-- =============================================
-- Parra, Guido Emanuel - Datos de Venta y DetalleVenta
-- Se cargan ANTES de crear el trigger, así el stock
-- que cargó Lucía queda como "stock actual"
-- Requiere: al menos 5 clientes y 8 productos
-- =============================================
USE PetShop;
GO

-- Fechas en formato ISO (con T) para que no dependan del idioma del servidor
INSERT INTO Venta (Fecha, IdCliente) VALUES
('2026-08-03T10:15:00', 1),
('2026-08-12T17:40:00', 2),
('2026-08-25T12:05:00', 3),
('2026-09-02T09:30:00', 1),
('2026-09-14T18:20:00', 4),
('2026-09-28T11:00:00', 5),
('2026-10-05T16:45:00', 2),
('2026-10-11T13:10:00', 3),
('2026-10-19T10:50:00', 4),
('2026-10-24T19:05:00', 5);
GO

-- El precio unitario se toma del precio actual del producto
INSERT INTO DetalleVenta (IdVenta, IdProducto, Cantidad, PrecioUnitario)
SELECT d.IdVenta, d.IdProducto, d.Cantidad, p.Precio
FROM (VALUES
    (1, 1, 1), (1, 3, 2),
    (2, 2, 1),
    (3, 4, 1), (3, 1, 1),
    (4, 5, 2),
    (5, 6, 3), (5, 2, 1),
    (6, 7, 4),
    (7, 1, 2), (7, 8, 1),
    (8, 3, 1),
    (9, 4, 1), (9, 6, 2),
    (10, 5, 1), (10, 1, 1)
) AS d (IdVenta, IdProducto, Cantidad)
INNER JOIN Producto p ON p.IdProducto = d.IdProducto;
GO
