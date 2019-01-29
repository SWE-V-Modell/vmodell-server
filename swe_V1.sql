-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 23. Jan 2019 um 17:52
-- Server-Version: 10.1.37-MariaDB
-- PHP-Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `swe`
--

drop database if exists swe;
create database swe DEFAULT CHARACTER SET utf8 ;

SET NAMES 'utf8';
use swe;
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `account`
--

CREATE TABLE `account` (
  `Id` int(11) NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `account`
--
SET NAMES 'utf8';
INSERT INTO `account` (`Id`, `Email`, `Password`) VALUES
(4, 'rügenberg@samanpouristcool.de', 'geheim'),
(5, 'ProfSamanpour@samanpouristrichtigcool.de', '1234geheim'),
(6, 'Dr.Ostermann@samanpouristscheiße.de', '1234'),
(7, 'lappe@istboese.de', '4321'),
(8, 'boehle@istlieb.de', '1234321'),
(9, 'lorenz@backhaus.de', 'fg23-df3sdfse3'),
(10, 'felix@maglorenz.de', 'lorenzistsuess'),
(11, 'julius@nordhues.de', 'istnichtwitzig'),
(12, 'sebastian@baeuger.com', 'IrgendeineKatze'),
(13, 'linde@baeuger.com', 'Passwort1'),
(14, 'jones@baeuger.com', '12345678');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin`
--

CREATE TABLE `admin` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `admin`
--

INSERT INTO `admin` (`Id`, `Name`, `Account`) VALUES
(1, 'Frau Lappe', 7),
(2, 'Herr Böhle', 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dozent`
--

CREATE TABLE `dozent` (
  `Id` int(55) NOT NULL,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `dozent`
--
SET NAMES 'utf8';
INSERT INTO `dozent` (`Id`, `Name`, `Account`) VALUES
(1, 'Herr Rügenberg', 4),
(2, 'Prof. Samanpour', 5),
(3, 'Dr. Ostermann', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gruppe`
--

CREATE TABLE `gruppe` (
  `Id` int(55) NOT NULL,
  `Beschreibung` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `gruppe`
--
SET NAMES 'utf8';
INSERT INTO `gruppe` (`Id`, `Beschreibung`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modul`
--

CREATE TABLE `modul` (
  `Id` int(55) NOT NULL,
  `Dozent` int(55) NOT NULL,
  `Beschreibung` varchar(255) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `modul`
--
SET NAMES 'utf8';
INSERT INTO `modul` (`Id`, `Dozent`, `Beschreibung`) VALUES
(1, 1, 'Software Engineering'),
(2, 2, 'IT-Management'),
(3, 3, 'Human Resources & Leadership');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

CREATE TABLE `student` (
  `Id` int(55) NOT NULL,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Gruppe` int(55) NOT NULL,
  `Account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `student`
--
SET NAMES 'utf8';
INSERT INTO `student` (`Id`, `Name`, `Gruppe`, `Account`) VALUES
(1, 'Lorenz Backhaus', 1, 9),
(2, 'Felix Maninger', 2, 10),
(3, 'Julius Nordhues', 3, 11),
(4, 'Sebastian Bauer', 1, 12),
(5, 'Jonas Linde', 2, 13),
(6, 'Jones Klocke', 3, 14);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `veranstaltung`
--

CREATE TABLE `veranstaltung` (
  `Id` int(55) NOT NULL,
  `Title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Modul` int(55) NOT NULL,
  `Datum` date NOT NULL,
  `Zeit_von` datetime NOT NULL,
  `Zeit_bis` datetime NOT NULL,
  `Anmerkung` varchar(255) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `veranstaltung`
--
SET NAMES 'utf8';
INSERT INTO `veranstaltung` (`Id`, `Modul`, `Title`, `Datum`, `Zeit_von`, `Zeit_bis`, `Anmerkung`) VALUES
(1, 1, 'SWE', '2019-08-13', '2019-08-13 13:30:00', '2019-08-13 16:30:00', 'Wird bestimmt richtig cool'),
(2, 2, 'Controlling', '2019-05-10', '2019-08-13 13:30:00', '2019-08-13 16:30:00', 'Wird bestimmt richtig richtig cool'),
(3, 3, 'IT-Management', '2019-11-12', '2019-11-12 13:30:00', '2019-11-12 16:39:00', 'Wird langweilig');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `veranstaltungsgruppen`
--

CREATE TABLE `veranstaltungsgruppen` (
  `Id` int(55) NOT NULL,
  `Gruppe` int(55) NOT NULL,
  `Veranstaltung` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `veranstaltungsgruppen`
--
SET NAMES 'utf8';
INSERT INTO `veranstaltungsgruppen` (`Id`, `Gruppe`, `Veranstaltung`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 1, 3),
(4, 1, 2),
(5, 2, 3),
(6, 3, 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Id`);

--
-- Indizes für die Tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_admin_account` (`Account`);

--
-- Indizes für die Tabelle `dozent`
--
ALTER TABLE `dozent`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_dozent_account` (`Account`);

--
-- Indizes für die Tabelle `gruppe`
--
ALTER TABLE `gruppe`
  ADD PRIMARY KEY (`Id`);

--
-- Indizes für die Tabelle `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_modul_dozent` (`Dozent`);

--
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_student_account` (`Account`),
  ADD KEY `fk_student_gruppe` (`Gruppe`);

--
-- Indizes für die Tabelle `veranstaltung`
--
ALTER TABLE `veranstaltung`
  ADD PRIMARY KEY (`Id`);

--
-- Indizes für die Tabelle `veranstaltungsgruppen`
--
ALTER TABLE `veranstaltungsgruppen`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_veranstaltung` (`Veranstaltung`),
  ADD KEY `fk_gruppen` (`Gruppe`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `account`
--
ALTER TABLE `account`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `dozent`
--
ALTER TABLE `dozent`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `gruppe`
--
ALTER TABLE `gruppe`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `modul`
--
ALTER TABLE `modul`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `student`
--
ALTER TABLE `student`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `veranstaltung`
--
ALTER TABLE `veranstaltung`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `veranstaltungsgruppen`
--
ALTER TABLE `veranstaltungsgruppen`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_account` FOREIGN KEY (`Account`) REFERENCES `account` (`Id`);

--
-- Constraints der Tabelle `dozent`
--
ALTER TABLE `dozent`
  ADD CONSTRAINT `fk_dozent_account` FOREIGN KEY (`Account`) REFERENCES `account` (`Id`);

--
-- Constraints der Tabelle `modul`
--
ALTER TABLE `modul`
  ADD CONSTRAINT `fk_modul_dozent` FOREIGN KEY (`Dozent`) REFERENCES `dozent` (`Id`);

--
-- Constraints der Tabelle `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_account` FOREIGN KEY (`Account`) REFERENCES `account` (`Id`),
  ADD CONSTRAINT `fk_student_gruppe` FOREIGN KEY (`Gruppe`) REFERENCES `gruppe` (`Id`);

--
-- Constraints der Tabelle `veranstaltungsgruppen`
--
ALTER TABLE `veranstaltungsgruppen`
  ADD CONSTRAINT `fk_gruppen` FOREIGN KEY (`Gruppe`) REFERENCES `gruppe` (`Id`),
  ADD CONSTRAINT `fk_veranstaltung` FOREIGN KEY (`Veranstaltung`) REFERENCES `veranstaltung` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
