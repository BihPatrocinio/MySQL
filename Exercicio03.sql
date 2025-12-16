-- Criação do Banco de Dados
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- Tabela de Categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

-- Tabela de Pizzas
CREATE TABLE tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200),
    valor DECIMAL(10,2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,   -- P, M, G
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de 5 registros: tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, tipo) VALUES
('Tradicional', 'Salgada'),
('Gourmet', 'Salgada'),
('Vegana', 'Salgada'),
('Doce', 'Doce'),
('Especial', 'Salgada');

-- Inserção de 20 registros: tabela tb_pizzas
INSERT INTO tb_pizzas (nome, descricao, valor, tamanho, categoria_id) VALUES
('Margherita', 'Molho de tomate, mozzarella, manjericão', 42.00, 'M', 1),
('Calabresa', 'Calabresa, cebola, mozzarella', 48.00, 'G', 1),
('Portuguesa', 'Presunto, ovo, cebola, azeitona, mozzarella', 52.00, 'G', 1),
('Napolitana', 'Tomate, alho, mozzarella, orégano', 44.00, 'M', 1),
('Quatro Queijos', 'Mozzarella, gorgonzola, parmesão, provolone', 55.00, 'M', 2),
('Trufada de Funghi', 'Funghi, azeite trufado, mozzarella', 92.00, 'M', 2),
('Parma e Rúcula', 'Presunto de parma, rúcula, parmesão', 78.00, 'M', 2),
('Camarão Gourmet', 'Camarão, alho-poró, mozzarella', 95.00, 'G', 2),
('Vegana Mediterrânea', 'Tomate, azeitona, rúcula, queijo vegano', 58.00, 'G', 3),
('Vegana de Cogumelos', 'Cogumelos, cebola roxa, queijo vegano', 60.00, 'M', 3),
('Vegana de Abobrinha', 'Abobrinha grelhada, tomate seco, queijo vegano', 62.00, 'M', 3),
('Vegana Mix de Legumes', 'Berinjela, pimentão, abobrinha, queijo vegano', 64.00, 'G', 3),
('Chocolate com Morango', 'Chocolate belga e morangos frescos', 65.00, 'M', 4),
('Banana com Canela', 'Banana, açúcar mascavo, canela', 50.00, 'G', 4),
('Romeu e Julieta', 'Goiabada e queijo cremoso', 55.00, 'M', 4),
('Nutella com Frutas', 'Nutella, morango e banana', 70.00, 'M', 4),
('Frango com Catupiry', 'Frango desfiado, catupiry, mozzarella', 56.00, 'G', 5),
('Carne Seca com Abóbora', 'Carne seca, abóbora, cebola, mozzarella', 68.00, 'M', 5),
('Pepperoni Especial', 'Pepperoni, mozzarella, orégano', 72.00, 'G', 5),
('Mexicana Picante', 'Carne moída, jalapeño, cheddar', 80.00, 'M', 5);

-- SELECT pizzas: valor > que R$ 45,00
SELECT * FROM tb_pizzas
WHERE valor > 45.00;

-- SELECT pizzas: valor entre R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas
WHERE valor BETWEEN 50.00 AND 100.00;

-- SELECT pizzas cujo nome possui a letra 'M'
SELECT * FROM tb_pizzas
WHERE nome LIKE '%M%';

-- SELECT com INNER JOIN entre pizzas e categorias
SELECT p.id, p.nome, p.valor, p.tamanho, c.nome_categoria, c.tipo
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- SELECT com INNER JOIN filtrando apenas pizzas da categoria "Doce"
SELECT p.id, p.nome, p.valor, p.tamanho, c.nome_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome_categoria = 'Doce';

-- Testando o código
SELECT * FROM tb_pizzas;
SELECT * FROM tb_categorias;
SELECT * FROM tb_pizzas WHERE valor > 45.00; -- Preço > 45
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00; -- Entre 50 e 100
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%'; -- Nome com 'M'