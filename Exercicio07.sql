-- Banco de Dados
CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- Tabela de Categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(60) NOT NULL,
    area VARCHAR(60) NOT NULL
);

-- Tabela de Cursos
CREATE TABLE tb_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    descricao VARCHAR(300),
    valor DECIMAL(10,2) NOT NULL,
    carga_horaria INT NOT NULL,   -- horas
    nivel VARCHAR(30) NOT NULL,   -- Básico, Intermediário, Avançado
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção:  tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, area) VALUES
('Programação', 'Tecnologia'),
('Dados', 'Tecnologia'),
('Design', 'Criatividade'),
('Negócios', 'Gestão'),
('Marketing', 'Comunicação');

-- Inserção: tabela tb_cursos
INSERT INTO tb_cursos (nome, descricao, valor, carga_horaria, nivel, categoria_id) VALUES
('Java Fundamentos', 'Sintaxe, OOP e coleções', 750.00, 60, 'Básico', 1),
('Java Avançado', 'Streams, Concurrency, Spring', 980.00, 80, 'Avançado', 1),
('Python para Dados', 'Pandas, NumPy e visualização', 820.00, 70, 'Intermediário', 2),
('SQL do Zero ao Avançado', 'Modelagem e consultas complexas', 640.00, 50, 'Intermediário', 2),
('UX/UI Design Essentials', 'Princípios, prototipagem e testes', 590.00, 45, 'Básico', 3),
('Gestão de Projetos Ágil', 'Scrum, Kanban e métricas', 680.00, 40, 'Intermediário', 4),
('Marketing Digital 360', 'SEO, Ads, Social Media', 720.00, 50, 'Intermediário', 5),
('Design com Figma', 'Componentes, auto layout e handoff', 520.00, 35, 'Básico', 3);

-- SELECT cursos com valor > que R$ 500,00
SELECT * FROM tb_cursos
WHERE valor > 500.00;

-- SELECT cursos com valor entre R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos
WHERE valor BETWEEN 600.00 AND 1000.00;

-- SELECT cursos cujo nome possui a letra 'J'
SELECT * FROM tb_cursos
WHERE nome LIKE '%J%';

-- SELECT com INNER JOIN entre cursos e categorias
SELECT c.id, c.nome, c.valor, c.carga_horaria, c.nivel, cat.nome_categoria, cat.area
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id;

-- SELECT com INNER JOIN filtrando apenas cursos da categoria "Programação" (ex.: Java)
SELECT c.id, c.nome, c.valor, c.nivel, cat.nome_categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE cat.nome_categoria = 'Programação';

-- Testando o código
SELECT * FROM tb_cursos;
SELECT * FROM tb_categorias;
SELECT * FROM tb_cursos WHERE valor > 500.00; -- Preço > 500
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00; -- Entre 600 e 1000
SELECT * FROM tb_cursos WHERE nome LIKE '%J%'; -- Nome com 'J'
