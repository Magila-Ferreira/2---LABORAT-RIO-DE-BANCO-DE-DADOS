create table funcionario (
    Pnome varchar(30),
    Minicial char(1),
    Unome varchar(30),
    Cpf varchar(11) primary key,
    Datanasc date,
    Endereco varchar(100),
    Sexo char(1),
    Salario float,
    Cpf_supervisor varchar(11),
    Dnr int
);

create table departamento (
    Dnome varchar(30),
    Dnumero int primary key,
    Cpf_gerente varchar(11),
    Data_inicio_gerente date
);

create table localizacao_dep (
    Dnumero int, 
    Dlocal varchar(30),
    primary key (Dnumero, Dlocal)
);

CREATE TABLE PROJETO (
    Projnome varchar(50),
    Projnumero int primary key,
    Projlocal varchar(50),
    Dnum int
);

CREATE TABLE TRABALHA_EM (
    Fcpf varchar(11),
    Pnr int,
    Horas Float,
    primary key (Fcpf, Pnr)
);

CREATE TABLE DEPENDENTE (
    Fcpf varchar(11),
    Nome_dependente varchar(50),
    Sexo char,
    Datanasc Date,
    Parentesco varchar(20),
    primary key (Fcpf, Nome_dependente)
);



