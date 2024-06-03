--LDD
--Crear base de Datos

CREATE DATABASE FBD_3P_PR01
GO

--Conectar a base de Datos
USE FBD_3P_PR01
GO

--Dentro de la base de datos FBD_3P_PR01 crear una tabla llamada Materia con los campos correspondientes
CREATE TABLE Materia (
  
  IdMateria INT PRIMARY KEY,
  Nombre VARCHAR(150) NOT NULL,
  Creditos INT DEFAULT(1),
  Horas INT NOT NULL,
  Semestre INT
)
GO

--Insertar 3 materias con todos sus datos
INSERT INTO Materia
Values
(1, 'Bases de Datos', '5', '30', '1'),
(2, 'Modelos Matematicos', '4', '25', '2'),
(3, 'ISSC', '3', '20', '4');

--Insertar 1 materia sin numero de creditos
INSERT INTO Materia(IdMateria, Nombre, Horas, Semestre)
VALUES (4, 'Lengua Extranjera', '30', '1');

--Insertar 1 materia sin semestre 
INSERT INTO Materia(IdMateria, Nombre, Creditos, Horas)
VALUES (5, 'Bienestar', '15', '15');


--CONSULTAR TODAS LAS MATERIAS
SELECT * FROM Materia

--OBTENER EL IDMATERIA Y NOMBRE DE LAS MATERIAS CON MAS DE DOS HORAS
SELECT IdMateria, Nombre FROM Materia WHERE Horas > 2

--OBTENER EL NOMBRE Y CREDITOS DE LAS MATERIAS CON MENOS DE 5 CREDITOS
SELECT Nombre, Creditos FROM Materia WHERE Creditos < 5

--ACTUALIZAR EL NUMERO DE CREDITOS DE LA PRIMERA MATERIA
UPDATE Materia SET Creditos = 7 WHERE IdMateria = 1;

--CONSULTAR NOMBRE Y CREDITOS DE LA PRIMERA MATERIA
SELECT Nombre, Creditos FROM Materia WHERE IdMateria = 1

--BORRAR LA ULTIMA MATERIA INSERTADA
DELETE FROM Materia WHERE IdMateria = 5;


