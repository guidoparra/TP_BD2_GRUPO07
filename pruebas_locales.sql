USE PetShop;
GO

IF OBJECT_ID('Proveedor', 'U') IS NULL
CREATE TABLE Proveedor (
    IdProveedor INT IDENTITY(1,1) PRIMARY KEY,
    RazonSocial VARCHAR(100) NOT NULL,
    CUIT        VARCHAR(20) NOT NULL UNIQUE,
    Telefono    VARCHAR(20) NOT NULL,
    Email       VARCHAR(100) NOT NULL
);
GO

IF NOT EXISTS (SELECT 1 FROM Proveedor)
INSERT INTO Proveedor (RazonSocial, CUIT, Telefono, Email)
VALUES ('Proveedor de prueba', '20-12345678-9', '1122334455', 'prueba@mail.com');
GO