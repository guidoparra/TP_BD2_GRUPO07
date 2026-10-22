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

IF NOT EXISTS (SELECT 1 FROM Categoria)
BEGIN
    INSERT INTO Categoria (Nombre, Descripcion) VALUES
    ('Descanso y confort', 'Camas, cuchas, colchones, mantas, almohadones, casas, hamacas y cuevas para gatos y fundas para camas'),
    ('Paseo y transporte', 'Correas, pretales, collares, chapitas identificatorias, bozales, bolsos, mochilas, transportadoras, cinturones de seguridad y cochecitos'),
    ('Entrenamiento y educación', 'Pañales, paños absorbentes, bolsitas para heces, clickers, silbatos, empapadores, barreras y corrales'),
    ('Peluquería y estética', 'Cepillos, peines, deslanadores, máquinas de corte, tijeras, cortaúñas, limas, perfumes, toallas, secadores y desenredantes'),
    ('Salud y prevención', 'Cepillos y pastas dentales, limpiadores de oídos y ojos, antipulgas, antigarrapatas, repelentes, botiquines y suplementos'),
    ('Mobiliario y enriquecimiento ambiental', 'Rascadores, árboles para gatos, túneles, circuitos, estantes, hamacas de pared, comederos interactivos, alfombras olfativas y juguetes dispensadores'),
    ('Alimentación y accesorios inteligentes', 'Comederos elevados y antivoracidad, bebederos tipo fuente, comederos automáticos, dispensadores de agua, balanzas y contenedores herméticos'),
    ('Productos para otras especies', 'Acuarios, filtros, bombas, aireadores, alimento y accesorios para peces, aves, roedores, conejos, tortugas y reptiles'),
    ('Indumentaria y artículos de temporada', 'Abrigos, sweaters, impermeables, botitas, medias, pañuelos, moños, disfraces, chalecos salvavidas y accesorios de temporada'),
    ('Premios y productos especiales', 'Snacks naturales, galletas, golosinas, huesos masticables, premios dentales, tortas de cumpleaños, productos gourmet y cajas de regalo'),
    ('Limpieza del hogar y control de olores', 'Limpiadores enzimáticos, neutralizadores de olores, desinfectantes, desodorantes de ambiente, palitas, alfombras para arena y quitapelos'),
    ('Personalización y recuerdos', 'Chapitas grabadas, collares y correas personalizados, placas QR, medallas, kits de huellas, marcos y recuerdos');
END
GO

SELECT * FROM Categoria;

