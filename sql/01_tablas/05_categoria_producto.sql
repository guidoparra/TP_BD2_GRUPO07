-- Lucia Maffey, creación de tablas categoria y producto
IF DB_ID('PetShop') IS NULL /*chequeo de que exista la base de datos*/
    CREATE DATABASE PetShop;
GO
USE PetShop;
GO

IF OBJECT_ID('Categoria', 'U') IS NULL /*chequeo de que exista la tabla*/
CREATE TABLE Categoria (
    IdCategoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre      VARCHAR(50) NOT NULL UNIQUE,
    Descripcion VARCHAR(200)
);

IF OBJECT_ID('Producto', 'U') IS NULL
CREATE TABLE Producto (
    IdProducto   INT IDENTITY(1,1) PRIMARY KEY,
    Nombre       VARCHAR(100) NOT NULL,
    Descripcion  VARCHAR(200),
    Precio       DECIMAL(10,2) NOT NULL CHECK (Precio > 0),
    Stock        INT NOT NULL CHECK (Stock >= 0),
    StockMinimo  INT NOT NULL CHECK (StockMinimo >=0),
    IdCategoria  INT NOT NULL,
    IdProveedor  INT NOT NULL,
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria),
    FOREIGN KEY (IdProveedor) REFERENCES Proveedor(IdProveedor)
);
GO

