-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/07/2026 às 01:41
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `florescer`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administradoras`
--

CREATE TABLE `administradoras` (
  `Adm_Nivel_Acesso` int(11) DEFAULT NULL,
  `Adm_ID` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Usuarios_Usu_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `administradoras`
--

INSERT INTO `administradoras` (`Adm_Nivel_Acesso`, `Adm_ID`, `fk_Usuarios_Usu_ID`) VALUES
(3, 1, 1),
(2, 2, 2),
(2, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `coletivos`
--

CREATE TABLE `coletivos` (
  `Col_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Col_Nome` varchar(100) DEFAULT NULL,
  `Col_Descricao` varchar(250) DEFAULT NULL,
  `Col_Are_Atuacao` varchar(15) DEFAULT NULL,
  `Col_Telefone` varchar(14) DEFAULT NULL,
  `Col_Email` varchar(60) DEFAULT NULL,
  `Col_Endereco` varchar(120) DEFAULT NULL,
  `Col_Cidade` varchar(80) DEFAULT NULL,
  `Col_Foto` varchar(255) DEFAULT NULL,
  `Col_Status` tinyint(1) DEFAULT NULL,
  `fk_Administradoras_Adm_ID` int(11) DEFAULT NULL,
  `fk_Administradoras_fk_Usuarios_Usu_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `coletivos`
--

