-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 02. Nov 2020 um 21:02
-- Server-Version: 10.2.33-MariaDB
-- PHP-Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `inf_153_inq1_04_igwww1`
--
CREATE DATABASE IF NOT EXISTS `inf_153_inq1_04_igwww1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `inf_153_inq1_04_igwww1`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Abschnitt`
--

DROP TABLE IF EXISTS `Abschnitt`;
CREATE TABLE `Abschnitt` (
  `id` int(11) NOT NULL,
  `nummer` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `aufnahme datum` timestamp NOT NULL COMMENT 'Zeitpunkt an welchem Eintrag in die Datenbank aufgenommen wurde',
  `weg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Abschnitt`
--

INSERT INTO `Abschnitt` (`id`, `nummer`, `name`, `aufnahme datum`, `weg_id`) VALUES
(1, 401, 'Wohleibrügg', '2020-11-20 18:28:32', 1),
(2, 402, 'Unterwohlen', '2020-11-20 18:28:32', 2),
(3, 403, 'Hofen Mühle', '2020-11-20 18:28:32', 3),
(4, 404, 'Hofen', '2020-11-20 18:28:32', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Aufgabe`
--

DROP TABLE IF EXISTS `Aufgabe`;
CREATE TABLE `Aufgabe` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Aufgabe`
--

INSERT INTO `Aufgabe` (`id`, `name`) VALUES
(1, 'Wegeschild'),
(2, 'mähen'),
(3, 'roden');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Aussicht`
--

DROP TABLE IF EXISTS `Aussicht`;
CREATE TABLE `Aussicht` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Aussicht`
--

INSERT INTO `Aussicht` (`id`, `name`) VALUES
(1, 'nähere Umgebung'),
(2, 'Fernsicht'),
(3, 'weitere Umgebung');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `BarrierFreePaths`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `BarrierFreePaths`;
CREATE TABLE `BarrierFreePaths` (
`nummer` int(11)
,`name` tinytext
,`Kinderwagen` tinytext
,`Rollstuhl` tinytext
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Belag`
--

DROP TABLE IF EXISTS `Belag`;
CREATE TABLE `Belag` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Belag`
--

INSERT INTO `Belag` (`id`, `name`) VALUES
(1, 'Naturweg'),
(2, 'Hartbelag Strasse'),
(3, 'Hartbelag Trottoir'),
(4, 'Hartbelag Mergel'),
(5, 'Pfad'),
(6, 'Mergel/Splitt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Beschreibung`
--

DROP TABLE IF EXISTS `Beschreibung`;
CREATE TABLE `Beschreibung` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Beschreibung`
--

INSERT INTO `Beschreibung` (`id`, `name`) VALUES
(1, 'frei'),
(2, 'gelegentlich'),
(3, 'regelmässig'),
(4, 'kaum'),
(5, 'nein'),
(6, 'möglich');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bild`
--

DROP TABLE IF EXISTS `Bild`;
CREATE TABLE `Bild` (
  `id` int(11) NOT NULL,
  `abschnitt_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `beschreibung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Charakter`
--

DROP TABLE IF EXISTS `Charakter`;
CREATE TABLE `Charakter` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Charakter`
--

INSERT INTO `Charakter` (`id`, `name`) VALUES
(1, 'Abwechslungsreich'),
(2, 'Normal'),
(3, 'Eintönig');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Eigentümer`
--

DROP TABLE IF EXISTS `Eigentümer`;
CREATE TABLE `Eigentümer` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Eigentümer`
--

INSERT INTO `Eigentümer` (`id`, `name`) VALUES
(1, 'Haiko Nuding'),
(2, 'Gemeinde Wohlen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Gegend`
--

DROP TABLE IF EXISTS `Gegend`;
CREATE TABLE `Gegend` (
  `id` int(11) NOT NULL,
  `aussicht_id` int(11) NOT NULL,
  `umgebung_id` int(11) NOT NULL,
  `geräuschkulisse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Gegend`
--

INSERT INTO `Gegend` (`id`, `aussicht_id`, `umgebung_id`, `geräuschkulisse_id`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 5, 1);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `GeneralData`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `GeneralData`;
CREATE TABLE `GeneralData` (
`Abschnitt Name` tinytext
,`nummer` int(11)
,`gefälle` tinytext
,`länge` smallint(6)
,`Eigentümer` tinytext
,`Verlauf` tinytext
,`Belag` text
,`Wegrand` tinytext
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Geräuschkulisse`
--

DROP TABLE IF EXISTS `Geräuschkulisse`;
CREATE TABLE `Geräuschkulisse` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Geräuschkulisse`
--

INSERT INTO `Geräuschkulisse` (`id`, `name`) VALUES
(1, 'normal'),
(2, 'ruhig'),
(3, 'laut');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Infrastruktur`
--

DROP TABLE IF EXISTS `Infrastruktur`;
CREATE TABLE `Infrastruktur` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Infrastruktur`
--

INSERT INTO `Infrastruktur` (`id`, `name`) VALUES
(1, 'Feuerstelle'),
(2, 'Bahnhof'),
(3, 'Toilette'),
(4, 'keine'),
(5, 'Brücke'),
(6, 'Steg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Infrastruktur_Weg`
--

DROP TABLE IF EXISTS `Infrastruktur_Weg`;
CREATE TABLE `Infrastruktur_Weg` (
  `infrastruktur_id` int(11) NOT NULL,
  `weg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Infrastruktur_Weg`
--

INSERT INTO `Infrastruktur_Weg` (`infrastruktur_id`, `weg_id`) VALUES
(6, 1),
(1, 2),
(4, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Pflege`
--

DROP TABLE IF EXISTS `Pflege`;
CREATE TABLE `Pflege` (
  `weg_id` int(11) NOT NULL,
  `aufgabe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Route`
--

DROP TABLE IF EXISTS `Route`;
CREATE TABLE `Route` (
  `id` int(11) NOT NULL,
  `nummer` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Route`
--

INSERT INTO `Route` (`id`, `nummer`) VALUES
(1, 420);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Route_Abschnitt`
--

DROP TABLE IF EXISTS `Route_Abschnitt`;
CREATE TABLE `Route_Abschnitt` (
  `route_id` int(11) DEFAULT NULL,
  `abschnitt_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Route_Abschnitt`
--

INSERT INTO `Route_Abschnitt` (`route_id`, `abschnitt_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ShowTraffic`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `ShowTraffic`;
CREATE TABLE `ShowTraffic` (
`nummer` int(11)
,`name` tinytext
,`Biker` tinytext
,`Velo` tinytext
,`Motoverkehr` tinytext
,`Kinderwagen` tinytext
,`Rollstuhl` tinytext
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Umgebung`
--

DROP TABLE IF EXISTS `Umgebung`;
CREATE TABLE `Umgebung` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Umgebung`
--

INSERT INTO `Umgebung` (`id`, `name`) VALUES
(1, 'am See'),
(2, 'Siedlungsrand'),
(3, 'im Wald'),
(4, 'übers Feld'),
(5, 'in Siedlung'),
(6, 'am Waldrand'),
(7, 'im Wald/übers Feld');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Verkehr`
--

DROP TABLE IF EXISTS `Verkehr`;
CREATE TABLE `Verkehr` (
  `id` int(11) NOT NULL,
  `velo` int(11) DEFAULT NULL,
  `biker` int(11) DEFAULT NULL,
  `rollstuhl` int(11) DEFAULT NULL,
  `kinderwagen` int(11) DEFAULT NULL,
  `motoverkehr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Verkehr`
--

INSERT INTO `Verkehr` (`id`, `velo`, `biker`, `rollstuhl`, `kinderwagen`, `motoverkehr`) VALUES
(1, 4, 4, 6, 6, 1),
(2, 2, 2, 6, 6, 2),
(3, 4, 2, 5, 5, 1),
(4, 3, 3, 6, 6, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Verlauf`
--

DROP TABLE IF EXISTS `Verlauf`;
CREATE TABLE `Verlauf` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Verlauf`
--

INSERT INTO `Verlauf` (`id`, `name`) VALUES
(1, 'Gerade'),
(2, 'Kurvig'),
(3, 'Steil');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Weg`
--

DROP TABLE IF EXISTS `Weg`;
CREATE TABLE `Weg` (
  `id` int(11) NOT NULL,
  `gefälle` tinytext NOT NULL COMMENT 'Gefälle in %',
  `länge` smallint(6) NOT NULL COMMENT 'Länge in Meter',
  `breite` double NOT NULL COMMENT 'Wegbreite in Meter',
  `belag_id` int(11) NOT NULL,
  `charakter_id` int(11) NOT NULL,
  `wegrand_id` int(11) NOT NULL,
  `verlauf_id` int(11) NOT NULL,
  `verkehr_id` int(11) NOT NULL,
  `gegend_id` int(11) NOT NULL,
  `eigentümer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Weg`
--

INSERT INTO `Weg` (`id`, `gefälle`, `länge`, `breite`, `belag_id`, `charakter_id`, `wegrand_id`, `verlauf_id`, `verkehr_id`, `gegend_id`, `eigentümer_id`) VALUES
(1, '<6', 878, 3, 4, 1, 3, 1, 1, 1, 2),
(2, '>6', 465, 3, 2, 2, 3, 1, 2, 2, 2),
(3, '>6', 454, 3, 2, 2, 4, 1, 3, 3, 2),
(4, '<6', 586, 4, 2, 2, 3, 1, 4, 4, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Wegrand`
--

DROP TABLE IF EXISTS `Wegrand`;
CREATE TABLE `Wegrand` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Wegrand`
--

INSERT INTO `Wegrand` (`id`, `name`) VALUES
(1, 'Siedlungsgebiet'),
(2, 'Gras nicht gemäht'),
(3, 'Gras gemäht'),
(4, 'Wadrand');

-- --------------------------------------------------------

--
-- Struktur des Views `BarrierFreePaths`
--
DROP TABLE IF EXISTS `BarrierFreePaths`;

DROP VIEW IF EXISTS `BarrierFreePaths`;
CREATE ALGORITHM=UNDEFINED DEFINER=`inf_153_inq1_04_igwww1`@`%` SQL SECURITY DEFINER VIEW `BarrierFreePaths`  AS  select `Abschnitt`.`nummer` AS `nummer`,`Abschnitt`.`name` AS `name`,`Kinderwagen`.`name` AS `Kinderwagen`,`Rollstuhl`.`name` AS `Rollstuhl` from ((((`Abschnitt` join `Weg` on(`Weg`.`id` = `Abschnitt`.`weg_id`)) join `Verkehr` on(`Weg`.`verkehr_id` = `Verkehr`.`id`)) join `Beschreibung` `Kinderwagen` on(`Verkehr`.`kinderwagen` = `Kinderwagen`.`id`)) join `Beschreibung` `Rollstuhl` on(`Verkehr`.`rollstuhl` = `Rollstuhl`.`id`)) where `Kinderwagen`.`id` = 6 or `Rollstuhl`.`id` = 6 ;

-- --------------------------------------------------------

--
-- Struktur des Views `GeneralData`
--
DROP TABLE IF EXISTS `GeneralData`;

DROP VIEW IF EXISTS `GeneralData`;
CREATE ALGORITHM=UNDEFINED DEFINER=`inf_153_inq1_04_igwww1`@`%` SQL SECURITY DEFINER VIEW `GeneralData`  AS  select `Abschnitt`.`name` AS `Abschnitt Name`,`Abschnitt`.`nummer` AS `nummer`,`Weg`.`gefälle` AS `gefälle`,`Weg`.`länge` AS `länge`,`Eigentümer`.`name` AS `Eigentümer`,`Verlauf`.`name` AS `Verlauf`,`Belag`.`name` AS `Belag`,`Wegrand`.`name` AS `Wegrand` from (((((`Abschnitt` join `Weg` on(`Weg`.`id` = `Abschnitt`.`weg_id`)) join `Eigentümer` on(`Weg`.`eigentümer_id` = `Eigentümer`.`id`)) join `Verlauf` on(`Weg`.`verlauf_id` = `Verlauf`.`id`)) join `Belag` on(`Weg`.`belag_id` = `Belag`.`id`)) join `Wegrand` on(`Weg`.`wegrand_id` = `Wegrand`.`id`)) ;

-- --------------------------------------------------------

--
-- Struktur des Views `ShowTraffic`
--
DROP TABLE IF EXISTS `ShowTraffic`;

DROP VIEW IF EXISTS `ShowTraffic`;
CREATE ALGORITHM=UNDEFINED DEFINER=`inf_153_inq1_04_igwww1`@`%` SQL SECURITY DEFINER VIEW `ShowTraffic`  AS  select `Abschnitt`.`nummer` AS `nummer`,`Abschnitt`.`name` AS `name`,`Biker`.`name` AS `Biker`,`Velo`.`name` AS `Velo`,`Motoverkehr`.`name` AS `Motoverkehr`,`Kinderwagen`.`name` AS `Kinderwagen`,`Rollstuhl`.`name` AS `Rollstuhl` from (((((((`Abschnitt` join `Weg` on(`Weg`.`id` = `Abschnitt`.`weg_id`)) join `Verkehr` on(`Weg`.`verkehr_id` = `Verkehr`.`id`)) join `Beschreibung` `Biker` on(`Verkehr`.`biker` = `Biker`.`id`)) join `Beschreibung` `Velo` on(`Verkehr`.`velo` = `Velo`.`id`)) join `Beschreibung` `Motoverkehr` on(`Verkehr`.`motoverkehr` = `Motoverkehr`.`id`)) join `Beschreibung` `Kinderwagen` on(`Verkehr`.`kinderwagen` = `Kinderwagen`.`id`)) join `Beschreibung` `Rollstuhl` on(`Verkehr`.`rollstuhl` = `Rollstuhl`.`id`)) ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Abschnitt`
--
ALTER TABLE `Abschnitt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abschnittnummer` (`nummer`),
  ADD KEY `weg_id` (`weg_id`);

--
-- Indizes für die Tabelle `Aufgabe`
--
ALTER TABLE `Aufgabe`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Aussicht`
--
ALTER TABLE `Aussicht`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Belag`
--
ALTER TABLE `Belag`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Beschreibung`
--
ALTER TABLE `Beschreibung`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Bild`
--
ALTER TABLE `Bild`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abschnitt_id` (`abschnitt_id`);

--
-- Indizes für die Tabelle `Charakter`
--
ALTER TABLE `Charakter`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Eigentümer`
--
ALTER TABLE `Eigentümer`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Gegend`
--
ALTER TABLE `Gegend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aussicht_id` (`aussicht_id`),
  ADD KEY `umgebung_id` (`umgebung_id`),
  ADD KEY `geräuschkulisse_id` (`geräuschkulisse_id`);

--
-- Indizes für die Tabelle `Geräuschkulisse`
--
ALTER TABLE `Geräuschkulisse`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Infrastruktur`
--
ALTER TABLE `Infrastruktur`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Infrastruktur_Weg`
--
ALTER TABLE `Infrastruktur_Weg`
  ADD KEY `infrastruktur_id` (`infrastruktur_id`),
  ADD KEY `weg_id` (`weg_id`);

--
-- Indizes für die Tabelle `Pflege`
--
ALTER TABLE `Pflege`
  ADD KEY `Plege_ibfk_1` (`weg_id`),
  ADD KEY `Plege_ibfk_2` (`aufgabe_id`);

--
-- Indizes für die Tabelle `Route`
--
ALTER TABLE `Route`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Route_Abschnitt`
--
ALTER TABLE `Route_Abschnitt`
  ADD KEY `Route_Abschnitt_ibfk_2` (`abschnitt_id`),
  ADD KEY `Route_Abschnitt_ibfk_1` (`route_id`);

--
-- Indizes für die Tabelle `Umgebung`
--
ALTER TABLE `Umgebung`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Verkehr`
--
ALTER TABLE `Verkehr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Verkehr_ibfk1` (`velo`),
  ADD KEY `Verkehr_ibfk2` (`biker`),
  ADD KEY `Verkehr_ibfk3` (`rollstuhl`),
  ADD KEY `Verkehr_ibfk4` (`kinderwagen`),
  ADD KEY `Verkehr_ibfk5` (`motoverkehr`);

--
-- Indizes für die Tabelle `Verlauf`
--
ALTER TABLE `Verlauf`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Weg`
--
ALTER TABLE `Weg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verlauf` (`verlauf_id`),
  ADD KEY `wegrand_id` (`wegrand_id`),
  ADD KEY `charakter_id` (`charakter_id`),
  ADD KEY `belag_id` (`belag_id`),
  ADD KEY `gegend_id` (`gegend_id`),
  ADD KEY `Weg_ibfk_7` (`verkehr_id`),
  ADD KEY `Weg_ibfk_1` (`eigentümer_id`);

--
-- Indizes für die Tabelle `Wegrand`
--
ALTER TABLE `Wegrand`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Abschnitt`
--
ALTER TABLE `Abschnitt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Aussicht`
--
ALTER TABLE `Aussicht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `Beschreibung`
--
ALTER TABLE `Beschreibung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `Bild`
--
ALTER TABLE `Bild`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Eigentümer`
--
ALTER TABLE `Eigentümer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `Gegend`
--
ALTER TABLE `Gegend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Geräuschkulisse`
--
ALTER TABLE `Geräuschkulisse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `Infrastruktur`
--
ALTER TABLE `Infrastruktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `Route`
--
ALTER TABLE `Route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Umgebung`
--
ALTER TABLE `Umgebung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `Verkehr`
--
ALTER TABLE `Verkehr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Weg`
--
ALTER TABLE `Weg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Abschnitt`
--
ALTER TABLE `Abschnitt`
  ADD CONSTRAINT `Abschnitt_ibfk_1` FOREIGN KEY (`weg_id`) REFERENCES `Weg` (`id`);

--
-- Constraints der Tabelle `Bild`
--
ALTER TABLE `Bild`
  ADD CONSTRAINT `Bild_ibfk_1` FOREIGN KEY (`abschnitt_id`) REFERENCES `Abschnitt` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Gegend`
--
ALTER TABLE `Gegend`
  ADD CONSTRAINT `Gegend_ibfk_1` FOREIGN KEY (`geräuschkulisse_id`) REFERENCES `Geräuschkulisse` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Gegend_ibfk_2` FOREIGN KEY (`aussicht_id`) REFERENCES `Aussicht` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Gegend_ibfk_3` FOREIGN KEY (`umgebung_id`) REFERENCES `Umgebung` (`id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Infrastruktur_Weg`
--
ALTER TABLE `Infrastruktur_Weg`
  ADD CONSTRAINT `Infrastruktur_Weg_ibfk_1` FOREIGN KEY (`infrastruktur_id`) REFERENCES `Infrastruktur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Infrastruktur_Weg_ibfk_2` FOREIGN KEY (`weg_id`) REFERENCES `Weg` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Pflege`
--
ALTER TABLE `Pflege`
  ADD CONSTRAINT `Plege_ibfk_1` FOREIGN KEY (`weg_id`) REFERENCES `Weg` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Plege_ibfk_2` FOREIGN KEY (`aufgabe_id`) REFERENCES `Aufgabe` (`id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Route_Abschnitt`
--
ALTER TABLE `Route_Abschnitt`
  ADD CONSTRAINT `Route_Abschnitt_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `Route` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Route_Abschnitt_ibfk_2` FOREIGN KEY (`abschnitt_id`) REFERENCES `Abschnitt` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Verkehr`
--
ALTER TABLE `Verkehr`
  ADD CONSTRAINT `Verkehr_ibfk1` FOREIGN KEY (`velo`) REFERENCES `Beschreibung` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Verkehr_ibfk2` FOREIGN KEY (`biker`) REFERENCES `Beschreibung` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Verkehr_ibfk3` FOREIGN KEY (`rollstuhl`) REFERENCES `Beschreibung` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Verkehr_ibfk4` FOREIGN KEY (`kinderwagen`) REFERENCES `Beschreibung` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Verkehr_ibfk5` FOREIGN KEY (`motoverkehr`) REFERENCES `Beschreibung` (`id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Weg`
--
ALTER TABLE `Weg`
  ADD CONSTRAINT `Weg_ibfk_1` FOREIGN KEY (`eigentümer_id`) REFERENCES `Eigentümer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Weg_ibfk_2` FOREIGN KEY (`belag_id`) REFERENCES `Belag` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Weg_ibfk_3` FOREIGN KEY (`charakter_id`) REFERENCES `Charakter` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Weg_ibfk_4` FOREIGN KEY (`verlauf_id`) REFERENCES `Verlauf` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Weg_ibfk_5` FOREIGN KEY (`wegrand_id`) REFERENCES `Wegrand` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Weg_ibfk_6` FOREIGN KEY (`gegend_id`) REFERENCES `Gegend` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Weg_ibfk_7` FOREIGN KEY (`verkehr_id`) REFERENCES `Verkehr` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
