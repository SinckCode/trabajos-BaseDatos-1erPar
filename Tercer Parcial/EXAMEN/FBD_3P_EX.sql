--CREAR BASE DE DATOS
CREATE DATABASE FBD_3P_EX
GO

--CONECTAR A BD
USE FBD_3P_EX
GO

--CREAR TABLA Especies
CREATE TABLE Especies(
     IdEspecies INT PRIMARY KEY IDENTITY(1,1),
	 Nombre VARCHAR(50) NOT NULL
)
GO

--CREAR TABLA Vehiculos
CREATE TABLE Vehiculos(
     IdVehiculos INT PRIMARY KEY IDENTITY(1,1),
	 Nombre VARCHAR(50) NOT NULL,
	 Tipo VARCHAR(50) NOT NULL,
	 Armamento VARCHAR(250) NOT NULL,
	 IdEspecies INT FOREIGN KEY REFERENCES Especies(IdEspecies)
)
GO

--CREAR TABLA Soldados
CREATE TABLE Soldados(
      IdSoldados INT PRIMARY KEY IDENTITY(1,1),
	  Nombre VARCHAR(50) NOT NULL,
	  Rango VARCHAR(50) NOT NULL,
	  Planeta_Natal VARCHAR(50) NOT NULL,
	  IdEspecies INT FOREIGN KEY REFERENCES Especies(IdEspecies)
)
GO
--CREAR TABLA ARMAS
CREATE TABLE Armas(
      IdArmas INT PRIMARY KEY IDENTITY(1,1),
	  Nombre VARCHAR(50) NOT NULL,
	  IdEspecies INT FOREIGN KEY REFERENCES Especies(IdEspecies)
)
GO
--CREAR TABLA ARMADURAS
CREATE TABLE Armaduras(
      IdArmaduras INT PRIMARY KEY IDENTITY(1,1),
	  Nivel VARCHAR(50) NOT NULL,
	  IdEspecies INT FOREIGN KEY REFERENCES Especies(IdEspecies),
	  Activo BIT DEFAULT(1)
)
GO
--CREAR TABLA DetalleVehiculos
CREATE TABLE DetalleVehiculos(
      IdDetalleVehiculos INT PRIMARY KEY IDENTITY(1,1),
	  IdVehiculos INT FOREIGN KEY REFERENCES Vehiculos(IdVehiculos),
	  IdSoldados INT FOREIGN KEY REFERENCES Soldados(IdSoldados),
	  Tripulantes VARCHAR(250) NOT NULL,
	  Debilidad VARCHAR(250) NOT NULL
)
GO
--CREAR TABLA DetalleArmas
CREATE TABLE DetalleArmas(
      IdDetalleArmas INT PRIMARY KEY IDENTITY(1,1),
	  IdArmas INT FOREIGN KEY REFERENCES Armas(IdArmas),
	  IdSoldados INT FOREIGN KEY REFERENCES Soldados(IdSoldados),
	  Letalidad VARCHAR(250) NOT NULL
)
GO


--INSERTAR DATOS EN Especies
INSERT INTO Especies
VALUES
('Humano'),('Covenant'),('Forerunner'),('Flood'),('IA');

--INSERTAR DATOS EN Especies
INSERT INTO Especies
VALUES
('Prometeos'),('Hunters'),('Drones'),('Ingenieros'),('Jackals');

--INSERTAR DATOS EN Especies
INSERT INTO Especies
VALUES
('Ingenieros'),('Jackals');

--INSERTAR DATOS EN Vehiculos
INSERT INTO Vehiculos (Nombre,Tipo,Armamento,IdEspecies)
VALUES
('Warthog','Terrestre','Ametralladora de tres cañones',1),
('Pelican','Aéreo','Torreta Frontal',1),
('Scorpion','Terrestre','Cañón de proyectibles de 90mm',1),
('Banshee','Aéreo','2 Cañones de plasma',2),
('Phantom','Aéreo','3 Cañónes de energía',2),
('Scarab','Terrestre','Cañon de energía clase 5',2),
('Centinelas','Aéreo','Desconocido',3);

--INSERTAR DATOS EN Vehiculos
INSERT INTO Vehiculos (Nombre,Tipo,Armamento,IdEspecies)
VALUES
('Avispa AV-29','Aéreo','Ametralladora ligera',1),
('Tanque Mortero','Terreste','Cañón de plasma Nivel 5',2),
('Phaeton','Aereo','Cañón de energía de disparo rápido',3);

