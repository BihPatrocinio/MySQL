--  Banco de Dados
CREATE DATABASE cidade_dos_vegetais;
USE cidade_dos_vegetais;

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
('Frutas Tropicais', 'Frutas'),
('Frutas Cítricas', 'Frutas'),
('Frutas Vermelhas', 'Frutas'),
('Legumes e Verduras', 'Vegetais'),
('Ervas e Especiarias', 'Temperos');

-- Inserção de 17 registros: tabela tb_produtos
INSERT INTO tb_produtos (nome, descricao, valor, estoque, categoria_id) VALUES
-- Frutas Tropicais
('Manga', 'Fruta doce e suculenta', 12.00, 150, 1),
('Abacaxi', 'Fruta tropical aromática e doce', 10.00, 100, 1),
('Mamão', 'Fruta macia e adocicada', 8.50, 120, 1),
('Maracujá', 'Fruta cítrica para sucos', 9.90, 90, 1),

-- Frutas Cítricas
('Laranja', 'Fruta cítrica rica em vitamina C', 7.00, 200, 2),
('Limão', 'Fruta cítrica azeda, usada em temperos', 5.50, 180, 2),
('Tangerina', 'Fruta cítrica doce e fácil de descascar', 8.00, 160, 2),
('Ponkan', 'Variedade de tangerina muito popular', 9.00, 140, 2),

-- Frutas Vermelhas
('Morango', 'Fruta vermelha doce e aromática', 15.00, 130, 3),
('Amora', 'Fruta pequena e roxa, sabor marcante', 18.00, 90, 3),
('Framboesa', 'Fruta vermelha delicada e ácida', 20.00, 80, 3),
('Cereja', 'Fruta vermelha doce e suculenta', 25.00, 70, 3),

-- Legumes e Verduras
('Alface', 'Folhas verdes crocantes', 4.99, 200, 4),
('Cenoura', 'Raiz crocante e doce', 6.50, 190, 4),
('Tomate', 'Fruto usado como legume em saladas', 7.20, 170, 4),

-- Ervas e Especiarias
('Coentro', 'Erva aromática para temperos', 4.00, 140, 5),
('Cebolinha', 'Erva fresca para temperos', 3.50, 150, 5);

-- SELECT produtos com valor > que R$ 10,00
SELECT * FROM tb_produtos
WHERE valor > 10.00;

-- SELECT produtos com valor entre R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos
WHERE valor BETWEEN 10.00 AND 20.00;

-- SELECT produtos cujo nome possui a letra 'C'
SELECT * FROM tb_produtos
WHERE nome LIKE '%C%';

-- SELECT com INNER JOIN entre produtos e categorias
SELECT p.id, p.nome, p.valor, p.estoque, c.nome_categoria, c.tipo
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- SELECT com INNER JOIN filtrando: produtos da categoria "Frutas Cítricas"
SELECT p.id, p.nome, p.valor, p.estoque, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome_categoria = 'Frutas Cítricas';

-- Testando o código
SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;
SELECT * FROM tb_produtos WHERE valor > 50.00; -- Preço > 50
SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00; -- Entre 50 e 150
SELECT * FROM tb_produtos WHERE nome LIKE '%C%'; -- Nome com 'C'

