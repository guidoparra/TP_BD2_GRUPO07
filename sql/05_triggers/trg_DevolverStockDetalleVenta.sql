--Lucia Maffey creación del trigger para devolver stock al anular una venta

USE PetShop;
GO

CREATE OR ALTER TRIGGER trg_DevolverStockDetalleVenta
ON DetalleVenta
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    -- Suma lo borrado por producto
    UPDATE p
    SET p.Stock = p.Stock + d.CantidadDevuelta
    FROM Producto p
    INNER JOIN (
        SELECT IdProducto, SUM(Cantidad) AS CantidadDevuelta
        FROM deleted
        GROUP BY IdProducto
    ) d ON d.IdProducto = p.IdProducto;
END;
GO