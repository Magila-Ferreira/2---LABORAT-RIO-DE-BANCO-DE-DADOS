/* Descrição textual do modelo lógico */
-- TIPO_PET {tip_codigo, tip_descricao}
-- PET {pet_codigo, pet_nome, pet_data_nascimento, tip_codigo, pes_cpf}
-- PESSOA {pes_cpf, pes_nome}

-- Questão 1
DELIMITER $$ 
CREATE PROCEDURE inserirProduto(
    IN pPRO_CODIGO int,
    IN pPRO_CODIGOBARRA int,
    IN pPRO_NOME varchar(50),
    IN pPRO_FABRICANTE varchar(50),
    IN pPRO_PRECO199 float,
    IN pPRO_PRECOMERCADO float,
    IN pPRO_ULTIMA_VENDA date,
    IN pPRO_QUANTIDADE int,
    IN pPRO_PONTOREPOSICAO int,
    IN pPRO_ESTOQUE_CORREDOR int,
    IN pPRO_ESTOQUE_COLUNA varchar(2),
    IN pPRO_ESTOQUE_ANDAR int,
    IN pPRO_ESTOQUE_POSICAO int,
    IN pFK_CTP_CODIGO int
) BEGIN
insert into produtos(
        PRO_CODIGO,
        PRO_CODIGOBARRA,
        PRO_NOME,
        PRO_FABRICANTE,
        PRO_PRECO199,
        PRO_PRECOMERCADO,
        PRO_ULTIMA_VENDA,
        PRO_QUANTIDADE,
        PRO_PONTOREPOSICAO,
        PRO_ESTOQUE_CORREDOR,
        PRO_ESTOQUE_COLUNA,
        PRO_ESTOQUE_ANDAR,
        PRO_ESTOQUE_POSICAO,
        FK_CTP_CODIGO
    ) values (
        pPRO_CODIGO,
        pPRO_CODIGOBARRA,
        pPRO_NOME,
        pPRO_FABRICANTE,
        pPRO_PRECO199,
        pPRO_PRECOMERCADO,
        pPRO_ULTIMA_VENDA,
        pPRO_QUANTIDADE,
        pPRO_PONTOREPOSICAO,
        pPRO_ESTOQUE_CORREDOR,
        pPRO_ESTOQUE_COLUNA,
        pPRO_ESTOQUE_ANDAR,
        pPRO_ESTOQUE_POSICAO,
        pFK_CTP_CODIGO
    );
END $$ 
DELIMITER $$ 

-- Exemplo: 
-- CALL inserirProduto(6, 111, 'BALA DE MENTA', 'HALLS', 1, 2, '2000-06-17', 23, 30, 5, 'C', 12, 3, 1); 

DELIMITER $ $ CREATE PROCEDURE inserirCliente(
    IN pCLI_CODIGO int(11),
    IN pCLI_NOME varchar(50),
    IN pCLI_TELEFONE bigint(20),
    IN pCLI_EMAIL varchar(50),
    IN pCLI_REFCOMERCIAL varchar(50),
    IN pCLI_REFBANCARIA varchar(50),
    IN pCLI_IE int(11),
    IN pCLI_CNPJ int(11),
    IN pCLI_LIMITE float,
    IN pFK_VDR_CODIGO int(11),
    IN pFK_TPC_CODIGO int(11),
    IN pFK_REG_CODIGO int(11)
) BEGIN
INSERT INTO clientes(
        CLI_CODIGO,
        CLI_NOME,
        CLI_TELEFONE,
        CLI_EMAIL,
        CLI_REFCOMERCIAL,
        CLI_REFBANCARIA,
        CLI_IE,
        CLI_CNPJ,
        CLI_LIMITE,
        FK_VDR_CODIGO,
        FK_TPC_CODIGO,
        FK_REG_CODIGO
    ) VALUES (
        pCLI_CODIGO,
        pCLI_NOME,
        pCLI_TELEFONE,
        pCLI_EMAIL,
        pCLI_REFCOMERCIAL,
        pCLI_REFBANCARIA,
        pCLI_IE,
        pCLI_CNPJ,
        pCLI_LIMITE,
        pFK_VDR_CODIGO,
        pFK_TPC_CODIGO,
        pFK_REG_CODIGO
    );
