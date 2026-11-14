-- =============================================
-- Parra Guido Emanuel - Tablas Venta y DetalleVenta
-- =============================================
USE PetShop;
GO

IF OBJECT_ID('Venta', 'U') IS NULL
CREATE TABLE Venta (
    IdVenta   INT IDENTITY(1,1) NOT NULL,
    Fecha     DATETIME NOT NULL CONSTRAINT DF_Venta_Fecha DEFAULT GETDATE(),
    IdCliente INT NOT NULL,
    Anulada   BIT NOT NULL CONSTRAINT DF_Venta_Anulada DEFAULT 0,
    CONSTRAINT PK_Venta PRIMARY KEY (IdVenta),
    CONSTRAINT FK_Venta_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);
GO

IF OBJECT_ID('DetalleVenta', 'U') IS NULL
CREATE TABLE DetalleVenta (
    IdDetalleVenta INT IDENTITY(1,1) NOT NULL,
    IdVenta        INT NOT NULL,
    IdProducto     INT NOT NULL,
    Cantidad       INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_DetalleVenta PRIMARY KEY (IdDetalleVenta),
    CONSTRAINT FK_DetalleVenta_Venta FOREIGN KEY (IdVenta) REFERENCES Venta(IdVenta),
    CONSTRAINT FK_DetalleVenta_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto),
    CONSTRAINT CK_DetalleVenta_Cantidad CHECK (Cantidad > 0),
    CONSTRAINT CK_DetalleVenta_Precio CHECK (PrecioUnitario > 0),
    -- un mismo producto no se puede repetir dentro de una venta 10-11-2026
    CONSTRAINT UQ_DetalleVenta_VentaProducto UNIQUE (IdVenta, IdProducto)
);
GO
