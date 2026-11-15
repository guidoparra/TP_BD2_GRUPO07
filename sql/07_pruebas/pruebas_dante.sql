USE PetShop;
GO

-- Total de una venta existente y una que no existe
SELECT dbo.fn_TotalVenta(1) AS TotalVenta1;
SELECT dbo.fn_TotalVenta(999) AS TotalVentaInexistente;
GO

-- Prueba de la vista
SELECT *
FROM vw_ResumenPorCliente;
GO

-- Estado de la venta 10 y stock antes de anular
SELECT *
FROM Venta
WHERE IdVenta = 10;

SELECT IdProducto, Nombre, Stock
FROM Producto
WHERE IdProducto IN (1, 5);
GO

-- Anular la venta 10
EXEC sp_AnularVenta
    @IdVenta = 10;
GO

-- Verificar venta anulada y stock devuelto
SELECT *
FROM Venta
WHERE IdVenta = 10;

SELECT IdProducto, Nombre, Stock
FROM Producto
WHERE IdProducto IN (1, 5);
GO

-- Intentar anular de nuevo la misma venta
EXEC sp_AnularVenta
    @IdVenta = 10;
GO

-- Intentar anular una venta que no existe
EXEC sp_AnularVenta
    @IdVenta = 999;
GO