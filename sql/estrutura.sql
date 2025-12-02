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

CREATE TABLE venda_item (
  venda_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  venda_id INT NOT NULL REFERENCES venda(venda_id) ON DELETE CASCADE,
  combustivel_id INT NOT NULL REFERENCES combustivel(combustivel_id),
  quantidade_l NUMERIC(12,3) NOT NULL CHECK (quantidade_l >= 0),
  preco_unitario NUMERIC(12,4) NOT NULL CHECK (preco_unitario >= 0)
);

INSERT INTO combustivel (nome, estoque_l) VALUES
  ('Gasolina', 1200.5),
  ('Etanol',  800.25),
  ('Diesel S10', 1500.0)

INSERT INTO funcionario (nome, ativo) VALUES
  ('Ana Silva', true),
  ('José Maria', true)

INSERT INTO venda (data_hora, funcionario_id, total) VALUES
  ('2025-11-01 09:15:00-03', 1, 210.04),
  ('2025-11-01 10:05:00-03', 2, 150.12),
  ('2025-11-01 11:00:00-03', 1,  50.15),
  ('2025-11-01 11:30:00-03', 1,  80.28),
  ('2025-11-01 11:32:00-03', 2, 110.16),
  ('2025-11-01 12:32:00-03', 2, 217.50)

INSERT INTO venda_item (venda_id, combustivel_id, quantidade_l, preco_unitario) VALUES
  (1, 1, 35.6, 5.9),
  (2, 2, 41.7, 3.6),
  (3, 1,  8.5, 5.9),
  (4, 2, 22.3, 3.6),
  (5, 2, 30.6, 3.6),
  (6, 3, 37.5, 5.8);

  