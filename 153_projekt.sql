-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 20. Okt 2020 um 14:53
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
-- Datenbank: `153_projekt`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Abschnitt`
--

CREATE TABLE `Abschnitt` (
  `id` int(11) NOT NULL,
  `nummer` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `aufnahme datum` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Zeitpunkt an welchem Eintrag in die Datenbank aufgenommen wurde',
  `weg_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Abschnitt`
--

INSERT INTO `Abschnitt` (`id`, `nummer`, `name`, `aufnahme datum`, `weg_id`, `route_id`) VALUES
(1, 2141, 'Heike Weg', '2020-10-20 12:13:47', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bild`
--

CREATE TABLE `Bild` (
  `id` int(11) NOT NULL,
  `abschnitt_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `beschreibung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Bild`
--

INSERT INTO `Bild` (`id`, `abschnitt_id`, `url`, `date`, `beschreibung`) VALUES
(1, 1, 'https://www.aletscharena.ch/sport-sommer/wandern/bettmersee-wandern-sommer-aletsch-arena-carina-scheuringer-44.jpg', '2020-10-19 22:00:00', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Eigentümer`
--

CREATE TABLE `Eigentümer` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Eigentümer`
--

INSERT INTO `Eigentümer` (`id`, `name`) VALUES
(1, 'Haiko Nuding');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Infrastruktur`
--

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
(3, 'Toilette');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Infrastruktur_Weg`
--

CREATE TABLE `Infrastruktur_Weg` (
  `infrastruktur_id` int(11) NOT NULL,
  `weg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Infrastruktur_Weg`
--

INSERT INTO `Infrastruktur_Weg` (`infrastruktur_id`, `weg_id`) VALUES
(1, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Route`
--

CREATE TABLE `Route` (
  `id` int(11) NOT NULL,
  `nummer` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Route`
--

INSERT INTO `Route` (`id`, `nummer`) VALUES
(1, 2341);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Weg`
--

CREATE TABLE `Weg` (
  `id` int(11) NOT NULL,
  `gefälle` tinyint(4) NOT NULL COMMENT 'Gefälle in %',
  `länge` smallint(6) NOT NULL COMMENT 'Länge in Meter',
  `wegbreite` smallint(6) NOT NULL COMMENT 'Wegbreite in Meter',
  `eigentümer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Weg`
--

INSERT INTO `Weg` (`id`, `gefälle`, `länge`, `wegbreite`, `eigentümer_id`) VALUES
(1, 6, 2540, 1, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Abschnitt`
--
ALTER TABLE `Abschnitt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abschnittnummer` (`nummer`),
  ADD KEY `weg_id` (`weg_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indizes für die Tabelle `Bild`
--
ALTER TABLE `Bild`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abschnitt_id` (`abschnitt_id`);

--
-- Indizes für die Tabelle `Eigentümer`
--
ALTER TABLE `Eigentümer`
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
-- Indizes für die Tabelle `Route`
--
ALTER TABLE `Route`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Weg`
--
ALTER TABLE `Weg`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `eigentümer_id` (`eigentümer_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Abschnitt`
--
ALTER TABLE `Abschnitt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Bild`
--
ALTER TABLE `Bild`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Eigentümer`
--
ALTER TABLE `Eigentümer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Infrastruktur`
--
ALTER TABLE `Infrastruktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `Route`
--
ALTER TABLE `Route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Weg`
--
ALTER TABLE `Weg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Abschnitt`
--
ALTER TABLE `Abschnitt`
  ADD CONSTRAINT `Abschnitt_ibfk_1` FOREIGN KEY (`weg_id`) REFERENCES `Weg` (`id`),
  ADD CONSTRAINT `Abschnitt_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `Route` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Bild`
--
ALTER TABLE `Bild`
  ADD CONSTRAINT `Bild_ibfk_1` FOREIGN KEY (`abschnitt_id`) REFERENCES `Abschnitt` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Eigentümer`
--
ALTER TABLE `Eigentümer`
  ADD CONSTRAINT `Eigentümer_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Weg` (`eigentümer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Infrastruktur_Weg`
--
ALTER TABLE `Infrastruktur_Weg`
  ADD CONSTRAINT `Infrastruktur_Weg_ibfk_1` FOREIGN KEY (`infrastruktur_id`) REFERENCES `Infrastruktur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Infrastruktur_Weg_ibfk_2` FOREIGN KEY (`weg_id`) REFERENCES `Weg` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Weg`
--
ALTER TABLE `Weg`
  ADD CONSTRAINT `Weg_ibfk_1` FOREIGN KEY (`eigentümer_id`) REFERENCES `Eigentümer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
