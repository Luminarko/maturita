-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 26. úno 2023, 23:33
-- Verze serveru: 10.4.27-MariaDB
-- Verze PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `chytra_kucharka`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `jednotky`
--

CREATE TABLE `jednotky` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `jednotky`
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
(19, 'x snítko'),
(20, 'x kulička'),
(21, 'x lžička');

-- --------------------------------------------------------

--
-- Struktura tabulky `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `kategorie`
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
-- Struktura tabulky `recept`
--

CREATE TABLE `recept` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(45) NOT NULL,
  `postup` varchar(5000) NOT NULL,
  `casova_narocnost` int(10) UNSIGNED NOT NULL,
  `kategorie_id` int(10) UNSIGNED NOT NULL,
  `obrazek` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `recept`
--

INSERT INTO `recept` (`id`, `nazev`, `postup`, `casova_narocnost`, `kategorie_id`, `obrazek`) VALUES
(1, 'Brokolicová polévka', 'Brokolici očistíme, omyjeme, rozdělíme na růžičky, košťály oloupeme a nakrájíme na plátky. Česnek nasekáme a podusíme na tuku s nakrájenými košťály. Přelijeme vývarem a povaříme na mírném ohni asi 5 minut. Přidáme růžičky brokolice a vaříme dalších 10 minut. Pak brokolici spolu s vývarem rozmixujeme. Za stálého míchání přidáme smetanu a dochutíme solí, pepřem a strouhaným muškátovým oříškem.', 30, 3, 'brokolicova_polevka.png'),
(2, 'Květákové makarony', 'Předehřejeme troubu na 220°C a naplníme rychlovarnou konev vodou a dáme vařit. Na velký pekáč narovnáme plátky pancetty a vložíme ho do trouby na horní příčku. Květák omyjeme, zbavíme svrchních listů, odřežeme tvrdý stonek a rozkrojíme na čtvrtiny. DO velkého hrnce vložíme květák středem dolů, přidáme těstoviny, zalijeme vařící vodou a vaříme na vysokém plameni dle návodu na obalu těstovin. Dále nastrouháme čedar. Opečenou pancettu vyndáme z trouby a nakrájíme na kousíčky. Těstoviny s květákem slijeme do velké mísy s cedníkem, abychom zachytili vodu z těstovin. Z cedníku přesypeme do pekáče, šťouchadlem či vidličkou rozdrobíme květák. Přidáme 400ml vody z těstovin, 2 prolisované stroužky česneku, většinu nastrouhaného čedaru a créme fraiche. Promícháme a pokud není směs hezky vláčná, přidáme ješte trochu vody. Dovnitř směsi vložíme snítky rozmarýnu, nahorě rovnoměrně posybeme pancettou a zbylým čedarem a dáme zapéct na cca. 10 minut nebo dokud nebudou těstoviny na povrchu zlatavé.', 30, 8, 'kvetakove_makarony.png\r\n'),
(3, 'Svíčková na smetaně', ' Maso prošpikujeme hranolky slaniny (jde to skvěle, pokud ji dáme na půl hodiny do mrazničky) a opečeme na oleji, nebo na oleji s máslem (máslo se nebude připalovat). Poté maso vyjmeme a na výpeku opečeme nahrubo nastrouhanou zeleninu a cibuli. Jakmile mrkev pustí barvu, přidáme cukr a necháme zkaramelizovat. Přidáme hořčici, koření, přilijeme ocet, vložíme maso a zalijeme vroucím vývarem. Vložíme hrnec či pekáč i s poklicí do trouby a pečeme do změknutí masa (přibližně 1,5-2 hodiny ve středně vyhřáté troubě). Poté maso i koření vyjmeme, maso nakrájíme a omáčku rozmixujeme. Je-li třeba, zahustíme omáčku hladkou moukou, rozkvedlanou v mléce a provaříme (mouku je třeba provařit minimálně po dobu 20 minut), podle potřeby dosolíme. Omáčku zjemníme smetanou, dochutíme citronem a plátkem másla, již nevaříme. Podáváme s houskovým knedlíkem, na talíři dozdobíme kouskem citronu a brusinkami. ', 150, 2, 'svickova_na_smetane.png'),
(4, 'Caesar salát s kuřecím masem', 'Omyjeme římský salát (pozor, jiný salát se na Caesar salát nepoužívá) a odřežeme tvrdý košťál. Použijeme jen hezké čisté listy salátu. Listy zbavené košťálu pak nakrájíme na pravidelné větší čtverce. Do misky vložíme najemno nastrouhaný sýr (parmezánového typu), žloutky, šťávu z jednoho citronu, ančovičky, dijonskou hořčici, olivový olej, balzamikový ocet. Vše v misce nejlépe ručním mixérem zamícháme tak, aby vznikla hustší hmota zálivky.\nV případě, že je hmota příliš hustá, přidáváme olivový olej na jemné zředění. Ničím nedochucovat! Ingredience salátu jsou kořením. Bagetu nakrájíme na pravidelné kostičky a nejprve dáme do trouby (nejlépe na pečící papír) orestovat do doby, než začnou být krutony křupavé. Pozor, nepéct do příliš tmavé barvy. Křupavé krutony vytáhneme z trouby. Na pánev s olivovým olejem vložíme stroužky česneku, které nejprve v ruce zmáčkneme (uvolní se tak výrazná chuť česneku). Vložíme na pánev spolu s krutony a restujeme do mírně tmavé barvy. Kuřecí maso budeme grilovat na kontaktním grilu 180-200°C. Některé grily mají jen hodnoty 1-3, tedy zvolíme prostřední hodnotu 2. (Pokud nemáte gril, pánev poslouží.) Nejprve rozehřejeme gril, maso nakrájíme na tenké plátky, pokapeme olivovým olejem, osolíme a přidáme čerstvě namletý černý pepř. Jednotlivé plátky masa důkladně v ruce promneme, abychom vetřeli olej a koření. Vložíme na gril a grilujeme 2-3 minuty z každé strany, dokud není maso hotové. (Pozor na prudké a dlouhé grilování, aby steak nebyl vysušený! Na zkoušku před dokončením můžete jeden plátek rozkrojit a zkontrolovat, je-li hotov.) Hotové kuřecí plátky nakrájíme na jemné plátky. Nejlépe ve větší míse si připravíme nakrájený římský salát, zalejeme rozmixovanou zálivkou a jemně vařečkami vmícháme směs do salátu, aby se nám všechny listy salátu spojily se zálivkou. Do hlubokého talíře vložíme jednotlivé porce salátu, naklademe nakrájené maso, posypeme krutony a nastrouháme na jemné plátky (hobliny) sýr. Kuřecí maso můžeme nahradit grilovaným lososem. Dobrou chuť!', 30, 1, 'caesar_s_kurecim.png'),
(5, 'Italské tiramisu', 'Připravte si espreso nebo silnou kávu podle svých možností. Postačí i rozpustná. Smíchejte ji s amarettem a nalijte do větší misky.Žloutky s cukrem smíchejte v ohnivzdorné misce a šlehejte ve vodní lázni. Když směs zesvětlá a zhoustne, máte hotovo. Sundejte misku z vodní lázně, a pokud není skleněná, zchlaďte ji, ať se žloutky nepřehřívají.Rozmíchejte mascarpone a pomalu do něj přidávejte žloutkový krém. Pečlivě vyšlehejte, aby se obě hmoty spojily.Ušlehejte šlehačku a přimíchejte ji k mascarpone se žloutkovým krémem. Snažte se zachovat vzduchové bublinky. Jde vám přece o lehký, nadýchaný krém.Nachystejte si hranatou misku nebo pekáček a můžete se pustit do skládání piškotů. Cukrářské piškoty namáčejte do kávy s amarettem a skládejte je vedle sebe do pekáče.Když spotřebujete polovinu piškotů, přelijte je polovinou krému. Vyskládejte na něj druhou vrstvu namočených piškotů a přelijte je zbylým krémem.Přes sítko poprašte tiramisu kakaem a nechte v lednici alespoň tři hodiny chladit.', 60, 4, 'italske_tiramisu.png'),
(6, 'Mojito', 'Do sklenice dáme nakrájenou limetku, 8 lístků máty a třtinový cukr. Vše podrtíme. Sklenici naplníme ledem,nalijeme bílý rum a dolijeme sodovkou. Ozdobíme kolečkem limetky a brčkem.', 10, 5, 'mojito.png'),
(7, 'Americké brambory', 'Brambory omyjeme a důkladně očistíme a pokrájíme na měsíčky. Troubu si předehřejeme cca na 200°C. Na plech nalijeme olej a poklademe čtvrtky brambor tak, aby se nedotýkaly. Posypeme kořením. Potom každou bramboru obrátíme a opět posypeme kořením. Plech vložíme do trouby a americké brambory pečeme 20-30 minut, dokud brambory nezměknou.', 40, 6, 'americke_brambory.png'),
(8, 'Špagety s tofu omáčkou', 'V hrnci přiveďte k varu osolenou vodu a špagety v ní uvařte podle návodu na obalu (cca 8–10 minut na středním plameni). Mezitím na pánvi rozehřejte řepkový olej a na středním plameni na něm osmažte cibuli (2–3 minuty). Přidejte česnek a restujte cca 2 minuty na středním plameni. Poté přisypte najemno nastrouhané tofu a opékejte dalších 5 minut (stále na středním plameni). Zalijte sójovou smetanou, přidejte medvědí česnek a dochuťte solí. Omáčku promíchejte s těstovinami a špenátem a podávejte.', 25, 7, 'spagety_tofu.png'),
(9, 'Česnečka', 'V hrnci na másle lehce osmažte nakrájenou cibuli. Zalijte ji vodou nebo zeleninovým vývarem a přidejte vařit na malé kostičky nakrájené brambory s kmínem, bobkovým listem a novým kořením. Jakmile cibule trochu povolí, přidejte na plátky nakrájený česnek (5 stroužků). Zbytek česneku prolisujte a přidejte v poslední minutce vaření, aby si zachoval co nejvíc vitamínů a výrazné chuti. Ochucujte podle potřeby majoránkou, petrželí nebo libečkem, pepřem a solí. Na závěr, jakmile vypnete sporák, přidejte prolisovaný česnek a 1 rozšlehané vejce.', 30, 3, 'cesnekova_polevka.png'),
(10, 'Míša řezy', 'Vyšleháme žloutky s moučkovým cukrem. Přidáme olej, mouku smíchanou s práškem do pečiva, kakao a opatrně vmícháme ušlehaný tuhý sníh. Vytvořené těsto pečeme v předehřáté troubě asi 10 minut při 180 °C na vymazaném a hrubou moukou vysypaném plechu. Po upečení piškot necháme vychladnout. Během chladnutí korpusu umícháme jemný krém z tvarohu, másla a cukru. Vychladlý piškotový plát potřeme krémem a necháme v chladu ztuhnout. Připravíme polevu: Do rozpuštěného tuku nalámeme čokoládu a mícháme, až vznikne hladká hmota. Za stálého míchání postupně přidáváme lžíce mléka. Hladkou polevou polijeme moučník a necháme ztuhnout.', 50, 4, 'misa_rezy.png'),
(11, 'Guláš', 'Cibuli oloupeme a nakrájíme nadrobno. V kastrole rozehřejeme sádlo a cibuli na něm restujeme dohněda, trvá to asi 15 minut. Na cibuli přidáme papriku, dobře promícháme a postupujeme rychle, aby paprika nezhořkla. Následně přidáme kousky masa, ze všech stran je opečeme a dobře mícháme (guláš se má přichytávat ke dnu hrnce, ale ne připalovat). Když je maso opečené, osolíme (cca 10 špetek) a opepříme. Přidáme rajský protlak, dobře promícháme a zalijeme malým množstvím vody - asi 2 dl. Do základu přisypeme kmín, prolisovaný česnek a necháme dusit na co nejnižší teplotě. Guláš stále hlídáme a občas mícháme. Přiléváme vodu po menších částech, protože jak již bylo řečeno, měl by se přichytávat, ovšem nikoli připalovat. Po cca hodině a půl maso ochutnáme a pokud je měkké, přidáme v dlaních rozemnutou majoránku a povaříme ještě 10 minut. Guláš nemusíme (a ani bychom neměli) zahušťovat, postaral se o to rozvařený cibulový základ. Jediné povolené zahušťovadlo je v případě potřeby chlebová strouhanka. Podáváme posypané čerstvě nakrájenou cibulí, nejlépe s houskovým knedlíkem, případně s bramboráčky nebo těstovinami.', 130, 2, 'gulas.png');

-- --------------------------------------------------------

--
-- Struktura tabulky `recept_has_suroviny`
--

CREATE TABLE `recept_has_suroviny` (
  `jednotky_id` int(10) UNSIGNED NOT NULL,
  `recept_id` int(10) UNSIGNED NOT NULL,
  `suroviny_id` int(10) UNSIGNED NOT NULL,
  `mnozstvi` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `recept_has_suroviny`
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
(14, 2, 46, 8),
(18, 3, 21, 1),
(17, 3, 22, 2),
(8, 3, 23, 800),
(17, 3, 26, 1),
(8, 3, 28, 100),
(20, 3, 29, 5),
(16, 3, 32, 1),
(14, 3, 35, 1),
(18, 3, 36, 1),
(8, 3, 47, 300),
(8, 3, 48, 50),
(17, 3, 49, 2),
(8, 3, 50, 100),
(10, 3, 51, 250),
(18, 3, 52, 3),
(18, 3, 53, 5),
(17, 3, 54, 1),
(16, 4, 29, 1),
(16, 4, 32, 1),
(13, 4, 37, 4),
(10, 4, 40, 165),
(8, 4, 42, 60),
(8, 4, 55, 200),
(18, 4, 56, 1),
(18, 4, 57, 2),
(18, 4, 58, 1),
(21, 4, 59, 1),
(18, 4, 60, 2),
(17, 4, 61, 1),
(18, 4, 62, 2),
(10, 5, 51, 100),
(18, 5, 57, 2),
(10, 5, 63, 200),
(10, 5, 64, 50),
(8, 5, 66, 500),
(18, 5, 67, 20),
(17, 5, 68, 2),
(18, 6, 69, 1),
(10, 6, 70, 100),
(10, 6, 71, 150),
(18, 6, 72, 8),
(21, 6, 73, 3),
(18, 7, 19, 9),
(17, 7, 28, 8),
(16, 7, 29, 1),
(16, 7, 32, 1),
(16, 7, 74, 5),
(18, 8, 21, 2),
(13, 8, 37, 4),
(8, 8, 75, 240),
(8, 8, 76, 400),
(10, 8, 77, 400),
(21, 8, 78, 2),
(8, 8, 79, 100),
(17, 8, 80, 4),
(18, 9, 19, 4),
(18, 9, 21, 1),
(16, 9, 29, 1),
(16, 9, 30, 1),
(16, 9, 32, 1),
(18, 9, 33, 1),
(14, 9, 35, 1),
(13, 9, 37, 10),
(18, 9, 52, 1),
(20, 9, 53, 2),
(12, 9, 81, 1),
(16, 9, 82, 1),
(16, 9, 83, 1),
(17, 10, 28, 2),
(18, 10, 33, 6),
(8, 10, 35, 350),
(17, 10, 68, 3),
(8, 10, 84, 300),
(17, 10, 85, 6),
(21, 10, 86, 1),
(8, 10, 87, 500),
(8, 10, 88, 120),
(17, 10, 89, 2),
(8, 11, 21, 500),
(8, 11, 23, 500),
(16, 11, 29, 1),
(16, 11, 32, 1),
(13, 11, 37, 4),
(18, 11, 81, 1),
(17, 11, 82, 1),
(21, 11, 83, 1),
(17, 11, 90, 3),
(17, 11, 91, 2),
(18, 11, 92, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `suroviny`
--

CREATE TABLE `suroviny` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `suroviny`
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
(46, 'Pancetta'),
(47, 'Kořenová zelenina'),
(48, 'Plnotučná hořčice'),
(49, 'Ocet'),
(50, 'Uzená slanina'),
(51, 'Smetana na šlehání 33%'),
(52, 'Bobkový list'),
(53, 'Nové koření'),
(54, 'Citronová šťáva'),
(55, 'Kuřecí prsa'),
(56, 'Francouzská bageta'),
(57, 'Žloutek'),
(58, 'Citron'),
(59, 'Dijonská hořčice'),
(60, 'Ančovičky'),
(61, 'Balzamikový ocet'),
(62, 'Římský salát'),
(63, 'Espresso'),
(64, 'Amaretto'),
(65, 'Cukr krupice'),
(66, 'Mascarpone'),
(67, 'Cukrářské piškoty'),
(68, 'Kakao'),
(69, 'Limetka'),
(70, 'Bílý rum'),
(71, 'Sodovka'),
(72, 'Máta'),
(73, 'Hnědý cukr'),
(74, 'Grilovací koření'),
(75, 'Celozrnné špagety'),
(76, 'Uzené tofu'),
(77, 'Sójová smetana'),
(78, 'Sušený medvědí česnek'),
(79, 'Baby špenát'),
(80, 'Řepkový olej'),
(81, 'Voda'),
(82, 'Majoránka'),
(83, 'Kmín'),
(84, 'Cukr moučka'),
(85, 'Polohrubá mouka'),
(86, 'Prášek do pečiva'),
(87, 'Tvaroh'),
(88, 'Čokoláda'),
(89, 'Mléko'),
(90, 'Sádlo'),
(91, 'Sladká mletá paprika'),
(92, 'Rajský protlak');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `jednotky`
--
ALTER TABLE `jednotky`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `recept`
--
ALTER TABLE `recept`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recept_kategorie1_idx` (`kategorie_id`);

