CREATE TABLE aeroportos(
    id SERIAL PRIMARY KEY,
    sigla TEXT NOT NULL UNIQUE,
    nome TEXT NOT NULL UNIQUE
)

CREATE TABLE companhias(
    id SERIAL PRIMARY KEY,
    sigla TEXT NOT NULL UNIQUE,
    nome TEXT NOT NULL UNIQUE
)

CREATE TABLE voos(
    id SERIAL PRIMARY KEY,
    sigla TEXT NOT NULL UNIQUE,
    origem_id INTEGER NOT NULL REFERENCES "aeroportos"("id"),
    destino_id INTEGER NOT NULL REFERENCES "aeroportos"("id") CHECK (origem_id !== destino_id),
    horario_saida TIMESTAMP NOT NULL DEFAULT NOW(),
    horario_chegada TIMESTAMP DEFAULT NULL,
    companhia_id INTEGER NOT NULL REFERENCES "companhias"("id")
)