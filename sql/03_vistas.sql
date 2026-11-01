CREATE VIEW vw_ProductosBajoStock AS
SELECT
IdProducto,
Nombre,
Stock, 
StockMinimo
FROM Producto
WHERE Stock <= StockMinimo;

/* para probrarla despues */
SELECT * FROM vw_ProductosBajoStock; 