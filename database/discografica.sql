-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 20, 2022 alle 08:13
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `discografica`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `album`
--

CREATE TABLE `album` (
  `id_album` int(11) NOT NULL,
  `titolo_album` varchar(128) NOT NULL,
  `data_pubblicazione` date NOT NULL,
  `durata_album` time NOT NULL CHECK (`durata_album` > 0),
  `id_gruppo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `album`
--

INSERT INTO `album` (`id_album`, `titolo_album`, `data_pubblicazione`, `durata_album`, `id_gruppo`) VALUES
(1, 'Origin of Symmetry', '2001-06-18', '00:51:27', 1),
(2, 'The Resistance', '2011-09-11', '00:54:14', 1),
(3, 'We Are Not Your Kind', '2019-08-09', '01:03:26', 2),
(4, 'Blackmagik Blazing', '2019-08-19', '00:59:45', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `brano`
--

CREATE TABLE `brano` (
  `id_brano` int(11) NOT NULL,
  `nome_brano` varchar(128) NOT NULL,
  `durata_brano` time NOT NULL CHECK (`durata_brano` > 0),
  `id_album` int(11) NOT NULL,
  `id_sottogenere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `brano`
--

INSERT INTO `brano` (`id_brano`, `nome_brano`, `durata_brano`, `id_album`, `id_sottogenere`) VALUES
(1, 'New Born', '00:06:03', 1, 8),
(2, 'Darkshines', '00:04:47', 1, 8),
(3, 'Megalomania', '00:04:38', 1, 8),
(4, 'Uprising', '00:05:05', 2, 8),
(5, 'Undiscolesed Desires', '00:03:56', 2, 8),
(6, 'MK Ultra', '00:04:06', 2, 8),
(7, 'Unsainted', '00:04:20', 3, 9),
(8, 'Solway Firth', '00:05:56', 3, 9),
(9, 'Nero Forte', '00:05:15', 3, 9),
(10, 'BLACK - RAY', '00:04:38', 4, 3),
(11, 'BRACE FOR FRICKING IMPACT', '00:04:24', 4, 3),
(12, '[BLEED BLOOD]', '00:04:19', 4, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `generi`
--

CREATE TABLE `generi` (
  `id_genere` int(11) NOT NULL,
  `nome_genere` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `generi`
--

INSERT INTO `generi` (`id_genere`, `nome_genere`) VALUES
(1, 'Genere Popolare'),
(2, 'Genere classico');

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo`
--

CREATE TABLE `gruppo` (
  `id_gruppo` int(11) NOT NULL,
  `nome_gruppo` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `gruppo`
--

INSERT INTO `gruppo` (`id_gruppo`, `nome_gruppo`) VALUES
(1, 'Muse'),
(2, 'Slipknot'),
(3, 'Camellia');

-- --------------------------------------------------------

--
-- Struttura della tabella `musicista`
--

CREATE TABLE `musicista` (
  `id_artista` int(11) NOT NULL,
  `nome_artista` varchar(128) NOT NULL,
  `id_gruppo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `musicista`
--

INSERT INTO `musicista` (`id_artista`, `nome_artista`, `id_gruppo`) VALUES
(1, 'Matthew James Bellamy', 1),
(2, 'Dominic James Howard', 1),
(3, 'Christopher Anthony Wolstenholme', 1),
(4, 'Corey Taylor', 2),
(5, 'Paul Gray', 2),
(6, 'Joey Jordison', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `sottogeneri`
--

CREATE TABLE `sottogeneri` (
  `id_sottogenere` int(11) NOT NULL,
  `nome_sottogenere` varchar(128) NOT NULL,
  `id_genere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `sottogeneri`
--

INSERT INTO `sottogeneri` (`id_sottogenere`, `nome_sottogenere`, `id_genere`) VALUES
(1, 'Avanguardia', 1),
(2, 'Blues', 1),
(3, 'Elettronica', 1),
(4, 'Folk', 1),
(5, 'Jazz', 1),
(6, 'New Age', 1),
(7, 'Rap', 1),
(8, 'Rock', 1),
(9, 'Metal', 1),
(10, 'Musica da camera', 2),
(11, 'Concerto', 2),
(12, 'Opera', 2),
(13, 'Sinfonia', 2),
(14, 'Musica corale', 2);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `id_gruppo` (`id_gruppo`);

--
-- Indici per le tabelle `brano`
--
ALTER TABLE `brano`
  ADD PRIMARY KEY (`id_brano`),
  ADD KEY `id_album` (`id_album`),
  ADD KEY `id_sottogenere` (`id_sottogenere`);

--
-- Indici per le tabelle `generi`
--
ALTER TABLE `generi`
  ADD PRIMARY KEY (`id_genere`);

--
-- Indici per le tabelle `gruppo`
--
ALTER TABLE `gruppo`
  ADD PRIMARY KEY (`id_gruppo`);

--
-- Indici per le tabelle `musicista`
--
ALTER TABLE `musicista`
  ADD PRIMARY KEY (`id_artista`),
  ADD KEY `id_gruppo` (`id_gruppo`);

--
-- Indici per le tabelle `sottogeneri`
--
ALTER TABLE `sottogeneri`
  ADD PRIMARY KEY (`id_sottogenere`),
  ADD KEY `id_genere` (`id_genere`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `brano`
--
ALTER TABLE `brano`
  MODIFY `id_brano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `generi`
--
ALTER TABLE `generi`
  MODIFY `id_genere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `gruppo`
--
ALTER TABLE `gruppo`
  MODIFY `id_gruppo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `musicista`
--
ALTER TABLE `musicista`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `sottogeneri`
--
ALTER TABLE `sottogeneri`
  MODIFY `id_sottogenere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_gruppo`) REFERENCES `gruppo` (`id_gruppo`);

--
-- Limiti per la tabella `brano`
--
ALTER TABLE `brano`
  ADD CONSTRAINT `brano_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  ADD CONSTRAINT `brano_ibfk_2` FOREIGN KEY (`id_sottogenere`) REFERENCES `sottogeneri` (`id_sottogenere`);

--
-- Limiti per la tabella `musicista`
--
ALTER TABLE `musicista`
  ADD CONSTRAINT `musicista_ibfk_1` FOREIGN KEY (`id_gruppo`) REFERENCES `gruppo` (`id_gruppo`);

--
-- Limiti per la tabella `sottogeneri`
--
ALTER TABLE `sottogeneri`
  ADD CONSTRAINT `sottogeneri_ibfk_1` FOREIGN KEY (`id_genere`) REFERENCES `generi` (`id_genere`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
