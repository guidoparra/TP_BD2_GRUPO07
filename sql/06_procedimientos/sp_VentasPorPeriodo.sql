--Lucia Maffey creación del reporte de ventas por periodo
USE PetShop;
GO

CREATE OR ALTER PROCEDURE sp_VentasPorPeriodo
    @FechaDesde DATE,
    @FechaHasta DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Validación de parámetros
    IF @FechaDesde IS NULL OR @FechaHasta IS NULL
    BEGIN
        RAISERROR('Debe indicar fecha desde y fecha hasta.', 16, 1);
        RETURN;
    END

    IF @FechaDesde > @FechaHasta
    BEGIN
        RAISERROR('La fecha desde no puede ser mayor que la fecha hasta.', 16, 1);
        RETURN;
    END

    -- Detalle de ventas del período 
    SELECT
        v.IdVenta,
        v.Fecha,
        c.Apellido + ', ' + c.Nombre AS Cliente,
        p.Nombre AS Producto,
        cat.Nombre AS Categoria,
        dv.Cantidad,
        dv.PrecioUnitario,
        dv.Cantidad * dv.PrecioUnitario AS Subtotal
    FROM Venta v
    INNER JOIN Cliente c ON c.IdCliente = v.IdCliente
    INNER JOIN DetalleVenta dv ON dv.IdVenta = v.IdVenta
    INNER JOIN Producto p ON p.IdProducto = dv.IdProducto
    INNER JOIN Categoria cat ON cat.IdCategoria = p.IdCategoria
    WHERE v.Anulada = 0
      AND v.Fecha >= @FechaDesde
      AND v.Fecha <  DATEADD(DAY, 1, @FechaHasta)
    ORDER BY v.Fecha, v.IdVenta;

    --Resumen del período
    SELECT
        @FechaDesde                              AS FechaDesde,
        @FechaHasta                              AS FechaHasta,
        COUNT(DISTINCT v.IdVenta)                AS CantidadVentas,
        ISNULL(SUM(dv.Cantidad), 0)              AS UnidadesVendidas,
        ISNULL(SUM(dv.Cantidad * dv.PrecioUnitario), 0) AS TotalVendido
    FROM Venta v
    INNER JOIN DetalleVenta dv ON dv.IdVenta = v.IdVenta
    WHERE v.Anulada = 0
      AND v.Fecha >= @FechaDesde
      AND v.Fecha <  DATEADD(DAY, 1, @FechaHasta);
END;
GO

/* para probarlo */
EXEC sp_VentasPorPeriodo @FechaDesde = '2026-11-01', @FechaHasta = '2026-11-30';