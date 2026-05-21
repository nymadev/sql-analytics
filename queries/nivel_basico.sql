-- Nível 1 -- Básico (Queries 1-5)


-- Query 1: Listar todos os clientes
SELECT * FROM clientes;

-- Query 2: Quanto vendemos no total?
SELECT SUM(valor_total) as receita_total FROM vendas;

-- Query 3: Quantas vendas foram feitas?
SELECT COUNT(*) as total_vendas FROM vendas;

-- Query 4: Qual produto mais vendido (por quantidade)?
SELECT p.nome, SUM(v.quantidade) as qtd_vendida
FROM vendas v
JOIN produtos p ON v.produto_id = p.id
GROUP BY p.nome
ORDER BY qtd_vendida DESC;

-- Query 5: Qual cliente gastou mais?
SELECT c.nome, SUM(v.valor_total) as gasto_total
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nome
ORDER BY gasto_total DESC;
