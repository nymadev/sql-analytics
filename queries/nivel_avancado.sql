--- Nível 3 — Avançado (Queries 16-20) ---

-- Query 16: Ranked: Top clientes com ROW_NUMBER
SELECT 
  c.nome,
  SUM(v.valor_total) as gasto,
  ROW_NUMBER() OVER (ORDER BY SUM(v.valor_total) DESC) as rank
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nome;

-- Query 17: Diferença de cada cliente vs média (analítico)
SELECT 
  c.nome,
  SUM(v.valor_total) as gasto,
  (SELECT AVG(valor_total) FROM vendas)::DECIMAL(10,2) as media_geral,
  (SUM(v.valor_total) - (SELECT AVG(valor_total) FROM vendas))::DECIMAL(10,2) as diff_media
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nome;

-- Query 18: CTE - Vendas por cliente depois filtrada
WITH vendas_cliente AS (
  SELECT 
    c.nome,
    COUNT(v.id) as num_vendas,
    SUM(v.valor_total) as total_gasto
  FROM vendas v
  JOIN clientes c ON v.cliente_id = c.id
  GROUP BY c.nome
)
SELECT * FROM vendas_cliente
WHERE total_gasto > 1000
ORDER BY total_gasto DESC;

-- Query 19: Cumulativo de receita por mês (running total)
SELECT 
  DATE_TRUNC('month', data_venda)::DATE as mes,
  SUM(valor_total) as receita_mes,
  SUM(SUM(valor_total)) OVER (ORDER BY DATE_TRUNC('month', data_venda)) as receita_cumulada
FROM vendas
GROUP BY DATE_TRUNC('month', data_venda)
ORDER BY mes;

-- Query 20: Clientes que nunca compraram (anti-join)
SELECT c.* 
FROM clientes c
LEFT JOIN vendas v ON c.id = v.cliente_id
WHERE v.id IS NULL;