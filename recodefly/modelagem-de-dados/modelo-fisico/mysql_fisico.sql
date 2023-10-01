CREATE DATABASE Recodefly;

USE Recodefly;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(255),
    dataNascimento DATE,
    cidade VARCHAR(255),
    estado VARCHAR(255),
    pais VARCHAR(255),
    cpf BIGINT,
    login VARCHAR(255),
    senha VARCHAR(255)
);

CREATE TABLE Destino (
    idDestino INT PRIMARY KEY,
    origem VARCHAR(255),
    destino VARCHAR(255)
);

CREATE INDEX idx_cliente ON Cliente (idCliente, login);

CREATE TABLE Reserva (
    idReserva INT PRIMARY KEY,
    fk_Cliente_idCliente INT,
    fk_Cliente_login VARCHAR(255),
    fk_Destino_idDestino INT,
    FOREIGN KEY (fk_Cliente_idCliente, fk_Cliente_login) 
        REFERENCES Cliente (idCliente, login)
        ON DELETE RESTRICT,
    FOREIGN KEY (fk_Destino_idDestino)
        REFERENCES Destino (idDestino)
        ON DELETE SET NULL
);