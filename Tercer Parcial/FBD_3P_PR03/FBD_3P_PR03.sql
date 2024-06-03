--FBD_3P_EJ03

--CREATE DATABASE FBD_3P_PR02
CREATE DATABASE FBD_3P_PR02
GO


--CONECTAR A FBD_3P_PR02

USE FBD_3P_PR02
GO

--CREAR LA TABLA Autor

CREATE TABLE Autor(
IdAutor INT PRIMARY KEY,
Nombre VARCHAR(150) NOT NULL,
FechaNacimiento DATE,
IdNacionalidad INT FOREIGN KEY REFERENCES Nacionalidad(IdNacionalidad)
)
GO

CREATE TABLE Nacionalidad(
IdNacionalidad INT PRIMARY KEY,
Nombre VARCHAR(150) NOT NULL
)
GO

--Insertar 5 nacionalidades
INSERT INTO Nacionalidad
Values
(1, 'Mexicana'),
(2, 'Americana'),
(3, 'Española'),
(4, 'Argentino'),
(5, 'Uruguayo');

--Insertar 3 Autores uno de ellos sin nacionalidad
INSERT INTO Autor
Values
(1, 'Angel','2004-08-06',1),
(2, 'Damelio','1994-09-05',3);

INSERT INTO Autor(IdAutor, Nombre, FechaNacimiento)
VALUES (3, 'Pedro', '2002-08-07');

--Hacer INNER JOIN Autor y Nacionalidad y obtener el nombre del autor y su nacionalidad

SELECT A.Nombre, N.Nombre Nacionalidad
FROM Autor A
INNER JOIN Nacionalidad N ON A.IdNacionalidad = N.IdNacionalidad

--Hacer LEFT JOIN Autor y Nacionalidad y obtener todos los datos de nacionalidad y solo nombre de autor

SELECT A.Nombre Nombre_Autor , N.*
FROM Autor A
LEFT JOIN Nacionalidad N ON A.IdNacionalidad = N.IdNacionalidad

--Hacer RIGHT JOIN Autor y Nacionalidad y obtener todos los datos de autor más el nombre de nacionalidad

SELECT A.*, N.Nombre Nacionalidad
FROM Autor A
RIGHT JOIN Nacionalidad N ON A.IdNacionalidad = N.IdNacionalidad





SELECT * FROM Autor
SELECT * FROM Nacionalidad
