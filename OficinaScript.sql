CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

DROP DATABASE Oficina;

-- VEICULO
CREATE TABLE Veiculo(
	idVeiculo INT auto_increment PRIMARY KEY,
    idRevisao INT,
    Placa CHAR(7) NOT NULL,
    CONSTRAINT placa_idVeiculo UNIQUE (idVeiculo, Placa)
);

ALTER TABLE Veiculo ADD CONSTRAINT fk_eqp_mecanicos FOREIGN KEY (idVeiculo) REFERENCES EqpMecanico(idEqpMecanico),
ADD CONSTRAINT fk_conserto FOREIGN KEY (idVeiculo) REFERENCES Conserto(idConserto),
ADD CONSTRAINT fk_revisao FOREIGN KEY (idRevisao) REFERENCES Revisao(idRevisão);

DESC Veiculo;

-- CLIENTES
CREATE TABLE Clientes(
	idClientes INT auto_increment PRIMARY KEY,
    idVeiculo INT,
    CONSTRAINT fk_veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

DESC Clientes;

-- PESSOA FISICA
CREATE TABLE PessoaFisica(
	idPessoaFisica INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Endereco VARCHAR(45),
    Contato CHAR(11)
);

ALTER TABLE PessoaFisica ADD CONSTRAINT unique_cpf_PessoaFisica UNIQUE (CPF);

ALTER TABLE PessoaFisica ADD CONSTRAINT fk_idClientes_pf FOREIGN KEY (idPessoaFisica) REFERENCES Clientes(idClientes),
ADD CONSTRAINT fk_clinte_pf FOREIGN KEY (idClientePf) REFERENCES Clientes(idClientes),
ADD CONSTRAINT fk_veiculo_pf FOREIGN KEY (idPessoaFisica) REFERENCES Veiculo(idVeiculo);

DESC PessoaFisica;

-- PESSOA JURIDICA
CREATE TABLE PessoaJuridica(
	idPessoaJuridica INT auto_increment PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Endereço VARCHAR(45),
    Contato CHAR(11),
    CONSTRAINT unique_cnpj_PessoaJuridica UNIQUE (CNPJ)
);

ALTER TABLE PessoaJuridica ADD CONSTRAINT fk_clientes_pj FOREIGN KEY (idPessoaJuridica) REFERENCES Clientes(idClientes),
ADD CONSTRAINT fk_veiculo_pj FOREIGN KEY (idPessoaJuridica) REFERENCES Veiculo(idVeiculo);

DESC PessoaJuridica;

-- CONSERTO
CREATE TABLE Conserto(
	idConserto INT auto_increment PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL
);

DESC Conserto;

-- REVISÃO
CREATE TABLE Revisao(
	idRevisao INT auto_increment PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL
);

DESC Revisão;

-- MECANICO
CREATE TABLE Mecanico(
	idMecanico INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45) NOT NULL,
    Especialidade VARCHAR(45) NOT NULL
);

DESC Mecanico;

-- EQUIPE MECÂNICOS
CREATE TABLE EqpMecanicos(
	idEqpMecanicos INT auto_increment PRIMARY KEY
);

ALTER TABLE EqpMecanicos ADD CONSTRAINT fk_Mecanico FOREIGN KEY (idEqpMecanicos) REFERENCES Mecanico(idMecanico);
ALTER TABLE OdServico ADD CONSTRAINT fk_OdServico FOREIGN KEY (idOdServico) REFERENCES OdServico(idOdServico);

DESC EqpMecanicos;

-- ORDEM DE SERVIÇO
CREATE TABLE OdServico(
	idOdServico INT auto_increment PRIMARY KEY,
    DataEmissao DATE,
    ValorServico FLOAT NOT NULL,
    ValorPeca FLOAT NOT NULL,
    ValorTotal FLOAT NOT NULL,
    Status ENUM('AGUARDANDO', 'EM ANDAMENTO', 'CONCLUIDO', 'CANCELADO'),
    DataConclusao DATE
);

SELECT * FROM OdServico ORDER BY DataEmissão;
SELECT * FROM OdServico ORDER BY ValorTotal;
DESC OdServiço;

-- REFERENCIA DE PREÇOS
CREATE TABLE ReferenciaPrecos(
	idReferenciaPrecos INT auto_increment PRIMARY KEY,
    CONSTRAINT fk_referencia_precos FOREIGN KEY (idReferenciaPreços) REFERENCES OdServiço(idOdServiço)
);

DESC ReferenciaPrecos;

-- AUTORIZAÇÃO CLIENTE
CREATE TABLE Autorizacao(
	idAutorização INT auto_increment PRIMARY KEY,
	Autorizado BOOL DEFAULT FALSE,
    CONSTRAINT fk_autorização_cliente FOREIGN KEY (idAutorização) REFERENCES Clientes(idClientes),
    CONSTRAINT fk_autorização_veiculo FOREIGN KEY (idAutorização) REFERENCES Veiculo(idVeiculo),
    CONSTRAINT fk_autorização_OdServiço FOREIGN KEY (idAutorização) REFERENCES OdServiço(idOdServiço)
);

DESC Autorizacao;

-- PEÇAS
CREATE TABLE Pecas(
	idPecas INT auto_increment PRIMARY KEY,
    Descrição VARCHAR(45),
    Valor FLOAT NOT NULL
);

DESC Pecas;

-- OS PEÇAS
CREATE TABLE OsPecas(
	idOsPecas INT auto_increment PRIMARY KEY,
	CONSTRAINT fk_pecas FOREIGN KEY (idOsPecas) REFERENCES Pecas(idPecas),
    CONSTRAINT fk_os_pecas FOREIGN KEY (idOsPecas) REFERENCES OdServiço(idOdServiço)
);

DESC OsPecas;

-- SERVIÇOS
CREATE TABLE Servicos(
	idServiços INT auto_increment PRIMARY KEY,
    Descrição VARCHAR(45),
    Valor FLOAT NOT NULL
);

DESC Servicos;

-- ORDEM DE SERVIÇO
CREATE TABLE OdServico(
	idOdServiço INT auto_increment PRIMARY KEY,
    CONSTRAINT fk_serviços FOREIGN KEY (idOdServiço) REFERENCES Serviços(idServiços),
    CONSTRAINT fk_os_serviços FOREIGN KEY (idOdServiço) REFERENCES OdServiço(idOdServiço)
);

DESC OdServico;
