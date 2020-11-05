-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Nov 05, 2020 alle 00:32
-- Versione del server: 10.4.11-MariaDB
-- Versione PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mdmc`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `camere`
--

CREATE TABLE `camere` (
  `id` bigint(20) NOT NULL,
  `id_struttura` bigint(20) NOT NULL,
  `prezzo` float NOT NULL,
  `foto` varchar(255) NOT NULL,
  `numero_ospiti` int(2) NOT NULL,
  `riscaldamento` tinyint(1) NOT NULL,
  `aria_condizionata` tinyint(1) NOT NULL,
  `servizio_in_camera` tinyint(1) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrizione` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini`
--

CREATE TABLE `immagini` (
  `id` bigint(20) NOT NULL,
  `id_struttura` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamento`
--

CREATE TABLE `pagamento` (
  `id` bigint(20) NOT NULL,
  `id_prenotazione` bigint(20) NOT NULL,
  `numero_carta` varchar(20) NOT NULL,
  `cvv` int(4) NOT NULL,
  `intestatario` varchar(100) NOT NULL,
  `mese` varchar(100) NOT NULL,
  `anno` varchar(100) NOT NULL,
  `prezzo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `id` bigint(20) NOT NULL,
  `id_struttura` bigint(20) NOT NULL,
  `id_camere` bigint(20) DEFAULT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `prezzo` float NOT NULL,
  `pagamento_tasse` tinyint(1) NOT NULL,
  `confermata` tinyint(1) NOT NULL,
  `totale_tassa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `strutture`
--

CREATE TABLE `strutture` (
  `id` bigint(20) NOT NULL,
  `tipologia` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `citta` int(100) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `prezzo` float DEFAULT NULL,
  `numero_ospiti` int(2) DEFAULT NULL,
  `id_gestore` bigint(20) NOT NULL,
  `wifi` tinyint(1) NOT NULL,
  `parcheggio` tinyint(1) NOT NULL,
  `piscina` tinyint(1) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `tassa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `citta` varchar(100) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `password` varchar(128) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `partita_iva` varchar(11) DEFAULT NULL,
  `tipo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `camere`
--
ALTER TABLE `camere`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `foto` (`foto`),
  ADD KEY `id_struttura` (`id_struttura`);

--
-- Indici per le tabelle `immagini`
--
ALTER TABLE `immagini`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`),
  ADD KEY `id_struttura` (`id_struttura`);

--
-- Indici per le tabelle `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prenotazione` (`id_prenotazione`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_struttura` (`id_struttura`),
  ADD KEY `id_camere` (`id_camere`);

--
-- Indici per le tabelle `strutture`
--
ALTER TABLE `strutture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_gestore` (`id_gestore`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `camere`
--
ALTER TABLE `camere`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `immagini`
--
ALTER TABLE `immagini`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `strutture`
--
ALTER TABLE `strutture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `camere`
--
ALTER TABLE `camere`
  ADD CONSTRAINT `camere_ibfk_1` FOREIGN KEY (`id_struttura`) REFERENCES `strutture` (`id`);

--
-- Limiti per la tabella `immagini`
--
ALTER TABLE `immagini`
  ADD CONSTRAINT `immagini_ibfk_1` FOREIGN KEY (`id_struttura`) REFERENCES `strutture` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_prenotazione`) REFERENCES `prenotazioni` (`id`);

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `utenti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`id_struttura`) REFERENCES `strutture` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prenotazioni_ibfk_3` FOREIGN KEY (`id_camere`) REFERENCES `camere` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `strutture`
--
ALTER TABLE `strutture`
  ADD CONSTRAINT `strutture_ibfk_1` FOREIGN KEY (`id_gestore`) REFERENCES `utenti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
