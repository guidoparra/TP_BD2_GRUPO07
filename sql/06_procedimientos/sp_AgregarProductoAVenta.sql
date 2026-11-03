-- =============================================
-- Parra Guido Emanuel - sp_AgregarProductoAVenta
-- Si @IdVenta es NULL entonces crea una venta nueva para @IdCliente
-- El stock NO se toca acá: lo descuenta trg_DescontarStockVenta
-- =============================================
USE PetShop;
GO

CREATE OR ALTER PROCEDURE sp_AgregarProductoAVenta
    @IdVenta    INT = NULL OUTPUT,
    @IdCliente  INT = NULL,
    @IdProducto INT,
    @Cantidad   INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validaciones
        IF @Cantidad IS NULL OR @Cantidad <= 0
            THROW 50010, 'La cantidad debe ser mayor a 0.', 1;

        IF NOT EXISTS (SELECT 1 FROM Producto WHERE IdProducto = @IdProducto)
            THROW 50011, 'El producto indicado no existe.', 1;

        IF @IdVenta IS NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM Cliente WHERE IdCliente = @IdCliente)
                THROW 50012, 'Para crear una venta hay que indicar un cliente existente.', 1;
        END
        ELSE
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM Venta WHERE IdVenta = @IdVenta)
                THROW 50013, 'La venta indicada no existe.', 1;

            IF EXISTS (SELECT 1 FROM Venta WHERE IdVenta = @IdVenta AND Anulada = 1)
                THROW 50014, 'No se pueden agregar productos a una venta anulada.', 1;

            IF EXISTS (SELECT 1 FROM DetalleVenta
                       WHERE IdVenta = @IdVenta AND IdProducto = @IdProducto)
                THROW 50015, 'El producto ya está cargado en esta venta.', 1;
        END

        BEGIN TRANSACTION;

        IF @IdVenta IS NULL
        BEGIN
            INSERT INTO Venta (Fecha, IdCliente) VALUES (GETDATE(), @IdCliente);
            SET @IdVenta = SCOPE_IDENTITY();
        END

        -- Precio vigente del producto
        INSERT INTO DetalleVenta (IdVenta, IdProducto, Cantidad, PrecioUnitario)
        SELECT @IdVenta, IdProducto, @Cantidad, Precio
        FROM Producto
        WHERE IdProducto = @IdProducto;

        COMMIT TRANSACTION;

        SELECT @IdVenta AS IdVenta, 'Producto agregado correctamente.' AS Mensaje;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
