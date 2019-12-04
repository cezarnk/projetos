-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.41-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para clinica
CREATE DATABASE IF NOT EXISTS `clinica` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `clinica`;

-- Copiando estrutura para tabela clinica.medicamentos
CREATE TABLE IF NOT EXISTS `medicamentos` (
  `codigo_medicamento` int(10) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL DEFAULT '0',
  `aplicacao` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.medicamentos: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` (`codigo_medicamento`, `descricao`, `aplicacao`) VALUES
	(1, 'Pantoprazol', 'comprimido'),
	(2, 'Imosec', 'comprimido'),
	(3, 'Benzetacil', 'injeção'),
	(4, 'Doralgina', 'gotas'),
	(5, 'Dorflex', 'Comprimido'),
	(6, 'Gardenal', 'Injeção'),
	(7, 'Dorflex', 'Comprimido');
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `codigo_paciente` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT '0',
  `convenio` varchar(50) DEFAULT '0',
  `datanasc` varchar(50) DEFAULT '0',
  `telefone` varchar(50) DEFAULT '0',
  `endereco` varchar(50) DEFAULT '0',
  PRIMARY KEY (`codigo_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.pacientes: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`codigo_paciente`, `nome`, `convenio`, `datanasc`, `telefone`, `endereco`) VALUES
	(1, 'Cezar', 'Cassi', '14/10/1988', '11-95070-0235', 'Rua São Bento, 236, SP'),
	(2, 'Julia', 'Cassi', '10/04/1993', NULL, 'Rua Alfredo Pujol, 345'),
	(3, 'Amanda', 'Amil', '12/02/1980', NULL, 'Centro, 123'),
	(4, 'Amanda', 'a', 'b', NULL, 'c'),
	(5, NULL, NULL, NULL, NULL, NULL),
	(6, 'Cassio', 'Amil', '09/08/1987', '(11) 2236-9908', 'Pça do Correio, 34'),
	(7, NULL, NULL, NULL, NULL, NULL),
	(8, 'Cassio', 'Amil', '10/04/1993', '1122369908', ''),
	(9, NULL, NULL, NULL, NULL, NULL),
	(10, '', '', '', '', ''),
	(11, 'Cassio', 'Cassi', '10/04/1993', '1122369908', ''),
	(12, 'Amilca', 'Amil', '10/06/1970', '11 - 2246-7645', 'Rua São Bento, 56'),
	(13, 'Leticia', 'Cassi', '14/09/1989', '11-2235-1245', 'Rua Treze, 45');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.register
CREATE TABLE IF NOT EXISTS `register` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sex` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.register: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` (`id`, `name`, `password`, `email`, `sex`, `country`) VALUES
	(17, 'arun', 'kumar', 'arun@gmail.com', 'Male', 'India'),
	(19, 'sonoo', 'jaiswal', 'sonoo@javatpoint.com', 'male', 'India'),
	(20, 'Ashok', 'ashok', 'ashok@javatpoint.com', 'male', 'India');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.tratamentos
CREATE TABLE IF NOT EXISTS `tratamentos` (
  `codigo_tratamento` int(10) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT '0',
  `amb` varchar(50) DEFAULT '0',
  `preco` varchar(50) DEFAULT '0',
  PRIMARY KEY (`codigo_tratamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.tratamentos: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `tratamentos` DISABLE KEYS */;
INSERT INTO `tratamentos` (`codigo_tratamento`, `descricao`, `amb`, `preco`) VALUES
	(1, 'Teste e adaptação', '50010140', '149.9'),
	(2, 'Amputação bilateral', '25060023', '180'),
	(3, 'Sessão nutricionista', '10910', '69.9'),
	(4, 'Atendimento fisiátrico', '25040030', '89.9'),
	(5, NULL, NULL, NULL),
	(6, NULL, NULL, NULL),
	(7, NULL, NULL, NULL),
	(8, 'Fisioterapia', '500090987', '199,90'),
	(9, 'Terapia Ocupacional', '2225607042', '150,99'),
	(10, 'Fisioterapia', '500090987', '199,90');
/*!40000 ALTER TABLE `tratamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT '0',
  `login` varchar(50) DEFAULT '0',
  `senha` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.usuario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nome`, `login`, `senha`) VALUES
	(1, 'Cezar', 'cezar', 'root'),
	(2, 'Marco', 'marco', 'root'),
	(3, 'Julia', 'julia', 'root'),
	(4, 'João', 'joao', '1234'),
	(5, 'Leticia', 'leticia', '1234');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
