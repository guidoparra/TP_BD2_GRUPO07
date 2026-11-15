USE PetShop;
GO

IF OBJECT_ID('dbo.trg_DevolverStockAnulacion', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_DevolverStockAnulacion;
GO

CREATE TRIGGER dbo.trg_DevolverStockAnulacion
ON dbo.Venta
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Anulada)
    BEGIN
        UPDATE p
        SET p.Stock = p.Stock + dv.Cantidad
        FROM dbo.Producto p
        INNER JOIN dbo.DetalleVenta dv ON p.IdProducto = dv.IdProducto
        INNER JOIN inserted i ON dv.IdVenta = i.IdVenta
        INNER JOIN deleted d ON i.IdVenta = d.IdVenta
        WHERE d.Anulada = 0 AND i.Anulada = 1;
    END
END
GO