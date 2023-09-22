create database sisgeresaude;

use sisgeresaude;

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    nome VARCHAR(100),
    matricula VARCHAR(20),
    equipe VARCHAR(50),
    cpffunc VARCHAR(14),
    rgfunc VARCHAR(12),
    datanascimento DATE,
    email VARCHAR(100),
    sexo ENUM('Feminino', 'Masculino', 'Outro'),
    enderecofunc VARCHAR(200),
    telefone VARCHAR(20),
    statusfunc ENUM ('Ativo', 'Inativo'),
    tiposanguineo VARCHAR(5)
);

CREATE TABLE medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    matricula VARCHAR(20),
    CRM VARCHAR(20),
    equipe ENUM('Asteca', 'Dumont', 'Veteranos', 'Força do Amanhã'),
    cpffunc VARCHAR(14),
    rgfunc VARCHAR(12),
    datanascimento DATE,
    email VARCHAR(100),
    sexo ENUM('Feminino', 'Masculino', 'Outro'),
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    tiposanguineo VARCHAR(5)
);

CREATE TABLE enfermeiros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    matricula VARCHAR(20),
    COREN VARCHAR(20),
    equipe ENUM('Asteca', 'Dumont', 'Veteranos', 'Força do Amanhã'),
    cpffunc VARCHAR(14),
    rgfunc VARCHAR(12),
    datanascimento DATE,
    email VARCHAR(100),
    sexo ENUM('Feminino', 'Masculino', 'Outro'),
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    tiposanguineo VARCHAR(5)
);

CREATE TABLE agentescomusaude (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    matricula VARCHAR(20),
    equipe ENUM('Asteca', 'Dumont', 'Veteranos', 'Força do Amanhã'),
    cpffunc VARCHAR(14),
    rgfunc VARCHAR(12),
    datanascimento DATE,
    email VARCHAR(100),
    sexo ENUM('Feminino', 'Masculino', 'Outro'),
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    tiposanguineo VARCHAR(5)
);

CREATE TABLE pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomepaciente VARCHAR(100),
    cpfpaciente VARCHAR(14),
    rgpaciente VARCHAR(12),
    enderecopaciente VARCHAR (100),
    datanascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(80),
    numcartaosus VARCHAR(15),
    equipe VARCHAR(50),
    nomemae VARCHAR(100),
    nomepai VARCHAR(100),
    raca VARCHAR(50),
    sexo ENUM('Feminino', 'Masculino', 'Outro'),
    tiposanguineo VARCHAR(5),
    nacionalidade ENUM('Brasileira', 'Estrangeira'),
    paisresidencia VARCHAR(50),
    statuspac ENUM ('Ativo', 'Inativo'),
    doencapreexis ENUM('Sim', 'Não')
);


CREATE TABLE consulta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomepaciente VARCHAR(100),
    cpfpaciente VARCHAR(14),
    numcartaosus VARCHAR(15),
    motivoconsulta VARCHAR(200),
    profissionalsolicitante VARCHAR(100),
    dataconsulta DATE,
    horaconsulta TIME
);

CREATE TABLE exames (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idpaciente INT,
    tipoexame VARCHAR(100),
    datapedido DATE,
    dataprevisao DATE,
    pronto BOOLEAN
);

CREATE TABLE niveisacesso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT
);

INSERT INTO niveisacesso (tipo, descricao) VALUES
    ('medico', 'Médico com acesso a todo o histórico e gerenciamento do paciente, marcação de consultas e exames.'),
    ('enfermeiro', 'Enfermeiro com acesso ao histórico do paciente e possibilidade de marcar consultas e ver resultado de exames.'),
    ('agentescomusaude', 'Agente de Saúde com permissão para cadastrar pacientes e ver resultado de exames.');
