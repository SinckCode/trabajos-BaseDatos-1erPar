--CREAR BASE DE DATOS
CREATE DATABASE FBD_3P_EJ03
GO

--CONECTAR A BD

USE FBD_3P_EJ03
GO

--CREAR TABLA Genero
CREATE TABLE Genero(
     IdGenero INT PRIMARY KEY IDENTITY(1,1),
	 Nombre VARCHAR(100) NOT NULL
)
GO

--CREAR TABLA Nacionalidad
CREATE TABLE Nacionalidad(
      IdNacionalidad INT PRIMARY KEY IDENTITY(1,1),
	  Nombre VARCHAR(100) NOT NULL
)

--CREAR TABLA JUEGO
CREATE TABLE Juego(
      IdJuego INT PRIMARY KEY IDENTITY(1,1),
	  Titulo VARCHAR(150) NOT NULL,
	  Ventas INT DEFAULT(0),
	  IdGenero INT FOREIGN KEY REFERENCES Genero(IdGenero),
	  IdNacionalidad INT FOREIGN KEY REFERENCES Nacionalidad(IdNacionalidad)
)


--INSERTAR DATOS EN GENERO
INSERT INTO Genero
VALUES
('Plataforma'),('Shooter'),('RPG'),('RTS');


--INSERTAR DATOS EN NACIONALIDAD
INSERT INTO Nacionalidad
VALUES
('JP'),('EUA'),('UE');


--INSERTAR DATOS EN JUEGO
INSERT INTO Juego
VALUES
('Mario Wonder',10000,1,1),
('COD',100000,1,2),
('Fire Emblem',1000000,1,3);

--OBTENER GENERO DE EL JUEGO COD
SELECT G.Nombre Genero FROM Juego J
INNER JOIN Genero G ON J.IdGenero = G.IdGenero
WHERE J.Titulo = 'COD'

--OBTENER NACIONALIDAD DEL JUEGO COD
SELECT N.Nombre Nacionalidad FROM Juego J
INNER JOIN Nacionalidad N ON J.IdNacionalidad = N.IdNacionalidad
WHERE J.Titulo = 'COD'

--LISTAR TODOS LOS JUEGOS CON SU JUEGO Y SU NACIONALIDAD
SELECT J.Titulo, J.Ventas, G.Nombre Genero, N.Nombre Nacionalidad FROM Juego J
INNER JOIN Genero G ON J.IdGenero = G.IdGenero
INNER JOIN Nacionalidad N ON J.IdNacionalidad = N.IdNacionalidad

--OBTENER LOS DATOS DE LOS JUEGOS DE GENERO DE PLATAFORMAS
SELECT J.Titulo, J.Ventas, G.Nombre Genero, N.Nombre Nacionalidad FROM Juego J
INNER JOIN Genero G ON J.IdGenero = G.IdGenero
INNER JOIN Nacionalidad N ON J.IdNacionalidad = N.IdNacionalidad
WHERE G.Nombre = 'Plataforma'

--OBTENER LOS DATOS DE LOS JUEGOS CON VENTAS MAYORES A 100MIL
SELECT J.Titulo, J.Ventas, G.Nombre Genero, N.Nombre Nacionalidad FROM Juego J
INNER JOIN Genero G ON J.IdGenero = G.IdGenero
INNER JOIN Nacionalidad N ON J.IdNacionalidad = N.IdNacionalidad
WHERE J.Ventas > 100000


--CREAR TABLA CLIENTE
CREATE TABLE Cliente (
IdCliente INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(150) NOT NULL,
Ciudad VARCHAR(150) NOT NULL,
Pais VARCHAR(100) NOT NULL,
Activo BIT DEFAULT(1)
)
GO

--CREAR TABLA PROVEEDOR
CREATE TABLE Provedor(
IdProveedor INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(150) NOT NULL,
NombreComercial VARCHAR(200),
Ciudad VARCHAR(150) NOT NULL,
Pais VARCHAR(100) NOT NULL,
Activo BIT DEFAULT(1)
)
GO

--INSERTAR DATOS EN CLIENTE
INSERT INTO Cliente VALUES
('Juan Pérez','CDMX','MX',1),
('María González','León','MX',1),
('Martha Noriega','LA','EUA',1),
('Pablo Hernández','Bogotá','COL',1);

--INSERTAR DATOS EN Proveedor
INSERT INTO Provedor VALUES
('Reyma','Productos Plásticos SA','León','MX',NULL),
('COSTCO','COSTCO CO','Washington','EUA',1),
('Corte Inglés',NULL,'Madrid','ESP',0);

--OBTENER DATOS DE CLIENTE
SELECT * FROM Cliente

--OBTENER DATOS DE PROVEEDOR
SELECT * FROM Provedor

--OBTENER PROVEEDORES ACTIVOS
SELECT * FROM Provedor
WHERE Activo = 1


--ACTIVAR LOS PROVEEDORES
UPDATE Provedor SET Activo = 1 WHERE Nombre = 'Corte Inglés'
UPDATE Provedor SET Activo = 1 WHERE NombreComercial = 'Productos Plásticos SA'

INSERT INTO Provedor (Nombre,NombreComercial,Ciudad,Pais)
VALUES ('OXXO','FEMSA','MTY','MX');

--OBTENER LAS CIUDADES CON ACTIVIDAD
SELECT Ciudad FROM Cliente
UNION
SELECT Ciudad FROM Provedor

--UNION CON REPETIDAS
SELECT Ciudad FROM Cliente
UNION ALL
SELECT Ciudad FROM Provedor

--UNION CD Y PAÍS
SELECT Ciudad, Pais FROM Cliente
UNION
SELECT Ciudad, Pais FROM Provedor

--DIFERENCIA ENTRE CIUDADES DE CLIENTE Y PROVEEDOR
SELECT Ciudad FROM Cliente
EXCEPT
SELECT Ciudad FROM Provedor

--TRANSACT SQL


SELECT * FROM Nacionalidad

SELECT * FROM Juego


UPDATE Juego SET IdGenero = 2 WHERE IdJuego = 3;