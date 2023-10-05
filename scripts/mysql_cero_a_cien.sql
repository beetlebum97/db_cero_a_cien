-- CREAR BASE DE DATOS

CREATE DATABASE CERO_A_CIEN;

USE CERO_A_CIEN;

-- CREAR TABLAS
-- Nombres de columnas con espacios en blanco: `nombre columna`.

CREATE TABLE Grupos(
        ID int PRIMARY KEY,
        Nombre varchar(255) UNIQUE NOT NULL,
        País varchar(255),
        Sede varchar(255),
        Fundación int,
        Empleados int,
        `Patrimonio(M)` int,
        `Valor bursátil(M)` int,
        Propietario1 varchar(255),
        Propietario2 varchar(255),
        Propietario3 varchar(255)
);

CREATE TABLE Fabricantes(
        ID int PRIMARY KEY,
        Marca varchar(255) UNIQUE NOT NULL,
        Empresa varchar(255) NOT NULL,
        País varchar(255) NOT NULL,
        Región varchar(255) NOT NULL,
        Sede varchar(255) NOT NULL,
        Fundación int,
        Disolución int,
        Empleados int,
        Grupo varchar(255),

        FOREIGN KEY (Grupo) REFERENCES Grupos (Nombre)
);

CREATE TABLE Estudios(
        ID int PRIMARY KEY,
        Nombre varchar(255) UNIQUE NOT NULL,
        País varchar(255),
        Sede varchar(255),
        Fundación int,
        Disolución int
);

CREATE TABLE Diseñadores(
        ID int PRIMARY KEY,
        Nombre varchar(255) UNIQUE NOT NULL,
        País varchar(255),
        Ciudad varchar(255)
);

CREATE TABLE Autores(
        ID int PRIMARY KEY,
        Nombre varchar(255) UNIQUE NOT NULL,
        Puesto varchar(255) NOT NULL
);

CREATE TABLE Coches(
        ID int PRIMARY KEY,
        Modelo varchar(255) UNIQUE NOT NULL,
        Fabricante varchar(255) NOT NULL,
        Diseñador varchar(255),
        Estudio varchar(255),
        Unidades int,
        Producción varchar(255),
        `Configuración motor` varchar(255),
        Tracción varchar(255),
        `Cilindrada(cc)` varchar(255),
        Motor varchar(255),
        `Potencia(CV)` varchar(255),
        Transmisión varchar(255),
        `Velocidad(km/h)` int,
        `0-100(s)` decimal(3,1),
        `Consumo(L/100)` decimal(3,1),
        `Peso(Kg)` varchar(255),

        FOREIGN KEY (Fabricante) REFERENCES Fabricantes (Marca),
        FOREIGN KEY (Diseñador) REFERENCES Diseñadores (Nombre),
        FOREIGN KEY (Estudio) REFERENCES Estudios (Nombre)
);

CREATE TABLE Revista(
        Número int PRIMARY KEY,
        Época varchar(255) NOT NULL,
        Año int NOT NULL,
        Portada varchar(255) NOT NULL,
        Ilustración varchar(255) NOT NULL,
        Color1 varchar(255) NOT NULL,
        Color2 varchar(255) NOT NULL,
        Impresión varchar(255),
        Edición varchar(255) NOT NULL,

        FOREIGN KEY (Portada) REFERENCES Coches (Modelo),
        FOREIGN KEY (Ilustración) REFERENCES Autores (Nombre)
);

CREATE TABLE Artículos(
        Revista int NOT NULL,
        Número int PRIMARY KEY,
        Sección varchar(255) CHECK (Sección IN('Arquitectura','Arte','Automodelismo','Carta del editor','Divulgación técnica',
        'Garajes de ensueño','Libros','Modelo mítico','Museos','Relojes','Reportajes','Rutas','Todos los coches van al cielo')),
        Título varchar(255) NOT NULL,
        Autor1 varchar(255),
        Autor2 varchar(255),
        Coche1 varchar(255),
        Coche2 varchar(255),
        Coche3 varchar(255),
        Coche4 varchar(255),
        Coche5 varchar(255),
        Coche6 varchar(255),

        FOREIGN KEY (Revista) REFERENCES Revista (Número),
        FOREIGN KEY (Autor1) REFERENCES Autores (Nombre),
        FOREIGN KEY (Autor2) REFERENCES Autores (Nombre),
        FOREIGN KEY (Coche1) REFERENCES Coches (Modelo),
        FOREIGN KEY (Coche2) REFERENCES Coches (Modelo),
        FOREIGN KEY (Coche3) REFERENCES Coches (Modelo),
        FOREIGN KEY (Coche4) REFERENCES Coches (Modelo),
        FOREIGN KEY (Coche5) REFERENCES Coches (Modelo),
        FOREIGN KEY (Coche6) REFERENCES Coches (Modelo)
);


-- IMPORTAR/INSERTAR REGISTROS
-- LOAD DATA INFILE: ficheros ubicados en el servidor. EN cliente, usar LOADA DATA LOCAL INFILE.
-- LOAD DATA ¡Indicar directorio de los ficheros csv!
-- NULLIF: Cuando no exista el valor, se inserta como NULL.
-- LINES TERMINATED BY: Linux '\n'. Windows '\r\n'.


