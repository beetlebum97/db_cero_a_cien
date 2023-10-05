-- CREAR BASE DE DATOS

CREATE DATABASE CERO_A_CIEN
GO

USE CERO_A_CIEN
GO

-- CREAR TABLAS
-- Nombre de columna con espacios debe estar entre corchetes [].



CREATE TABLE Grupos(
	ID int PRIMARY KEY,
	Nombre nvarchar(255) UNIQUE NOT NULL,
	País nvarchar(255) NULL,
	Sede nvarchar(255) NULL,
	Fundación nvarchar(255) NULL,
	Empleados int NULL,
	Patrimonio nvarchar(255) NULL,
	[Valor bursátil] nvarchar(255) NULL,
	Propietario1 nvarchar(255) NULL,
	Propietario2 nvarchar(255) NULL,
	Propietario3 nvarchar(255) NULL
)
GO

CREATE TABLE Fabricantes(
	ID int PRIMARY KEY,
	Marca nvarchar(255) UNIQUE NOT NULL,
	Empresa nvarchar(255) NOT NULL,
	País nvarchar(255) NOT NULL,
	Región nvarchar(255) NOT NULL,
	Sede nvarchar(255) NOT NULL,
	Fundación int NULL,
	Disolución int NULL,
	Empleados int NULL,
	Grupo nvarchar(255),

    FOREIGN KEY (Grupo) REFERENCES Grupos (Nombre) 
)
GO

CREATE TABLE Estudios(
	ID int PRIMARY KEY,
	Nombre nvarchar(255) UNIQUE NOT NULL,
	País nvarchar(255) NULL,
	Sede nvarchar(255) NULL,
	Fundación int NULL,
	Disolución int NULL
)
GO

CREATE TABLE Diseñadores(
	ID int PRIMARY KEY,
	Nombre nvarchar(255) UNIQUE NOT NULL,
	País nvarchar(255) NULL,
	Ciudad nvarchar(255) NULL
)
GO

CREATE TABLE Autores(
	ID int PRIMARY KEY,
	Nombre nvarchar(255) UNIQUE NOT NULL,
	Puesto nvarchar(255)
)
GO

CREATE TABLE Coches(
	ID int PRIMARY KEY,
	Modelo nvarchar(255) UNIQUE NOT NULL, 
	Fabricante nvarchar(255) NOT NULL,
	Diseñador nvarchar(255),
	Estudio nvarchar(255),
	Unidades int, 
	Producción nvarchar(255),
	[Configuración motor] nvarchar(255),
	Tracción nvarchar(255),
	[Cilindrada(cc)] nvarchar(255),
	Motor nvarchar(255),
	[Potencia(CV)] nvarchar(255),
	Transmisión nvarchar(255),
	[Velocidad(km/h)] int,
	[0-100(s)] decimal(3,1),
	[Consumo(L/100)] decimal(3,1),
	[Peso(Kg)] nvarchar(255),


	FOREIGN KEY (Fabricante) REFERENCES Fabricantes (Marca),
	FOREIGN KEY (Diseñador) REFERENCES Diseñadores (Nombre),
	FOREIGN KEY (Estudio) REFERENCES Estudios (Nombre)

) 
GO

CREATE TABLE Revista(
	Número int PRIMARY KEY,
	Periodo nvarchar(255) NOT NULL,
	Año int NOT NULL,
	Portada nvarchar(255),	
	Ilustración nvarchar(255),
	Color1 nvarchar(255),
	Color2 nvarchar(255),
	Impresión nvarchar(255),
	Edición nvarchar(255),

	FOREIGN KEY (Portada) REFERENCES Coches (Modelo),
	FOREIGN KEY (Ilustración) REFERENCES Autores (Nombre)
) 
GO

CREATE TABLE Artículos(
	Revista int,
	Número int PRIMARY KEY,
	Sección nvarchar(255) CHECK (Sección IN('Arquitectura','Arte','Automodelismo','Carta del editor','Divulgación técnica',
	'Garajes de ensueño','Libros','Modelo mítico','Museos','Relojes','Reportajes','Rutas','Todos los coches van al cielo')),
	Título nvarchar(255) NOT NULL,
	Autor1 nvarchar(255),	
	Autor2 nvarchar(255),
	Coche1 nvarchar(255),
	Coche2 nvarchar(255),
	Coche3 nvarchar(255),
	Coche4 nvarchar(255),
	Coche5 nvarchar(255),
	Coche6 nvarchar(255),

	FOREIGN KEY (Revista) REFERENCES Revista (Número),
	FOREIGN KEY (Autor1) REFERENCES Autores (Nombre),
	FOREIGN KEY (Autor2) REFERENCES Autores (Nombre),
	FOREIGN KEY (Coche1) REFERENCES Coches (Modelo),
	FOREIGN KEY (Coche2) REFERENCES Coches (Modelo),
	FOREIGN KEY (Coche3) REFERENCES Coches (Modelo),
	FOREIGN KEY (Coche4) REFERENCES Coches (Modelo),
	FOREIGN KEY (Coche5) REFERENCES Coches (Modelo),
	FOREIGN KEY (Coche6) REFERENCES Coches (Modelo)
) 
GO

-- IMPORTAR/INSERTAR REGISTROS
-- BULK INSERT: Modificar directorio del archivo.csv según su ubicación.

BULK INSERT Grupos
FROM 'D:\db_cero_a_cien\data\grupos.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE='65001'
	)
GO


BULK INSERT Fabricantes
FROM 'D:\db_cero_a_cien\data\fabricantes.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE='65001'
	)
GO

BULK INSERT Estudios
FROM 'D:\db_cero_a_cien\data\estudios.csv' 
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE='65001'
	)
GO


BULK INSERT Diseñadores
FROM 'D:\db_cero_a_cien\data\disenadores.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE='65001'
	)
GO

BULK INSERT Autores
FROM 'D:\db_cero_a_cien\data\autores.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE='65001'
	)
GO

BULK INSERT Coches
FROM 'D:\db_cero_a_cien\data\coches.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE='65001'
	)
GO

BULK INSERT Revista
FROM 'D:\db_cero_a_cien\data\revista.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE='65001'
	)
GO

BULK INSERT Artículos
FROM 'D:\db_cero_a_cien\data\articulos.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE='65001'
	)
GO

-- REGISTROS DE CADA TABLA

SELECT A.Revistas, B.Artículos, C.Autores, D.Coches, E.Fabricantes,F.Grupos, G.Diseñadores, H.Estudios
FROM (SELECT COUNT(R.Número) AS 'Revistas' FROM Revista R) A
CROSS JOIN (SELECT COUNT(AR.Número) AS 'Artículos' FROM Artículos AR) B
CROSS JOIN (SELECT COUNT (AT.Nombre) AS 'Autores' FROM Autores AT) C
CROSS JOIN (SELECT COUNT(C.Modelo) AS 'Coches' FROM  Coches C) D
CROSS JOIN (SELECT COUNT(F.Marca) AS 'Fabricantes' FROM Fabricantes F) E
CROSS JOIN (SELECT COUNT (G.Nombre) AS 'Grupos' FROM Grupos G) F
CROSS JOIN (SELECT COUNT(D.Nombre) AS 'Diseñadores' FROM Diseñadores D) G
CROSS JOIN (SELECT COUNT(E.Nombre) AS 'Estudios' FROM Estudios E) H 
GO