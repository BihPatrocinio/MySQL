-- Banco de Dados
CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

-- Tabela de Categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(60) NOT NULL,
    setor VARCHAR(60) NOT NULL
);

-- Tabela de Produtos
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200),
    valor DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    marca VARCHAR(60) NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção: tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, setor) VALUES
('Hidráulica', 'Instalações'),
('Elétrica', 'Instalações'),
('Ferramentas', 'Equipamentos'),
('Acabamento', 'Revestimentos'),
('Estrutural', 'Construção');

-- Inserção: tabela tb_produtos
INSERT INTO tb_produtos (nome, descricao, valor, estoque, marca, categoria_id) VALUES
('Cimento CP-II 50kg', 'Cimento para obras gerais', 42.90, 120, 'Votorantim', 5),
('Tinta Acrílica 18L', 'Tinta para áreas internas e externas', 139.90, 40, 'Suvinil', 4),
('Chuveiro Elétrico 7500W', 'Aquecimento instantâneo', 129.00, 25, 'Lorenzetti', 2),
('Furadeira 700W', 'Furadeira de impacto 13mm', 149.00, 30, 'Bosch', 3),
('Torneira Cozinha', 'Misturador de bancada', 89.90, 50, 'Docol', 1),
('Registro 1/2"', 'Registro de pressão para chuveiro', 59.90, 80, 'Tigre', 1),
('Cabo Elétrico 2,5mm 100m', 'Rolo de cabo flexível', 219.00, 15, 'Prysmian', 2),
('Piso Porcelanato 60x60', 'Caixa com 2m²', 129.90, 60, 'Portobello', 4);

-- SELECT produtos com valor > que R$ 100,00
SELECT * FROM tb_produtos
WHERE valor > 100.00;

-- SELECT produtos com valor entre R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos
WHERE valor BETWEEN 70.00 AND 150.00;

-- SELECT produtos cujo nome possui a letra 'C'
SELECT * FROM tb_produtos
WHERE nome LIKE '%C%';

-- SELECT com INNER JOIN entre produtos e categorias
SELECT p.id, p.nome, p.valor, p.estoque, p.marca, c.nome_categoria, c.setor
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- SELECT com INNER JOIN filtrando apenas produtos da categoria "Hidráulica"
SELECT p.id, p.nome, p.valor, p.estoque, p.marca, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome_categoria = 'Hidráulica';

-- Testando o código
SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;
SELECT * FROM tb_produtos WHERE valor > 100.00; -- Preço > 100
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00; -- Entre 50 e 150
SELECT * FROM tb_produtos WHERE nome LIKE '%C%'; -- Nome com 'C'

