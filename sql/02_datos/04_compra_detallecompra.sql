-- =============================================
-- Datos de Compra y DetalleCompra
-- =============================================
USE PetShop;
GO

-- Compras (solo se cargan si la tabla está vacía)
IF NOT EXISTS (SELECT 1 FROM dbo.Compra)
BEGIN
    INSERT INTO dbo.Compra (IdProveedor, Fecha)
    VALUES
    (1, '2026-11-01 10:00:00'),   -- compra 1
    (2, '2026-11-01 11:30:00'),   -- compra 2
    (1, '2026-11-02 09:00:00');   -- compra 3 (se usa en pruebas_camila.sql)
END
GO

-- Detalle de las compras 1 y 2
INSERT INTO dbo.DetalleCompra (IdCompra, IdProducto, Cantidad, CostoUnitario)
SELECT Datos.IdCompra, Datos.IdProducto, Datos.Cantidad, Datos.CostoUnitario
FROM (
    VALUES
        (1, 1, 10, 8500.00),
        (1, 2, 5,  3200.00),
        (2, 3, 20, 1500.00)
) AS Datos (IdCompra, IdProducto, Cantidad, CostoUnitario)
WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.DetalleCompra DC
    WHERE DC.IdCompra = Datos.IdCompra
      AND DC.IdProducto = Datos.IdProducto
);
GO