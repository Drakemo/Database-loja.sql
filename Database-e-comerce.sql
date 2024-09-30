DROP TABLE IF EXISTS Categorias;
DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Itens_do_Pedido;
DROP TABLE IF EXISTS Pagamentos;


CREATE TABLE Categorias (
id INT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
descrição TEXT)
COMMENT = 'onde estará os produtos';

CREATE TABLE Produtos (
id INT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
descrição TEXT,
preço DECIMAL(10) NOT NULL,
estoque INT NOT NULL,
categoria_id INT,
imagem_url VARCHAR(255));

CREATE TABLE Clientes (
id INT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
senha VARCHAR(255) NOT NULL,
endereço VARCHAR(255),
telefone VARCHAR(15));

CREATE TABLE Pedidos (
id INT PRIMARY KEY,
cliente_id INT,
data_pedido DATETIME NOT NULL,
status VARCHAR(50),
total DECIMAL(10));

CREATE TABLE Itens_do_Pedido (
id INT PRIMARY KEY,
pedido_id INT,
produto_id INT,
quantidade INT NOT NULL,
preço_unitário DECIMAL(10) NOT NULL);

CREATE TABLE Pagamentos (
id INT PRIMARY KEY,
pedido_id INT,
data_pagamento DATETIME NOT NULL,
valor DECIMAL(10) NOT NULL,
método VARCHAR(50));

ALTER TABLE Produtos ADD CONSTRAINT Produtos_categoria_id_Categorias_id FOREIGN KEY (categoria_id) REFERENCES Categorias(id);
ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_cliente_id_Clientes_id FOREIGN KEY (cliente_id) REFERENCES Clientes(id);
ALTER TABLE Itens_do_Pedido ADD CONSTRAINT Itens_do_Pedido_pedido_id_Pedidos_id FOREIGN KEY (pedido_id) REFERENCES Pedidos(id);
ALTER TABLE Itens_do_Pedido ADD CONSTRAINT Itens_do_Pedido_produto_id_Produtos_id FOREIGN KEY (produto_id) REFERENCES Produtos(id);
ALTER TABLE Pagamentos ADD CONSTRAINT Pagamentos_pedido_id_Pedidos_id FOREIGN KEY (pedido_id) REFERENCES Pedidos(id);
