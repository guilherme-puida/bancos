-- -------- < TF1 > --------
--
--            SCRIPT DE DELECAO
--
-- Data Criacao ...........: 11/12/2023
-- Autor(es) ..............: Ana Letícia Pereira
--                           Guilherme Puida Moreira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_1B1_guilhermemoreira;
--
-- PROJETO => 01 Base de Dados
--         => 14 Tabelas
--         => 4 Usuários
--         => 2 Papéis
--
-- ---------------------------------------------------------
USE TF_1B1_guilhermemoreira;

DROP TABLE contem;
DROP TABLE VENDA;
DROP TABLE CAIXA;
DROP TABLE ESTOQUE;
DROP TABLE PRODUTO;
DROP TABLE FORNECEDOR;
DROP TABLE FUNCIONARIO;
DROP TABLE CONTA;
DROP TABLE LOJA;
DROP TABLE CLIENTE_JURIDICO;
DROP TABLE CLIENTE_FISICO;
DROP TABLE CLIENTE;
DROP TABLE `LEAD`;
DROP TABLE PESSOA;

DROP USER dono;
DROP USER socio;
DROP USER maria;
DROP USER jose;

DROP ROLE administrador;
DROP ROLE funcionario;
