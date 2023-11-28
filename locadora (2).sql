DROP DATABASE IF exists locadora;

CREATE DATABASE locadora;

USE locadora;

CREATE TABLE Veiculo (
	VeiculoID 	INT PRIMARY KEY,
    Placa   	VARCHAR(8),
    Modelo  	VARCHAR(50),
    Cor     	VARCHAR(30),
    Diaria  	FLOAT
);

CREATE TABLE Cliente (
	ClienteId 		INT PRIMARY KEY,
    Nome      		VARCHAR(100),
    CPF       	   	VARCHAR(20),
    DataNascimento 	DATE
);

CREATE TABLE Locacao (
    LocacaoID 	INT PRIMARY KEY,
    VeiculoID 	INT,
    ClienteID 	INT,
    DataInicio	DATE,
    DataFim 	DATE,
    TempoLocado INT,
    ValorTotal 	DECIMAL(10, 2),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(VeiculoID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);
CREATE VIEW ViewLocacoes AS
SELECT
    L.LocacaoID AS CodLocaçao,
    V.Modelo AS Veiculo,
    V.Cor AS Cor,
    V.Placa AS Placa,
    V.Diaria AS Diaria,
    C.Nome AS Nome,
    C.CPF AS CPF,
    C.DataNascimento AS Nascimento,
    L.TempoLocado AS Dias,
    L.ValorTotal AS Total
FROM
    Locacao L
JOIN
    Veiculo V ON L.VeiculoID = V.VeiculoID
JOIN
    Cliente C ON L.ClienteID = C.ClienteID;
    
SELECT * FROM viewlocacoes;
    