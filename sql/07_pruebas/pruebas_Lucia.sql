USE PetShop;
GO

-- =============================================
-- CASO 1: Prueba de la vista
-- Productos más vendidos
-- =============================================

SELECT *
FROM vw_ProductosMasVendidos
ORDER BY UnidadesVendidas DESC;
GO


-- =============================================
-- CASO 2: SP - Reporte de ventas por período
-- Período con ventas existentes
-- =============================================

EXEC sp_VentasPorPeriodo
    @FechaDesde = '2026-08-01',
    @FechaHasta = '2026-10-31';
GO


-- =============================================
-- CASO 3: SP - Período sin ventas
-- =============================================

EXEC sp_VentasPorPeriodo
    @FechaDesde = '2099-01-01',
    @FechaHasta = '2099-01-31';
GO


-- =============================================
-- CASO 4: SP - Fecha desde mayor que fecha hasta
-- =============================================

EXEC sp_VentasPorPeriodo
    @FechaDesde = '2026-10-31',
    @FechaHasta = '2026-08-01';
GO


-- =============================================
-- CASO 5: SP - Parámetros nulos
-- =============================================

EXEC sp_VentasPorPeriodo
    @FechaDesde = NULL,
    @FechaHasta = NULL;
GO


-- =============================================
-- CASO 6: TRIGGER - Devolver stock al eliminar
-- un detalle de venta
-- =============================================

DECLARE @IdVenta INT;
DECLARE @IdProducto INT;
DECLARE @Cantidad INT;

-- Buscar un detalle existente
SELECT TOP (1)
    @IdVenta = IdVenta,
    @IdProducto = IdProducto,
    @Cantidad = Cantidad
FROM DetalleVenta
ORDER BY IdVenta, IdProducto;

IF @IdVenta IS NULL
BEGIN
    PRINT 'No hay detalles de venta para probar el trigger.';
END
ELSE
BEGIN
    BEGIN TRANSACTION;

    -- Consultar stock antes de eliminar
    SELECT IdProducto, Nombre, Stock AS StockAntes
    FROM Producto
    WHERE IdProducto = @IdProducto;

    -- Eliminar un detalle de venta
    ;WITH DetalleSeleccionado AS (
        SELECT TOP (1) *
        FROM DetalleVenta
        WHERE IdVenta = @IdVenta
          AND IdProducto = @IdProducto
    )
    DELETE FROM DetalleSeleccionado;

    -- Consultar stock después de eliminar
    SELECT IdProducto, Nombre, Stock AS StockDespues
    FROM Producto
    WHERE IdProducto = @IdProducto;

    -- Revertir los cambios para conservar los datos originales
    ROLLBACK TRANSACTION;

    -- Comprobar que el stock volvió al valor original
    SELECT IdProducto, Nombre, Stock AS StockRestaurado
    FROM Producto
    WHERE IdProducto = @IdProducto;
END;
GO
