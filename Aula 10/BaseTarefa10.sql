insert into
    funcionario
values
    (
        'João',
        'B',
        'Silva',
        '12345678966',
        '1965-01-09',
        'Rua das Flores, 751, São Paulo, SP',
        'M',
        30000,
        '33344555587',
        5
    );

insert into
    funcionario
values
    (
        'Fernando',
        'T',
        'Wong',
        '33344555587',
        '1955-12-08',
        'Rua da Lapa, 34, São Paulo, SP',
        'M',
        40000,
        '88866555576',
        5
    );

insert into
    funcionario
values
    (
        'Alice',
        'J',
        'Zelaya',
        '99988777767',
        '1968-01-19',
        'Rua Souza Lima, 35, Curitiba, PR',
        'F',
        25000,
        '98765432168',
        4
    );

insert into
    funcionario
values
    (
        'Jennifer',
        'S',
        'Souza',
        '98765432168',
        '1941-06-20',
        'Av. Arthur de Lima, 54, Santo André, SP',
        'F',
        43000,
        '88866555576',
        4
    );

insert into
    funcionario
values
    (
        'Ronaldo',
        'K',
        'Lima',
        '66688444476',
        '1962-09-15',
        'Rua Rebouças, 65, Piracicaba, SP',
        'M',
        38000,
        '33344555587',
        5
    );

insert into
    funcionario
values
    (
        'Joice',
        'A',
        'Leite',
        '45345345376',
        '1972-07-31',
        'Av. Lucas Obes, 74, São Paulo, SP',
        'F',
        25000,
        '33344555587',
        5
    );

insert into
    funcionario
values
    (
        'André',
        'V',
        'Pereira',
        '98798798733',
        '1969-03-29',
        'Rua Timbira, 35, São Paulo, SP',
        'M',
        25000,
        '98765432168',
        4
    );

insert into
    funcionario
values
    (
        'Jorge',
        'E',
        'Brito',
        '88866555576',
        '1937-11-10',
        'Rua do Horto, 35, São Paulo, SP',
        'M',
        55000,
        null,
        1
    );

insert into
    departamento
values
    ('Pesquisa', 5, '33344555587', '1988-05-22');

insert into
    departamento
values
    ('Administração', 4, '98765432168', '1995-01-01');

insert into
    departamento
values
    ('Matriz', 1, '88866555576', '1981-06-19');

insert into
    localizacao_dep
values
    (1, 'São Paulo');

insert into
    localizacao_dep
values
    (4, 'Mauá');

insert into
    localizacao_dep
values
    (5, 'Santo André');

insert into
    localizacao_dep
values
    (5, 'Itu');

insert into
    localizacao_dep
values
    (5, 'São Paulo');

INSERT INTO
    `projeto`(`Projnome`, `Projnumero`, `Projlocal`, `Dnum`)
VALUES
    ('PRODUTO X', 1, 'Santo André', 5);

INSERT INTO
    `projeto`(`Projnome`, `Projnumero`, `Projlocal`, `Dnum`)
VALUES
    ('PRODUTO Y', 2, 'Itu', 5);

INSERT INTO
    `projeto`(`Projnome`, `Projnumero`, `Projlocal`, `Dnum`)
VALUES
    ('PRODUTO Z', 3, 'São Paulo', 5);

INSERT INTO
    `projeto`(`Projnome`, `Projnumero`, `Projlocal`, `Dnum`)
VALUES
    ('Informatização', 10, 'Mauá', 4);

INSERT INTO
    `projeto`(`Projnome`, `Projnumero`, `Projlocal`, `Dnum`)
VALUES
    ('Reorganização', 20, 'São Paulo', 1);

INSERT INTO
    `projeto`(`Projnome`, `Projnumero`, `Projlocal`, `Dnum`)
VALUES
    ('Novosbeneficios', 30, 'Mauá', 4);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (12345678966, 1, 32.5);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (12345678966, 2, 7.5);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (66688555576, 3, 40.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (45345345376, 1, 20.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (45345345376, 2, 20.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (33344555587, 2, 10.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (33344555587, 3, 10.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (33344555587, 10, 10.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (33344555587, 20, 10.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (99988777767, 30, 30.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (99987777767, 10, 10.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (98798798733, 10, 35.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (98798798733, 30, 5.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (98765432168, 30, 20.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (98765432168, 20, 15.0);

INSERT INTO
    `trabalha_em`(`Fcpf`, `Pnr`, `Horas`)
VALUES
    (88866555576, 20, NULL);

INSERT INTO
    `dependente`(
        `Fcpf`,
        `Nome_dependente`,
        `Sexo`,
        `Datanasc`,
        `Parentesco`
    )
VALUES
    (
        33344555587,
        'Alicia',
        'F',
        '1986-04-05',
        'Filha'
    );

INSERT INTO
    `dependente`(
        `Fcpf`,
        `Nome_dependente`,
        `Sexo`,
        `Datanasc`,
        `Parentesco`
    )
VALUES
    (33344555587, 'Tiago', 'M', '1983-10-25', 'Filho');

INSERT INTO
    `dependente`(
        `Fcpf`,
        `Nome_dependente`,
        `Sexo`,
        `Datanasc`,
        `Parentesco`
    )
VALUES
    (
        33344555587,
        'Janaína',
        'F',
        '1958-05-03',
        'Esposa'
    );

INSERT INTO
    `dependente`(
        `Fcpf`,
        `Nome_dependente`,
        `Sexo`,
        `Datanasc`,
        `Parentesco`
    )
VALUES
    (
        98765432168,
        'Antônio',
        'M',
        '1942-02-28',
        'Marido'
    );

INSERT INTO
    `dependente`(
        `Fcpf`,
        `Nome_dependente`,
        `Sexo`,
        `Datanasc`,
        `Parentesco`
    )
VALUES
    (
        12345678966,
        'Michael',
        'M',
        '1988-01-04',
        'Filho'
    );

INSERT INTO
    `dependente`(
        `Fcpf`,
        `Nome_dependente`,
        `Sexo`,
        `Datanasc`,
        `Parentesco`
    )
VALUES
    (
        12345678966,
        'Alicia',
        'F',
        '1988-12-30',
        'Filha'
    );

INSERT INTO
    `dependente`(
        `Fcpf`,
        `Nome_dependente`,
        `Sexo`,
        `Datanasc`,
        `Parentesco`
    )
VALUES
    (
        12345678966,
        'Elizabeth',
        'F',
        '1967-05-05',
        'Esposa'
    );