END $$ 
DELIMITER $$ 

-- Exemplo: 
-- CALL inserirCliente(6, 'COMERCIA&', 23994587812, 'comercial@gmail.com', '***', '*****', 45, 63, 1000, 3, 1, 5); 

DELIMITER $$ 
CREATE PROCEDURE inserirPedido(
    IN pPED_CODIGO int(11),
    IN pPED_DATA date,
    IN pPED_VALORINICIAL float,
    IN pPED_DESCONTO_TOTAL float,
    IN pPED_VALORFINAL float,
    IN pPED_COMISSAO_TOTAL float,
    IN pPED_QNT_PAGAMENTOS int(11),
    IN pFK_FRP_CODIGO int(11),
    IN pFK_VDR_CODIGO int(11),
    IN pFK_CLI_CODIGO int(11),
    IN pFK_STF_CODIGO int(11)
) BEGIN
INSERT INTO pedidos (
        PED_CODIGO,
        PED_DATA,
        PED_VALORINICIAL,
        PED_DESCONTO_TOTAL,
        PED_VALORFINAL,
        PED_COMISSAO_TOTAL,
        PED_QNT_PAGAMENTOS,
        FK_FRP_CODIGO,
        FK_VDR_CODIGO,
        FK_CLI_CODIGO,
        FK_STF_CODIGO
    ) VALUES (
        pPED_CODIGO,
        pPED_DATA,
        pPED_VALORINICIAL,
        pPED_DESCONTO_TOTAL,
        pPED_VALORFINAL,
        pPED_COMISSAO_TOTAL,
        pPED_QNT_PAGAMENTOS,
        pFK_FRP_CODIGO,
        pFK_VDR_CODIGO,
        pFK_CLI_CODIGO,
        pFK_STF_CODIGO
    );
END $$ 
DELIMITER $$ 

-- Exemplo: 
-- CALL inserirPedido(951, '1998-03-20', 400, 40, 360, 80.0, 3, 1, 3, 5, 1); 

DELIMITER $$ 
CREATE PROCEDURE inserirVendedor(
    IN pVDR_CODIGO int,
    IN pVDR_NOME varchar(50),
    IN pVDR_TELEFONE bigint
) BEGIN 
INSERT INTO vendedores (
        VDR_CODIGO,
        VDR_NOME,
        VDR_TELEFONE
    ) VALUES (
        pVDR_CODIGO,
        pVDR_NOME,
        pVDR_TELEFONE
    );

END $$ 
DELIMITER $$ 

-- Exemplo
-- CALL inserirVendedor(6, 'SILLAS LIMA', 17995621445);

-- Questão 2 */
DELIMITER $$ 
CREATE PROCEDURE alterarQntPag_emPedidosFat(IN pPED_QNT_PAGAMENTOS INT) BEGIN
    UPDATE pedidos
    SET PED_QNT_PAGAMENTOS = pPED_QNT_PAGAMENTOS
    WHERE FK_STF_CODIGO = 2;
END $$ DELIMITER $$ 

-- Exemplo:
-- Pedidos FATURADOS
-- CALL alterarQntPag_emPedidosFat(5);
 
-- Pedidos NÃO faturados
-- CALL alterarQntPag_emPedidoNaoFat(2);

DELIMITER $$ 
CREATE PROCEDURE alterarDadosCliente(IN pCLI_CODIGO INT) BEGIN
    UPDATE clientes
    SET CLI_CODIGO = pCLI_CODIGO
    WHERE CLI_CODIGO = 0;
END $$ 
DELIMITER $$ 

-- Exemplo:
-- CALL alterarDadosCliente(1);

-- Questão 3
DELIMITER $$ 
CREATE PROCEDURE excluirDadosCliente(IN pCLI_CODIGO INT) BEGIN
    DELETE FROM clientes
    WHERE CLI_CODIGO > 100
    AND CLI_CODIGO = pCLI_CODIGO;
END $$ DELIMITER $$ 

-- Exemplo:
-- CALL excluirDadosCliente(1);

