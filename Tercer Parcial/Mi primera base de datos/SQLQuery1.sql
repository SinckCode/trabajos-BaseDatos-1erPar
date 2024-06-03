--LDD
--Crear base de Datos

CREATE DATABASE ISSC_112
GO

--Conectar a base de Datos
USE ISSC_112
GO

--Crear tabla
CREATE TABLE Alumno (
  
  Matricula INT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(200) NOT NULL,
  Correo VARCHAR(200) UNIQUE,
  Telefono VARCHAR(20) DEFAULT('N/A')
)
GO

--LMD / CRUD CREATE READ DELETE
--OBTENER TODOS LOS DATOS DE ALUMNO
SELECT Matricula, Nombre, Apellido, Correo, Telefono FROM Alumno

--OBTENE TODOS LOS CAMPOS DE ALUMNO COMODIN
SELECT * FROM Alumno

--OBTENER NOMBRE Y APELLIDO DE ALUMNO
SELECT Nombre, Apellido FROM Alumno

--OBTENER NOMBRE Y APELLIDO
SELECT Nombre, Apellido FROM Alumno WHERE Matricula = 4;

--OBTENER TODOS LOS DATOS DONDE MATRÍCULA SEA MENOR A 4
SELECT * FROM Alumno WHERE Matricula < 4

--INSERTAR TUPLA ALUMNO
INSERT INTO Alumno (Matricula, Nombre, Apellido, Correo, Telefono)
VALUES (1, 'Edgar', 'Castro', 'edgar@correo.com', '477-123-45');

--INSERTAR TUPLA SIN TELEFONO
INSERT INTO Alumno (Matricula, Nombre, Apellido, Correo)
VALUES (2, 'Alvaro', 'Mora', 'alvaro@correo.com');

--INSERTAR TUPLA CON TODOS LOS CAMPOS

INSERT INTO Alumno
Values(3, 'Cesar', 'Carrillo', 'cesar@correo.com', '477-567-89');

--INSERTAR DOS TUPLAS
INSERT INTO Alumno
Values
(4, 'Adriel', 'Plasencia', 'adriel@correo.com', '477-567-89'),
(5, 'Carlos', 'Morrison', 'carlos@correo.com', '477-567-89');

--ACTUALIZAR UN DATO DE ALUMNO
UPDATE Alumno SET Telefono = '477-098-76' WHERE Matricula = 2;

--ELIMINAR UNA TUPLA DE ALUMNO
DELETE FROM Alumno WHERE Matricula = 5 AND Matricula < 7;