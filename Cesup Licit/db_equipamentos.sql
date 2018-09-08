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


-- Copiando estrutura do banco de dados para bd_equipamentos
CREATE DATABASE IF NOT EXISTS `bd_equipamentos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_equipamentos`;

-- Copiando estrutura para tabela bd_equipamentos.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_equipamentos.categorias: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id`, `nome`) VALUES
	(1, 'Bracos'),
	(2, 'Pernas'),
	(3, 'Peito'),
	(4, 'Costas'),
	(5, 'Ombros'),
	(7, 'Acessorio'),
	(8, 'Residencial\r\n'),
	(9, 'Bancos Livres');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_equipamentos.linhas
CREATE TABLE IF NOT EXISTS `linhas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_equipamentos.linhas: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `linhas` DISABLE KEYS */;
INSERT INTO `linhas` (`id`, `nome`) VALUES
	(2, 'Acessorios'),
	(3, 'Cardiovascular'),
	(4, 'Multi Estacoes / Condominios'),
	(5, 'Cross Training / Funcional'),
	(6, 'Free Weight'),
	(7, 'Stratos'),
	(8, 'New Exata'),
	(9, 'Fusion\r\n');
/*!40000 ALTER TABLE `linhas` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_equipamentos.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  `linha_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `linha_id` (`linha_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_equipamentos.produtos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`id`, `codigo`, `nome`, `categoria_id`, `linha_id`) VALUES
	(2, 'RA003', 'Extensora Carga Lateral', 2, 8),
	(3, 'RA004', 'Extensora/Flexora Sentada Dupla Unica Carga', 2, 8),
	(4, 'RA005', 'Flexora Sentada', 2, 8),
	(12, 'RA032D', 'Leg Press Horizontal Deitado', 2, 8),
	(18, 'RB006', 'Pulley com Remada', 9, 4),
	(19, 'RB010', 'Remada Sentada', 4, 8),
	(20, 'RB004', 'Remada Baixa Carga Lateral', 4, 8),
	(21, 'RC011S', 'Supino Sentado Vertical', 3, 8),
	(22, 'RC011', 'Banco supino reto/inclinado e press de ombro', 3, 8),
	(23, 'RC023', 'Pec Deck Com Reversao', 9, 7),
	(28, 'RC078', 'Cross Over Angulado C/ Smith Machine Conj.', 7, 5),
	(29, 'RD002', 'Rosca Scott', 1, 8),
	(30, 'RD006', 'Rosca Sentada Camber Curl', 9, 1),
	(31, 'RD010', 'Triceps Dip (Paralelo)', 1, 8),
	(32, 'RF013', 'Abdominal Costas', 6, 8),
	(33, 'RF014', 'Abdominal / Dorsal', 9, 8),
	(34, 'RF012', 'Abdominal Peito', 6, 8),
	(35, 'FW3080', 'Banco Reto Fixo 1.00m', 9, 6),
	(36, 'FW3081', 'Banco Reto Fixo 1.20m', 9, 6),
	(37, 'FW4003', 'Prancha Abdominal', 6, 6),
	(38, 'FW4085', 'Paralela Abdominal e Triceps', 6, 6),
	(39, 'FW4090', 'Hiperextensao Lombar 45', 7, 6),
	(44, 'BP016', 'Remada Cavalinho', 4, 6),
	(45, 'CP003', 'Supino Canadense', 3, 6),
	(46, 'CP004Q', 'Supino Reto', 3, 6),
	(47, 'CP006RC', 'Supino Reto/Incl.', 3, 6),
	(48, 'CP008Q', 'Supino Inclinado', 3, 6),
	(49, 'CP009Q', 'Supino Declinado', 3, 6),
	(50, 'CP013', 'Banco Regulavel 1.20m', 9, 6),
	(52, 'CP016', 'Banco Regulavel Declinado Reto e Inclinado 1.00m', 9, 6),
	(53, 'DP004S', 'Scott sent. -  Angulo Regulavel', 1, 6),
	(55, 'EP001', 'Banco p. Press Sentado', 5, 6),
	(56, 'RA016RF', 'Leg Press 45', 2, 6),
	(57, 'FS1020', 'Flexora Deitada', 2, 9),
	(58, 'FS1025', 'Flexora Sentada', 2, 9),
	(60, 'FS1031', 'Extensora Apoio Central', 2, 9),
	(61, 'FS1040', 'Flexora Vertical', 2, 9),
	(62, 'FS1050', 'Adutor / Abdutor', 2, 9),
	(63, 'FS1051', 'Adutor ', 2, 9),
	(64, 'FS1052', 'Abdutor', 2, 9),
	(73, 'FS2040', 'Pulley Alto', 4, 9),
	(74, 'FS2045', 'Remada Baixa', 4, 9),
	(76, 'FS2060', 'Remada c/ Apoio Peito', 4, 9);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
