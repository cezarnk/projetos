-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.21-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para execead
CREATE DATABASE IF NOT EXISTS `execead` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `execead`;

-- Copiando estrutura para tabela execead.classificacao
CREATE TABLE IF NOT EXISTS `classificacao` (
  `idTme` int(11) NOT NULL AUTO_INCREMENT,
  `pontos` int(11) NOT NULL,
  `jogos` int(11) DEFAULT NULL,
  `vitorias` int(11) DEFAULT NULL,
  `empates` int(11) DEFAULT NULL,
  `derrotas` int(11) DEFAULT NULL,
  `golsPro` int(11) DEFAULT NULL,
  `golsContra` int(11) DEFAULT NULL,
  `codTime` int(11) NOT NULL,
  PRIMARY KEY (`idTme`,`codTime`),
  KEY `fk_CLASSIFICACAO_TIME_idx` (`codTime`),
  CONSTRAINT `fk_CLASSIFICACAO_TIME` FOREIGN KEY (`codTime`) REFERENCES `time` (`codTime`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela execead.classificacao: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `classificacao` DISABLE KEYS */;
INSERT INTO `classificacao` (`idTme`, `pontos`, `jogos`, `vitorias`, `empates`, `derrotas`, `golsPro`, `golsContra`, `codTime`) VALUES
	(1, 6, 2, 2, 0, 0, 6, 3, 2),
	(2, 3, 2, 1, 0, 1, 2, 2, 4),
	(3, 1, 2, 0, 1, 1, 2, 3, 3),
	(4, 0, 2, 0, 0, 2, 1, 4, 5),
	(5, 3, 2, 1, 0, 1, 4, 3, 7),
	(6, 6, 2, 2, 0, 0, 4, 2, 8),
	(7, 3, 2, 1, 0, 1, 3, 3, 13);
/*!40000 ALTER TABLE `classificacao` ENABLE KEYS */;

-- Copiando estrutura para tabela execead.estadio
CREATE TABLE IF NOT EXISTS `estadio` (
  `codEstadio` int(11) NOT NULL,
  `nomeEstadio` varchar(45) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `siglaUF` varchar(2) NOT NULL,
  PRIMARY KEY (`codEstadio`,`siglaUF`),
  KEY `fk_ESTADIO_UF1_idx` (`siglaUF`),
  CONSTRAINT `fk_ESTADIO_UF1` FOREIGN KEY (`siglaUF`) REFERENCES `uf` (`siglaUF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela execead.estadio: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `estadio` DISABLE KEYS */;
INSERT INTO `estadio` (`codEstadio`, `nomeEstadio`, `Cidade`, `siglaUF`) VALUES
	(1, 'Vila Belmiro', 'Santos', 'SP'),
	(2, 'Morumbi', 'São Paulo', 'SP'),
	(3, 'Pacaembu', 'São Paulo', 'SP'),
	(4, 'Allianz Park', 'São Paulo', 'SP'),
	(5, 'Maracanã', 'Rio de Janeiro', 'RJ'),
	(6, 'São Jenuário', 'Rio de Janeiro', 'RJ'),
	(7, 'Beira Rio', 'Rio Grande do Sul', 'RS'),
	(8, 'Mineirão', 'Minas Gerais', 'MG'),
	(9, 'Fonte Nova', 'Salvador', 'BA'),
	(9, 'Olímpico', 'Rio Grande do Sul', 'RS');
/*!40000 ALTER TABLE `estadio` ENABLE KEYS */;

-- Copiando estrutura para tabela execead.jogos
CREATE TABLE IF NOT EXISTS `jogos` (
  `numJogo` int(11) NOT NULL AUTO_INCREMENT,
  `rodada` int(11) DEFAULT NULL,
  `diaJogo` date DEFAULT NULL,
  `codTimeVisitante` int(11) DEFAULT NULL,
  `placarTimeCasa` int(11) DEFAULT NULL,
  `placarTimeVisitante` int(11) DEFAULT NULL,
  `codTime` int(11) NOT NULL,
  `codEstadio` int(11) NOT NULL,
  PRIMARY KEY (`numJogo`,`codTime`,`codEstadio`),
  KEY `fk_JOGOS_TIME1_idx` (`codTime`),
  KEY `fk_JOGOS_ESTADIO1_idx` (`codEstadio`),
  CONSTRAINT `fk_JOGOS_ESTADIO1` FOREIGN KEY (`codEstadio`) REFERENCES `estadio` (`codEstadio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_JOGOS_TIME1` FOREIGN KEY (`codTime`) REFERENCES `time` (`codTime`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela execead.jogos: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `jogos` DISABLE KEYS */;
INSERT INTO `jogos` (`numJogo`, `rodada`, `diaJogo`, `codTimeVisitante`, `placarTimeCasa`, `placarTimeVisitante`, `codTime`, `codEstadio`) VALUES
	(1, 1, '2018-07-03', 7, 3, 2, 2, 1),
	(2, 1, '2018-07-03', 3, 1, 0, 4, 2),
	(3, 1, '2018-07-04', 5, 2, 1, 8, 7),
	(4, 1, '2018-07-04', 9, 1, 1, 10, 8),
	(5, 2, '2018-07-07', 12, 3, 1, 2, 9),
	(6, 2, '2018-07-07', 11, 2, 2, 3, 5),
	(7, 2, '2018-07-08', 8, 1, 2, 4, 2),
	(8, 2, '2018-07-08', 5, 2, 0, 7, 4),
	(9, 1, '2018-07-11', 13, 1, 3, 12, 3),
	(10, 2, '2018-07-14', 10, 0, 2, 13, 3),
	(11, 2, '2018-07-14', 13, 1, 2, 3, 2),
	(13, 2, '2018-07-18', 13, 3, 0, 2, 1),
	(14, 2, '2018-07-18', 9, 1, 0, 13, 1),
	(15, 2, '2018-07-18', 4, 2, 0, 13, 2),
	(16, 2, '2018-07-18', 11, 1, 2, 13, 5),
	(17, 2, '2018-07-18', 2, 0, 3, 13, 1),
	(18, 2, '2018-07-18', 8, 0, 1, 13, 1);
/*!40000 ALTER TABLE `jogos` ENABLE KEYS */;

-- Copiando estrutura para tabela execead.time
CREATE TABLE IF NOT EXISTS `time` (
  `codTime` int(11) NOT NULL AUTO_INCREMENT,
  `nomeTime` varchar(45) DEFAULT NULL,
  `siglaUF` varchar(2) NOT NULL,
  PRIMARY KEY (`codTime`,`siglaUF`),
  KEY `fk_TIME_UF1_idx` (`siglaUF`),
  CONSTRAINT `fk_TIME_UF1` FOREIGN KEY (`siglaUF`) REFERENCES `uf` (`siglaUF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela execead.time: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` (`codTime`, `nomeTime`, `siglaUF`) VALUES
	(2, 'Santos', 'SP'),
	(3, 'Corinthians', 'SP'),
	(4, 'São Paulo', 'SP'),
	(5, 'Palmeiras', 'SP'),
	(7, 'Vasco da Gama', 'RJ'),
	(8, 'Internacional', 'RS'),
	(9, 'Atlético-MG', 'MG'),
	(10, 'Grêmio', 'RS'),
	(11, 'Botafogo', 'RJ'),
	(12, 'Bahia', 'BA'),
	(13, 'Pirapora', 'SP');
/*!40000 ALTER TABLE `time` ENABLE KEYS */;

-- Copiando estrutura para tabela execead.uf
CREATE TABLE IF NOT EXISTS `uf` (
  `siglaUF` varchar(2) NOT NULL,
  `nomeUF` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`siglaUF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela execead.uf: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
INSERT INTO `uf` (`siglaUF`, `nomeUF`) VALUES
	('BA', 'Bahia'),
	('MG', 'Minas Gerais'),
	('RJ', 'Rio de Janeiro'),
	('RS', 'Rio Grande do Sul'),
	('SP', 'São Paulo');
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
