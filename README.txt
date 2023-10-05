
<<<< BASE DE DATOS CERO A CIEN >>>>

[ INTRODUCCIÓN ] 

Base de datos de la revista de coches Cero a Cien. 
Es un ejercicio de como crear una base de datos y clasificar los datos.
(esquema: diagrama.png).

Recoge los 10 primeroas números de la revista (nº actual: 11) en las siguientes tablas:

- Revistas (10 registros).
- Artículos (170 registros).
- Autores (72 registros).
- Coches (63 registros).
- Fabricantes (28 registros).
- Grupos (15 registros).
- Diseñadores (35 registros).
- Estudios (11 registros).

El repositorio contiene los scripts y datos necesarios 
para cargar la base de datos en servidores SQL Server y MySQL (MariaDB). 

Versiones utilizadas:

- SQL Server: 16.0.1050.5
- MySQL: 10.11.3-MariaDB-1
- MySQL: 5.7.15-log


[ EJECUCIÓN SQL SERVER ]

1º) EDITAR SCRIPT SQL-SERVER_CERO_A_CIEN.SQL

Instrucciones BULK INSERT: Modificar directorio del archivo.csv según su ubicación.

BULK INSERT Tabla
FROM 'directorio\archivo.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE='65001'
	)

2º) LANZAR SCRIPT SQL-SERVER_CERO_A_CIEN.SQL

-> OPCIÓN 1 COMANDO

sqlcmd -S servidor -U usuario -P password -i directorio\sql-server_cero_a_cien.sql

-> OPCIÓN 2 COMANDO

sqlcmd -S servidor -U usuario -P password
1> :r directorio\sql-server_cero_a_cien.sql
2> GO

-> OPCIÓN 3 SQL SERVER MANAGEMENT STUDIO

Cargar script sql y lanzar (F5).

*** RESULTADO ***

1> :r D:\db_cero_a_cien\scripts\sql-server_cero_a_cien.sql
Se cambió el contexto de la base de datos a 'CERO_A_CIEN'.

(15 filas afectadas)

(28 filas afectadas)

(11 filas afectadas)

(35 filas afectadas)

(72 filas afectadas)

(63 filas afectadas)

(10 filas afectadas)

(170 filas afectadas)
Revistas    Artículos   Autores     Coches      Fabricantes Grupos      Diseñadores Estudios
----------- ----------- ----------- ----------- ----------- ----------- ----------- -----------
         10         170          72          63          28          15          35          11

(1 filas afectadas)


[ EJECUCIÓN MYSQL-MARIADB ]

1º) EDITAR SCRIPT MYSQL_CERO_A_CIEN.SQL

LOAD DATA: Adaptar ruta de los ficheros .csv según su ubicación.
LOAD DATA INFILE = archivos ubicados en el servidor.
LOAD DATA LOCAL FILE = archivos ubicados en el cliente.

-LINUX-

Recomendable usar directorio dentro de /var/lib para evitar problemas de permisos que
requieran cambio de configuración: ERROR 13 (HY000) (Errcode: 13 "Permission denied").
Cambio de línea: '\n'.

LOAD DATA INFILE '/var/lib/mysql-data/archivo.csv'
LINES TERMINATED BY '\n' 

-WINDOWS-

Recomendable usar directorio C:\\ProgramData\\MySQL\\MySQL Server <versión>\\Data
para evitar problemas de permisos: ERROR 13 (HY000) (Errcode: 13 "Permission denied") 
que requieran cambio de configuración. Cambio de línea: '\r\n'.

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Data\archivo.csv'
LINES TERMINATED BY '\r\n'

2º) LANZAR SCRIPT MYSQL_CERO_A_CIEN.SQL

-> OPCIÓN 1

mysql -u usuario -p < directorio/mysql_cero_a_cien.sql

-> OPCIÓN 2

mysql -u usuario -p
MariaDB [(none)]> source directorio/mysql_cero_a_cien.sql

-> OPCIÓN 3 WORKBENCH

Cargar script sql y lanzar.

*** RESULTADO ***

MariaDB [(none)]> source mysql_cero_a_cien.sql
Query OK, 1 row affected (0,000 sec)

Database changed
Query OK, 0 rows affected (0,009 sec)

Query OK, 0 rows affected (0,010 sec)

Query OK, 0 rows affected (0,009 sec)

Query OK, 0 rows affected (0,009 sec)

Query OK, 0 rows affected (0,007 sec)

Query OK, 0 rows affected (0,014 sec)

Query OK, 0 rows affected (0,011 sec)

Query OK, 0 rows affected (0,023 sec)

Query OK, 15 rows affected (0,002 sec)
Records: 15  Deleted: 0  Skipped: 0  Warnings: 0

Query OK, 28 rows affected (0,002 sec)
Records: 28  Deleted: 0  Skipped: 0  Warnings: 0

Query OK, 11 rows affected (0,002 sec)
Records: 11  Deleted: 0  Skipped: 0  Warnings: 0

Query OK, 35 rows affected (0,003 sec)
Records: 35  Deleted: 0  Skipped: 0  Warnings: 0

Query OK, 72 rows affected (0,002 sec)
Records: 72  Deleted: 0  Skipped: 0  Warnings: 0

Query OK, 63 rows affected (0,003 sec)
Records: 63  Deleted: 0  Skipped: 0  Warnings: 0

Query OK, 10 rows affected (0,001 sec)
Records: 10  Deleted: 0  Skipped: 0  Warnings: 0

Query OK, 170 rows affected (0,007 sec)
Records: 170  Deleted: 0  Skipped: 0  Warnings: 0

+----------+------------+---------+--------+-------------+--------+--------------+----------+
| Revistas | Artículos  | Autores | Coches | Fabricantes | Grupos | Diseñadores  | Estudios |
+----------+------------+---------+--------+-------------+--------+--------------+----------+
|       10 |        170 |      72 |     63 |          28 |     15 |           35 |       11 |
+----------+------------+---------+--------+-------------+--------+--------------+----------+
1 row in set (0,001 sec)


