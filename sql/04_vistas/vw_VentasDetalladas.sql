-- =============================================
-- Parra, Guido Emanuel - vw_VentasDetalladas
-- Cada línea de venta con cliente, producto,
-- categoría, subtotal y estado
-- =============================================
USE PetShop;
GO

CREATE OR ALTER VIEW vw_VentasDetalladas
AS
SELECT
    v.IdVenta,
    v.Fecha,
    c.Apellido + ', ' + c.Nombre        AS Cliente,
    c.DNI,
    p.Nombre                            AS Producto,
    cat.Nombre                          AS Categoria,
    dv.Cantidad,
    dv.PrecioUnitario,
    dv.Cantidad * dv.PrecioUnitario     AS Subtotal,
    CASE WHEN v.Anulada = 1 THEN 'Anulada' ELSE 'Activa' END AS Estado
FROM Venta v
INNER JOIN Cliente      c   ON c.IdCliente     = v.IdCliente
INNER JOIN DetalleVenta dv  ON dv.IdVenta      = v.IdVenta
INNER JOIN Producto     p   ON p.IdProducto    = dv.IdProducto
INNER JOIN Categoria    cat ON cat.IdCategoria = p.IdCategoria;
GO
