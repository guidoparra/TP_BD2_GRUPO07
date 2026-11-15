USE PetShop;
GO
-- =============================================
-- DATOS DE PRUEBA: Proveedor
-- =============================================
IF NOT EXISTS (
    SELECT 1 FROM dbo.Proveedor 
    WHERE CUIT IN ('30-44561665-9', '30-20054896-0', '30-36289581-0')
)
BEGIN
    INSERT INTO dbo.Proveedor (RazonSocial, CUIT, Telefono, Email)
    VALUES 
    ('Distribuidora Alimentos S.A.', '30-44561665-9', '11-3454-4654', 'DistribuidoraAlimentos@gmail.com'),
    ('Mundo Juguetes S.A.',          '30-20054896-0', '11-8966-2789', 'MundoJuguetes@gmail.com'),
    ('CasaHigiene S.A.',            '30-36289581-0', '11-6722-7306', 'CasaHigieneCanina@gmail.com');
END
GO
-- =============================================
-- DATOS DE PRUEBA: Cliente (5 clientes para cubrir IDs 1 al 5)
-- =============================================
IF NOT EXISTS (
    SELECT 1 FROM dbo.Cliente 
    WHERE DNI IN ('44670929', '44453224', '43324535', '38912450', '41205889')
)
BEGIN
    INSERT INTO dbo.Cliente (Nombre, Apellido, DNI, Telefono, Email)
    VALUES 
    ('Sebastián',      'Rodríguez', '44670929', '1139488347', 'sebastianrodriguez@gmail.com'),
    ('Facundo Fabián', 'Gómez',     '44453224', '3484567489', 'facundogomez@gmail.com'),
    ('Juana',          'Gabrielli', '43324535', '3484369061', 'juanagabrielli@gmail.com'),
    ('Martín',         'Sosa',      '38912450', '1154328790', 'martinsosa@gmail.com'),
    ('Camila',         'Peralta',   '41205889', '1167891234', 'camilaperalta@gmail.com');
END
GO