-- I. Pesquise e implemente no seu banco de dados instruções que utilizem

-- INTERSECT (Intersecção dos dados nas tabelas)
select * from FUNCIONARIO
WHERE Cpf IN (select Fcpf from DEPENDENTE);

select * from PROJETO
WHERE Dnum IN (select Dnumero from DEPARTAMENTO);   

-- EXCEPT (Exceção dos dados nas tabelas)
select * from FUNCIONARIO
WHERE Cpf NOT IN (select Fcpf from DEPENDENTE);

select * from PROJETO
WHERE Dnum NOT IN (select Dnumero from DEPARTAMENTO);

-- UNION (União dos dados nas tabelas)
select Cpf CPF, Pnome NOME, Datanasc DT_NASC, 'Possui mais de 53 anos' Informacao 
from FUNCIONARIO
where FUNCIONARIO.Datanasc <= '1970-11-13'
and Datanasc > '1950-11-13'
UNION
select Cpf CPF, Pnome NOME, Datanasc DT_NASC, 'Possui mais de 73 anos' Informacao 
from FUNCIONARIO
where FUNCIONARIO.Datanasc <= '1950-11-13'
ORDER BY DT_NASC

select F.Cpf CPF, F.Pnome NOME, F.Datanasc DT_NASC from FUNCIONARIO F
JOIN DEPENDENTE D
WHERE F.Cpf = D.Fcpf  
UNION
select D.Fcpf DCPF, D.Nome_dependente DNOME, D.Datanasc DNASC from DEPENDENTE D
JOIN FUNCIONARIO F
WHERE F.Cpf = D.Fcpf;    

-- II. Uma transação é um rotina que deve ser executada por completo ou cancelada.

-- Implemente no seu Banco de Dados três rotinas que utilizem o conceito de transação.

-------------------------------- 1ª ROTINA 
DELIMITER $$
CREATE PROCEDURE associacaoDepFunc(IN pFcpf varchar(11), IN pNome_dependente varchar(50), IN pSexo char(1), IN pDatanasc date, IN pParentesco varchar(20))
BEGIN 
    IF EXISTS (select Cpf from FUNCIONARIO WHERE Cpf = pFcpf) THEN
        INSERT INTO DEPENDENTE (
            Fcpf,
            Nome_dependente,
            Sexo,
            Datanasc,
            Parentesco
        ) VALUES (
            pFcpf,
            pNome_dependente,
            pSexo,
            pDatanasc,
            pParentesco
        );
    ELSE
        select "Não existe nenhum funcionário com o valor inserido em Fcpf!";
    END IF;
END $$
DELIMITER $$

-- EXEMPLO:
call associacaoDepFunc('98798798733', 'Marido do André', 'M', '1985-06-25', 'Marido');

-------------------------------- 2ª ROTINA
DELIMITER $$
CREATE PROCEDURE associacaoProjDepart(
    IN pProjnome varchar(50),
    IN pProjnumero int(11),
    IN pProjlocal varchar(50),
    IN pDnum int(11)
) BEGIN
    IF NOT EXISTS (
        select Dnumero 
        from DEPARTAMENTO 
        where Dnumero = pDnum
    ) THEN
        set @Cpf := (select Cpf from FUNCIONARIO
        where Dnr = 1);

        set @pData_inicio_gerente := (CURDATE());  
         
        call inseriDepartamento("novo departamento", pDnum, @Cpf, @pData_inicio_gerente);

        INSERT INTO PROJETO (
            Projnome,
            Projnumero,
            Projlocal,
            Dnum
        ) VALUES (
            pProjnome,
            pProjnumero,
            pProjlocal,
            pDnum
    );
    ELSE
        INSERT INTO PROJETO (
            Projnome,
            Projnumero,
            Projlocal,
            Dnum
        ) VALUES (
            pProjnome,
            pProjnumero,
            pProjlocal,
            pDnum
    );
    END IF;
END $$
DELIMITER $$;

-- Sub PROCEDURE
DELIMITER $$
CREATE PROCEDURE inseriDepartamento(
    IN pDnome varchar(50), 
    IN pDnumero int(11), 
    IN pCpf_gerente varchar(11), 
    IN pData_inicio_gerente date
) BEGIN
    INSERT INTO DEPARTAMENTO (
        Dnome, 
        Dnumero, 
        Cpf_gerente,
        Data_inicio_gerente
    ) VALUES (
        pDnome, 
        pDnumero, 
        pCpf_gerente,
        pData_inicio_gerente
    );
END $$
DELIMITER $$

-- Exemplos:
call associacaoProjDepart('Jogos JS', 0519, 'F1', 6);

-------------------------------- 3ª ROTINA
DELIMITER $$
CREATE PROCEDURE atualizaNomeDepartamento(
    IN pDnome varchar(30),
    IN pDlocal varchar(30)
) BEGIN
    IF EXISTS (
        select Dnumero 
        from DEPARTAMENTO
        WHERE Dnome = "novo departamento"
        LIMIT 1
    ) THEN
        SET @pDnumero := (
            select Dnumero 
            from DEPARTAMENTO
            WHERE Dnome = "novo departamento"
            LIMIT 1);

        UPDATE DEPARTAMENTO
        SET Dnome = pDnome
        WHERE Dnumero = @pDnumero;   

    ELSE 
        IF EXISTS (
            select Dnumero 
            from DEPARTAMENTO d
            where Dnumero 
            not in (select Dnumero from LOCALIZACAO_DEP)
            limit 1
        ) THEN
            SET @loc := (
                select Dnumero 
                from DEPARTAMENTO d
                where Dnumero not in (select Dnumero from LOCALIZACAO_DEP)
                limit 1
            );

            INSERT INTO LOCALIZACAO_DEP (
                Dnumero,
                Dlocal
            ) VALUES (
                @loc,
                pDlocal
            );
        ELSE
            select "Nenhuma atualização necessária!";
        END IF;
    END IF;
END $$
DELIMITER $$

-- Exemplo:
call atualizaNomeDepartamento("DEV", "Poços de caldas");