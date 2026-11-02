-- =============================================
-- 00 - Crear la base de datos desde cero
-- ATENCIÓN: borra la base PetShop si ya existe
-- =============================================
USE master;
GO
IF DB_ID('PetShop') IS NOT NULL
BEGIN
    ALTER DATABASE PetShop SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PetShop;
END
GO
CREATE DATABASE PetShop;
GO
