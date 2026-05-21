CREATE INDEX idx_cliente_id ON vendas(cliente_id);
CREATE INDEX idx_produto_id ON vendas(produto_id);
CREATE INDEX idx_data_venda ON vendas(data_venda);

COMMIT;