--INSERTAR DATOS EN Soldados
INSERT INTO Soldados (Nombre,Rango,Planeta_Natal,IdEspecies)
VALUES
('Jhon 117','Spartan II','Eridanus II',1),
('Cortana','IA','Reach',1),
('Thel Vadam','Inquisidor','Vadam Shanghelios',2),
('Profeta de la Verdad','Jerarca','Gran caridad',2),
('Didacta','Prometeo','Nomdagro',3),
('La Bibliotecaria','Moldeadora de vida','Nomdagro',3);

--INSERTAR DATOS EN Soldados
INSERT INTO Soldados (Nombre,Rango,Planeta_Natal,IdEspecies)
VALUES
('Grunt005','Gruntss','Gruntiano',2),
('Atriox','Lider Desterrado','Decimus',2),
('Isabel','IA','Prometeus',2),
('Noble 6','Spartan III',' Pegasi Delta',2);

--INSERTAR DATOS EN Armas
INSERT INTO Armas (Nombre,IdEspecies)
VALUES
('Metralladora Pesada',1),
('M6G Magnum',1),
('Rifle de asalto MA5',1),
('Rifle de Enfoque',2),
('Espada de Energía',2),
('Rifle de aplicaciones',3);

--INSERTAR DATOS EN Armas
INSERT INTO Armas (Nombre,IdEspecies)
VALUES
('Metralladora Ligera',1),
('Cañon de plasma',2),
('Aguijionador',2),
('Arma Four',3);

--INSERTAR DATOS EN Armaduras
INSERT INTO Armaduras(Nivel,IdEspecies)
VALUES
('MJOLNIR MARK I',1),
('MJOLNIR MARK II',1),
('MJOLNIR MARK III',1),
('MJOLNIR MARK IV',1),
('Ranger',2),
('Ultra',2),
('Zealot',2),
('Officer',2),
('Piel de Combate Clase 12',3);

--INSERTAR DATOS EN Armaduras
INSERT INTO Armaduras(Nivel,IdEspecies)
VALUES
('Armadura Flood',4);

DROP TABLE Armaduras
select * from Especies

--INSERTAR DATOS EN DetalleVehiculos
INSERT INTO DetalleVehiculos (IdVehiculos,IdSoldados,Tripulantes,Debilidad)
VALUES
(1,1,'3 pasajeros','Tendencia a volcar'),
(2,2,'2 + 10 asientos + 1 artillero','Los Banshee'),
(3,3,'1 conductor + 1 artillero + 4 pasajeros','La Lentitud'),
(4,4,'1 conductor','Muy poco blindado'),
(5,5,'1 piloto + 2 artilleros + 24 en bodega','Hurnet o Falcon'),
(6,6,'1 piloto + 1 coopiloto','Varios pelotones'),
(7,6,'Desconocido','Desconocido');

--INSERTAR DATOS EN DetalleVehiculos
INSERT INTO DetalleVehiculos (IdVehiculos,IdSoldados,Tripulantes,Debilidad)
VALUES
(8,8,'2 pasajeros','Tendencia a explotar'),
(9,9,'1 conductor + 1 artillero','Muy lentos'),
(10,10,'1 conductor','Volador ligero');


select * from Vehiculos

--INSERTAR DATOS EN DetalleArmas
INSERT INTO DetalleArmas (IdArmas,IdSoldados,Letalidad)
VALUES
(1,1,'Balas perforadoras'),
(2,2,'Balas de 50mm'),
(3,3,'600 balas por minuto'),
(4,4,'Con una bala se mata un Spartan'),
(5,5,'Con un swing se mata un Spartan'),
(6,6,'Haz de luz');

--INSERTAR DATOS EN DetalleArmas
INSERT INTO DetalleArmas (IdArmas,IdSoldados,Letalidad)
VALUES
(7,7,'Balas perforadoras ligeras'),
(8,8,'Perforante plasmatico'),
(9,9,'Aguijones explosivos'),
(10,10,'Todo explota');

select * from Armas

--ACTUALIZAR 5 REGISTROS
select * from Especies
select * from Vehiculos
select * from Soldados
select * from Armas
select * from Armaduras

