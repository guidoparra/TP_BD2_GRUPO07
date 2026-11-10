-- Lucia Maffey, datos en tablas categoria y producto
USE PetShop;
GO
IF NOT EXISTS (SELECT 1 FROM Categoria)
BEGIN
    INSERT INTO Categoria (Nombre, Descripcion) 
    VALUES
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


IF NOT EXISTS (SELECT 1 FROM Producto) /* solo inserta si la tabla está vacía */
BEGIN
    INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, StockMinimo, IdCategoria, IdProveedor)
    VALUES
    /*Descanso y confort*/
    ('Cama acolchada mediana', 'Cama lavable para perros medianos', 18500.00, 12, 5, 1, 1),
    ('Cucha plástica para gatos', 'Casa resistente a la intemperie', 24900.00, 2, 4, 1, 1),
    /*Paseo y transporte*/
    ('Correa de nylon 1.5m', 'Correa resistente con manija acolchada', 6200.00, 3, 10, 2, 1),
    ('Transportadora mediana', 'Transportadora rígida con puerta metálica', 32000.00, 8, 3, 2, 1),
    /*Entrenamiento y educación*/
    ('Bolsitas para heces x100', 'Bolsitas biodegradables con dispensador', 2800.00, 40, 15, 3, 1),
    /*Peluquería y estética*/
    ('Cepillo deslanador', 'Cepillo para pelo largo', 4800.00, 25, 8, 4, 1),
    /*Salud y prevención*/
    ('Pipeta antipulgas', 'Pipeta mensual para perros de 10 a 25 kg', 7500.00, 4, 12, 5, 1),
    /*Mobiliario y enriquecimiento ambiental*/
    ('Rascador torre para gatos', 'Torre de 3 niveles con sisal', 45000.00, 6, 2, 6, 1),
    /*Alimentación y accesorios inteligentes*/
    ('Bebedero tipo fuente', 'Fuente de agua eléctrica de 2 litros', 21000.00, 10, 4, 7, 1),
    /*Productos para otras especies*/
    ('Filtro para acuario', 'Filtro interno para acuarios de hasta 100 litros', 15500.00, 1, 5, 8, 1),
    /*Indumentaria y artículos de temporada*/
    ('Sweater para perro talle M', 'Sweater de lana tejido a mano', 9800.00, 18, 6, 9, 1),
    /*Premios y productos especiales*/
    ('Snack dental x12', 'Premios dentales para perros medianos', 5200.00, 60, 20, 10, 1),
    /*Limpieza del hogar y control de olores*/
    ('Limpiador enzimático 500ml', 'Elimina manchas y olores de orina', 6900.00, 22, 8, 11, 1),
    /*Personalización y recuerdos*/
    ('Chapita grabada con nombre', 'Chapita de acero con nombre y teléfono', 3500.00, 5, 10, 12, 1),
    ('Marco para huella de mascota', 'Kit con marco para conservar la huella', 12000.00, 14, 3, 12, 1);
END
GO
