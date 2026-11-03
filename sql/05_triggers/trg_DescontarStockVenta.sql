-- =============================================
-- Parra, Guido Emanuel - trg_DescontarStockVenta
-- AFTER INSERT en DetalleVenta
-- Valida venta no anulada y stock suficiente, y descuenta stock.
-- Soporta inserts de varias filas a la vez.
-- =============================================
USE PetShop;
GO

CREATE OR ALTER TRIGGER trg_DescontarStockVenta
ON DetalleVenta
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1) No se puede agregar productos a una venta anulada
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Venta v ON v.IdVenta = i.IdVenta
        WHERE v.Anulada = 1
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50001, 'No se pueden agregar productos a una venta anulada.', 1;
    END

    -- 2) Tiene que haber stock suficiente (se suma por producto)
    IF EXISTS (
        SELECT 1
        FROM (SELECT IdProducto, SUM(Cantidad) AS Total
              FROM inserted
              GROUP BY IdProducto) i
        INNER JOIN Producto p ON p.IdProducto = i.IdProducto
        WHERE p.Stock < i.Total
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50002, 'Stock insuficiente para uno o más productos de la venta.', 1;
    END

    -- 3) Descontar el stock
    UPDATE p
    SET p.Stock = p.Stock - i.Total
    FROM Producto p
    INNER JOIN (SELECT IdProducto, SUM(Cantidad) AS Total
                FROM inserted
                GROUP BY IdProducto) i ON i.IdProducto = p.IdProducto;
END;
GO