--
-- Indexy pro tabulku `recept_has_suroviny`
--
ALTER TABLE `recept_has_suroviny`
  ADD PRIMARY KEY (`recept_id`,`suroviny_id`),
  ADD KEY `fk_recept_has_suroviny_jednotky1_idx` (`jednotky_id`),
  ADD KEY `fk_recept_has_suroviny_recept1_idx` (`recept_id`),
  ADD KEY `fk_recept_has_suroviny_suroviny1_idx` (`suroviny_id`);

--
-- Indexy pro tabulku `suroviny`
--
ALTER TABLE `suroviny`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `jednotky`
--
ALTER TABLE `jednotky`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `recept`
--
ALTER TABLE `recept`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pro tabulku `suroviny`
--
ALTER TABLE `suroviny`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `recept`
--
ALTER TABLE `recept`
  ADD CONSTRAINT `fk_recept_kategorie1` FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `recept_has_suroviny`
--
ALTER TABLE `recept_has_suroviny`
  ADD CONSTRAINT `fk_recept_has_suroviny_jednotky1` FOREIGN KEY (`jednotky_id`) REFERENCES `jednotky` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recept_has_suroviny_recept1` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recept_has_suroviny_suroviny1` FOREIGN KEY (`suroviny_id`) REFERENCES `suroviny` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
