USE PetShop;
GO

IF OBJECT_ID('dbo.vw_ResumenPorCliente', 'V') IS NOT NULL
    DROP VIEW dbo.vw_ResumenPorCliente;
GO

CREATE OR ALTER VIEW dbo.vw_ResumenPorCliente
AS
SELECT 
    c.IdCliente,
    c.Nombre,
    c.Apellido,
    c.DNI,
    COUNT(v.IdVenta) AS CantidadCompras,
    ISNULL(SUM(dbo.fn_TotalVenta(v.IdVenta)), 0) AS TotalGastado
FROM dbo.Cliente c
LEFT JOIN dbo.Venta v 
    ON c.IdCliente = v.IdCliente 
    AND v.Anulada = 0
GROUP BY 
    c.IdCliente,
    c.Nombre,
    c.Apellido,
    c.DNI;
GO