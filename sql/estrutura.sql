CREATE DATABASE posto_combustivel;

CREATE TABLE combustivel (
  combustivel_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  estoque_l NUMERIC(12,3) NOT NULL DEFAULT 0,
  CONSTRAINT combustivel_nome_uniq UNIQUE (nome)
);

CREATE TABLE funcionario (
  funcionario_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  ativo BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE venda (
  venda_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  data_hora TIMESTAMPTZ NOT NULL DEFAULT now(),
  funcionario_id INT REFERENCES funcionario(funcionario_id) ON DELETE SET NULL,
  total NUMERIC(12,2) NOT NULL CHECK (total >= 0)
);