--FBD_3P_EJ02
--CONECTAR A ISSC_112

USE ISSC_112
GO

--CREAR LA TABLA Orden

CREATE TABLE Orden(
IdOrden INT PRIMARY KEY IDENTITY(1,1),
IdCliente INT FOREIGN KEY REFERENCES Cliente(IdCliente),
Fecha DATE
)
GO

CREATE TABLE Cliente(
IdCliente INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(150) NOT NULL,
Pais VARCHAR(100)
)
GO

--INSERTAR CLIENTES

INSERT INTO Cliente VALUES('Fulano','España'),('SULTANO','MARRUECOS'),('MENGANA','GRECIA');

--OBTENER CLIENTES
SELECT * FROM Cliente

--INSERTAR ORDEN

INSERT INTO Orden VALUES (1, '2023-10-31'),(1,'2023-11-01');
INSERT INTO Orden (Fecha) VALUES('2023-11-16')

--OBTENER ORDEN

SELECT * FROM Orden

--JOIN
--INNER JOIN

SELECT * FROM Cliente
INNER JOIN Orden ON Cliente.IdCliente = Orden.IdCliente

--LEFT JOIN
SELECT * FROM Cliente
LEFT JOIN Orden ON Cliente.IdCliente = Orden.IdCliente

--RIGHT JOIN
SELECT * FROM Cliente
RIGHT JOIN Orden ON Cliente.IdCliente = Orden.IdCliente

--OUTER JOIN
SELECT * FROM Cliente
FULL OUTER JOIN Orden ON Cliente.IdCliente = Orden.IdCliente

SELECT * FROM Cliente

SELECT * FROM Orden

--OBTENER ALIAS
SELECT * FROM Cliente C
SELECT * FROM Cliente AS C
INNER JOIN Orden O ON C.IdCliente = O.IdCliente

--TRAER SOLO 
SELECT C.Nombre Cliente, O.IdOrden AS NumOrden, Fecha FechaPedido 
FROM Cliente AS C
INNER JOIN Orden O ON C.IdCliente = O.IdCliente

--LDD
--DROP TABLE Orden

--ALIAS

SELECT * 
FROM Cliente CL
INNER JOIN Orden OD ON CL.IdCliente = OD.IdCliente

SELECT CL.Pais Origen, OD.IdOrden Pedido, OD.Fecha [Fecha Entrega]
FROM Cliente CL
INNER JOIN Orden OD ON CL.IdCliente = OD.IdCliente


--OBTENER UN DATO ESPECÍFICO
SELECT *
FROM Cliente C
INNER JOIN Orden O ON C.IdCliente = O.IdCliente

--TRAER PAIS

SELECT C.Pais
FROM Cliente C
INNER JOIN Orden O ON C.IdCliente = O.IdCliente
WHERE O.IdOrden = 2

--PEDIDOS A PARTIR DE NOVIEMBRE

SELECT C.Nombre Cliente, O.IdOrden Pedido
FROM Cliente C
INNER JOIN Orden O ON C.IdCliente = O.IdCliente
WHERE O.Fecha >= '2023-11-01'

--PEDIDOS A PARTIR DE NOVIEMBRE

SELECT C.Nombre Cliente, O.IdOrden Pedido
FROM Cliente C
RIGHT JOIN Orden O ON C.IdCliente = O.IdCliente
WHERE O.Fecha >= '2023-11-01'