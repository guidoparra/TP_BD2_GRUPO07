USE PetShop;
GO

IF OBJECT_ID('dbo.sp_AnularVenta', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_AnularVenta;
GO

CREATE PROCEDURE dbo.sp_AnularVenta
    @IdVenta INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.Venta WHERE IdVenta = @IdVenta)
    BEGIN
        RAISERROR('La venta indicada no existe.', 16, 1);
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM dbo.Venta WHERE IdVenta = @IdVenta AND Anulada = 1)
    BEGIN
        RAISERROR('La venta ya se encuentra anulada.', 16, 1);
        RETURN;
    END

    UPDATE dbo.Venta
    SET Anulada = 1
    WHERE IdVenta = @IdVenta;
END
GO
