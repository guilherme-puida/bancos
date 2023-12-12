-- -------- < TF1 > --------
--
--            SCRIPT DE CONTROLE
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
CREATE ROLE administrador;
GRANT ALL ON tf1GuilhermeMoreiraAnaPereira.* TO administrador;

CREATE USER dono IDENTIFIED BY '@dono';
GRANT administrador TO dono;

CREATE USER socio IDENTIFIED BY 'socio!!';
GRANT administrador TO socio;

CREATE ROLE funcionario;
GRANT INSERT, SELECT, DELETE ON tf1GuilhermeMoreiraAnaPereira.* TO funcionario;

CREATE USER maria IDENTIFIED BY 'maria123';
GRANT funcionario TO maria;

CREATE USER jose IDENTIFIED BY 'zezao';
GRANT funcionario TO jose;

FLUSH PRIVILEGES;
