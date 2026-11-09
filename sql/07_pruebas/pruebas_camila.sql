USE PetShop;
GO

BEGIN TRANSACTION;

-- 1. Ver stock inicial
SELECT IdProducto, Nombre, Stock
FROM Producto
WHERE IdProducto = 2;
GO

-- 2. Probar procedimiento con datos válidos
EXEC sp_AgregarProductoACompra
    @IdCompra = 3,
    @IdProducto = 2,
    @Cantidad = 5,
    @CostoUnitario = 3200.00;
GO

-- 3. Verificar que el trigger haya aumentado el stock
SELECT IdProducto, Nombre, Stock
FROM Producto
WHERE IdProducto = 2;
GO

-- 4. Probar vista de productos con bajo stock
SELECT *
FROM vw_ProductosBajoStock;
GO

-- 5. Probar error: compra inexistente
EXEC sp_AgregarProductoACompra
    @IdCompra = 999,
    @IdProducto = 1,
    @Cantidad = 5,
    @CostoUnitario = 3200.00;
GO

-- 6. Probar error: cantidad inválida
EXEC sp_AgregarProductoACompra
    @IdCompra = 3,
    @IdProducto = 1,
    @Cantidad = -5,
    @CostoUnitario = 3200.00;
GO

ROLLBACK TRANSACTION;
GO