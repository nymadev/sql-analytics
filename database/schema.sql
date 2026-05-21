-- Criar database
CREATE DATABASE vendas_simples;

-- Conectar ao database
\c vendas_simples;

-- Tabela: Clientes
CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  pais VARCHAR(50),
  data_criacao DATE DEFAULT CURRENT_DATE
);


-- Tabela: Produtos
CREATE TABLE produtos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  categoria VARCHAR(50),
  preco DECIMAL(10, 2) NOT NULL,
  estoque INT DEFAULT 0
);


-- Tabela: Vendas
CREATE TABLE vendas (
  id SERIAL PRIMARY KEY,
  cliente_id INT NOT NULL REFERENCES clientes(id),
  produto_id INT NOT NULL REFERENCES produtos(id),
  quantidade INT NOT NULL,
  valor_total DECIMAL(10, 2),
  data_venda DATE DEFAULT CURRENT_DATE,
  status VARCHAR(20) DEFAULT 'Completo'
  );