DELIMITER $$ 
CREATE PROCEDURE excluirDadosProduto(IN pPRO_NOME varchar(50)) BEGIN
    DELETE FROM produtos
    WHERE pPRO_NOME = PRO_NOME;
END $$ 
DELIMITER $$ 

-- Exemplo:
-- CALL excluirDadosProduto('Chocolate');

-- Questão 4

DELIMITER $$ 
CREATE PROCEDURE exibirCategoriaProdutoNuncaVendido() BEGIN
    SELECT CTP_DESCRICAO, PRO_NOME
    FROM produtos P
    JOIN categorias_produto CP ON P.FK_CTP_CODIGO = CP.CTP_CODIGO
    WHERE PRO_ULTIMA_VENDA = '0000-00-00';
END $$ 
DELIMITER $$ 

-- Exemplo:
-- CALL exibirCategoriaProdutoNuncaVendido();

-- Questão 5 
DELIMITER $$ 
CREATE PROCEDURE exibirProdutoComMaisDeCincoVenda() BEGIN
    SELECT PRO_CODIGO, PRO_NOME, COUNT(PP.FK_PRO_CODIGO) AS 'qntPedidosProduto'
    FROM produtos P
    JOIN pedidos_produtos PP ON P.PRO_CODIGO = PP.FK_PRO_CODIGO
    WHERE PRO_ULTIMA_VENDA BETWEEN '2022-01-01'
    AND '2022-06-30'
    GROUP BY PP.FK_PRO_CODIGO
    HAVING qntPedidosProduto > 5;
END $$ 
DELIMITER $$ 
    
-- Exemplo:
-- CALL exibirProdutoComMaisDeCincoVenda();

-- Questão 6
DELIMITER $$
CREATE PROCEDURE exibirVendedor_porVendas() BEGIN
    SELECT VDR_CODIGO, VDR_NOME, SUM(PED_VALORFINAL) AS 'somaVendas'
    FROM vendedores
    JOIN Pedidos ON(VDR_CODIGO = FK_VDR_CODIGO)
    WHERE PED_DATA BETWEEN '2021-01-01' AND '2021-12-31'
    GROUP BY VDR_CODIGO
    ORDER BY somaVendas DESC;
END $$
DELIMITER $$;

-- Exemplo:
-- CALL exibirVendedor_porVendas();

-- Questão 7
DELIMITER $$
    CREATE PROCEDURE exibirQntVendedores_porRegiao() BEGIN
    SELECT REG_NOME, COUNT(VDR_NOME) AS 'qnt' FROM vendedores 
    JOIN regioes ON (VDR_CODIGO = FK_VDR_CODIGO)
    GROUP BY REG_CODIGO  
    HAVING qnt > 3
    ORDER BY REG_NOME;
END $$
DELIMITER $$

-- Exemplo:
-- CALL exibirQntVendedores_porRegiao();

-- Questão 8
DELIMITER $$
CREATE PROCEDURE reajustarPrecoProduto(IN pReajuste float, IN pPRO_CODIGO INT) BEGIN
    UPDATE produtos
    SET PRO_PRECO199 = (PRO_PRECO199 * ((pReajuste/100) + 1));
    WHERE PRO_CODIGO = pPRO_CODIGO;

    UPDATE produtos
    SET PRO_PRECOMERCADO = (PRO_PRECOMERCADO * ((pReajuste/100) + 1)) 
    WHERE PRO_CODIGO = pPRO_CODIGO; 
END $$
DELIMITER $$

-- Exemplo:
-- CALL reajustarPrecoProduto(10, 1);

/*
9.  Faça uma rotina para adicionar itens na venda e atualizar os dados necessários no Pedido.

10. Faça uma rotina para que receba como parâmetro o CNPJ do cliente e mostre o número do pedido, a data da compra, a descrição de todos os produtos que o cliente ja comprou na loja; exibir em ordem de cliente e produto.

11. Faça uma rotina para exibir o código e nome de todos os produtos que não foram vendidos nos últimos três meses.

12. Faça uma rotina para exibir a quantidade de clientes que utilizaram cada forma de pagamento forma.

*/
-- Fazer tabela de Log. Procedure???