-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 20, 2023 at 04:25 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chytra_kucharka`
--

-- --------------------------------------------------------

--
-- Table structure for table `jednotky`
--

CREATE TABLE `jednotky` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `jednotky`
--

INSERT INTO `jednotky` (`id`, `nazev`) VALUES
(7, 'kg'),
(8, 'g'),
(9, 'dkg'),
(10, 'ml'),
(11, 'dcl'),
(12, 'l'),
(13, 'x stroužek'),
(14, 'x plátek'),
(16, 'špetka'),
(17, 'x lžíce'),
(18, 'ks'),
(19, 'x snítko');

-- --------------------------------------------------------

--
-- Table structure for table `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`id`, `nazev`) VALUES
(1, 'Saláty'),
(2, 'Omáčky'),
(3, 'Polévky'),
(4, 'Dezerty'),
(5, 'Nápoje'),
(6, 'Přílohy'),
(7, 'Zdravé'),
(8, 'Těstoviny');

-- --------------------------------------------------------

--
-- Table structure for table `recept`
--

CREATE TABLE `recept` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(45) NOT NULL,
  `postup` varchar(1000) NOT NULL,
  `casova_narocnost` int(10) UNSIGNED NOT NULL,
  `kategorie_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `recept`
--

INSERT INTO `recept` (`id`, `nazev`, `postup`, `casova_narocnost`, `kategorie_id`) VALUES
(1, 'Brokolicová polévka', 'Brokolici očistíme, omyjeme, rozdělíme na růžičky, košťály oloupeme a nakrájíme na plátky. Česnek nasekáme a podusíme na tuku s nakrájenými košťály. Přelijeme vývarem a povaříme na mírném ohni asi 5 minut. Přidáme růžičky brokolice a vaříme dalších 10 minut. Pak brokolici spolu s vývarem rozmixujeme. Za stálého míchání přidáme smetanu a dochutíme solí, pepřem a strouhaným muškátovým oříškem.', 30, 3),
(2, 'Květákové makarony', 'Předehřejeme troubu na 220°C a naplníme rychlovarnou konev vodou a dáme vařit. Na velký pekáč narovnáme plátky pancetty a vložíme ho do trouby na horní příčku. Květák omyjeme, zbavíme svrchních listů, odřežeme tvrdý stonek a rozkrojíme na čtvrtiny. DO velkého hrnce vložíme květák středem dolů, přidáme těstoviny, zalijeme vařící vodou a vaříme na vysokém plameni dle návodu na obalu těstovin. Dále nastrouháme čedar. Opečenou pancettu vyndáme z trouby a nakrájíme na kousíčky. Těstoviny s květákem slijeme do velké mísy s cedníkem, abychom zachytili vodu z těstovin. Z cedníku přesypeme do pekáče, šťouchadlem či vidličkou rozdrobíme květák. Přidáme 400ml vody z těstovin, 2 prolisované stroužky česneku, většinu nastrouhaného čedaru a créme fraiche. Promícháme a pokud není směs hezky vláčná, přidáme ješte trochu vody. Dovnitř směsi vložíme snítky rozmarýnu, nahorě rovnoměrně posybeme pancettou a zbylým čedarem a dáme zapéct na cca. 10 minut nebo dokud nebudou těstoviny na povrchu zlatavé.', 30, 8);

-- --------------------------------------------------------

--
-- Table structure for table `recept_has_suroviny`
--

CREATE TABLE `recept_has_suroviny` (
  `jednotky_id` int(10) UNSIGNED NOT NULL,
  `recept_id` int(10) UNSIGNED NOT NULL,
  `suroviny_id` int(10) UNSIGNED NOT NULL,
  `mnozstvi` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `recept_has_suroviny`
--

INSERT INTO `recept_has_suroviny` (`jednotky_id`, `recept_id`, `suroviny_id`, `mnozstvi`) VALUES
(8, 1, 18, 750),
(16, 1, 29, 1),
(16, 1, 32, 1),
(8, 1, 35, 10),
(10, 1, 36, 500),
(13, 1, 37, 1),
(10, 1, 38, 100),
(16, 1, 39, 1),
(18, 2, 25, 1),
(16, 2, 32, 1),
(13, 2, 37, 2),
(17, 2, 40, 1),
(8, 2, 41, 250),
(17, 2, 42, 6),
(19, 2, 43, 3),
(8, 2, 44, 500),
(10, 2, 45, 250),
(14, 2, 46, 8);

-- --------------------------------------------------------

--
-- Table structure for table `suroviny`
--

CREATE TABLE `suroviny` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `suroviny`
--

INSERT INTO `suroviny` (`id`, `nazev`) VALUES
(18, 'Brokolice'),
(19, 'Brambory'),
(20, 'Celer'),
(21, 'Cibule'),
(22, 'Cukr'),
(23, 'Hovězí'),
(24, 'Kuřecí'),
(25, 'Květák'),
(26, 'Mouka'),
(27, 'Mrkev'),
(28, 'Olej'),
(29, 'Pepř'),
(30, 'Petržel'),
(31, 'Ryby'),
(32, 'Sůl'),
(33, 'Vajíčka'),
(34, 'Vepřové'),
(35, 'Máslo'),
(36, 'Vývar'),
(37, 'Česnek'),
(38, 'Šlechačka'),
(39, 'Muškátový oříšek'),
(40, 'Olivový olej'),
(41, 'Čedar'),
(42, 'Parmezán'),
(43, 'Rozmarýn'),
(44, 'Makaróny'),
(45, 'Créme Fraiche'),
(46, 'Pancetta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jednotky`
--
ALTER TABLE `jednotky`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recept`
--
ALTER TABLE `recept`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recept_kategorie1_idx` (`kategorie_id`);

--
-- Indexes for table `recept_has_suroviny`
--
ALTER TABLE `recept_has_suroviny`
  ADD PRIMARY KEY (`recept_id`,`suroviny_id`),
  ADD KEY `fk_recept_has_suroviny_jednotky1_idx` (`jednotky_id`),
  ADD KEY `fk_recept_has_suroviny_recept1_idx` (`recept_id`),
  ADD KEY `fk_recept_has_suroviny_suroviny1_idx` (`suroviny_id`);

--
-- Indexes for table `suroviny`
--
ALTER TABLE `suroviny`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jednotky`
--
ALTER TABLE `jednotky`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `recept`
--
ALTER TABLE `recept`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suroviny`
--
ALTER TABLE `suroviny`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recept`
--
ALTER TABLE `recept`
  ADD CONSTRAINT `fk_recept_kategorie1` FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `recept_has_suroviny`
--
ALTER TABLE `recept_has_suroviny`
  ADD CONSTRAINT `fk_recept_has_suroviny_jednotky1` FOREIGN KEY (`jednotky_id`) REFERENCES `jednotky` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recept_has_suroviny_recept1` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recept_has_suroviny_suroviny1` FOREIGN KEY (`suroviny_id`) REFERENCES `suroviny` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
