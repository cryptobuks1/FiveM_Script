-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2021 at 06:16 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fivem`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'Ambulance', 1),
('society_cardealer', 'Concessionnaire', 1),
('society_mechanic', 'Mécano', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_ambulance', 0, NULL),
(2, 'society_mechanic', 0, NULL),
(3, 'society_police', 0, NULL),
(4, 'society_cardealer', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'Ambulance', 1),
('society_cardealer', 'Concesionnaire', 1),
('society_mechanic', 'Mécano', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bbvehicles`
--

CREATE TABLE `bbvehicles` (
  `plate` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`) VALUES
(1, 'steam:11000010a665804', 'Demub', 'GG', '1996-12-22', 'M', '168', '4586'),
(2, 'steam:1100001088aac30', 'jjj', 'jj', '1990-01-01', 'M', '200', '5991'),
(3, 'steam:1100001088aac30', 'Jay', 'Luther', '1997-06-13', 'm', '170', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crew_phone_bank`
--

CREATE TABLE `crew_phone_bank` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crew_phone_news`
--

CREATE TABLE `crew_phone_news` (
  `id` int(11) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'Ambulance', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  `weight` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`, `weight`) VALUES
('bandage', 'Bandage', -1, 0, 1, 2),
('bread', 'Bread', 10, 0, 1, 1),
('fixkit1', 'ชุดซ่อมช่าง', -1, 0, 1, 3),
('green_phone', 'Iphone (Green)', 1, 0, 1, 1),
('medikit', 'Medikit', -1, 0, 1, 2),
('water', 'Water', 10, 0, 1, 1),
('white_phone', 'Iphone (White)', 1, 0, 1, 1),
('yellow_phone', 'Iphone (Yellow)', 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`) VALUES
('ambulance', 'Ambulance'),
('cardealer', 'Concessionnaire'),
('mechanic', 'Mecano'),
('police', 'LSPD'),
('unemployed', 'Unemployed');

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 2000, '{}', '{}'),
(15, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(16, 'ambulance', 1, 'doctor', 'Medecin', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(17, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(18, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(19, 'mechanic', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
(20, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
(21, 'mechanic', 2, 'experimente', 'Experimente', 36, '{}', '{}'),
(22, 'mechanic', 3, 'chief', 'Chef d\'équipe', 48, '{}', '{}'),
(23, 'mechanic', 4, 'boss', 'Patron', 0, '{}', '{}'),
(24, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
(25, 'police', 1, 'officer', 'Officier', 40, '{}', '{}'),
(26, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
(27, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
(28, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}'),
(29, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(30, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(31, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(32, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(40) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) NOT NULL DEFAULT 'civ',
  `category` varchar(50) DEFAULT NULL,
  `name` varchar(60) NOT NULL DEFAULT 'Unknown',
  `fuel` int(11) NOT NULL DEFAULT 100,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `image` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `category`, `name`, `fuel`, `stored`, `image`) VALUES
('steam:11000010a665804', 'CJY 149', '{\"modBackWheels\":-1,\"modHydrolic\":-1,\"modXenon\":false,\"modBrakes\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"modAirFilter\":-1,\"modHood\":-1,\"modRearBumper\":-1,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modArmor\":-1,\"modSteeringWheel\":-1,\"modSeats\":-1,\"modSuspension\":-1,\"modFender\":-1,\"modEngine\":-1,\"modWindows\":-1,\"color2\":112,\"pearlescentColor\":0,\"neonEnabled\":[false,false,false,false],\"modTurbo\":false,\"health\":1000.0,\"modExhaust\":-1,\"modVanityPlate\":-1,\"modStruts\":-1,\"modShifterLeavers\":-1,\"modPlateHolder\":-1,\"modFrontBumper\":-1,\"extras\":{\"2\":true,\"7\":true,\"1\":true},\"modLivery\":-1,\"modRoof\":-1,\"modFrame\":-1,\"modSpoilers\":-1,\"tyres\":[2,2,2,2,2,2,2],\"modTrimB\":-1,\"modTank\":-1,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"modArchCover\":-1,\"modAPlate\":-1,\"modEngineBlock\":-1,\"model\":745926877,\"modDashboard\":-1,\"plate\":\"CJY 149\",\"modFrontWheels\":-1,\"plateIndex\":4,\"modOrnaments\":-1,\"wheels\":0,\"modAerials\":-1,\"neonColor\":[255,0,255],\"dirtLevel\":9.0,\"tyreSmokeColor\":[255,255,255],\"windowTint\":-1,\"modDial\":-1,\"wheelColor\":156,\"modGrille\":-1,\"doors\":{\"1\":true,\"2\":true,\"3\":true,\"4\":true,\"5\":true,\"0\":true},\"color1\":0,\"modTrunk\":-1,\"modSpeakers\":-1,\"windows\":{\"1\":1,\"2\":1,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":1},\"modTransmission\":-1}', 'helicopter', 'ambulance', NULL, 'Unknown', 100, 0, NULL),
('steam:11000010a665804', 'UJA 815', '{\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modXenon\":false,\"extras\":[],\"modArchCover\":-1,\"tyres\":[2,2,2,2,2,2,2],\"modRoof\":-1,\"modFrame\":-1,\"modBackWheels\":-1,\"modEngine\":-1,\"modTrunk\":-1,\"neonEnabled\":[false,false,false,false],\"health\":1000.0,\"modTransmission\":-1,\"modRightFender\":-1,\"modSeats\":-1,\"modAerials\":-1,\"modHydrolic\":-1,\"modFender\":-1,\"tyreSmokeColor\":[255,255,255],\"modTurbo\":false,\"dirtLevel\":7.0,\"model\":-2007026063,\"modSmokeEnabled\":false,\"modWindows\":-1,\"modEngineBlock\":-1,\"plateIndex\":4,\"modSuspension\":-1,\"modVanityPlate\":-1,\"modFrontWheels\":-1,\"modHorns\":-1,\"windowTint\":-1,\"modSpeakers\":-1,\"modLivery\":-1,\"modPlateHolder\":-1,\"modArmor\":-1,\"modSteeringWheel\":-1,\"modBrakes\":-1,\"wheelColor\":156,\"modSpoilers\":-1,\"modDial\":-1,\"color1\":77,\"modAirFilter\":-1,\"doors\":{\"1\":true,\"2\":true,\"3\":true,\"4\":true,\"5\":true,\"0\":true},\"modGrille\":-1,\"modAPlate\":-1,\"modDoorSpeaker\":-1,\"modTank\":-1,\"neonColor\":[255,0,255],\"modStruts\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"pearlescentColor\":0,\"wheels\":0,\"color2\":0,\"plate\":\"UJA 815\",\"modSideSkirt\":-1,\"modShifterLeavers\":-1,\"modHood\":-1,\"modOrnaments\":-1,\"modTrimA\":-1,\"windows\":{\"1\":1,\"2\":1,\"3\":1,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":1},\"modDashboard\":-1}', 'car', 'police', NULL, 'Unknown', 100, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL,
  `num` varchar(10) NOT NULL,
  `incoming` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 30),
(2, 'TwentyFourSeven', 'water', 15),
(3, 'RobsLiquor', 'bread', 30),
(4, 'RobsLiquor', 'water', 15),
(5, 'LTDgasoline', 'bread', 30),
(6, 'LTDgasoline', 'water', 15),
(7, 'TwentyFourSeven', 'yellow_phone', 500),
(8, 'RobsLiquor', 'yellow_phone', 500),
(9, 'LTDgasoline', 'yellow_phone', 500),
(10, 'TwentyFourSeven', 'green_phone', 500),
(11, 'TwentyFourSeven', 'white_phone', 500),
(12, 'RobsLiquor', 'green_phone', 500),
(13, 'RobsLiquor', 'white_phone', 500),
(14, 'LTDgasoline', 'green_phone', 500),
(15, 'LTDgasoline', 'white_phone', 500);

-- --------------------------------------------------------

--
-- Table structure for table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `twitter_accounts`
--

INSERT INTO `twitter_accounts` (`id`, `username`, `password`, `avatar_url`, `identifier`) VALUES
(40, 'Jay Luther', '0', NULL, 'steam:1100001088aac30');

-- --------------------------------------------------------

--
-- Table structure for table `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `crypto` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`, `status`, `phone_number`, `crypto`) VALUES
('test', 'test', 1, 'test', 'test', 'unemployed', 0, 'test', 'test', 1, 1, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', ''),
('steam:1100001088aac30', 'license:e4491b3e9cefdabcaed01d73a993b28a716dd914', 5058594, 'Luther', '{\"pants_2\":4,\"glasses_1\":0,\"sex\":0,\"pants_1\":61,\"torso_1\":15,\"arms\":15,\"shoes_1\":34,\"tshirt_1\":15}', 'unemployed', 0, '[]', '{\"z\":29.3,\"y\":-1354.9,\"x\":29.5}', 10500, 0, 'superadmin', 'Jay', 'Luther', '1997-06-13', 'm', '170', NULL, '[{\"val\":940100,\"percent\":94.01,\"name\":\"hunger\"},{\"val\":646750,\"percent\":64.67500000000001,\"name\":\"thirst\"}]', '848-8790', '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}');

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(1, 'steam:11000010a665804', 'black_money', 0),
(2, 'steam:1100001088aac30', 'black_money', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_clothes`
--

CREATE TABLE `user_clothes` (
  `identifier` varchar(255) NOT NULL,
  `skin` varchar(255) NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` varchar(255) NOT NULL DEFAULT '0',
  `face_texture` varchar(255) NOT NULL DEFAULT '0',
  `hair` varchar(255) NOT NULL DEFAULT '11',
  `hair_texture` varchar(255) NOT NULL DEFAULT '4',
  `shirt` varchar(255) NOT NULL DEFAULT '0',
  `shirt_texture` varchar(255) NOT NULL DEFAULT '0',
  `pants` varchar(255) NOT NULL DEFAULT '8',
  `pants_texture` varchar(255) NOT NULL DEFAULT '0',
  `shoes` varchar(255) NOT NULL DEFAULT '1',
  `shoes_texture` varchar(255) NOT NULL DEFAULT '0',
  `vest` varchar(255) NOT NULL DEFAULT '0',
  `vest_texture` varchar(255) NOT NULL DEFAULT '0',
  `bag` varchar(255) NOT NULL DEFAULT '40',
  `bag_texture` varchar(255) NOT NULL DEFAULT '0',
  `hat` varchar(255) NOT NULL DEFAULT '1',
  `hat_texture` varchar(255) NOT NULL DEFAULT '1',
  `mask` varchar(255) NOT NULL DEFAULT '0',
  `mask_texture` varchar(255) NOT NULL DEFAULT '0',
  `glasses` varchar(255) NOT NULL DEFAULT '6',
  `glasses_texture` varchar(255) NOT NULL DEFAULT '0',
  `gloves` varchar(255) NOT NULL DEFAULT '2',
  `gloves_texture` varchar(255) NOT NULL DEFAULT '0',
  `jacket` varchar(255) NOT NULL DEFAULT '7',
  `jacket_texture` varchar(255) NOT NULL DEFAULT '2',
  `ears` varchar(255) NOT NULL DEFAULT '1',
  `ears_texture` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_inventory`
--

INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
(1, 'steam:1100001088aac30', 'bread', 0),
(2, 'steam:1100001088aac30', 'water', 6),
(3, 'steam:1100001088aac30', 'blue_phone', 1),
(4, 'steam:1100001088aac30', 'green_phone', 1),
(5, 'steam:1100001088aac30', 'white_phone', 1),
(10, 'steam:1100001088aac30', 'medikit', 0),
(11, 'steam:1100001088aac30', 'fixkit1', 0),
(12, 'steam:1100001088aac30', 'bandage', 0),
(13, 'steam:1100001088aac30', 'yellow_phone', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
('Adder', 'adder', 200000, 'super', 2),
('Akuma', 'akuma', 15000, 'motorcycles', 1),
('Alpha', 'alpha', 100000, 'sports', 2),
('Ardent', 'ardent', 50000, 'sportsclassics', 1),
('Asea', 'asea', 10000, 'sedans', 1),
('Asterope', 'asterope', 30000, 'sedans', 0),
('Autarch', 'autarch', 1000000, 'super', 2),
('Avarus', 'avarus', 19000, 'motorcycles', 0),
('Baller', 'baller', 300000, 'suvs', 2),
('Baller Super', 'baller4', 350000, 'suvs', 2),
('Banshee', 'banshee', 90000, 'sports', 2),
('Banshee 900R', 'banshee2', 300000, 'super', 0),
('Bati', 'bati', 50000, 'motorcycles', 0),
('Bestia GTS', 'bestiagts', 78000, 'sports', 0),
('Bf Injection', 'bfinjection', 15000, 'offroad', 0),
('Bifta', 'bifta', 18000, 'offroad', 1),
('Bison', 'bison', 250000, 'vans', 2),
('BJXL', 'bjxl', 150000, 'suvs', 2),
('Blade', 'blade', 50000, 'muscle', 2),
('Blista', 'blista', 50000, 'compacts', 2),
('Blista S', 'blista2', 60000, 'sports', 2),
('Blista GT', 'blista3', 65000, 'sports', 2),
('Bobcatxl', 'bobcatxl', 300000, 'vans', 2),
('Brawler', 'brawler', 150000, 'offroad', 1),
('Brioso', 'brioso', 62000, 'compacts', 2),
('Btype', 'btype', 90000, 'sportsclassics', 1),
('Btype SC', 'btype2', 95000, 'sportsclassics', 1),
('Btype S', 'btype3', 99000, 'sportsclassics', 2),
('Buccaneer', 'buccaneer', 155000, 'muscle', 0),
('Buffalo', 'buffalo', 68000, 'sports', 0),
('Buffalo GT', 'buffalo3', 70000, 'sports', 2),
('Bullet', 'bullet', 95000, 'super', 1),
('Camper', 'camper', 60000, 'vans', 2),
('Carboni', 'carbonizzare', 195000, 'sports', 2),
('Carbonr S', 'carbonrs', 31200, 'motorcycles', 1),
('Casco', 'casco', 42000, 'sportsclassics', 0),
('Cavalcade', 'cavalcade', 92000, 'suvs', 2),
('Cheetah', 'cheetah', 2500000, 'super', 2),
('Cheetah SC', 'cheetah2', 2800000, 'sportsclassics', 2),
('Chino', 'chino', 70000, 'muscle', 0),
('Chino S', 'chino2', 75000, 'muscle', 2),
('Cliff hanger', 'cliffhanger', 15800, 'motorcycles', 2),
('COG55', 'cog55', 210000, 'sedans', 0),
('Cogcabrio', 'cogcabrio', 70000, 'coupes', 2),
('Cognoscenti', 'cognoscenti', 200000, 'sedans', 2),
('Comet SX', 'comet2', 120000, 'sports', 2),
('Contender', 'contender', 300000, 'suvs', 2),
('Coquette', 'coquette', 75000, 'sports', 2),
('Coquette SC', 'coquette2', 74000, 'sportsclassics', 0),
('Coquette GM', 'coquette3', 80000, 'muscle', 2),
('Cyclone', 'cyclone', 3000000, 'super', 2),
('Daemon', 'daemon', 18100, 'motorcycles', 2),
('Defiler', 'defiler', 25000, 'motorcycles', 2),
('Diablous', 'diablous', 45000, 'motorcycles', 1),
('Diablous S', 'Diablous2', 50000, 'motorcycles', 1),
('Dilettante', 'dilettante', 40000, 'compacts', 1),
('Dominator', 'dominator', 55000, 'muscle', 2),
('Double', 'double', 35000, 'motorcycles', 1),
('Dubsta', 'dubsta', 95000, 'suvs', NULL),
('Dukes', 'dukes', 67000, 'muscle', NULL),
('Elegy', 'elegy', 300000, 'sports', 2),
('Elegy S', 'elegy2', 330000, 'sports', NULL),
('Emperor', 'emperor', 8000, 'sedans', 2),
('Entity XF', 'entityxf', 300000, 'super', NULL),
('Ess key', 'esskey', 14000, 'motorcycles', NULL),
('Exemplar', 'exemplar', 90000, 'coupes', NULL),
('F620', 'f620', 300000, 'coupes', NULL),
('Faction', 'faction', 110000, 'muscle', NULL),
('Faggio S', 'faggio', 5500, 'motorcycles', NULL),
('FCR', 'fcr', 13500, 'motorcycles', NULL),
('FCR S', 'fcr2', 19600, 'motorcycles', NULL),
('Felon', 'felon', 100000, 'coupes', NULL),
('Felon S', 'felon2', 150000, 'coupes', NULL),
('Feltzer S', 'feltzer2', 113100, 'sports', NULL),
('Feltzer SC', 'feltzer3', 80000, 'sportsclassics', NULL),
('FMJ', 'fmj', 330000, 'super', NULL),
('FQ2', 'fq2', 253000, 'suvs', NULL),
('Fugitive', 'fugitive', 66000, 'sedans', NULL),
('Furore GT', 'furoregt', 100000, 'sports', NULL),
('Fusilade', 'fusilade', 66000, 'sports', NULL),
('Futo', 'futo', 75000, 'sports', NULL),
('Gargoyle', 'gargoyle', 34000, 'motorcycles', NULL),
('Gauntlet', 'gauntlet', 80000, 'muscle', NULL),
('Glendale', 'glendale', 150000, 'sedans', NULL),
('GPL', 'gp1', 300000, 'super', NULL),
('Granger', 'granger', 120000, 'suvs', NULL),
('Gresley', 'gresley', 250000, 'suvs', NULL),
('GT500', 'gt500', 130000, 'sportsclassics', NULL),
('Habanero', 'habanero', 62000, 'suvs', NULL),
('Hakuchou', 'hakuchou', 150000, 'motorcycles', NULL),
('Hermes', 'hermes', 53000, 'muscle', NULL),
('Hexer', 'hexer', 19500, 'motorcycles', NULL),
('Hotknife', 'hotknife', 50000, 'muscle', NULL),
('Huntley', 'huntley', 250000, 'suvs', NULL),
('Infernus', 'infernus', 130000, 'super', NULL),
('Infernus SC', 'infernus2', 70000, 'sportsclassics', NULL),
('Ingot', 'ingot', 45000, 'sedans', NULL),
('Innovation', 'innovation', 32000, 'motorcycles', NULL),
('Intruder', 'intruder', 53000, 'sedans', NULL),
('Issi S', 'issi2', 38500, 'compacts', NULL),
('Italigtb', 'italigtb', 500000, 'super', NULL),
('Jackal', 'jackal', 92000, 'coupes', NULL),
('Jester', 'jester', 400000, 'sports', NULL),
('Journey', 'journey', 80000, 'vans', NULL),
('Khamelion', 'khamelion', 83000, 'sports', NULL),
('Kuruma', 'kuruma', 98000, 'sports', NULL),
('Lands Talker', 'landstalker', 85000, 'suvs', NULL),
('LE7B', 'le7b', 450000, 'super', NULL),
('Lectro', 'lectro', 40000, 'motorcycles', NULL),
('Lynx S', 'lynx2', 173000, 'sports', NULL),
('Mamba', 'mamba', 90000, 'sportsclassics', NULL),
('Manana', 'manana', 66000, 'sportsclassics', NULL),
('Massacro', 'massacro', 88000, 'sports', NULL),
('Mesa S', 'mesa', 98000, 'suvs', NULL),
('Mesa OR', 'mesa3', 75000, 'offroad', NULL),
('Minivan', 'minivan', 100000, 'vans', NULL),
('Minivan2', 'minivan2', 130000, 'vans', NULL),
('Monroe', 'monroe', 84000, 'sportsclassics', NULL),
('Moon Beam', 'moonbeam', 150000, 'muscle', NULL),
('Neon', 'neon', 150000, 'sports', NULL),
('Nero', 'nero', 2500000, 'super', NULL),
('Nightblade', 'nightblade', 25000, 'motorcycles', NULL),
('Night Shade', 'nightshade', 72300, 'muscle', NULL),
('Ninef', 'ninef', 63000, 'sports', NULL),
('Omnis', 'omnis', 68000, 'sports', NULL),
('Oracle S', 'oracle', 82000, 'coupes', NULL),
('Oracle', 'oracle2', 87000, 'coupes', NULL),
('Osiris', 'osiris', 300000, 'super', NULL),
('Panto', 'panto', 22000, 'compacts', NULL),
('Pariah', 'pariah', 72200, 'sports', NULL),
('Patriot', 'patriot', 70000, 'suvs', NULL),
('PCJ', 'pcj', 13500, 'motorcycles', NULL),
('Penetrator', 'penetrator', 380000, 'super', NULL),
('Penumbra', 'penumbra', 66500, 'sports', NULL),
('Peyote', 'peyote', 86500, 'sportsclassics', NULL),
('Pfister', 'pfister811', 1304000, 'super', NULL),
('Picador', 'picador', 45000, 'muscle', NULL),
('Pigalle', 'pigalle', 20000, 'sportsclassics', NULL),
('Prairie', 'prairie', 430000, 'compacts', NULL),
('Premier', 'premier', 35000, 'sedans', NULL),
('Primo', 'primo', 100000, 'sedans', NULL),
('Prototipo', 'prototipo', 3000000, 'super', NULL),
('Radi', 'radi', 74000, 'suvs', NULL),
('Raiden', 'raiden', 68800, 'sports', NULL),
('Rancher XL', 'rancherxl', 79000, 'offroad', NULL),
('Rapid GT', 'rapidgt', 35000, 'sports', NULL),
('Rapidgt Turbo', 'rapidgt2', 82500, 'sports', NULL),
('Rapid GTSC', 'rapidgt3', 38000, 'sportsclassics', NULL),
('raptor', 'raptor', 84000, 'sports', NULL),
('Ratloader MS', 'ratloader2', 18000, 'muscle', NULL),
('Reaper', 'reaper', 300000, 'super', NULL),
('Rebel OR', 'rebel2', 20000, 'offroad', NULL),
('Regina', 'regina', 22500, 'sedans', NULL),
('Retinue', 'retinue', 78000, 'sportsclassics', NULL),
('Revolter', 'revolter', 200000, 'sports', NULL),
('Rhapsody', 'rhapsody', 30000, 'compacts', NULL),
('Rocoto', 'rocoto', 110000, 'suvs', NULL),
('Ruffian', 'ruffian', 10000, 'motorcycles', NULL),
('Ruiner', 'ruiner', 54000, 'muscle', NULL),
('Rumpo VN', 'rumpo3', 250000, 'vans', NULL),
('ruston', 'ruston', 93200, 'sports', NULL),
('Sabre GT', 'sabregt', 87000, 'muscle', NULL),
('Sadler', 'sadler', 169000, 'suvs', NULL),
('Sanchez', 'sanchez2', 15000, 'motorcycles', NULL),
('Savestra', 'savestra', 85000, 'sportsclassics', NULL),
('SCL', 'sc1', 100000, 'super', NULL),
('Schafter SD', 'schafter2', 45000, 'sedans', NULL),
('Schafter ST', 'schafter3', 40000, 'sports', NULL),
('Schwarzer', 'schwarzer', 65350, 'sports', NULL),
('Seminole', 'seminole', 97000, 'suvs', NULL),
('sentinel', 'sentinel', 100000, 'coupes', NULL),
('Serrano', 'serrano', 78000, 'suvs', NULL),
('Seven 70', 'seven70', 93000, 'sports', NULL),
('Sheava', 'sheava', 250000, 'super', NULL),
('Slam Van', 'slamvan', 80000, 'muscle', NULL),
('Specter', 'specter', 88750, 'sports', NULL),
('Speedo', 'speedo', 230000, 'vans', NULL),
('stalion', 'stalion', 42000, 'muscle', NULL),
('Stanier', 'stanier', 40000, 'sedans', NULL),
('Stinger', 'stinger', 76000, 'sportsclassics', NULL),
('Stratum', 'stratum', 63000, 'sedans', NULL),
('Streiter', 'streiter', 120000, 'sports', NULL),
('Stretch', 'stretch', 1300000, 'sedans', NULL),
('Stromberg', 'stromberg', 77000, 'sportsclassics', NULL),
('Sultan', 'sultan', 54642, 'sports', NULL),
('sultanrs', 'sultanrs', 95000, 'super', NULL),
('Superd', 'superd', 42000, 'sedans', NULL),
('Surano', 'surano', 71350, 'sports', NULL),
('Surge', 'surge', 30000, 'sedans', NULL),
('T20', 't20', 2800000, 'super', NULL),
('Tailgater', 'tailgater', 86000, 'sedans', NULL),
('Tampa GT', 'tampa', 90000, 'muscle', NULL),
('Tampa ST', 'tampa2', 43500, 'sports', NULL),
('Tempesta', 'tempesta', 900000, 'super', NULL),
('Torero', 'torero', 79000, 'sportsclassics', NULL),
('Tornado', 'tornado', 68000, 'sportsclassics', NULL),
('Tropos', 'tropos', 95000, 'sports', NULL),
('Turismo SC', 'turismo2', 1200000, 'sportsclassics', NULL),
('Turismor', 'turismor', 2200000, 'super', NULL),
('Tyrus', 'tyrus', 2300000, 'super', NULL),
('Vacca', 'vacca', 800000, 'super', NULL),
('Vader', 'vader', 11700, 'motorcycles', NULL),
('Vagner', 'vagner', 3500000, 'super', NULL),
('Verlierer ST', 'verlierer2', 96000, 'sports', NULL),
('Vigero', 'vigero', 78000, 'muscle', NULL),
('Virgo', 'virgo', 75000, 'muscle', NULL),
('Viseris', 'viseris', 200000, 'sportsclassics', NULL),
('Visione', 'visione', 2250000, 'super', NULL),
('Voltic', 'voltic', 100000, 'super', NULL),
('Voodoo', 'voodoo', 150000, 'muscle', NULL),
('Vortex', 'vortex', 13356, 'motorcycles', NULL),
('Warrener', 'warrener', 64000, 'sedans', NULL),
('Washington', 'washington', 25000, 'sedans', NULL),
('Windsor', 'windsor', 500000, 'coupes', NULL),
('windsor S', 'windsor2', 550000, 'coupes', NULL),
('Wolfsbane', 'wolfsbane', 27000, 'motorcycles', NULL),
('XA21', 'xa21', 2375000, 'super', NULL),
('XLS', 'xls', 253000, 'suvs', NULL),
('Yosemite', 'yosemite', 475000, 'muscle', NULL),
('Youga', 'Youga', 24000, 'vans', NULL),
('Youga VN', 'youga2', 300000, 'vans', NULL),
('Zentorno', 'zentorno', 725000, 'super', NULL),
('zion', 'zion', 75000, 'coupes', NULL),
('zion S', 'zion2', 80000, 'coupes', NULL),
('Ztype', 'ztype', 200000, 'sportsclassics', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicleshop_categories`
--

CREATE TABLE `vehicleshop_categories` (
  `name` varchar(100) NOT NULL,
  `label` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicleshop_vehicles`
--

CREATE TABLE `vehicleshop_vehicles` (
  `code` varchar(100) NOT NULL,
  `hash` varchar(11) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`id`, `name`, `label`) VALUES
(1, 'compacts', 'Compacts'),
(2, 'coupes', 'Coupés'),
(3, 'sedans', 'Sedans'),
(4, 'sports', 'Sports'),
(5, 'sportsclassics', 'Sports Classics'),
(6, 'super', 'Super'),
(7, 'muscle', 'Muscle'),
(8, 'offroad', 'Off Road'),
(9, 'suvs', 'SUVs'),
(10, 'vans', 'Vans'),
(11, 'motorcycles', 'Motos');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_tunings`
--

CREATE TABLE `vehicle_tunings` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `mods` text NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `yellowpages_posts`
--

CREATE TABLE `yellowpages_posts` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Indexes for table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Indexes for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_clothes`
--
ALTER TABLE `user_clothes`
  ADD PRIMARY KEY (`identifier`) USING BTREE;

--
-- Indexes for table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vehicleshop_categories`
--
ALTER TABLE `vehicleshop_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vehicleshop_vehicles`
--
ALTER TABLE `vehicleshop_vehicles`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_tunings`
--
ALTER TABLE `vehicle_tunings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_yellowpages_posts_twitter_accounts` (`authorId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16291;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vehicle_tunings`
--
ALTER TABLE `vehicle_tunings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);

--
-- Constraints for table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD CONSTRAINT `FK_yellowpages_posts_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
