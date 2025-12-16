-- Criação do Banco de Dados
CREATE DATABASE rh_empresa;
USE rh_empresa;

-- Tabela de Colaboradores
CREATE TABLE colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    departamento VARCHAR(50),
    data_admissao DATE
);

-- Inserção de 5 ou mais registros
INSERT INTO colaboradores (nome, cargo, salario, departamento, data_admissao)
VALUES 
('Otavio Lima', 'Desenvolvedor', 4500.00, 'TI', '2021-03-29'),
('Leonardo Castro', 'Analista de Marketing', 2800.00, 'Marketing', '2020-07-02'),
('Christina Santos', 'Gerente de CRM', 7500.00, 'Gestao', '2019-01-20'),
('Agatha Lira', 'Analista Contábil', 1900.00, 'Contabilidade', '2022-02-01'),
('Ana Lucia Oliveira', 'Assistente de administrativo', 1300.00, 'Administracao', '2024-07-05'),
('Antonio Firmino', 'Analista de RH', 1900.00, 'RH', '2021-01-13'),
('Andre Fernandes', 'Desenvolvedor', 4500.00, 'TI', '2022-06-27'),
('Gilberto Gomes', 'Analista Pleno de CRM', 1900.00, 'CRM', '2020-04-01'),
('Fernanda Santos', 'Cientista de dados', 5200.00, 'TI', '2021-07-24');

-- SELECT colaboradores com salário maior que 2000
SELECT * FROM colaboradores
WHERE salario > 2000;

-- SELECT colaboradores com salário menor que 2000
SELECT * FROM colaboradores
WHERE salario < 2000;

-- Atualização de registro (atualização de salário pelo id e numero de indentificação do funcionario)
UPDATE colaboradores
SET salario = 2500.00
WHERE id = 8;

-- Conferindo os registros e resultados
SELECT * FROM colaboradores; 
SELECT * FROM colaboradores WHERE salario > 2000;
SELECT * FROM colaboradores WHERE salario < 2000;
SELECT * FROM colaboradores WHERE id = 8;