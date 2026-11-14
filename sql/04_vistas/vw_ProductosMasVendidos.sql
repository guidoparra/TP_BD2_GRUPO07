--Lucia Maffey creación de la vista vw_ProductosMasVendidos
USE PetShop;
GO

CREATE OR ALTER VIEW vw_ProductosMasVendidos
AS
SELECT
    p.IdProducto,
    p.Nombre AS Producto,
    cat.Nombre AS Categoria,
    SUM(dv.Cantidad) AS UnidadesVendidas,
    SUM(dv.Cantidad * dv.PrecioUnitario) AS TotalRecaudado

FROM DetalleVenta dv

INNER JOIN Venta v ON v.IdVenta = dv.IdVenta
INNER JOIN Producto p ON p.IdProducto = dv.IdProducto
INNER JOIN Categoria cat ON cat.IdCategoria = p.IdCategoria
WHERE v.Anulada = 0
GROUP BY p.IdProducto, p.Nombre, cat.Nombre;
GO

/* para probarla después */
SELECT * FROM vw_ProductosMasVendidos
ORDER BY UnidadesVendidas DESC;

