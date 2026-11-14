USE PetShop;
GO
-- =============================================
-- TABLA: Cliente
-- =============================================
IF OBJECT_ID('Cliente', 'U') IS NULL
CREATE TABLE Cliente (
    IdCliente INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    DNI VARCHAR(15) NOT NULL UNIQUE,
    Telefono VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PRIMARY KEY (IdCliente)
);
GO
-- =============================================
-- TABLA: Proveedor
-- =============================================
IF OBJECT_ID('Proveedor', 'U') IS NULL
CREATE TABLE Proveedor (
    IdProveedor INT IDENTITY(1,1) NOT NULL,
    RazonSocial VARCHAR(100) NOT NULL,
    CUIT VARCHAR(20) NOT NULL UNIQUE,
    Telefono VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PRIMARY KEY (IdProveedor)
);
GO