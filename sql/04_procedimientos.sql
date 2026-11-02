CREATE PROCEDURE sp_AgregarProductoACompra
@IdCompra INT,
@IdProducto INT,
@Cantidad INT,
@CostoUnitario DECIMAL(10,2)
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY

IF NOT EXISTS (
    SELECT 1
    FROM Compra
    WHERE IdCompra = @IdCompra
)

BEGIN
THROW 50001, 'La compra indicada no existe.', 1;
END;

IF NOT EXISTS (
    SELECT 1
    FROM Producto
    WHERE  IdProducto = @IdProducto
)
BEGIN
THROW 50002, 'El producto indicado no existe.', 1;
END;

   IF @Cantidad <= 0
   BEGIN
   THROW 50003, 'La cantidad debe ser mayor a cero.', 1;
   END;

   IF @CostoUnitario <= 0
   BEGIN
   THROW 50004, 'El costo unitario debe ser mayor a cero.', 1;
   END; 

   IF EXISTS (
    SELECT 1
    FROM DetalleCompra
    WHERE IdCompra = @IdCompra
    AND IdProducto = @IdProducto
   )

   BEGIN
   THROW 50005, 'El producto ya fue agregado a esta compra.', 1;
   END;

   INSERT INTO DetalleCompra (
    IdCompra,
    IdProducto,
    Cantidad,
    CostoUnitario
   )
   VALUES (
    @IdCompra,
    @IdProducto,
    @Cantidad,
    @CostoUnitario
   );

   PRINT 'Producto agregado correctamente a la compra.';

   END TRY 

   BEGIN CATCH
   PRINT  'Error: ' + ERROR_MESSAGE();
   THROW;
   END CATCH;
   END;