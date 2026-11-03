USE PetShop;
GO

CREATE TRIGGER trg_SumarStockCompra
ON DetalleCompra 
AFTER INSERT
AS 
BEGIN
 SET NOCOUNT ON;

 UPDATE P
 SET p.sTOCK = p.sTOCK + i.Cantidad
 FROM Producto p
 INNER JOIN inserted i
 ON p.IdProducto = i.IdProducto;

 END;
 GO