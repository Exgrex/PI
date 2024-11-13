CREATE DATABASE bolos;

USE bolos;

CREATE TABLE Cliente (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(90) UNIQUE NOT NULL,  -- Adicionando UNIQUE para evitar duplicação de nome de usuário
nome VARCHAR(90) NOT NULL,
senha VARCHAR(255) NOT NULL 
);

CREATE TABLE Pedido_Produto (
    id_pedido_produto INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

SELECT 
    p.id_pedido,
    p.data_pedido,
    p.valor_pedido,
    p.desc_pedido,
    pr.id_produto,
    pr.nome_produto,
    pr.preco_uni,
    pp.quantidade
FROM 
    Pedido p
JOIN 
    Pedido_Produto pp ON p.id_pedido = pp.id_pedido
JOIN 
    Produto pr ON pp.id_produto = pr.id_produto;
