-- =============================================
-- Parra, Guido Emanuel - Casos de prueba para el video
-- Ejecutar cada bloque por separado (seleccionar hasta el GO)
-- =============================================
USE PetShop;
GO

-- ===== CASO 1 (éxito): venta nueva, se descuenta el stock =====
SELECT IdProducto, Nombre, Stock FROM Producto WHERE IdProducto IN (1, 2);

DECLARE @NuevaVenta INT;   -- NULL = crea la venta
EXEC sp_AgregarProductoAVenta
     @IdVenta = @NuevaVenta OUTPUT, @IdCliente = 1, @IdProducto = 1, @Cantidad = 2;

-- Segundo producto a la misma venta
EXEC sp_AgregarProductoAVenta
     @IdVenta = @NuevaVenta OUTPUT, @IdProducto = 2, @Cantidad = 1;

SELECT IdProducto, Nombre, Stock FROM Producto WHERE IdProducto IN (1, 2);
SELECT * FROM vw_VentasDetalladas WHERE IdVenta = @NuevaVenta;
GO

-- ===== CASO 2 (validación SP): cantidad inválida =====
EXEC sp_AgregarProductoAVenta @IdVenta = 1, @IdProducto = 2, @Cantidad = 0;
GO

-- ===== CASO 3 (validación SP): producto inexistente =====
EXEC sp_AgregarProductoAVenta @IdVenta = 1, @IdProducto = 9999, @Cantidad = 1;
GO

-- ===== CASO 4 (validación SP): producto repetido en la venta =====
EXEC sp_AgregarProductoAVenta @IdVenta = 1, @IdProducto = 1, @Cantidad = 1;
GO

-- ===== CASO 5 (validación TRIGGER vía SP): stock insuficiente =====
-- La venta tampoco se crea, porque todo se revierte
SELECT COUNT(*) AS VentasAntes FROM Venta;
GO
EXEC sp_AgregarProductoAVenta @IdCliente = 2, @IdProducto = 1, @Cantidad = 100000;
GO
SELECT COUNT(*) AS VentasDespues FROM Venta;
GO

-- ===== CASO 6 (TRIGGER directo): INSERT sin pasar por el SP =====
SELECT IdProducto, Nombre, Stock FROM Producto WHERE IdProducto = 5;

INSERT INTO DetalleVenta (IdVenta, IdProducto, Cantidad, PrecioUnitario)
SELECT 2, IdProducto, 3, Precio FROM Producto WHERE IdProducto = 5;

SELECT IdProducto, Nombre, Stock FROM Producto WHERE IdProducto = 5;   -- bajó 3
GO

-- ===== CASO 7 (TRIGGER directo): stock insuficiente =====
INSERT INTO DetalleVenta (IdVenta, IdProducto, Cantidad, PrecioUnitario)
SELECT 3, IdProducto, 99999, Precio FROM Producto WHERE IdProducto = 6;
GO

-- ===== CASO 8 (cuando esté sp_AnularVenta de Dante): venta anulada =====
-- EXEC sp_AnularVenta @IdVenta = 4;
-- EXEC sp_AgregarProductoAVenta @IdVenta = 4, @IdProducto = 3, @Cantidad = 1;
GO
