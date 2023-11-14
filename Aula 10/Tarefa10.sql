-- Pág. 77 - 115
--    1.  Recuperar o nome e endereço de todos os funcionários que trabalham para o departamento de 'Pesquisa'.
select
    Pnome,
    Minicial,
    Unome,
    Endereco
from
    funcionario
where
    Dnr = 5;

--    2.  Para cada projeto localizado em 'Mauá', liste o número do projeto, o número do departamento que o controla e o sobrenome, endereço e data de nascimento do gerente do departamento.
select
    Projnumero,
    Dnum,
    Unome,
    Endereco,
    Datanasc
from
    funcionario f
    join departamento d on f.Dnr = d.Dnumero
    join projeto p on d.Dnumero = p.Dnum
where
    f.cpf = d.Cpf_gerente
    and Projlocal = 'Mauá';

--    3.  Recuperar os nomes de todos os funcionário que não possuem supervisores.
select
    Pnome,
    Minicial,
    Unome
from
    funcionario
where Cpf_supervisor is null;

--    4.  Para cada projeto, recupere o número e o nome do projeto e o número de funcionários do departamento 5 que trabalham no projeto.
select
    Projnumero,
    ProjNome,
    count(*)
from projeto p
    join departamento d on d.Dnumero = p.Dnum
    join funcionario f on f.Dnr = d.Dnumero
    join trabalha_em te on p.Projnumero = te.Pnr  
where f.Dnr = 5
and te.Pnr in(select p.Projnumero from projeto)
group by Projnumero;

--    5.  Encontrar o nome de todos os funcionários que nasceram durante a década de 1950.
select
    Pnome,
    Minicial,
    Unome
from
    funcionario
where
    Datanasc between '1950-01-01'
    and '1959-12-31';

--    6.  Recuperar o nome do funcionário e o nome de seus dependentes.
select
    Pnome,
    Minicial,
    Unome,
    Nome_dependente
from
    funcionario f
    join dependente d 
    on f.Cpf = d.Fcpf;

--    7. Para cada departamento que tem mais de cinco funcionários, recuperar o número do departamento e o número de seus funcionários que estão ganhando mais de R$ 40000.
select
    count(Cpf), Dnumero
from
    funcionario f
    join departamento d on f.Dnr = d.Dnumero
and f.Salario > 40000
group by Dnumero
having COUNT(Dnumero) > 5;

--    8. Para cada departamento cujo salário médio do funcionário seja maior do que R$ 20.000,00, recupere o nome do departamento e o número de funcionários que trabalham nele.
select
    Dnome,
    count(Cpf) as 'qnt_func'
from
    funcionario f
    join departamento d on f.Dnr = d.Dnumero
group by Dnumero
having (sum(f.salario) / qnt_func) > 20000;

--    9. Recupere os nomes dos funcionários que ganham pelo menos 10.000,00 a mais que o funcionário que recebe menos na empresa.
select
    Pnome,
    Minicial,
    Unome
from
    funcionario f
where
    f.Salario > (
        (
            select
                min(Salario) as menorSalario
            from
                funcionario
        ) + 10000
    );

--    10. Recuperar o primeiro e último nome do funcionário, o nome do departamento e o nome do projeto, de todos os funcionários.
select
    Pnome,
    Unome,
    Dnome,
    Projnome
from
    funcionario f
    join departamento d on d.Dnumero = f.Dnr
    join projeto p on p.Dnum = d.Dnumero;