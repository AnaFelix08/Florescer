

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET NAMES utf8mb4;

DROP DATABASE IF EXISTS florescer;
CREATE DATABASE florescer;
USE florescer;


CREATE TABLE `usuarios` (
  `Usu_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Usu_Email` varchar(80) DEFAULT NULL,
  `Usu_Senha` varchar(30) DEFAULT NULL,
  `Usu_Criado_Em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuarios` (`Usu_ID`, `Usu_Email`, `Usu_Senha`, `Usu_Criado_Em`) VALUES
(1, 'admin.rosana@florescer.org', 'senha_hash_01', '2025-02-10 09:15:00'),
(2, 'admin.marcia@florescer.org', 'senha_hash_02', '2025-02-11 10:30:00'),
(3, 'admin.juliana@florescer.org', 'senha_hash_03', '2025-02-12 14:00:00'),
(4, 'lideranca.camila@coletivo1.org', 'senha_hash_04', '2025-03-01 08:20:00'),
(5, 'lideranca.fernanda@coletivo2.org', 'senha_hash_05', '2025-03-02 08:45:00'),
(6, 'lideranca.beatriz@coletivo3.org', 'senha_hash_06', '2025-03-03 09:10:00'),
(7, 'lideranca.patricia@coletivo4.org', 'senha_hash_07', '2025-03-04 09:40:00'),
(8, 'lideranca.gabriela@coletivo5.org', 'senha_hash_08', '2025-03-05 11:05:00');

ALTER TABLE `usuarios` AUTO_INCREMENT = 9;


CREATE TABLE `administradoras` (
  `Adm_Nivel_Acesso` int(11) DEFAULT NULL,
  `Adm_ID` int(11) NOT NULL,
  `fk_Usuarios_Usu_ID` int(11) NOT NULL,
  PRIMARY KEY (`Adm_ID`, `fk_Usuarios_Usu_ID`),
  KEY `FK_Administradoras_2` (`fk_Usuarios_Usu_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `administradoras` (`Adm_Nivel_Acesso`, `Adm_ID`, `fk_Usuarios_Usu_ID`) VALUES
(3, 1, 1),
(2, 2, 2),
(2, 3, 3);

CREATE TABLE `coletivos` (
  `Col_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
  `fk_Administradoras_fk_Usuarios_Usu_ID` int(11) DEFAULT NULL,
  KEY `FK_Coletivos_2` (`fk_Administradoras_Adm_ID`, `fk_Administradoras_fk_Usuarios_Usu_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `coletivos` (`Col_ID`, `Col_Nome`, `Col_Descricao`, `Col_Are_Atuacao`, `Col_Telefone`, `Col_Email`, `Col_Endereco`, `Col_Cidade`, `Col_Foto`, `Col_Status`, `fk_Administradoras_Adm_ID`, `fk_Administradoras_fk_Usuarios_Usu_ID`) VALUES
(1, 'Coletivo Raízes Femininas', 'Grupo dedicado ao acolhimento e apoio psicossocial de mulheres em situacao de vulnerabilidade.', 'Assistencia Soc', '(19) 3622-1001', 'contato@raizesfemininas.org', 'Rua das Flores, 120', 'Sao Joao da Boa Vista', 'coletivos/raizes.jpg', 1, 1, 1),
(2, 'Coletivo Vozes Ativas', 'Atuacao voltada a educacao popular e defesa de direitos humanos das mulheres.', 'Educacao', '(19) 3622-1002', 'contato@vozesativas.org', 'Av. Brasil, 450', 'Sao Joao da Boa Vista', 'coletivos/vozes.jpg', 1, 2, 2),
(3, 'Coletivo Semear Cidadania', 'Promove capacitacao profissional e geracao de renda para mulheres.', 'Trabalho e Rend', '(19) 3622-1003', 'contato@semearcidadania.org', 'Rua Sao Paulo, 78', 'Sao Joao da Boa Vista', 'coletivos/semear.jpg', 1, 3, 3),
(4, 'Coletivo Amparo Jurídico', 'Orientacao e encaminhamento juridico gratuito para mulheres em situacao de violencia.', 'Assistencia Jur', '(19) 3622-1004', 'contato@amparojuridico.org', 'Rua XV de Novembro, 300', 'Sao Joao da Boa Vista', 'coletivos/amparo.jpg', 1, 1, 1),
(5, 'Coletivo Arte e Resistência', 'Utiliza expressoes artisticas e culturais como ferramenta de empoderamento feminino.', 'Cultura', '(19) 3622-1005', 'contato@arteresistencia.org', 'Praca Central, 55', 'Sao Joao da Boa Vista', 'coletivos/arte.jpg', 1, 2, 2);


CREATE TABLE `contatosemergencia` (
  `CoE_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `CoE_Nome` varchar(100) DEFAULT NULL,
  `CoE_Telefone` varchar(14) DEFAULT NULL,
  `CoE_Tipo` varchar(20) DEFAULT NULL,
  `fk_Administradoras_Adm_ID` int(11) DEFAULT NULL,
  `fk_Administradoras_fk_Usuarios_Usu_ID` int(11) DEFAULT NULL,
  KEY `FK_ContatosEmergencia_2` (`fk_Administradoras_Adm_ID`, `fk_Administradoras_fk_Usuarios_Usu_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `contatosemergencia` (`CoE_ID`, `CoE_Nome`, `CoE_Telefone`, `CoE_Tipo`, `fk_Administradoras_Adm_ID`, `fk_Administradoras_fk_Usuarios_Usu_ID`) VALUES
(1, 'Delegacia da Mulher - Sao Joao da Boa Vista', '(19) 3623-4500', 'Delegacia', 1, 1),
(2, 'CRAS Regiao Central', '(19) 3623-4550', 'Assistencia Social', 2, 2),
(3, 'CREAS Municipal', '(19) 3623-4600', 'Assistencia Social', 3, 3),
(4, 'Central de Atendimento a Mulher (180)', '180', 'Disque Denuncia', 1, 1),
(5, 'Hospital Municipal - Pronto Socorro', '(19) 3623-4700', 'Saude', 2, 2);


CREATE TABLE `eventos` (
  `Eve_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Eve_Titulo` varchar(100) DEFAULT NULL,
  `Eve_Descricao` varchar(250) DEFAULT NULL,
  `Eve_Data` datetime DEFAULT NULL,
  `Eve_Local` varchar(120) DEFAULT NULL,
  `Eve_Modalidade` enum('Presencial','Online','Híbrido') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `eventos` (`Eve_ID`, `Eve_Titulo`, `Eve_Descricao`, `Eve_Data`, `Eve_Local`, `Eve_Modalidade`) VALUES
(1, 'Roda de Conversa: Autoconhecimento e Autoestima', 'Encontro para discussao sobre autoestima e fortalecimento pessoal feminino.', '2026-08-15 14:00:00', 'Centro Comunitario Central', 'Presencial'),
(2, 'Oficina de Direitos da Mulher', 'Oficina explicativa sobre direitos legais e canais de denuncia.', '2026-08-22 09:00:00', 'Auditorio da Prefeitura', 'Presencial'),
(3, 'Live: Saude Mental Feminina', 'Transmissao ao vivo com psicologas convidadas sobre saude mental.', '2026-09-05 19:00:00', 'Plataforma Online', 'Online'),
(4, 'Feira de Empreendedorismo Feminino', 'Exposicao e venda de produtos de empreendedoras locais.', '2026-09-18 10:00:00', 'Praca Central', 'Presencial'),
(5, 'Ciclo de Debates: Arte como Resistencia', 'Serie de debates hibridos sobre arte, cultura e empoderamento.', '2026-10-02 16:00:00', 'Centro Cultural / Transmissao Online', 'Híbrido');


CREATE TABLE `liderancas` (
  `Lid_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Lid_Nome` varchar(100) DEFAULT NULL,
  `Lid_Telefone` varchar(14) DEFAULT NULL,
  `fk_Usuarios_Usu_ID` int(11) NOT NULL,
  `fk_Coletivos_Col_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Lid_ID`, `fk_Usuarios_Usu_ID`),
  KEY `FK_Liderancas_2` (`fk_Usuarios_Usu_ID`),
  KEY `FK_Liderancas_3` (`fk_Coletivos_Col_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `liderancas` (`Lid_ID`, `Lid_Nome`, `Lid_Telefone`, `fk_Usuarios_Usu_ID`, `fk_Coletivos_Col_ID`) VALUES
(1, 'Camila Andrade Souza', '(19) 99111-2001', 4, 1),
(2, 'Fernanda Lima Rocha', '(19) 99111-2002', 5, 2),
(3, 'Beatriz Nogueira Costa', '(19) 99111-2003', 6, 3),
(4, 'Patricia Menezes Alves', '(19) 99111-2004', 7, 4),
(5, 'Gabriela Ferraz Duarte', '(19) 99111-2005', 8, 5);


CREATE TABLE `organiza` (
  `fk_Coletivos_Col_ID` int(11) DEFAULT NULL,
  `fk_Eventos_Eve_ID` int(11) DEFAULT NULL,
  KEY `FK_Organiza_1` (`fk_Coletivos_Col_ID`),
  KEY `FK_Organiza_2` (`fk_Eventos_Eve_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `organiza` (`fk_Coletivos_Col_ID`, `fk_Eventos_Eve_ID`) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 4),
(4, 2),
(5, 5),
(2, 5);


ALTER TABLE `administradoras`
  ADD CONSTRAINT `FK_Administradoras_2` FOREIGN KEY (`fk_Usuarios_Usu_ID`)
  REFERENCES `usuarios` (`Usu_ID`) ON DELETE CASCADE;

ALTER TABLE `coletivos`
  ADD CONSTRAINT `FK_Coletivos_2` FOREIGN KEY (`fk_Administradoras_Adm_ID`, `fk_Administradoras_fk_Usuarios_Usu_ID`)
  REFERENCES `administradoras` (`Adm_ID`, `fk_Usuarios_Usu_ID`) ON DELETE CASCADE;

ALTER TABLE `contatosemergencia`
  ADD CONSTRAINT `FK_ContatosEmergencia_2` FOREIGN KEY (`fk_Administradoras_Adm_ID`, `fk_Administradoras_fk_Usuarios_Usu_ID`)
  REFERENCES `administradoras` (`Adm_ID`, `fk_Usuarios_Usu_ID`) ON DELETE CASCADE;

ALTER TABLE `liderancas`
  ADD CONSTRAINT `FK_Liderancas_2` FOREIGN KEY (`fk_Usuarios_Usu_ID`)
  REFERENCES `usuarios` (`Usu_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Liderancas_3` FOREIGN KEY (`fk_Coletivos_Col_ID`)
  REFERENCES `coletivos` (`Col_ID`) ON DELETE RESTRICT;

ALTER TABLE `organiza`
  ADD CONSTRAINT `FK_Organiza_1` FOREIGN KEY (`fk_Coletivos_Col_ID`)
  REFERENCES `coletivos` (`Col_ID`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_Organiza_2` FOREIGN KEY (`fk_Eventos_Eve_ID`)
  REFERENCES `eventos` (`Eve_ID`) ON DELETE SET NULL;

COMMIT;