-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Jan 2019 um 20:24
-- Server-Version: 10.1.33-MariaDB
-- PHP-Version: 7.2.6

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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `account`
--

CREATE TABLE `account` (
  `Id` int(11) NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin`
--

CREATE TABLE `admin` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dozent`
--

CREATE TABLE `dozent` (
  `Id` int(55) NOT NULL,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gruppe`
--

CREATE TABLE `gruppe` (
  `Id` int(55) NOT NULL,
  `Beschreibung` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `veranstalter`
--

CREATE TABLE `veranstaltung` (
  `Id` int(55) NOT NULL,
  `Title` int(55) NOT NULL,
  `Dozent`int(55) NOT NULL,
  `Date_begin` date NOT NULL,
  `Date_end` date NOT NULL,
  `Anmerkung` varchar(255) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_student_account` (`Account`),
  ADD KEY `fk_student_gruppe` (`Gruppe`);

--
-- Indizes für die Tabelle `veranstalter`
--
ALTER TABLE `veranstaltung`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_veranstaltung_dozent`(`Dozent`);


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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `dozent`
--
ALTER TABLE `dozent`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gruppe`
--
ALTER TABLE `gruppe`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `student`
--
ALTER TABLE `student`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `veranstalter`
--
ALTER TABLE `veranstaltung`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `veranstaltungsgruppen`
--
ALTER TABLE `veranstaltungsgruppen`
  MODIFY `Id` int(55) NOT NULL AUTO_INCREMENT;

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
-- Constraints der Tabelle `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_account` FOREIGN KEY (`Account`) REFERENCES `account` (`Id`),
  ADD CONSTRAINT `fk_student_gruppe` FOREIGN KEY (`gruppe`) REFERENCES `gruppe` (`Id`);

--
-- Constraints der Tabelle `veranstaltungsgruppen`
--
ALTER TABLE `veranstaltung`
  ADD CONSTRAINT `fk_veranstaltung_dozent` FOREIGN KEY (`Dozent`) REFERENCES `dozent` (`Id`);

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
