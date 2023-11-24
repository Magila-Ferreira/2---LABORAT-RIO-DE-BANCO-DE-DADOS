-- MÁGILA MORGANA - 4º ADS

-- Faça uma rotina de Backup do Banco de Dados  (do Projeto).

DELIMITER $$
CREATE EVENT backup_event
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    mysqldump -h localhost -u root -p distribuidora > backup.sql
END $$ 
DELIMITER $$ 

-- Utilizando o conceito de triggers, faça uma rotina de log para as principais tabelas do Banco de Dados (do Projeto), por exemplo:  
    -- cliente, produto, pedido, itens de pedido, vendedor, pagamentos (detalhes), categorias

CREATE TABLE logDistribuidora (
	ID int AUTO_INCREMENT PRIMARY KEY,
    CODIGO_ROW int,
    DIA_HORA datetime, 
    TABELA_INSERIDA varchar(50)
);

DELIMITER $$
CREATE TRIGGER logDistribuidoraPedidos 
    BEFORE INSERT
    ON pedidos
    FOR EACH ROW
BEGIN
    INSERT INTO logDistribuidora (
        CODIGO_ROW,
        DIA_HORA, 
        TABELA_INSERIDA
    ) VALUES (
        NEW.PED_CODIGO,
        NOW(),
        "PEDIDOS");
END $$
DELIMITER $$
-- INSERT INTO pedidos VALUES (106, '2023-11-24', 500, 50, 450, 20, 6, 2, 3, 1, 1); 

DELIMITER $$
CREATE TRIGGER logDistribuidoraProdutos
    BEFORE INSERT
    ON produtos
    FOR EACH ROW
BEGIN
    INSERT INTO logDistribuidora (
        CODIGO_ROW,
        DIA_HORA, 
        TABELA_INSERIDA
    ) VALUES (
        NEW.PRO_CODIGO,
        NOW(),
        "PRODUTOS"); 
END $$
DELIMITER $$
-- INSERT INTO produtos VALUES (20, 111, "BOLACHA MAIZENA", "MARILAN", 3, 4, '2023-11-24', 25, 5, 4, "D", 7, 12, 21); 

DELIMITER $$
CREATE TRIGGER logDistribuidoraClientes
    BEFORE INSERT
    ON clientes
    FOR EACH ROW
BEGIN
    INSERT INTO logDistribuidora (
        CODIGO_ROW,
        DIA_HORA, 
        TABELA_INSERIDA
    ) VALUES (
        NEW.CLI_CODIGO,
        NOW(),
        "CLIENTES"); 
END $$
DELIMITER $$
-- INSERT INTO clientes VALUES (23, 'LARISSARAFAEL', 12995457841, 'larirafa@gmail.com', '***', '*****', 50, 60, 2000, 3, 2, 4);

DELIMITER $$
CREATE TRIGGER logDistribuidoraPedidos_produtos
    BEFORE INSERT
    ON pedidos_produtos
    FOR EACH ROW
BEGIN
    INSERT INTO logDistribuidora (
        CODIGO_ROW,
        DIA_HORA, 
        TABELA_INSERIDA
    ) VALUES (
        NEW.FK_PED_CODIGO,
        NOW(),
        "PEDIDOS_PRODUTOS"); 
END $$
DELIMITER $$
-- INSERT INTO pedidos_produtos VALUES (101, 6, "BOLACHA DE MAIZENA", 3, 4, 12, 1.2, 1.2); 

DELIMITER $$
CREATE TRIGGER logDistribuidoraVendedores
    BEFORE INSERT
    ON vendedores
    FOR EACH ROW
BEGIN
    INSERT INTO logDistribuidora (
        CODIGO_ROW,
        DIA_HORA, 
        TABELA_INSERIDA
    ) VALUES (
        NEW.VDR_CODIGO,
        NOW(),
        "VENDEDORES");
END $$
DELIMITER $$
-- INSERT INTO vendedores VALUES(7, 'GABRIELA LOPES', 17945789512);

DELIMITER $$
CREATE TRIGGER logDistribuidoraFormas_pagamento
    BEFORE INSERT
    ON formas_pagamento
    FOR EACH ROW
BEGIN
    INSERT INTO logDistribuidora (
        CODIGO_ROW,
        DIA_HORA, 
        TABELA_INSERIDA
    ) VALUES (
        NEW.FRP_CODIGO,
        NOW(),
        "FORMAS_PAGAMENTO");
END $$
DELIMITER $$
-- INSERT INTO formas_pagamento VALUES (6, "BOLETO");

DELIMITER $$
CREATE TRIGGER logDistribuidoraCategorias_produto
    BEFORE INSERT
    ON categorias_produto
    FOR EACH ROW
BEGIN
    INSERT INTO logDistribuidora (
        CODIGO_ROW,
        DIA_HORA, 
        TABELA_INSERIDA
    ) VALUES (
        NEW.CTP_CODIGO,
        NOW(),
        "CATEGORIAS_PRODUTO");
END $$
DELIMITER $$
-- INSERT INTO categorias_produto VALUES(6, 'ESPORTE');