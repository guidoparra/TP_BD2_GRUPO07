USE PetShop;
GO

IF OBJECT_ID('dbo.fn_TotalVenta', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_TotalVenta;
GO

CREATE FUNCTION dbo.fn_TotalVenta (@IdVenta INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Total DECIMAL(10, 2);

    SELECT @Total = ISNULL(SUM(Cantidad * PrecioUnitario), 0)
    FROM dbo.DetalleVenta
    WHERE IdVenta = @IdVenta;

    RETURN @Total;
END
GO