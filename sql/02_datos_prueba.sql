INSERT INTO Compra (IdProveedor, Fecha)
VALUES 
(1, '2026-11-01 10:00:00'),
(2, '2026-11-01 11:30:00');


INSERT INTO DetalleCompra (IdCompra, IdProducto, Cantidad, CostoUnitario)
VALUES
(1, 1, 10, 8500.00),
(1, 2, 5, 3200.00),
(2, 3, 20, 1500.00);