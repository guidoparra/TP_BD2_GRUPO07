INSERT INTO Compra (IdProveedor, Fecha)
VALUES 
(1, '2026-11-01 10:00:00'),
(2, '2026-11-01 11:30:00');


/*INSERT INTO DetalleCompra (IdCompra, IdProducto, Cantidad, CostoUnitario)
VALUES
(1, 1, 10, 8500.00),
(1, 2, 5, 3200.00),
(2, 3, 20, 1500.00);
*/


INSERT INTO dbo.DetalleCompra (IdCompra, IdProducto, Cantidad, CostoUnitario)
SELECT
    Datos.IdCompra,
    Datos.IdProducto,
    Datos.Cantidad,
    Datos.CostoUnitario
FROM (
    VALUES
        (1, 1, 10, 8500.00),
        (1, 2, 5, 3200.00),
        (2, 3, 20, 1500.00),
        (3, 6, 5, 3200.00)
) AS Datos (IdCompra, IdProducto, Cantidad, CostoUnitario)
WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.DetalleCompra DC
    WHERE DC.IdCompra = Datos.IdCompra
      AND DC.IdProducto = Datos.IdProducto
);
GO
