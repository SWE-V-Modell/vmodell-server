-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.1.37-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für swe
CREATE DATABASE IF NOT EXISTS `swe` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `swe`;

-- Exportiere Struktur von Tabelle swe.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `E_Mail` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Password` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle swe.dozent
CREATE TABLE IF NOT EXISTS `dozent` (
  `Id` int(55) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `E_Mail` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Password` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle swe.gruppe
CREATE TABLE IF NOT EXISTS `gruppe` (
  `Id` int(55) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle swe.modul
CREATE TABLE IF NOT EXISTS `modul` (
  `Id` int(55) NOT NULL AUTO_INCREMENT,
  `Dozent` int(55) NOT NULL,
  `Beschreibung` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle swe.student
CREATE TABLE IF NOT EXISTS `student` (
  `Id` int(55) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `E_Mail` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `gruppe` int(55) NOT NULL,
  `Password` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle swe.veranstalter
CREATE TABLE IF NOT EXISTS `veranstalter` (
  `Id` int(55) NOT NULL AUTO_INCREMENT,
  `Modul` int(55) NOT NULL,
  `Datum` date NOT NULL,
  `Zeit_von` datetime NOT NULL,
  `Zeit_bis` datetime NOT NULL,
  `Anmerkung` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von Tabelle swe.veranstaltungsgruppen
CREATE TABLE IF NOT EXISTS `veranstaltungsgruppen` (
  `Id` int(55) NOT NULL AUTO_INCREMENT,
  `Gruppe` int(55) NOT NULL,
  `Veranstaltung` int(55) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