INSERT INTO `coletivos` (`Col_ID`, `Col_Nome`, `Col_Descricao`, `Col_Are_Atuacao`, `Col_Telefone`, `Col_Email`, `Col_Endereco`, `Col_Cidade`, `Col_Foto`, `Col_Status`, `fk_Administradoras_Adm_ID`, `fk_Administradoras_fk_Usuarios_Usu_ID`) VALUES
(1, 'Coletivo Raízes Femininas', 'Grupo dedicado ao acolhimento e apoio psicossocial de mulheres em situacao de vulnerabilidade.', 'Assistencia Soc', '(19) 3622-1001', 'contato@raizesfemininas.org', 'Rua das Flores, 120', 'Sao Joao da Boa Vista', 'coletivos/raizes.jpg', 1, 1, 1),
(2, 'Coletivo Vozes Ativas', 'Atuacao voltada a educacao popular e defesa de direitos humanos das mulheres.', 'Educacao', '(19) 3622-1002', 'contato@vozesativas.org', 'Av. Brasil, 450', 'Sao Joao da Boa Vista', 'coletivos/vozes.jpg', 1, 2, 2),
(3, 'Coletivo Semear Cidadania', 'Promove capacitacao profissional e geracao de renda para mulheres.', 'Trabalho e Rend', '(19) 3622-1003', 'contato@semearcidadania.org', 'Rua Sao Paulo, 78', 'Sao Joao da Boa Vista', 'coletivos/semear.jpg', 1, 3, 3),
(4, 'Coletivo Amparo Jurídico', 'Orientacao e encaminhamento juridico gratuito para mulheres em situacao de violencia.', 'Assistencia Jur', '(19) 3622-1004', 'contato@amparojuridico.org', 'Rua XV de Novembro, 300', 'Sao Joao da Boa Vista', 'coletivos/amparo.jpg', 1, 1, 1),
(5, 'Coletivo Arte e Resistência', 'Utiliza expressoes artisticas e culturais como ferramenta de empoderamento feminino.', 'Cultura', '(19) 3622-1005', 'contato@arteresistencia.org', 'Praca Central, 55', 'Sao Joao da Boa Vista', 'coletivos/arte.jpg', 1, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contatosemergencia`
--

CREATE TABLE `contatosemergencia` (
  `CoE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CoE_Nome` varchar(100) DEFAULT NULL,
  `CoE_Telefone` varchar(14) DEFAULT NULL,
  `CoE_Tipo` varchar(20) DEFAULT NULL,
  `fk_Administradoras_Adm_ID` int(11) DEFAULT NULL,
  `fk_Administradoras_fk_Usuarios_Usu_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contatosemergencia`
--

INSERT INTO `contatosemergencia` (`CoE_ID`, `CoE_Nome`, `CoE_Telefone`, `CoE_Tipo`, `fk_Administradoras_Adm_ID`, `fk_Administradoras_fk_Usuarios_Usu_ID`) VALUES
(1, 'Delegacia da Mulher - Sao Joao da Boa Vista', '(19) 3623-4500', 'Delegacia', 1, 1),
(2, 'CRAS Regiao Central', '(19) 3623-4550', 'Assistencia Social', 2, 2),
(3, 'CREAS Municipal', '(19) 3623-4600', 'Assistencia Social', 3, 3),
(4, 'Central de Atendimento a Mulher (180)', '180', 'Disque Denuncia', 1, 1),
(5, 'Hospital Municipal - Pronto Socorro', '(19) 3623-4700', 'Saude', 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `Eve_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Eve_Titulo` varchar(100) DEFAULT NULL,
  `Eve_Descricao` varchar(250) DEFAULT NULL,
  `Eve_Data` datetime DEFAULT NULL,
  `Eve_Local` varchar(120) DEFAULT NULL,
  `Eve_Modalidade` enum('Presencial','Online','Híbrido') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `eventos`
--

INSERT INTO `eventos` (`Eve_ID`, `Eve_Titulo`, `Eve_Descricao`, `Eve_Data`, `Eve_Local`, `Eve_Modalidade`) VALUES
(1, 'Roda de Conversa: Autoconhecimento e Autoestima', 'Encontro para discussao sobre autoestima e fortalecimento pessoal feminino.', '2026-08-15 14:00:00', 'Centro Comunitario Central', 'Presencial'),
(2, 'Oficina de Direitos da Mulher', 'Oficina explicativa sobre direitos legais e canais de denuncia.', '2026-08-22 09:00:00', 'Auditorio da Prefeitura', 'Presencial'),
(3, 'Live: Saude Mental Feminina', 'Transmissao ao vivo com psicologas convidadas sobre saude mental.', '2026-09-05 19:00:00', 'Plataforma Online', 'Online'),
(4, 'Feira de Empreendedorismo Feminino', 'Exposicao e venda de produtos de empreendedoras locais.', '2026-09-18 10:00:00', 'Praca Central', 'Presencial'),
(5, 'Ciclo de Debates: Arte como Resistencia', 'Serie de debates hibridos sobre arte, cultura e empoderamento.', '2026-10-02 16:00:00', 'Centro Cultural / Transmissao Online', 'Híbrido');

-- --------------------------------------------------------

--
-- Estrutura para tabela `liderancas`
--

CREATE TABLE `liderancas` (
  `Lid_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Lid_Nome` varchar(100) DEFAULT NULL,
  `Lid_Telefone` varchar(14) DEFAULT NULL,
  `fk_Usuarios_Usu_ID` int(11) NOT NULL,
  `fk_Coletivos_Col_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `liderancas`
--

INSERT INTO `liderancas` (`Lid_ID`, `Lid_Nome`, `Lid_Telefone`, `fk_Usuarios_Usu_ID`, `fk_Coletivos_Col_ID`) VALUES
(1, 'Camila Andrade Souza', '(19) 99111-200', 4, 1),
(2, 'Fernanda Lima Rocha', '(19) 99111-200', 5, 2),
(3, 'Beatriz Nogueira Costa', '(19) 99111-200', 6, 3),
(4, 'Patricia Menezes Alves', '(19) 99111-200', 7, 4),
(5, 'Gabriela Ferraz Duarte', '(19) 99111-200', 8, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `organiza`
--

CREATE TABLE `organiza` (
  `fk_Coletivos_Col_ID` int(11) DEFAULT NULL,
  `fk_Eventos_Eve_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `organiza`
--

INSERT INTO `organiza` (`fk_Coletivos_Col_ID`, `fk_Eventos_Eve_ID`) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 4),
(4, 2),
(5, 5),
(2, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `Usu_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Usu_Email` varchar(80) DEFAULT NULL,
  `Usu_Senha` varchar(30) DEFAULT NULL,
  `Usu_Criado_Em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`Usu_ID`, `Usu_Email`, `Usu_Senha`, `Usu_Criado_Em`) VALUES
(1, 'admin.rosana@florescer.org', 'senha_hash_01', '2025-02-10 09:15:00'),
(2, 'admin.marcia@florescer.org', 'senha_hash_02', '2025-02-11 10:30:00'),
(3, 'admin.juliana@florescer.org', 'senha_hash_03', '2025-02-12 14:00:00'),
(4, 'lideranca.camila@coletivo1.org', 'senha_hash_04', '2025-03-01 08:20:00'),
(5, 'lideranca.fernanda@coletivo2.org', 'senha_hash_05', '2025-03-02 08:45:00'),
(6, 'lideranca.beatriz@coletivo3.org', 'senha_hash_06', '2025-03-03 09:10:00'),
(7, 'lideranca.patricia@coletivo4.org', 'senha_hash_07', '2025-03-04 09:40:00'),
(8, 'lideranca.gabriela@coletivo5.org', 'senha_hash_08', '2025-03-05 11:05:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administradoras`
--
ALTER TABLE `administradoras`
  ADD PRIMARY KEY (`Adm_ID`,`fk_Usuarios_Usu_ID`),
  ADD KEY `FK_Administradoras_2` (`fk_Usuarios_Usu_ID`);

--
-- Índices de tabela `coletivos`
--
ALTER TABLE `coletivos`
  ADD PRIMARY KEY (`Col_ID`),
  ADD KEY `FK_Coletivos_2` (`fk_Administradoras_Adm_ID`,`fk_Administradoras_fk_Usuarios_Usu_ID`);

--
-- Índices de tabela `contatosemergencia`
--
ALTER TABLE `contatosemergencia`
  ADD PRIMARY KEY (`CoE_ID`),
  ADD KEY `FK_ContatosEmergencia_2` (`fk_Administradoras_Adm_ID`,`fk_Administradoras_fk_Usuarios_Usu_ID`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`Eve_ID`);

--
-- Índices de tabela `liderancas`
--
ALTER TABLE `liderancas`
  ADD PRIMARY KEY (`Lid_ID`,`fk_Usuarios_Usu_ID`),
  ADD KEY `FK_Liderancas_2` (`fk_Usuarios_Usu_ID`),
  ADD KEY `FK_Liderancas_3` (`fk_Coletivos_Col_ID`);

--
-- Índices de tabela `organiza`
--
ALTER TABLE `organiza`
  ADD KEY `FK_Organiza_1` (`fk_Coletivos_Col_ID`),
  ADD KEY `FK_Organiza_2` (`fk_Eventos_Eve_ID`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Usu_ID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Usu_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `administradoras`
--
ALTER TABLE `administradoras`
  ADD CONSTRAINT `FK_Administradoras_2` FOREIGN KEY (`fk_Usuarios_Usu_ID`) REFERENCES `usuarios` (`Usu_ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `coletivos`
--
ALTER TABLE `coletivos`
  ADD CONSTRAINT `FK_Coletivos_2` FOREIGN KEY (`fk_Administradoras_Adm_ID`,`fk_Administradoras_fk_Usuarios_Usu_ID`) REFERENCES `administradoras` (`Adm_ID`, `fk_Usuarios_Usu_ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contatosemergencia`
--
ALTER TABLE `contatosemergencia`
  ADD CONSTRAINT `FK_ContatosEmergencia_2` FOREIGN KEY (`fk_Administradoras_Adm_ID`,`fk_Administradoras_fk_Usuarios_Usu_ID`) REFERENCES `administradoras` (`Adm_ID`, `fk_Usuarios_Usu_ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `liderancas`
--
ALTER TABLE `liderancas`
  ADD CONSTRAINT `FK_Liderancas_2` FOREIGN KEY (`fk_Usuarios_Usu_ID`) REFERENCES `usuarios` (`Usu_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Liderancas_3` FOREIGN KEY (`fk_Coletivos_Col_ID`) REFERENCES `coletivos` (`Col_ID`);

--
-- Restrições para tabelas `organiza`
--
ALTER TABLE `organiza`
  ADD CONSTRAINT `FK_Organiza_1` FOREIGN KEY (`fk_Coletivos_Col_ID`) REFERENCES `coletivos` (`Col_ID`),
  ADD CONSTRAINT `FK_Organiza_2` FOREIGN KEY (`fk_Eventos_Eve_ID`) REFERENCES `eventos` (`Eve_ID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
