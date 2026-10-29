CREATE TABLE Compra (
    IdCompra INT IDENTITY(1,1) PRIMARY KEY,
    IdProveedor INT NOT NULL,
    Fecha DATETIME NOT NULL,


    CONSTRAINT FK_Compra_Proveedor
    FOREING KEY (IdProveedor)
    REFERENCES Proveedor (IdProveedor)
);

CREATE TABLE DetalleCompra (
    IdDetalleCompra INT IDENTITY(1,1) PRIMARY KEY,
    IdCompra INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    CostoUnitario DECIMAL(10,2) NOT NULL,


    CONSTRAINT FK_DetalleCompra_Compra
    FOREING KEY (IdCompra),
    REFERENCES Compra(IdCompra),

    CONSTRAINT FK_DetalleCompra_Producto
    FOREING KEY (IdProducto)
    REFERENCES Producto(IdProducto),


    CONSTRAINT CK_DetalleCompra_Cantidad
    CHECK (Cantidad > 0),

    CONSTRAINT CK_DetalleCompra_CostoUnitario
    CHECK (CostoUnitario > 0),

    CONSTRAINT UQ_DetalleCompra_CompraProducto
    UNIQUE (IdCompra, IdProducto)

);