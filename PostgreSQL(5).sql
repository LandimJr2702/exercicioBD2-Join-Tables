-- criando tabela para times
CREATE TABLE TIMES ( 
  ID SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL
  );
  
-- criando tabela para JogadoresALTER
CREATE TABLE JOGADOR(
  ID SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  posicao VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  time_id INT CONSTRAINT fk_time_id REFERENCES TIMES(id)
  )
  
-- Criando a tabela TECNICO
CREATE TABLE TECNICO (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  time_id INT CONSTRAINT fk_time_id REFERENCES TIMES(id)
);

-- Inserindo dados na tabela TIME
INSERT INTO TIMES (nome)
VALUES
  ('São Paulo'),
  ('Corinthians'),
  ('Palmeiras');

-- Inserindo dados na tabela JOGADOR
INSERT INTO JOGADOR (nome, posicao, data_nascimento, time_id)
VALUES
  ('Neymar', 'Atacante', '1995-05-22', 1),
  ('Gabriel Jesus', 'Atacante', '2000-03-05', 1),
  ('Casemiro', 'Meio-campo', '1991-08-02', 2),
  ('Fernandinho', 'Meio-campo', '1983-05-22', 2),
  ('Weverson', 'Zagueiro', '1994-05-01', 3),
  ('Gustavo Scarpa', 'Meia', '1992-05-25', 3);
-- Inserindo dados na tabela TECNICO
INSERT INTO TECNICO (nome, data_nascimento, time_id)
VALUES
  ('Tite', '1962-07-22', 1),
  ('Fábio Carille', '1974-10-18', 2),
  ('Abel Ferreira', '1984-05-22', 3);

-- Consulta para exibir nome do time, nome do técnico e data de nascimento do técnico
SELECT TIMES.nome AS "Time", TECNICO.nome AS "Técnico", TECNICO.data_nascimento
FROM TIMES
JOIN TECNICO
ON TIMES.id = TECNICO.time_id;

-- Consulta para exibir nome do time, nome do jogador, posição e data de nascimento do jogador
SELECT TIMES.nome AS "Time", JOGADOR.nome AS "Jogador", JOGADOR.posicao, JOGADOR.data_nascimento
FROM TIMES
JOIN JOGADOR
ON TIMES.id = JOGADOR.time_id;
