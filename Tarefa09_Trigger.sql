/*  DEFINIÇÃO 

    Trigger é um procedimento disparador que ocorre em sucessão ou antecedêndia a outro evento especificado. Como o próprio nome sugere, trata-se de um gatilho que aguarda a execução de uma 'função' para disparar outra no banco de dados relacional.

    Fontes:
        *   http://algoritmoselogica.com.br/site2/moodle/course/view.php?id=75
        *   https://www.alura.com.br/artigos/trigger-em-sql

 */

 -- Exemplos 1:
DELIMITER $$
CREATE TRIGGER logPedidos
    AFTER INSERT
    ON pedidos
    FOR EACH ROW
BEGIN
    INSERT INTO logPedidos (PED_CODIGO, PED_LOG)
    VALUES (NEW.PED_CODIGO, NOW());
END $$
DELIMITER $$

INSERT INTO pedidos (PED_CODIGO, PED_DATA) values (7, '2023-11-07');

-- Após a criação da Trigger e a inserção de um novo pedido, automaticamente, é disparada uma função que armazena na tabela 'logPedidos' o código do pedido, a data e hora da inserção realizada em pedidos. Print em anexo.

-- Exemplo 2:
DELIMITER $$
CREATE TRIGGER atualizaEstoque
    AFTER INSERT
    ON pedidos_produtos
    FOR EACH ROW
BEGIN
    UPDATE produtos 
    SET PRO_ULTIMA_VENDA = NOW(),
    PRO_QUANTIDADE = (PRO_QUANTIDADE - NEW.PED_PRO_QUANTIDADE)
    WHERE PRO_CODIGO = NEW.FK_PRO_CODIGO;  
END $$
DELIMITER $$

INSERT INTO pedidos_produtos (FK_PED_CODIGO, FK_PRO_CODIGO, PED_PRO_QUANTIDADE) values (960, 5, 10);

-- Após a criação da Trigger, quando um novo registro foi acrescentado em pedidos_produtos, a Trigger foi disparada e atualizou a data da última venda e a quantidade dos produtos em estoque, presentes na tabela produtos. Prints em anexo.

-- Exemplo 3:
DELIMITER $$
CREATE TRIGGER atualizaPrazosDeFormasPagamento
    AFTER INSERT
    ON prazos
    FOR EACH ROW
BEGIN
    INSERT INTO formapagamento_prazos (FK_FRP_CODIGO, FK_PRA_CODIGO) 
    values (3, NEW.PRA_CODIGO)
END $$
DELIMITER $$

INSERT INTO prazos VALUES (6, 150);

-- Após a criação da Trigger, quando um novo prazo é adicionado à tabela prazos, a Trigger dispara a inserção desse novo prazo na tabela formapagamento_prazos, de modo a acrescentar um novo prazo aos pagamentos realizados no cartão de crédito FRP_CODIGO 3.
