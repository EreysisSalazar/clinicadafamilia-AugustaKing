-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/09/2023 às 05:48
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sisgeresaude`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agentescomusaude`
--

CREATE TABLE `agentescomusaude` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `matricula` varchar(20) DEFAULT NULL,
  `equipe` enum('Asteca','Dumont','Veteranos','Força do Amanhã') DEFAULT NULL,
  `cpffunc` varchar(14) DEFAULT NULL,
  `rgfunc` varchar(12) DEFAULT NULL,
  `datanascimento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sexo` enum('Feminino','Masculino','Outro') DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tiposanguineo` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `nomepaciente` varchar(100) DEFAULT NULL,
  `cpfpaciente` varchar(14) DEFAULT NULL,
  `numcartaosus` varchar(15) DEFAULT NULL,
  `motivoconsulta` varchar(200) DEFAULT NULL,
  `profissionalsolicitante` varchar(100) DEFAULT NULL,
  `dataconsulta` date DEFAULT NULL,
  `horaconsulta` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `nomepaciente`, `cpfpaciente`, `numcartaosus`, `motivoconsulta`, `profissionalsolicitante`, `dataconsulta`, `horaconsulta`) VALUES
(1, 'Marina Diamantes', '878.864.790-09', 'S-26099', 'Cefaléia', 'Selena maria', '2023-09-25', '10:30:00'),
(2, 'Stefano Gregorio', '676.436.764-70', 'S-21092', 'Tendinite', 'Selena maria', '2023-10-31', '10:30:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enfermeiros`
--

CREATE TABLE `enfermeiros` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `matricula` varchar(20) DEFAULT NULL,
  `COREN` varchar(20) DEFAULT NULL,
  `equipe` enum('Asteca','Dumont','Veteranos','Força do Amanhã') DEFAULT NULL,
  `cpffunc` varchar(14) DEFAULT NULL,
  `rgfunc` varchar(12) DEFAULT NULL,
  `datanascimento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sexo` enum('Feminino','Masculino','Outro') DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tiposanguineo` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exames`
--

