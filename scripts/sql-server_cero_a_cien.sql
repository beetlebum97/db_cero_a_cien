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
	Pa�s nvarchar(255) NULL,
	Sede nvarchar(255) NULL,
	Fundaci�n nvarchar(255) NULL,
	Empleados int NULL,
	Patrimonio nvarchar(255) NULL,
	[Valor burs�til] nvarchar(255) NULL,
	Propietario1 nvarchar(255) NULL,
	Propietario2 nvarchar(255) NULL,
	Propietario3 nvarchar(255) NULL
)
GO

CREATE TABLE Fabricantes(
	ID int PRIMARY KEY,
	Marca nvarchar(255) UNIQUE NOT NULL,
	Empresa nvarchar(255) NOT NULL,
	Pa�s nvarchar(255) NOT NULL,
	Regi�n nvarchar(255) NOT NULL,
	Sede nvarchar(255) NOT NULL,
	Fundaci�n int NULL,
	Disoluci�n int NULL,
	Empleados int NULL,
	Grupo nvarchar(255),

    FOREIGN KEY (Grupo) REFERENCES Grupos (Nombre) 
)
GO

CREATE TABLE Estudios(
	ID int PRIMARY KEY,
	Nombre nvarchar(255) UNIQUE NOT NULL,
	Pa�s nvarchar(255) NULL,
	Sede nvarchar(255) NULL,
	Fundaci�n int NULL,
	Disoluci�n int NULL
)
GO

CREATE TABLE Dise�adores(
	ID int PRIMARY KEY,
	Nombre nvarchar(255) UNIQUE NOT NULL,
	Pa�s nvarchar(255) NULL,
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
	Dise�ador nvarchar(255),
	Estudio nvarchar(255),
	Unidades int, 
	Producci�n nvarchar(255),
	[Configuraci�n motor] nvarchar(255),
	Tracci�n nvarchar(255),
	[Cilindrada(cc)] nvarchar(255),
	Motor nvarchar(255),
	[Potencia(CV)] nvarchar(255),
	Transmisi�n nvarchar(255),
	[Velocidad(km/h)] int,
	[0-100(s)] decimal(3,1),
	[Consumo(L/100)] decimal(3,1),
	[Peso(Kg)] nvarchar(255),


	FOREIGN KEY (Fabricante) REFERENCES Fabricantes (Marca),
	FOREIGN KEY (Dise�ador) REFERENCES Dise�adores (Nombre),
	FOREIGN KEY (Estudio) REFERENCES Estudios (Nombre)

) 
GO

CREATE TABLE Revista(
	N�mero int PRIMARY KEY,
	Periodo nvarchar(255) NOT NULL,
	A�o int NOT NULL,
	Portada nvarchar(255),	
	Ilustraci�n nvarchar(255),
	Color1 nvarchar(255),
	Color2 nvarchar(255),
	Impresi�n nvarchar(255),
	Edici�n nvarchar(255),

	FOREIGN KEY (Portada) REFERENCES Coches (Modelo),
	FOREIGN KEY (Ilustraci�n) REFERENCES Autores (Nombre)
) 
GO

CREATE TABLE Art�culos(
	Revista int,
	N�mero int PRIMARY KEY,
	Secci�n nvarchar(255) CHECK (Secci�n IN('Arquitectura','Arte','Automodelismo','Carta del editor','Divulgaci�n t�cnica',
	'Garajes de ensue�o','Libros','Modelo m�tico','Museos','Relojes','Reportajes','Rutas','Todos los coches van al cielo')),
	T�tulo nvarchar(255) NOT NULL,
	Autor1 nvarchar(255),	
	Autor2 nvarchar(255),
	Coche1 nvarchar(255),
	Coche2 nvarchar(255),
	Coche3 nvarchar(255),
	Coche4 nvarchar(255),
	Coche5 nvarchar(255),
	Coche6 nvarchar(255),

	FOREIGN KEY (Revista) REFERENCES Revista (N�mero),
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
-- BULK INSERT: Modificar directorio del archivo.csv seg�n su ubicaci�n.

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


BULK INSERT Dise�adores
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

BULK INSERT Art�culos
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

SELECT A.Revistas, B.Art�culos, C.Autores, D.Coches, E.Fabricantes,F.Grupos, G.Dise�adores, H.Estudios
FROM (SELECT COUNT(R.N�mero) AS 'Revistas' FROM Revista R) A
CROSS JOIN (SELECT COUNT(AR.N�mero) AS 'Art�culos' FROM Art�culos AR) B
CROSS JOIN (SELECT COUNT (AT.Nombre) AS 'Autores' FROM Autores AT) C
CROSS JOIN (SELECT COUNT(C.Modelo) AS 'Coches' FROM  Coches C) D
CROSS JOIN (SELECT COUNT(F.Marca) AS 'Fabricantes' FROM Fabricantes F) E
CROSS JOIN (SELECT COUNT (G.Nombre) AS 'Grupos' FROM Grupos G) F
CROSS JOIN (SELECT COUNT(D.Nombre) AS 'Dise�adores' FROM Dise�adores D) G
CROSS JOIN (SELECT COUNT(E.Nombre) AS 'Estudios' FROM Estudios E) H 
GO