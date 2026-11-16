GO

CREATE OR ALTER VIEW dbo.vw_ProductosBajoStock AS
SELECT
    IdProducto,
    Nombre,
    Stock,
    StockMinimo
FROM dbo.Producto
WHERE Stock <= StockMinimo;
GO

/* para probrarla despues */
SELECT *
FROM dbo.vw_ProductosBajoStock;
GO