UPDATE Especies SET Nombre = 'Brutes' WHERE Nombre = 'Jackals'
UPDATE Vehiculos SET Armamento = 'Todo lo inimaginable' WHERE Armamento = 'Desconocido'
UPDATE Soldados SET Nombre = 'Tvaoan' WHERE Nombre = 'Grunt005'
UPDATE Armas SET Nombre = 'Anillos Halo' WHERE Nombre = 'Arma Four'
UPDATE Armaduras SET Nivel = 'Desterrada' WHERE Nivel = 'Armadura Flood'



--Realizar 3 bajas lógicas en una tabla

UPDATE Armaduras SET Activo = 0 WHERE Nivel = 'MJOLNIR MARK II'
UPDATE Armaduras SET Activo = 0 WHERE Nivel = 'Ultra'
UPDATE Armaduras SET Activo = 0 WHERE Nivel = 'Desterrada'

--Realizar 2 bajas definitivas en cualquier tabla

DELETE FROM Especies WHERE IdEspecies = 11
DELETE FROM Especies WHERE IdEspecies = 12

DROP TABLE Especies

--Generar 10 consultas de las cuales por lo menos 3 deben incluir la clausula JOIN, al menos 1 Union (todas deben especificar los campos a seleccionar [no usar comodin])

SELECT * FROM Armas A
INNER JOIN Armaduras Ar ON A.IdEspecies = Ar.IdEspecies

SELECT * FROM Armas A
LEFT JOIN Armaduras Ar ON A.IdEspecies = Ar.IdEspecies

SELECT * FROM Armas A
RIGHT JOIN Armaduras Ar ON A.IdEspecies = Ar.IdEspecies

--ACTIVOS
SELECT * FROM Armas A
INNER JOIN Armaduras Ar ON A.IdEspecies = Ar.IdEspecies
WHERE Ar.Activo = 1

--ARMADURAS ACTIVAS
SELECT * FROM Armaduras
WHERE Activo = 1

--ARMADURAS DESACTIVADAS
SELECT * FROM Armaduras
WHERE Activo = 0

SELECT * FROM Armas A
INNER JOIN Armaduras Ar ON A.IdEspecies = Ar.IdEspecies
WHERE Ar.Activo = 0

SELECT A.Nombre Armas FROM Armas A
INNER JOIN Armaduras Ar ON A.IdEspecies = Ar.IdEspecies
WHERE A.IdEspecies = 3


--ARMAS COVENANT
SELECT A.Nombre ArmasCovenant FROM Armas A
WHERE A.IdEspecies = 2

--ARMAS HUMANAS
SELECT A.Nombre ArmasHumanas FROM Armas A
WHERE A.IdEspecies = 1

SELECT V.Nombre Vehiculos FROM Vehiculos V
INNER JOIN Armaduras Ar ON V.IdEspecies = Ar.IdEspecies
WHERE V.IdEspecies = 3

--VEHICULOS COVENANT
SELECT V.Nombre VehiculosCovenant FROM Vehiculos V
WHERE V.IdEspecies = 2

--VEHICULOS HUMANOS
SELECT V.Nombre VehiculosHumanos FROM Vehiculos V
WHERE V.IdEspecies = 1

--VEHICULOS FORERUNNER
SELECT V.Nombre VehiculosForerunner FROM Vehiculos V
WHERE V.IdEspecies = 3

select * from Soldados

UPDATE Soldados SET IdEspecies = 1 WHERE IdSoldados = 9
UPDATE Soldados SET IdEspecies = 1 WHERE IdSoldados = 10

--SOLDADOS COVENANT
SELECT S.Nombre SoldadosCovenant FROM Soldados S
WHERE S.IdEspecies = 2

--SOLDADOS HUMANOS
SELECT S.Nombre SoldadosCovenant FROM Soldados S
WHERE S.IdEspecies = 2

--SOLDADOS FORERUNNER
SELECT V.Nombre VehiculosForerunner FROM Vehiculos V
WHERE V.IdEspecies = 3

SELECT A.Nombre Armas FROM Armas A
WHERE A.IdEspecies = 1

SELECT Nombre FROM Armas
UNION 
SELECT Nombre FROM Vehiculos

SELECT Nombre FROM Armas
UNION 
SELECT Nombre FROM Especies

SELECT Nombre FROM Armas
EXCEPT 
SELECT Nombre FROM Especies





