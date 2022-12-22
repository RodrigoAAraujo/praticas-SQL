CREATE TABLE modulos(
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE
)

CREATE TABLE projetos(
    id SERIAL PRIMARY TEXT,
    nome TEXT NOT NULL UNIQUE,
    modulo_id INTEGER NOT NULL REFERENCES "modulos"("id")
)

CREATE TABLE turmas(
    id SERIAL PRIMARY KEY,
    codigo TEXT NOT NULL UNIQUE
)

CREATE TABLE alunos(
    id SERIAL PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome TEXT NOT NULL
)

CREATE TABLE aluno_turmas(
    id SERIAL PRIMARY KEY,
    aluno_id INTEGER NOT NULL REFERENCES "alunos"("id"),
    turma_id INTEGER NOT NULL REFERENCES "turmas"("id"),
    data_entrada DATE NOT NULL DEFAULT NOW(),
    dat_saida DATE DEFAULT NULL
)

CREATE TYPE nota_entrega AS ENUM('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas')

CREATE TABLE entrega_projetos(
    id SERIAL PRIMARY KEY,
    aluno_id INTEGER NOT NULL REFERENCES "alunos"("id"),
    projeto_id INTEGER NOT NULL REFERENCES "projetos"("id"),
    data_entrega DATE NOT NULL DEFAULT NOW(),
    nota nota_entrega NOT NULL
)