--- Nível 2 — Intermediário (Queries 6-15) ---

-- Query 6: Receita por país
SELECT c.pais, SUM(v.valor_total) as receita
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.pais
ORDER BY receita DESC;

-- Query 7: Clientes que fizeram mais de 1 compra
SELECT c.nome, COUNT(v.id) as num_compras
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nome
HAVING COUNT(v.id) > 1
ORDER BY num_compras DESC;

-- Query 8: Valor médio das vendas
SELECT AVG(valor_total) as valor_medio
FROM vendas;

-- Query 9: Vendas por mês
SELECT DATE_TRUNC('month', data_venda)::DATE as mes, SUM(valor_total) as receita
FROM vendas
GROUP BY DATE_TRUNC('month', data_venda)
ORDER BY mes;

-- Query 10: Produtos não vendidos (estoque completo)
SELECT p.nome, p.estoque
FROM produtos p
LEFT JOIN vendas v ON p.id = v.produto_id
WHERE v.id IS NULL;

-- Query 11: Ticket médio por cliente
SELECT c.nome, AVG(v.valor_total) as ticket_medio
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nome
ORDER BY ticket_medio DESC;

-- Query 12: Top 3 clientes (receita)
SELECT c.nome, SUM(v.valor_total) as gasto
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nome
ORDER BY gasto DESC
LIMIT 3;

-- Query 13: Vendas pendentes
SELECT v.id, c.nome, p.nome, v.valor_total
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
JOIN produtos p ON v.produto_id = p.id
WHERE v.status = 'Pendente';

-- Query 14: Categoria mais lucrativa
SELECT p.categoria, SUM(v.valor_total) as receita
FROM vendas v
JOIN produtos p ON v.produto_id = p.id
GROUP BY p.categoria
ORDER BY receita DESC;

-- Query 15: Taxa de conversão (clientes com vendas vs total)
SELECT 
  (COUNT(DISTINCT cliente_id)::FLOAT / (SELECT COUNT(*) FROM clientes) * 100)::DECIMAL(5,2) as conversao_pct
FROM vendas;