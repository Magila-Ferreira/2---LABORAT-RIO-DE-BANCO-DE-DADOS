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