LOAD DATA INFILE '/var/lib/mysql-data/cero_a_cien/grupos.csv'
INTO TABLE Grupos
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID,Nombre,@País,@Sede,@Fundación,@Empleados,@`Patrimonio(M)`,@`Valor bursátil(M)`,@Propietario1,@Propietario2,@Propietario3)
SET País = NULLIF(@País,''),
Sede = NULLIF(@Sede,''),
Fundación = NULLIF(@Fundación,''),
Empleados = NULLIF(@Empleados,''),
`Patrimonio(M)` = NULLIF(@`Patrimonio(M)`,''),
`Valor bursátil(M)` = NULLIF(@`Valor bursátil(M)`,''),
Propietario1 = NULLIF(@Propietario1,''),
Propietario2 = NULLIF(@Propietario2,''),
Propietario3 = NULLIF(@Propietario3,'')
;

LOAD DATA INFILE '/var/lib/mysql-data/cero_a_cien/fabricantes.csv'
INTO TABLE Fabricantes
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID,Marca,Empresa,País,Región,Sede,@Fundación,@Disolución,@Empleados,@Grupo)
SET Fundación = NULLIF(@Fundación,''),
Disolución = NULLIF(@Disolución,''),
Empleados = NULLIF(@Empleados,''),
Grupo = NULLIF(@Grupo,'')
;

LOAD DATA INFILE '/var/lib/mysql-data/cero_a_cien/estudios.csv'
INTO TABLE Estudios
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID,Nombre,@País,@Sede,@Fundación,@Disolución)
SET País = NULLIF(@País,''),
Sede = NULLIF(@Sede,''),
Fundación = NULLIF(@Fundación,''),
Disolución = NULLIF(@Disolución,'')
;

LOAD DATA INFILE '/var/lib/mysql-data/cero_a_cien/disenadores.csv'
INTO TABLE Diseñadores
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID,Nombre,@País,@Ciudad)
SET País = NULLIF(@País,''),
Ciudad = NULLIF(@Ciudad,'')
;

LOAD DATA INFILE '/var/lib/mysql-data/cero_a_cien/autores.csv'
INTO TABLE Autores
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID,Nombre,Puesto)
;

LOAD DATA INFILE '/var/lib/mysql-data/cero_a_cien/coches.csv'
INTO TABLE Coches
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID,Modelo,Fabricante,@Diseñador,@Estudio,@Unidades,@Producción,@`Configuración motor`,@Tracción,@`Cilindrada(cc)`,@Motor,@`Potencia(CV)`,@Transmisión,
@`Velocidad(km/h)`,@`0-100(s)`,@`Consumo(L/100)`,@`Peso(Kg)`)
SET Diseñador = NULLIF(@Diseñador,''),
Estudio = NULLIF(@Estudio,''),
Unidades = NULLIF(@Unidades,''),
Producción = NULLIF(@Producción,''),
`Configuración motor` = NULLIF(@`Configuración motor`,''),
Tracción = NULLIF(@Tracción,''),
`Cilindrada(cc)` = NULLIF(@`Cilindrada(cc)`,''),
Motor = NULLIF(@Motor,''),
`Potencia(CV)` = NULLIF(@`Potencia(CV)`,''),
`Velocidad(km/h)` = NULLIF(@`Velocidad(km/h)`,''),
`0-100(s)` = NULLIF(@`0-100(s)`,''),
`Consumo(L/100)` = NULLIF(@`Consumo(L/100)`,''),
`Peso(Kg)` = NULLIF(@`Peso(Kg)`,'')
;

LOAD DATA INFILE '/var/lib/mysql-data/cero_a_cien/revista.csv'
INTO TABLE Revista
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Número,Época,Año,Portada,Ilustración,Color1,Color2,@Impresión,Edición)
SET Impresión = NULLIF(@Impresión,'')
;

LOAD DATA INFILE '/var/lib/mysql-data/cero_a_cien/articulos.csv'
INTO TABLE Artículos
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Revista,Número,Sección,Título,@Autor1,@Autor2,@Coche1,@Coche2,@Coche3,@Coche4,@Coche5,@Coche6)
SET Autor1 = NULLIF(@Autor1,''),
Autor2 = NULLIF(@Autor2,''),
Coche1 = NULLIF(@Coche1,''),
Coche2 = NULLIF(@Coche2,''),
Coche3 = NULLIF(@Coche3,''),
Coche4 = NULLIF(@Coche4,''),
Coche5 = NULLIF(@Coche5,''),
Coche6 = NULLIF(@Coche6,'')
;

-- REGISTROS DE CADA TABLA

SELECT A.Revistas, B.Artículos, C.Autores, D.Coches, E.Fabricantes,F.Grupos, G.Diseñadores, H.Estudios
FROM (SELECT COUNT(R.Número) AS 'Revistas' FROM Revista R) A
CROSS JOIN (SELECT COUNT(AR.Número) AS 'Artículos' FROM Artículos AR) B
CROSS JOIN (SELECT COUNT(AT.Nombre) AS 'Autores' FROM Autores AT) C
CROSS JOIN (SELECT COUNT(C.Modelo) AS 'Coches' FROM  Coches C) D
CROSS JOIN (SELECT COUNT(F.Marca) AS 'Fabricantes' FROM Fabricantes F) E
CROSS JOIN (SELECT COUNT(G.Nombre) AS 'Grupos' FROM Grupos G) F
CROSS JOIN (SELECT COUNT(D.Nombre) AS 'Diseñadores' FROM Diseñadores D) G
CROSS JOIN (SELECT COUNT(E.Nombre) AS 'Estudios' FROM Estudios E) H
;