CREATE TABLE `exames` (
  `id` int(11) NOT NULL,
  `tipoexame` varchar(100) DEFAULT NULL,
  `dataexame` date DEFAULT NULL,
  `dataprevisao` date DEFAULT NULL,
  `nomepaciente` varchar(50) DEFAULT NULL,
  `cpfpaciente` varchar(14) NOT NULL,
  `numcartaosus` varchar(15) NOT NULL,
  `pronto` int(11) DEFAULT 0,
  `horaexame` time DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exames`
--

INSERT INTO `exames` (`id`, `tipoexame`, `dataexame`, `dataprevisao`, `nomepaciente`, `cpfpaciente`, `numcartaosus`, `pronto`, `horaexame`) VALUES
(1, 'Hemograma', '2023-12-20', '0000-00-00', 'Enzo Ribeiro Wang', '170.272.660-67', 'S-21075', 0, '08:00:00'),
(2, 'Endoscopia', '2023-10-27', NULL, 'Melanie Martinez ', '845.864.677-38', 'S-12375', 0, '09:45:00'),
(11, 'Endoscopia', '2023-12-20', NULL, 'Analia Beatriz Correia', '676.436.764-00', 'S-12398', 0, '10:35:00'),
(12, 'Mamografia', '2024-10-10', NULL, 'Melanie Martinez', '878.864.790-09', 'S-26099', 0, '08:45:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `matricula` varchar(20) DEFAULT NULL,
  `equipe` varchar(50) DEFAULT NULL,
  `cpffunc` varchar(14) DEFAULT NULL,
  `rgfunc` varchar(12) DEFAULT NULL,
  `datanascimento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sexo` enum('Feminino','Masculino','Outro') DEFAULT NULL,
  `enderecofunc` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `statusfunc` enum('Ativo','Inativo') DEFAULT NULL,
  `tiposanguineo` varchar(5) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `tipo`, `nome`, `matricula`, `equipe`, `cpffunc`, `rgfunc`, `datanascimento`, `email`, `sexo`, `enderecofunc`, `telefone`, `statusfunc`, `tiposanguineo`, `senha`) VALUES
(1, 'medico', 'Maria Silva Pereira', 'med12023', 'Asteca', '123.456.789-00', '46.125.809-2', '1985-11-10', 'dramariaspereira@email.com', 'Feminino', 'Avenida RJ, 201, rio de janeiro, RJ, Brasil', '(21)9876-5412', 'Ativo', 'AB', '$2y$10$rU5BONOjwRh3KnRGMxnVGOeV.Dm4mwLVUURO9pnJ9alpurI5aLDCG'),
(2, 'enfermeiro', 'Abelardo Di Bragança', 'enf223', 'Dumont', '321.456.789-00', '26.864.182-1', '1992-08-07', 'abeldb@email.com', 'Masculino', 'Avenida Luz, 202, rio de janeiro, RJ, Brasil', '(21) 99666-1712', 'Ativo', 'O+', '$2y$10$vZFQfSEUQeF6KxInL8eYluBu.0TY1QxDIZL.NvrG/pxDPNSaNGIkK'),
(3, 'agentescomusaude', 'Orlando Souza Cruise', 'ag323', 'Força do amanhã', '129.451.651-55', '54.169.081-4', '2001-01-02', 'cruise.orlando@email.com', 'Masculino', 'Rua dos pinhais azuis, 2477, rio de janeiro, RJ, Brasil', '(21) 97163-2857', 'Ativo', 'O-', '$2y$10$DtKu0qaA08RNOmAXubV7c.0EOqjXOKdnUcIwfklcHiGQ7OCG5N7YW'),
(4, 'medico', 'Pamela Lorde de François', 'med423', 'Veteranos', '838.206.464-77', '94.523.632-3', '1997-04-04', 'doutorapamelalf@email.com', 'Feminino', 'Rua do colegio, 789, rio de janeiro, RJ, Brasil.', '(21) 97632-0071', 'Ativo', 'A-', '$2y$10$1rupdRwkxng6nPduwnFHPOXgZwAHJ6t2OrqmYbjBnTWSzKTYrLPwm'),
(5, 'enfermeiro', 'Aurora Santos Luz', 'en523', 'Asteca', '414.987.997-44', '62.565.267-8', '1978-06-08', 'auroraenfermeira@email.com', 'Feminino', 'Rua Cristo amado, 33, rio de janeiro, RJ, Brasil', '(24) 97411-7797', 'Ativo', 'B+', '$2y$10$N5TEZGNQ5wBWIBbhAZQMi.girJuvOjuv8r5E/RDeLfOl0wGybh4AO'),
(6, 'agentescomusaude', 'João Benjamin dos Anjos', 'ag623', 'Força do amanhã', '269.756.066-17', '65.816.446-6', '1969-09-10', 'joaodosanjos@email.com', 'Masculino', 'Rua das palmeiras, 1001, rio de janeiro, RJ, Brasil.', '(22) 99803-1055', 'Ativo', 'A+', '$2y$10$SEw8QLSb4bwCFf2Y..xgXuu./YMsFsU0KiANnZWw92nOuPCkXrwai'),
(9, 'medico', 'Augusto César Lovato', 'med723', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$B8qtDLzhSV6eKwh9kPAliOkH3VZQv0Pa4A4g9v45f6BlNIFKnP186'),
(10, 'enfermeiro', 'Selena Maria ', 'enf823', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$gDZfFYI5blAlO/QkEWS0VOHprYXk3tnaHi54clQ6Pj97pp/9RLPIu'),
(11, 'agentescomusaude', 'Demetrio Devonne', 'ag923', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ADc3nKSsZzMM0vx0Nx2xWOa7.iPxP5DfX3BHvpWH1bexuQmHK3q3C');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

CREATE TABLE `historico` (
  `id` int(11) NOT NULL,
  `nomepaciente` int(11) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `dataexame` date DEFAULT NULL,
  `dataconsulta` date DEFAULT NULL,
  `horaexame` time DEFAULT NULL,
  `horaconsulta` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `horarios_ocupados`
--

CREATE TABLE `horarios_ocupados` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `cpfpaciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `horarios_ocupados`
--

INSERT INTO `horarios_ocupados` (`id`, `data`, `hora`, `tipo`, `cpfpaciente`) VALUES
(1, '2023-09-25', '10:30:00', 'consulta', 878),
(2, '2023-10-31', '10:30:00', 'consulta', 676);

-- --------------------------------------------------------

--
-- Estrutura para tabela `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `matricula` varchar(20) DEFAULT NULL,
  `CRM` varchar(20) DEFAULT NULL,
  `equipe` enum('Asteca','Dumont','Veteranos','Força do Amanhã') DEFAULT NULL,
  `cpffunc` varchar(14) DEFAULT NULL,
  `rgfunc` varchar(12) DEFAULT NULL,
  `datanascimento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sexo` enum('Feminino','Masculino','Outro') DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tiposanguineo` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `niveisacesso`
--

CREATE TABLE `niveisacesso` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `niveisacesso`
--

INSERT INTO `niveisacesso` (`id`, `tipo`, `descricao`) VALUES
(1, 'medico', 'Médico com acesso a todo o histórico e gerenciamento do paciente, marcação de consultas e exames.'),
(2, 'enfermeiro', 'Enfermeiro com acesso ao histórico do paciente e possibilidade de marcar consultas e ver resultado de exames.'),
(3, 'agentescomusaude', 'Agente de Saúde com permissão para cadastrar pacientes e ver resultado de exames.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nomepaciente` varchar(100) DEFAULT NULL,
  `cpfpaciente` varchar(14) DEFAULT NULL,
  `rgpaciente` varchar(12) DEFAULT NULL,
  `enderecopaciente` varchar(100) DEFAULT NULL,
  `datanascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `numcartaosus` varchar(15) DEFAULT NULL,
  `equipe` varchar(50) DEFAULT NULL,
  `nomemae` varchar(100) DEFAULT NULL,
  `nomepai` varchar(100) DEFAULT NULL,
  `raca` varchar(50) DEFAULT NULL,
  `sexo` enum('Feminino','Masculino','Outro') DEFAULT NULL,
  `tiposanguineo` varchar(5) DEFAULT NULL,
  `nacionalidade` enum('Brasileira','Estrangeira') DEFAULT NULL,
  `statuspac` enum('Ativo','Inativo') DEFAULT NULL,
  `doencapreexis` enum('Sim','Não') DEFAULT NULL,
  `detalhesdoenca` varchar(255) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `senha` varchar(55) DEFAULT NULL,
  `tokenreset` varchar(255) DEFAULT NULL,
  `expiracaotoken` timestamp NULL DEFAULT NULL,
  `solicitacaoreset` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nomepaciente`, `cpfpaciente`, `rgpaciente`, `enderecopaciente`, `datanascimento`, `telefone`, `email`, `numcartaosus`, `equipe`, `nomemae`, `nomepai`, `raca`, `sexo`, `tiposanguineo`, `nacionalidade`, `statuspac`, `doencapreexis`, `detalhesdoenca`, `usuario`, `senha`, `tokenreset`, `expiracaotoken`, `solicitacaoreset`) VALUES
(2, 'Enzo Ribeiro Wang', '170.000.660-07', '30.000.923-0', 'Avenida cabo verde, 727, iguá, rio de janeiro, RJ, Brasil', '2002-05-22', '219002008009', 'erb.2002@email.com', 'S-21075', 'Força do Amanhã', 'Mariana Ribeiro', 'Wang Tao', 'Amarela', 'Masculino', 'O-', 'Brasileira', 'Ativo', 'Não', '', 'enzow', '0202', NULL, NULL, 0),
(3, 'Stefano Gregorio', '676.436.764-70', '84.342.986-0', 'Rua buenos aires, 2008, rio de janeiro, rj, Brasil', '1994-01-04', '(21) 2169-5275', 'sgreg@email.com', 'S-21092', 'Asteca', 'Fatima Gregorio', 'Francisco Gregorio', 'Branca', 'Masculino', 'O+', 'Brasileira', 'Ativo', 'Sim', 'Lupus', 'sgreg', '0303', NULL, NULL, 0),
(4, 'Marina Diamantes', '878.864.790-09', '85.824.730-6', 'Avenida primadona, 2008, rio de janeiro, rj, Brasil', '2005-02-05', '(21) 3372-7025', 'maridias@email.com', 'S-26099', 'Asteca', 'Paula Diamantes', 'Paolo Diamantes', 'Branca', 'Feminino', 'O+', 'Brasileira', 'Ativo', 'Sim', 'Asma', 'marid', '0404', NULL, NULL, 0),
(5, 'Melanie Martinez', '845.864.677-38', '62.984.233-4', 'Rua ABC, 2010, rio de janeiro, RJ, Brasil', '1999-10-10', '(21) 6372-7000', 'melmar@email.com', 'S-12375', 'asteca', 'Mariah Martinez', 'João Martinez', 'Branca', 'Feminino', 'O-', 'Brasileira', 'Ativo', 'Não', '', 'melmar', '0505', NULL, NULL, 0),
(7, 'Cristo Luz e Silva', '345.123.677-01', '12.984.233-0', 'Rua Paraíso, 33, bairro Ave Maria, Rio de janeiro, Rj', '2002-02-22', '(21) 1234-1500', 'cristo.les@email.com', 'S-98765', 'força do amanhã', 'Daniela Luz del Prata', 'Martin Souza e Silva', 'Preta', 'Masculino', 'O-', 'Brasileira', 'Ativo', 'Não', '', '', '', NULL, NULL, 0),
(18, 'Analia Beatriz Correia', '676.436.764-00', '37.123.923-0', 'Rua ABC, 202, rio de janeiro, RJ, Brasil', '2002-02-22', '(21) 6372-0000', 'analiabia@email.com', 'S-12398', 'dumont', 'Fatima Correia', 'Augusto Correia', 'Branca', 'Feminino', 'O+', 'Brasileira', 'Ativo', 'Sim', '', NULL, NULL, NULL, NULL, 0),
(19, 'Salomé Gomes Nakamura', '170.000.660-67', '15.824.730-6', 'Rua 123, 200, rio de janeiro, RJ, Brasil', '1969-10-30', '(21) 2688-6200', 'salomegn@email.com', 'S-12000', 'asteca', 'Silene Gomes', 'Fuhiko Nakamura', 'Amarela', 'Feminino', 'AB', 'Brasileira', 'Ativo', 'Sim', '', NULL, NULL, NULL, NULL, 0),
(20, 'José Maria Domingos', '000.436.764-70', '62.984.123-0', 'Avenida morada dos anjos, 7, campo pequeno, rio de janeiro, RJ, Brasil', '2003-02-01', '(21) 3456-1500', 'jmd.jmd@email.com', 'S-12000', 'veteranos', 'Shirley Maria', 'Paulo Domingos', 'Parda', 'Masculino', 'A-', 'Brasileira', 'Ativo', 'Não', '', NULL, NULL, NULL, NULL, 0),
(21, 'Fatima dos Anjos', '111.436.764-00', '37.000.103-3', 'Avenida Potter, 7, campo pequeno, rio de janeiro, RJ, Brasil', '1999-05-07', '(21) 3372-0011', 'fatinhadosanjos@email.com', 'S-22301', 'força do amanhã', 'Maria dos Anjos', 'Josè dos Anjos', 'Parda', 'Feminino', 'AB', 'Brasileira', 'Ativo', 'Não', '', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tokensredefinicaosenha`
--

CREATE TABLE `tokensredefinicaosenha` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `criadoem` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agentescomusaude`
--
ALTER TABLE `agentescomusaude`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `enfermeiros`
--
ALTER TABLE `enfermeiros`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `exames`
--
ALTER TABLE `exames`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nomepaciente` (`nomepaciente`);

--
-- Índices de tabela `horarios_ocupados`
--
ALTER TABLE `horarios_ocupados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data` (`data`,`hora`);

--
-- Índices de tabela `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `niveisacesso`
--
ALTER TABLE `niveisacesso`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tokensredefinicaosenha`
--
ALTER TABLE `tokensredefinicaosenha`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agentescomusaude`
--
ALTER TABLE `agentescomusaude`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `enfermeiros`
--
ALTER TABLE `enfermeiros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `exames`
--
ALTER TABLE `exames`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `horarios_ocupados`
--
ALTER TABLE `horarios_ocupados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `niveisacesso`
--
ALTER TABLE `niveisacesso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tokensredefinicaosenha`
--
ALTER TABLE `tokensredefinicaosenha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`nomepaciente`) REFERENCES `pacientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
