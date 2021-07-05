-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Jul 2021 um 16:30
-- Server-Version: 10.4.19-MariaDB
-- PHP-Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `lbdb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `champion`
--

CREATE TABLE `champion` (
  `id` int(11) NOT NULL,
  `src` varchar(120) NOT NULL,
  `name` varchar(20) NOT NULL,
  `image_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `champion`
--

INSERT INTO `champion` (`id`, `src`, `name`, `image_name`) VALUES
(1, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Annie.png', 'Annie', 'Annie.png'),
(2, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Olaf.png', 'Olaf', 'Olaf.png'),
(3, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Galio.png', 'Galio', 'Galio.png'),
(4, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/TwistedFate.png', 'Twisted Fate', 'TwistedFate.png'),
(5, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/XinZhao.png', 'Xin Zhao', 'XinZhao.png'),
(6, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Urgot.png', 'Urgot', 'Urgot.png'),
(7, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Leblanc.png', 'LeBlanc', 'Leblanc.png'),
(8, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Vladimir.png', 'Vladimir', 'Vladimir.png'),
(9, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Fiddlesticks.png', 'Fiddlesticks', 'Fiddlesticks.png'),
(10, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Kayle.png', 'Kayle', 'Kayle.png'),
(11, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/MasterYi.png', 'Master Yi', 'MasterYi.png'),
(12, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Alistar.png', 'Alistar', 'Alistar.png'),
(13, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Ryze.png', 'Ryze', 'Ryze.png'),
(14, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Sion.png', 'Sion', 'Sion.png'),
(15, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Sivir.png', 'Sivir', 'Sivir.png'),
(16, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Soraka.png', 'Soraka', 'Soraka.png'),
(17, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Teemo.png', 'Teemo', 'Teemo.png'),
(18, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Tristana.png', 'Tristana', 'Tristana.png'),
(19, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Warwick.png', 'Warwick', 'Warwick.png'),
(20, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Nunu.png', 'Nunu & Willump', 'Nunu.png'),
(21, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/MissFortune.png', 'Miss Fortune', 'MissFortune.png'),
(22, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Ashe.png', 'Ashe', 'Ashe.png'),
(23, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Tryndamere.png', 'Tryndamere', 'Tryndamere.png'),
(24, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Jax.png', 'Jax', 'Jax.png'),
(25, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Morgana.png', 'Morgana', 'Morgana.png'),
(26, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Zilean.png', 'Zilean', 'Zilean.png'),
(27, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Singed.png', 'Singed', 'Singed.png'),
(28, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Evelynn.png', 'Evelynn', 'Evelynn.png'),
(29, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Twitch.png', 'Twitch', 'Twitch.png'),
(30, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Karthus.png', 'Karthus', 'Karthus.png'),
(31, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Chogath.png', 'Cho\'Gath', 'Chogath.png'),
(32, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Amumu.png', 'Amumu', 'Amumu.png'),
(33, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Rammus.png', 'Rammus', 'Rammus.png'),
(34, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Anivia.png', 'Anivia', 'Anivia.png'),
(35, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Shaco.png', 'Shaco', 'Shaco.png'),
(36, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/DrMundo.png', 'Dr. Mundo', 'DrMundo.png'),
(37, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Sona.png', 'Sona', 'Sona.png'),
(38, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Kassadin.png', 'Kassadin', 'Kassadin.png'),
(39, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Irelia.png', 'Irelia', 'Irelia.png'),
(40, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Janna.png', 'Janna', 'Janna.png'),
(41, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Gangplank.png', 'Gangplank', 'Gangplank.png'),
(42, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Corki.png', 'Corki', 'Corki.png'),
(43, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Karma.png', 'Karma', 'Karma.png'),
(44, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Taric.png', 'Taric', 'Taric.png'),
(45, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Veigar.png', 'Veigar', 'Veigar.png'),
(48, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Trundle.png', 'Trundle', 'Trundle.png'),
(50, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Swain.png', 'Swain', 'Swain.png'),
(51, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Caitlyn.png', 'Caitlyn', 'Caitlyn.png'),
(53, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Blitzcrank.png', 'Blitzcrank', 'Blitzcrank.png'),
(54, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Malphite.png', 'Malphite', 'Malphite.png'),
(55, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Katarina.png', 'Katarina', 'Katarina.png'),
(56, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Nocturne.png', 'Nocturne', 'Nocturne.png'),
(57, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Maokai.png', 'Maokai', 'Maokai.png'),
(58, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Renekton.png', 'Renekton', 'Renekton.png'),
(59, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/JarvanIV.png', 'Jarvan IV.', 'JarvanIV.png'),
(60, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Elise.png', 'Elise', 'Elise.png'),
(61, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Orianna.png', 'Orianna', 'Orianna.png'),
(62, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/MonkeyKing.png', 'Wukong', 'MonkeyKing.png'),
(63, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Brand.png', 'Brand', 'Brand.png'),
(64, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/LeeSin.png', 'Lee Sin', 'LeeSin.png'),
(67, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Vayne.png', 'Vayne', 'Vayne.png'),
(68, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Rumble.png', 'Rumble', 'Rumble.png'),
(69, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Cassiopeia.png', 'Cassiopeia', 'Cassiopeia.png'),
(72, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Skarner.png', 'Skarner', 'Skarner.png'),
(74, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Heimerdinger.png', 'Heimerdinger', 'Heimerdinger.png'),
(75, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Nasus.png', 'Nasus', 'Nasus.png'),
(76, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Nidalee.png', 'Nidalee', 'Nidalee.png'),
(77, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Udyr.png', 'Udyr', 'Udyr.png'),
(78, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Poppy.png', 'Poppy', 'Poppy.png'),
(79, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Gragas.png', 'Gragas', 'Gragas.png'),
(80, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Pantheon.png', 'Pantheon', 'Pantheon.png'),
(81, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Ezreal.png', 'Ezreal', 'Ezreal.png'),
(82, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Mordekaiser.png', 'Mordekaiser', 'Mordekaiser.png'),
(83, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Yorick.png', 'Yorick', 'Yorick.png'),
(84, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Akali.png', 'Akali', 'Akali.png'),
(85, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Kennen.png', 'Kennen', 'Kennen.png'),
(86, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Garen.png', 'Garen', 'Garen.png'),
(89, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Leona.png', 'Leona', 'Leona.png'),
(90, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Malzahar.png', 'Malzahar', 'Malzahar.png'),
(91, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Talon.png', 'Talon', 'Talon.png'),
(92, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Riven.png', 'Riven', 'Riven.png'),
(96, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/KogMaw.png', 'Kog\'Maw', 'KogMaw.png'),
(98, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Shen.png', 'Shen', 'Shen.png'),
(99, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Lux.png', 'Lux', 'Lux.png'),
(101, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Xerath.png', 'Xerath', 'Xerath.png'),
(102, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Shyvana.png', 'Shyvana', 'Shyvana.png'),
(103, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Ahri.png', 'Ahri', 'Ahri.png'),
(104, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Graves.png', 'Graves', 'Graves.png'),
(105, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Fizz.png', 'Fizz', 'Fizz.png'),
(106, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Volibear.png', 'Volibear', 'Volibear.png'),
(107, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Rengar.png', 'Rengar', 'Rengar.png'),
(110, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Varus.png', 'Varus', 'Varus.png'),
(111, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Nautilus.png', 'Nautilus', 'Nautilus.png'),
(112, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Viktor.png', 'Viktor', 'Viktor.png'),
(113, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Sejuani.png', 'Sejuani', 'Sejuani.png'),
(114, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Fiora.png', 'Fiora', 'Fiora.png'),
(115, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Ziggs.png', 'Ziggs', 'Ziggs.png'),
(117, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Lulu.png', 'Lulu', 'Lulu.png'),
(119, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Draven.png', 'Draven', 'Draven.png'),
(120, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Hecarim.png', 'Hecarim', 'Hecarim.png'),
(121, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Khazix.png', 'Kha\'Zix', 'Khazix.png'),
(122, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Darius.png', 'Darius', 'Darius.png'),
(126, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Jayce.png', 'Jayce', 'Jayce.png'),
(127, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Lissandra.png', 'Lissandra', 'Lissandra.png'),
(131, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Diana.png', 'Diana', 'Diana.png'),
(133, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Quinn.png', 'Quinn', 'Quinn.png'),
(134, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Syndra.png', 'Syndra', 'Syndra.png'),
(136, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/AurelionSol.png', 'Aurelion Sol', 'AurelionSol.png'),
(141, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Kayn.png', 'Kayn', 'Kayn.png'),
(142, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Zoe.png', 'Zoe', 'Zoe.png'),
(143, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Zyra.png', 'Zyra', 'Zyra.png'),
(145, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Kaisa.png', 'Kai\'Sa', 'Kaisa.png'),
(147, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Seraphine.png', 'Seraphine', 'Seraphine.png'),
(150, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Gnar.png', 'Gnar', 'Gnar.png'),
(154, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Zac.png', 'Zac', 'Zac.png'),
(157, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Yasuo.png', 'Yasuo', 'Yasuo.png'),
(161, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Velkoz.png', 'Vel\'Koz', 'Velkoz.png'),
(163, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Taliyah.png', 'Taliyah', 'Taliyah.png'),
(164, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Camille.png', 'Camille', 'Camille.png'),
(201, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Braum.png', 'Braum', 'Braum.png'),
(202, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Jhin.png', 'Jhin', 'Jhin.png'),
(203, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Kindred.png', 'Kindred', 'Kindred.png'),
(222, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Jinx.png', 'Jinx', 'Jinx.png'),
(223, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/TahmKench.png', 'Tahm Kench', 'TahmKench.png'),
(234, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Viego.png', 'Viego', 'Viego.png'),
(235, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Senna.png', 'Senna', 'Senna.png'),
(236, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Lucian.png', 'Lucian', 'Lucian.png'),
(238, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Zed.png', 'Zed', 'Zed.png'),
(240, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Kled.png', 'Kled', 'Kled.png'),
(245, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Ekko.png', 'Ekko', 'Ekko.png'),
(246, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Qiyana.png', 'Qiyana', 'Qiyana.png'),
(254, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Vi.png', 'Vi', 'Vi.png'),
(266, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Aatrox.png', 'Aatrox', 'Aatrox.png'),
(267, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Nami.png', 'Nami', 'Nami.png'),
(268, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Azir.png', 'Azir', 'Azir.png'),
(350, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Yuumi.png', 'Yuumi', 'Yuumi.png'),
(360, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Samira.png', 'Samira', 'Samira.png'),
(412, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Thresh.png', 'Thresh', 'Thresh.png'),
(420, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Illaoi.png', 'Illaoi', 'Illaoi.png'),
(421, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/RekSai.png', 'Rek\'Sai', 'RekSai.png'),
(427, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Ivern.png', 'Ivern', 'Ivern.png'),
(429, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Kalista.png', 'Kalista', 'Kalista.png'),
(432, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Bard.png', 'Bard', 'Bard.png'),
(497, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Rakan.png', 'Rakan', 'Rakan.png'),
(498, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Xayah.png', 'Xayah', 'Xayah.png'),
(516, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Ornn.png', 'Ornn', 'Ornn.png'),
(517, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Sylas.png', 'Sylas', 'Sylas.png'),
(518, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Neeko.png', 'Neeko', 'Neeko.png'),
(523, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Aphelios.png', 'Aphelios', 'Aphelios.png'),
(526, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Rell.png', 'Rell', 'Rell.png'),
(555, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Pyke.png', 'Pyke', 'Pyke.png'),
(777, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Yone.png', 'Yone', 'Yone.png'),
(875, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Sett.png', 'Sett', 'Sett.png'),
(876, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Lillia.png', 'Lillia', 'Lillia.png'),
(887, 'https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/Gwen.png', 'Gwen', 'Gwen.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comp`
--

CREATE TABLE `comp` (
  `id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `champion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `concept_room`
--

CREATE TABLE `concept_room` (
  `note` varchar(300) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `comp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `party`
--

CREATE TABLE `party` (
  `id` int(11) NOT NULL,
  `invite_key` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `owner_mail` varchar(320) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tierlist`
--

CREATE TABLE `tierlist` (
  `tool_id` int(11) NOT NULL,
  `rank` varchar(2) NOT NULL,
  `champion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tool`
--

CREATE TABLE `tool` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `party_id` int(11) NOT NULL,
  `type_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `email` varchar(320) NOT NULL,
  `password` varchar(32) NOT NULL,
  `league_name` varchar(16) NOT NULL,
  `region` varchar(5) NOT NULL,
  `auth` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`email`, `password`, `league_name`, `region`, `auth`) VALUES
('test@test.test', 'test', 'Chaınbreaker', 'euw1', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_in_party`
--

CREATE TABLE `user_in_party` (
  `party_id` int(11) NOT NULL,
  `user_email` varchar(320) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `champion`
--
ALTER TABLE `champion`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `comp`
--
ALTER TABLE `comp`
  ADD PRIMARY KEY (`id`,`role`,`champion`);

--
-- Indizes für die Tabelle `concept_room`
--
ALTER TABLE `concept_room`
  ADD PRIMARY KEY (`note`,`tool_id`,`comp_id`);

--
-- Indizes für die Tabelle `party`
--
ALTER TABLE `party`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tierlist`
--
ALTER TABLE `tierlist`
  ADD PRIMARY KEY (`tool_id`,`rank`,`champion`);

--
-- Indizes für die Tabelle `tool`
--
ALTER TABLE `tool`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Indizes für die Tabelle `user_in_party`
--
ALTER TABLE `user_in_party`
  ADD PRIMARY KEY (`party_id`,`user_email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `comp`
--
ALTER TABLE `comp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `party`
--
ALTER TABLE `party`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `tool`
--
ALTER TABLE `tool`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
