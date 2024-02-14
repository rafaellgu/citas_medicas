-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para citas_2826502
DROP DATABASE IF EXISTS `citas_2826502`;
CREATE DATABASE IF NOT EXISTS `citas_2826502` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `citas_2826502`;

-- Volcando estructura para tabla citas_2826502.cita
DROP TABLE IF EXISTS `cita`;
CREATE TABLE IF NOT EXISTS `cita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `hora` time NOT NULL DEFAULT current_timestamp(),
  `consutorio` int(11) NOT NULL DEFAULT 0,
  `doctor_id` int(11) DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cita_medicos` (`doctor_id`),
  KEY `FK_cita_pacinetes` (`paciente_id`),
  CONSTRAINT `FK_cita_medicos` FOREIGN KEY (`doctor_id`) REFERENCES `medicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cita_pacinetes` FOREIGN KEY (`paciente_id`) REFERENCES `pacinetes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla citas_2826502.cita: ~2 rows (aproximadamente)
DELETE FROM `cita`;
INSERT INTO `cita` (`id`, `fecha`, `hora`, `consutorio`, `doctor_id`, `paciente_id`) VALUES
	(1, '2024-02-14', '17:38:23', 1, NULL, NULL),
	(2, '2024-01-14', '17:38:36', 2, NULL, NULL);

-- Volcando estructura para tabla citas_2826502.medicos
DROP TABLE IF EXISTS `medicos`;
CREATE TABLE IF NOT EXISTS `medicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `especialidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla citas_2826502.medicos: ~2 rows (aproximadamente)
DELETE FROM `medicos`;
INSERT INTO `medicos` (`id`, `nombres`, `especialidad`) VALUES
	(1, 'Gustavo', 'Pedriatria'),
	(2, 'Camila', 'Oncologia');

-- Volcando estructura para tabla citas_2826502.pacinetes
DROP TABLE IF EXISTS `pacinetes`;
CREATE TABLE IF NOT EXISTS `pacinetes` (
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `n_documento` bigint(20) NOT NULL DEFAULT 0,
  `celular` bigint(20) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla citas_2826502.pacinetes: ~2 rows (aproximadamente)
DELETE FROM `pacinetes`;
INSERT INTO `pacinetes` (`nombre`, `apellidos`, `n_documento`, `celular`, `id`) VALUES
	('Cristian', 'Buitrago', 1000379, 310409, 1),
	('Rafael', 'Lugo', 1000321, 30456, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
