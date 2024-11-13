
CREATE DATABASE bolos;

USE bolos;

CREATE TABLE Cliente (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(90) UNIQUE NOT NULL,  -- Adicionando UNIQUE para evitar duplicação de nome de usuário
nome VARCHAR(90) NOT NULL,
senha VARCHAR(255) NOT NULL 
);

CREATE TABLE Produto (
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome_produto VARCHAR(90) NOT NULL,
preco_uni DOUBLE NOT NULL,
categoria VARCHAR(90)
);

CREATE TABLE Pedido (
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
data_pedido DATE NOT NULL,
valor_pedido DOUBLE NOT NULL,
desc_pedido VARCHAR(255)
);