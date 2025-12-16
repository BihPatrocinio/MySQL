-- Criação do Banco de Dados
CREATE DATABASE senhor_dos_aneis;
USE senhor_dos_aneis;

-- Tabela de Classes
CREATE TABLE tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

-- Tabela de Personagens
CREATE TABLE tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- Inserção de 5 ou mais registros: tabela tb_classes
INSERT INTO tb_classes (nome_classe, descricao) VALUES
('Hobbit', 'Pequenos e ágeis, especialistas em furtividade'),
('Mago', 'Usuários de magias poderosas e sabedoria'),
('Guerreiro', 'Combatentes fortes e habilidosos em batalha'),
('Arqueiro', 'Mestres em ataques à distância com arco e flecha'),
('Rei', 'Líderes com grande autoridade e resistência');

-- Inserção de 14 registros: tabela tb_personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Frodo', 1200, 800, 10, 1),       -- Hobbit
('Samwise', 1100, 900, 9, 1),      -- Hobbit
('Merry', 1000, 700, 8, 1),        -- Hobbit
('Pippin', 950, 650, 7, 1),        -- Hobbit
('Gandalf', 3000, 2000, 25, 2),    -- Mago
('Saruman', 2800, 1900, 24, 2),    -- Mago
('Radagast', 2200, 1500, 20, 2),   -- Mago
('Aragorn', 2800, 1800, 22, 3),    -- Guerreiro
('Boromir', 2300, 1600, 18, 3),    -- Guerreiro
('Gimli', 2400, 1700, 19, 3),      -- Guerreiro
('Legolas', 2600, 1500, 20, 4),    -- Arqueiro
('Thranduil', 2700, 1600, 21, 4),  -- Arqueiro
('Théoden', 2000, 1900, 21, 5),    -- Rei
('Elrond', 2500, 1800, 23, 5);     -- Rei

-- SELECT personagens com poder de ataque maior que 2000
SELECT * FROM tb_personagens
WHERE poder_ataque > 2000;

-- SELECT personagens com poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT personagens cujo nome possui a letra 'T'
SELECT * FROM tb_personagens
WHERE nome LIKE '%T%';

-- SELECT com INNER JOIN entre personagens e classes
SELECT p.id, p.nome, p.poder_ataque, p.poder_defesa, p.nivel, c.nome_classe, c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;

-- SELECT com INNER JOIN filtrando personagens da classe "Mago"
SELECT p.id, p.nome, p.poder_ataque, p.poder_defesa, p.nivel, c.nome_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome_classe = 'Mago';

-- Teste de código
SELECT * FROM tb_personagens; -- Personagens
SELECT * FROM tb_classes; -- Classificação e descrição dos personagens
SELECT * FROM tb_personagens WHERE poder_ataque > 2000; -- Ataque > 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000; -- Defesa 1000–2000
SELECT * FROM tb_personagens WHERE nome LIKE '%T%'; -- Nome com ‘T’



