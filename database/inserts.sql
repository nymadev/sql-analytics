-- ============================================
-- INSERIR DADOS DE TESTE
-- ============================================

INSERT INTO clientes (nome, email, pais, data_criacao) VALUES
('Alice Silva', 'alice@email.com', 'Brasil', '2024-01-05'),
('Bob Santos', 'bob@email.com', 'Brasil', '2024-01-10'),
('Carol Costa', 'carol@email.com', 'Portugal', '2024-02-01'),
('David Lima', 'david@email.com', 'Brasil', '2024-02-15'),
('Eva Oliveira', 'eva@email.com', 'Brasil', '2024-03-01'),
('Frank Souza', 'frank@email.com', 'Espanha', '2024-03-10'),
('Grace Martins', 'grace@email.com', 'Brasil', '2024-03-20'),
('Henry Alves', 'henry@email.com', 'Brasil', '2024-04-01'),
('Iris Cardoso', 'iris@email.com', 'Brasil', '2024-04-15'),
('Jack Ferreira', 'jack@email.com', 'Reino Unido', '2024-05-01');

INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
('Notebook Dell', 'Eletrônicos', 3500.00, 15),
('Mouse Logitech', 'Periféricos', 150.00, 50),
('Teclado Mecânico', 'Periféricos', 450.00, 30),
('Monitor 27"', 'Eletrônicos', 1200.00, 10),
('Headset Corsair', 'Periféricos', 600.00, 25),
('SSD 500GB', 'Armazenamento', 400.00, 40),
('RAM 16GB', 'Memória', 350.00, 60),
('Webcam Logitech', 'Periféricos', 250.00, 20),
('Mousepad', 'Periféricos', 80.00, 100),
('Hub USB', 'Periféricos', 120.00, 35);

INSERT INTO vendas (cliente_id, produto_id, quantidade, valor_total, data_venda, status) VALUES
(1, 1, 1, 3500.00, '2024-05-01', 'Completo'),
(1, 2, 2, 300.00, '2024-05-02', 'Completo'),
(2, 3, 1, 450.00, '2024-05-03', 'Completo'),
(3, 4, 1, 1200.00, '2024-05-05', 'Completo'),
(2, 5, 1, 600.00, '2024-05-06', 'Completo'),
(4, 6, 1, 400.00, '2024-05-07', 'Pendente'),
(5, 7, 2, 700.00, '2024-05-08', 'Completo'),
(6, 8, 1, 250.00, '2024-05-10', 'Completo'),
(1, 9, 5, 400.00, '2024-05-12', 'Completo'),
(7, 2, 3, 450.00, '2024-05-15', 'Completo'),
(8, 1, 1, 3500.00, '2024-05-18', 'Completo'),
(3, 5, 2, 1200.00, '2024-05-20', 'Completo'),
(9, 6, 1, 400.00, '2024-05-22', 'Pendente'),
(10, 3, 2, 900.00, '2024-05-25', 'Completo'),
(4, 10, 4, 480.00, '2024-05-27', 'Completo');