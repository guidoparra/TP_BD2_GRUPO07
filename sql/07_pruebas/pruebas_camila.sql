USE PetShop;
GO

-- Ver stock actual del producto
SELECT IdProducto, Nombre, Stock
FROM Producto
WHERE IdProducto = 6;
GO

-- Probar procedimiento con datos válidos
EXEC sp_AgregarProductoACompra
    @IdCompra = 3,
    @IdProducto = 6,
    @Cantidad = 5,
    @CostoUnitario = 3200.00;
GO

-- Verificar que el trigger haya aumentado el stock
SELECT IdProducto, Nombre, Stock
FROM Producto
WHERE IdProducto = 6;
GO

-- Probar la vista
SELECT *
FROM vw_ProductosBajoStock;
GO

-- Probar error: compra inexistente
EXEC sp_AgregarProductoACompra
    @IdCompra = 999,
    @IdProducto = 1,
    @Cantidad = 5,
    @CostoUnitario = 3200.00;
GO

-- Probar error: cantidad inválida
EXEC sp_AgregarProductoACompra
    @IdCompra = 3,
    @IdProducto = 1,
    @Cantidad = -5,
    @CostoUnitario = 3200.00;
GO