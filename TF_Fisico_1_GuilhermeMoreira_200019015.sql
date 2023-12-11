-- -------- < TF1 > --------
--
--            SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 04/12/2023
-- Autor(es) ..............: Ana Letícia Pereira
--                           Guilherme Puida Moreira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: tf1GuilhermeMoreiraAnaPereira
--
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas
--
-- ---------------------------------------------------------
CREATE DATABASE IF NOT EXISTS tf1GuilhermeMoreiraAnaPereira;

USE tf1GuilhermeMoreiraAnaPereira;

CREATE TABLE PESSOA
  (
     idPessoa       INT NOT NULL AUTO_INCREMENT,
     telefone       VARCHAR(11) NOT NULL,
     nome           VARCHAR(50) NOT NULL,
     sobrenome      VARCHAR(50) NOT NULL,
     endereco       VARCHAR(100) NOT NULL,
     dataNascimento DATE NOT NULL,

     CONSTRAINT pessoa_PK PRIMARY KEY (idPessoa)
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE `LEAD`
  (
     idLead    INT NOT NULL AUTO_INCREMENT,
     origem    VARCHAR(50) NOT NULL,
     interesse VARCHAR(50) NOT NULL,
     status    VARCHAR(50) NOT NULL,
     sexo      ENUM('M', 'F') NOT NULL,
     tipo      VARCHAR(50) NOT NULL,
     idPessoa  INT NOT NULL,

     CONSTRAINT lead_PK PRIMARY KEY (idLead),
     CONSTRAINT lead_PESSOA_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA (idPessoa) ON DELETE RESTRICT
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE CLIENTE
  (
     idCliente    INT NOT NULL AUTO_INCREMENT,
     dataCadastro DATE NOT NULL,
     idPessoa     INT NOT NULL,

     CONSTRAINT cliente_PK PRIMARY KEY (idCliente),
     CONSTRAINT cliente_PESSOA_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA (idPessoa) ON DELETE RESTRICT
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE CLIENTE_FISICO
  (
     cpf       CHAR(11) NOT NULL,
     sexo      ENUM('M', 'F') NOT NULL,
     idCliente INT NOT NULL,

     CONSTRAINT cliente_fisico_PK PRIMARY KEY (cpf),
     CONSTRAINT cliente_fisico_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE (idCliente) ON DELETE RESTRICT
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE CLIENTE_JURIDICO
  (
     cnpj        CHAR(14) NOT NULL,
     organizacao VARCHAR(100) NOT NULL,
     idCliente   INT NOT NULL,

     CONSTRAINT cliente_juridico_PK PRIMARY KEY (cnpj),
     CONSTRAINT cliente_juridico_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE (idCliente) ON DELETE RESTRICT
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE LOJA
  (
     idLoja        INT NOT NULL auto_increment,
     cnpj          CHAR(14) NOT NULL,
     endereco      VARCHAR(100) NOT NULL,

     CONSTRAINT loja_PK PRIMARY KEY (idLoja)
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE CONTA
 (
    idConta         INT NOT NULL auto_increment,
    idLoja          INT NOT NULL,
    ano             INT NOT NULL,
    mes             INT NOT NULL,
    valorAgua       REAL NOT NULL,
    valorInternet   REAL NOT NULL,
    valorEnergia    REAL NOT NULL,
    valorAluguel    REAL NOT NULL,
    valorOutros     REAL NOT NULL,
    descricaoOutros VARCHAR(100) NOT NULL,

    CONSTRAINT conta_PK PRIMARY KEY (idConta),
    CONSTRAINT conta_LOJA_FK FOREIGN KEY (idLoja) references LOJA (idLoja) ON DELETE RESTRICT
 )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE FUNCIONARIO
  (
     cpf                 CHAR(11) NOT NULL,
     area                VARCHAR(100) NOT NULL,
     cargo               VARCHAR(100) NOT NULL,
     dataAdmissao        DATE NOT NULL,
     salario             REAL NOT NULL,
     horaExtra           REAL NOT NULL,
     comissao            REAL NOT NULL,
     idPessoa            INT NOT NULL,
     idLoja              INT NOT NULL,
     dataTerminoContrato DATE,

     CONSTRAINT funcionario_PK PRIMARY KEY (cpf),
     CONSTRAINT funcionario_PESSOA_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA (idPessoa) ON DELETE RESTRICT
  )
ENGINE = InnoDB;

CREATE TABLE FORNECEDOR
  (
     idFornecedor INT NOT NULL auto_increment,
     cnpj         CHAR(14) NOT NULL,
     idPessoa     INT NOT NULL,
     CONSTRAINT fornecedor_PK PRIMARY KEY (idFornecedor),
     CONSTRAINT fornecedor_PESSOA_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA (idPessoa) ON DELETE RESTRICT
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE PRODUTO
  (
     idProduto    INT NOT NULL auto_increment,
     nome         VARCHAR(100) NOT NULL,
     descricao    VARCHAR(500) NOT NULL,
     preco        REAL NOT NULL,
     tipo         VARCHAR(100) NOT NULL,
     altura       REAL NOT NULL,
     largura      REAL NOT NULL,
     profundidade REAL NOT NULL,
     material     VARCHAR(100) NOT NULL,
     CONSTRAINT produto_PK PRIMARY KEY (idProduto)
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE ESTOQUE
  (
     idEstoque          INT NOT NULL auto_increment,
     idLoja             INT NOT NULL,
     idProduto          INT NOT NULL,
     idFornecedor       INT NOT NULL,
     responsavelEntrada CHAR(11) NOT NULL,
     endereco           VARCHAR(100) NOT NULL,
     quantidade         INT NOT NULL,
     troca              ENUM ('S', 'N') NOT NULL,

     CONSTRAINT estoque_PK PRIMARY KEY (idEstoque),
     CONSTRAINT estoque_LOJA_FK FOREIGN KEY (idLoja) REFERENCES LOJA (idLoja) ON DELETE RESTRICT,
     CONSTRAINT estoque_PRODUTO_FK FOREIGN KEY (idProduto) REFERENCES PRODUTO (idProduto) ON DELETE RESTRICT,
     CONSTRAINT estoque_FORNECEDOR_FK FOREIGN KEY (idFornecedor) REFERENCES FORNECEDOR (idFornecedor) ON DELETE RESTRICT,
     CONSTRAINT estoque_FUNCIONARIO_FK FOREIGN KEY (responsavelEntrada) REFERENCES FUNCIONARIO (cpf) ON DELETE RESTRICT
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE CAIXA
  (
     idCaixa        INT NOT NULL auto_increment,
     idLoja         INT NOT NULL,
     dataHoraAbertura   DATE NOT NULL,
     dataHoraFechamento DATE,
     valorInicial   REAL NOT NULL,
     valorFinal     REAL,

     CONSTRAINT caixa_PK PRIMARY KEY (idCaixa),
     CONSTRAINT caixa_LOJA_FK FOREIGN KEY (idLoja) REFERENCES LOJA (idLoja) ON DELETE RESTRICT
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE VENDA
  (
     idVenda        INT NOT NULL auto_increment,
     cpfFuncionario CHAR(11) NOT NULL,
     idCaixa        INT NOT NULL,
     idCliente      INT NOT NULL,
     data           DATE NOT NULL,
     formaPagamento ENUM('CD', 'CD', 'P', 'D', 'V') NOT NULL,
     local          VARCHAR(100) NOT NULL,
     parcelas       INT,

     CONSTRAINT venda_PK PRIMARY KEY (idvenda),
     CONSTRAINT venda_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE (idCliente) ON DELETE RESTRICT,
     CONSTRAINT venda_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario) REFERENCES FUNCIONARIO (cpf) ON DELETE RESTRICT,
     CONSTRAINT venda_CAIXA_FK FOREIGN KEY (idCaixa) REFERENCES CAIXA (idCaixa) ON DELETE RESTRICT
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE contem
  (
     idVenda    INT NOT NULL,
     idProduto  INT NOT NULL,
     quantidade INT NOT NULL,

     CONSTRAINT contem_PK PRIMARY KEY (idVenda, idProduto),
     CONSTRAINT contem_VENDA_FK FOREIGN KEY (idVenda) REFERENCES VENDA (idVenda) ON DELETE RESTRICT,
     CONSTRAINT contem_PRODUTO_FK FOREIGN KEY (idProduto) REFERENCES PRODUTO (idProduto) ON DELETE RESTRICT
  )
ENGINE = InnoDB;
