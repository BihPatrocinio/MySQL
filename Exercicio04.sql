-- Criação do Banco de Dados
CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- Tabela de Categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

-- Tabela de Produtos
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200),
    valor DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de 5 registros: tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, tipo) VALUES
('Medicamentos', 'Controlado e não controlado'),
('Higiene', 'Cuidados pessoais'),
('Cosméticos', 'Beleza e dermo'),
('Infantil', 'Cuidados para bebês e crianças'),
('Suplementos', 'Vitaminas e nutrição');

-- Inserção de 10 registros: tabela tb_produtos
INSERT INTO tb_produtos (nome, descricao, valor, estoque, categoria_id) VALUES
('Paracetamol 750mg', 'Analgésico e antitérmico', 12.90, 120, 1),
('Ibuprofeno 400mg', 'Anti-inflamatório e analgésico', 18.50, 90, 1),
('Antialérgico Loratadina', 'Alívio de alergias', 22.00, 75, 1),
('Shampoo Anticaspa', 'Controle de caspa', 34.90, 60, 2),
('Álcool Gel 70%', 'Higienização das mãos', 9.99, 200, 2),
('Creme Hidratante Facial', 'Hidratação intensa', 58.00, 40, 3),
('Protetor Solar FPS 50', 'Proteção UVA/UVB', 79.90, 55, 3),
('Fralda Tamanho M', 'Pacote com 30 unidades', 52.00, 80, 4),
('Escova Dental Macia', 'Cerdas ultra macias', 7.50, 150, 2),
('Vitamina C 1g', 'Suplemento antioxidante', 64.90, 70, 5);

-- SELECT produtos com valor maior que R$ 50,00
SELECT * FROM tb_produtos
WHERE valor > 50.00;

-- SELECT produtos com valor entre R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos
WHERE valor BETWEEN 5.00 AND 60.00;

-- SELECT produtos cujo nome possui a letra 'C'
SELECT * FROM tb_produtos
WHERE nome LIKE '%C%';

-- SELECT com INNER JOIN entre produtos e categorias
SELECT p.id, p.nome, p.valor, p.estoque, c.nome_categoria, c.tipo
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- SELECT com INNER JOIN filtrando apenas produtos da categoria "Cosméticos"
SELECT p.id, p.nome, p.valor, p.estoque, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome_categoria = 'Cosméticos';

-- Teste de código
SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;
SELECT * FROM tb_produtos WHERE valor > 50.00; -- Preço > 50
SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00; -- Entre 5 e 60
SELECT * FROM tb_produtos WHERE nome LIKE '%C%'; -- Nome com 'C'