USE PetShop;
GO
-- =============================================
-- DATOS DE PRUEBA: Proveedor
-- =============================================
INSERT INTO dbo.Proveedor (RazonSocial, CUIT, Telefono, Email)
VALUES 
('Distribuidora Alimentos S.A.', '30-44561665-9', '11-3454-4654', 'DistribuidoraAlimentos@gmail.com'),
('Mundo Juguetes S.A.',          '30-20054896-0', '11-8966-2789', 'MundoJuguetes@gmail.com'),
('CasaHigiene S.A.',            '30-36289581-0', '11-6722-7306', 'CasaHigieneCanina@gmail.com');
GO
-- =============================================
-- DATOS DE PRUEBA: Cliente
-- =============================================
INSERT INTO dbo.Cliente (Nombre, Apellido, DNI, Telefono, Email)
VALUES 
('Sebastián',      'Rodríguez', '44670929', '1139488347', 'sebastianrodriguez@gmail.com'),
('Facundo Fabián', 'Gómez',     '44453224', '3484567489', 'facundogomez@gmail.com'),
('Juana',          'Gabrielli', '43324535', '3484369061', 'juanagabrielli@gmail.com');
GO