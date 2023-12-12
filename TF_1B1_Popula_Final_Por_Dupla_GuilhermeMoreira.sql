-- -------- < TF1 > --------
--
--            SCRIPT DE POPULACAO
--
-- Data Criacao ...........: 11/12/2023
-- Autor(es) ..............: Ana Letícia Pereira
--                           Guilherme Puida Moreira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_1B1_guilhermemoreira;
--
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas
--         => 4 Usuários
--         => 2 Papéis
--
-- ---------------------------------------------------------

USE TF_1B1_guilhermemoreira;

INSERT INTO PESSOA (telefone, nome, sobrenome, endereco, dataNascimento)
VALUES
('12345678901', 'João', 'Silva', 'Rua A, 123', '1990-01-15'),
('98765432109', 'Maria', 'Souza', 'Avenida B, 456', '1985-05-20'),
('11122233344', 'Carlos', 'Rocha', 'Rua C, 789', '1982-11-10'),
('55566677788', 'Ana', 'Oliveira', 'Avenida D, 1011', '1995-03-25'),
('99988877766', 'Lucas', 'Fernandes', 'Rua E, 1213', '1988-08-05'),
('11122233355', 'Mariana', 'Lima', 'Rua F, 1415', '1992-06-18'),
('77788899900', 'Roberto', 'Santos', 'Avenida G, 1617', '1980-12-03'),
('44455566677', 'Juliana', 'Pereira', 'Rua H, 1819', '1998-09-22'),
('33344455566', 'Eduardo', 'Cruz', 'Avenida I, 2021', '1993-04-14'),
('22233344455', 'Aline', 'Costa', 'Rua J, 2223', '1987-07-30');

INSERT INTO `LEAD` (origem, interesse, status, sexo, tipo, idPessoa)
VALUES
('Online', 'Alimentos', 'Fechado', 'M', 'Confirmado', 7),
('Offline', 'Beleza', 'Cancelado', 'F', 'Desinteressado', 8),
('Online', 'Automóveis', 'Novo', 'M', 'Potencial', 9),
('Offline', 'Viagens', 'Em Andamento', 'F', 'Interesse', 10);

INSERT INTO CLIENTE (dataCadastro, idPessoa)
VALUES
('2021-01-01', 1),
('2022-02-15', 2),
('2023-03-30', 3),
('2020-04-12', 4),
('2023-05-22', 5),
('2021-06-05', 6),
('2022-07-18', 7);

INSERT INTO CLIENTE_FISICO (cpf, sexo, idCliente)
VALUES
('12345678901', 'M', 1),
('98765432109', 'F', 2),
('11122233344', 'M', 3);

INSERT INTO CLIENTE_JURIDICO (cnpj, organizacao, idCliente)
VALUES
('55667788990011', 'Empresa D', 4),
('99988877766655', 'Empresa E', 5),
('98765432101234', 'Empresa F', 6),
('12345678901234', 'Empresa G', 7);

INSERT INTO LOJA (cnpj, endereco)
VALUES
('01234567890123', 'Rua X, 567'),
('98765432109876', 'Avenida Y, 890'),
('11223344556677', 'Rua Z, 111'),
('55667788990011', 'Avenida W, 222'),
('99988877766655', 'Rua V, 333');

INSERT INTO CONTA (idLoja, ano, mes, valorAgua, valorInternet, valorEnergia, valorAluguel, valorOutros, descricaoOutros)
VALUES
(1, 2023, 7, 100, 100, 100, 100, 0, ''),
(1, 2023, 8, 100, 100, 100, 100, 0, ''),
(1, 2023, 8, 100, 100, 100, 100, 0, ''),
(1, 2023, 10, 100, 100, 100, 100, 0, ''),
(1, 2023, 11, 200, 200, 200, 200, 200, 'Seguro');

INSERT INTO FUNCIONARIO (cpf, area, cargo, dataAdmissao, salario, horaExtra, comissao, idPessoa, idLoja, dataTerminoContrato)
VALUES
('12345678901', 'Vendas', 'Vendedor', '2020-01-10', 3000.00, 50.00, 200.00, 1, 1, NULL),
('98765432109', 'RH', 'Recrutador', '2021-03-15', 3500.00, 60.00, 250.00, 2, 2, NULL),
('11122233344', 'Estoque', 'Analista de Estoque', '2019-05-20', 3200.00, 40.00, 180.00, 3, 3, NULL),
('55566677788', 'Financeiro', 'Analista Financeiro', '2022-07-08', 3800.00, 55.00, 220.00, 4, 4, NULL),
('99988877766', 'TI', 'Analista de Sistemas', '2023-09-12', 4000.00, 60.00, 250.00, 5, 5, NULL);

INSERT INTO FORNECEDOR (cnpj, idPessoa)
VALUES
('01234567890123', 6),
('98765432109876', 7),
('11223344556677', 8),
('55667788990011', 9),
('99988877766655', 10);

INSERT INTO PRODUTO (nome, descricao, preco, tipo, altura, largura, profundidade, material)
VALUES
('Sofá 1', 'Sofá de couro', 1500.00, 'Móveis', 80.0, 120.0, 60.0, 'Couro'),
('Sofá 2', 'Sofá de couro', 1500.00, 'Móveis', 80.0, 120.0, 60.0, 'Couro'),
('Sofá 3', 'Sofá de couro', 1500.00, 'Móveis', 80.0, 120.0, 60.0, 'Couro'),
('Sofá 4', 'Sofá de couro', 1500.00, 'Móveis', 80.0, 120.0, 60.0, 'Couro'),
('Sofá 5', 'Sofá de couro', 1500.00, 'Móveis', 80.0, 120.0, 60.0, 'Couro');

INSERT INTO ESTOQUE (idLoja, idProduto, idFornecedor, responsavelEntrada, endereco, quantidade, troca)
VALUES
(1, 1, 1, '12345678901', 'Rua X, 567', 50, 'N'),
(2, 2, 2, '98765432109', 'Avenida Y, 890', 100, 'S'),
(3, 3, 3, '11122233344', 'Rua Z, 111', 30, 'N'),
(4, 4, 4, '55566677788', 'Avenida W, 222', 80, 'S'),
(5, 5, 5, '99988877766', 'Rua V, 333', 60, 'N');

INSERT INTO CAIXA (idLoja, dataHoraAbertura, dataHoraFechamento, valorInicial, valorFinal)
VALUES
(1, '2023-01-01 00:00:00', NULL, 5000.00, NULL),
(2, '2023-02-01 00:00:00', '2023-02-28 00:00:00', 6000.00, 6200.00),
(3, '2023-03-01 00:00:00', '2023-03-15 00:00:00', 7000.00, 7200.00),
(4, '2023-04-01 00:00:00', NULL, 5500.00, NULL),
(5, '2023-05-01 00:00:00', NULL, 8000.00, NULL);

INSERT INTO VENDA (data, formaPagamento, local, idCliente, cpfFuncionario, idCaixa, parcelas)
VALUES
('2023-01-10', 'CC', 'Loja 1', 1, '12345678901', 1, 0),
('2023-02-20', 'D', 'Loja 2', 2, '98765432109', 2, 0),
('2023-03-05', 'P', 'Loja 3', 3, '11122233344', 3, 0),
('2023-04-15', 'CD', 'Loja 4', 4, '55566677788', 4, 0),
('2023-05-25', 'D', 'Loja 5', 5, '99988877766', 5, 0);

INSERT INTO contem (idVenda, idProduto, quantidade)
VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 3),
(3, 4, 1),
(4, 5, 2),
(5, 1, 1);
