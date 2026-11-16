-- =============================================
-- Parra Guido Emanuel - Datos de Venta y DetalleVenta
-- =============================================
USE PetShop;
GO

INSERT INTO Venta (Fecha, IdCliente) VALUES
('2026-08-03T10:15:00', 1),
('2026-08-12T17:40:00', 2), -- 10--11-2026 v2
('2026-08-25T12:05:00', 3),
('2026-09-02T09:30:00', 1),
('2026-09-14T18:20:00', 20),
('2026-09-28T11:00:00', 21),
('2026-10-05T16:45:00', 2),
('2026-10-11T13:10:00', 3),
('2026-10-19T10:50:00', 20),
('2026-10-24T19:05:00', 21);
GO

-- El precio unitario se toma del precio actual del producto
-- El precio unitario se toma del precio actual del producto
INSERT INTO DetalleVenta (IdVenta, IdProducto, Cantidad, PrecioUnitario)
SELECT d.IdVenta, d.IdProducto, d.Cantidad, p.Precio
FROM (VALUES
    (140, 1, 1), (140, 3, 2),
    (141, 2, 1),
    (142, 4, 1), (142, 1, 1),
    (143, 5, 2),
    (144, 6, 3), (144, 2, 1),
    (145, 7, 4),
    (146, 1, 2), (146, 8, 1),
    (147, 3, 1),
    (148, 4, 1), (148, 6, 2),
    (149, 5, 1), (149, 1, 1)
) AS d (IdVenta, IdProducto, Cantidad)
INNER JOIN Producto p ON p.IdProducto = d.IdProducto;
GO

