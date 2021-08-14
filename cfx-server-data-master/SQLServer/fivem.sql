-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2021 at 06:15 PM
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
('property_black_money', 'Argent Sale Propriété', 0),
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
(0, 'property_black_money', 0, 'steam:1100001088aac30'),
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
('property', 'Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_cardealer', 'Concesionnaire', 1),
('society_mechanic', 'Mécano', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'steam:1100001088aac30', 'Jay', 'Luther', '1997-06-13', 'm', '170', NULL),
(2, 'steam:11000010f4c9cfd', 'Benji', 'Dunn', '29/03/2539', 'm', '180', NULL),
(3, 'steam:11000010a665804', 'Demub', 'FFF', '2511/12/12', 'm', '155', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `communityservice`
--

CREATE TABLE `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('property', 'Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_police', 'Police', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

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

--
-- Dumping data for table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_ambulance', NULL, '{}'),
(2, 'society_police', NULL, '{}'),
(3, 'property', 'steam:1100001088aac30', '{\"dressing\":[{\"label\":\"A\",\"skin\":{\"bodyb_1\":0,\"helmet_1\":-1,\"skin\":0,\"bracelets_1\":-1,\"tshirt_1\":15,\"shoes_1\":1,\"sex\":0,\"mask_1\":0,\"face\":0,\"eyebrows_5\":0.0,\"blush_2\":0,\"ears_2\":0,\"beard_4\":0,\"arms\":15,\"lipstick_3\":0,\"chin_height\":0.0,\"lipstick_2\":0,\"nose_1\":0.0,\"hair_color_1\":0,\"helmet_2\":0,\"watches_1\":-1,\"torso_2\":0,\"chain_2\":0,\"makeup_1\":0,\"age_1\":0,\"mask_2\":0,\"cheeks_1\":0.0,\"eyebrows_4\":0,\"decals_1\":0,\"eyebrows_2\":0,\"eyebrows_3\":0,\"beard_1\":0,\"mom\":0.0,\"arms_2\":0,\"eye_color\":0,\"chin_hole\":0.0,\"moles_1\":0,\"makeup_2\":0,\"makeup_4\":0,\"hair_1\":0,\"sun_2\":0,\"tshirt_2\":0,\"watches_2\":0,\"blush_1\":0,\"lips_thick\":0.0,\"eyebrows_1\":0,\"nose_3\":0.0,\"beard_2\":0,\"complexion_2\":0,\"bracelets_2\":0,\"bodyb_2\":0,\"bags_1\":0,\"nose_2\":0.0,\"jaw_1\":0.0,\"beard_3\":0,\"chest_1\":0,\"glasses_1\":0,\"chin_lenght\":0.0,\"hair_color_2\":0,\"dad\":0.0,\"pants_2\":0,\"nose_6\":0.0,\"cheeks_2\":0.0,\"blush_3\":0,\"eye_open\":0.0,\"chest_2\":0,\"complexion_1\":0,\"nose_5\":0.0,\"hair_2\":0,\"blemishes_2\":0,\"neck_thick\":0.0,\"age_2\":0,\"bags_2\":0,\"chin_width\":0.0,\"bproof_1\":0,\"shoes_2\":0,\"cheeks_3\":0.0,\"glasses_2\":0,\"bproof_2\":0,\"chain_1\":44,\"pants_1\":48,\"blemishes_1\":0,\"lipstick_1\":0,\"torso_1\":15,\"moles_2\":0,\"nose_4\":0.0,\"lipstick_4\":0,\"ears_1\":-1,\"chest_3\":0,\"decals_2\":0,\"eyebrows_6\":0.0,\"jaw_2\":0.0,\"makeup_3\":0,\"sun_1\":0}},{\"skin\":{\"bodyb_1\":0,\"helmet_1\":-1,\"skin\":0,\"nose_2\":0.0,\"tshirt_1\":15,\"shoes_1\":1,\"sex\":0,\"mask_1\":0,\"face\":0,\"eyebrows_5\":0.0,\"blush_2\":0,\"ears_2\":0,\"beard_4\":0,\"arms\":15,\"lipstick_3\":0,\"chin_height\":0.0,\"lipstick_2\":0,\"nose_1\":0.0,\"hair_color_1\":0,\"beard_2\":0,\"watches_1\":-1,\"torso_2\":0,\"chain_2\":0,\"makeup_1\":0,\"age_1\":0,\"mask_2\":0,\"cheeks_1\":0.0,\"eyebrows_4\":0,\"decals_1\":0,\"eyebrows_2\":0,\"eyebrows_3\":0,\"beard_1\":0,\"mom\":0.0,\"arms_2\":0,\"eye_color\":0,\"chin_hole\":0.0,\"moles_1\":0,\"makeup_2\":0,\"makeup_4\":0,\"hair_1\":0,\"eyebrows_6\":0.0,\"tshirt_2\":0,\"hair_2\":0,\"bproof_1\":0,\"blush_1\":0,\"chest_3\":0,\"eyebrows_1\":0,\"nose_3\":0.0,\"complexion_2\":0,\"bracelets_2\":0,\"pants_1\":48,\"bags_1\":0,\"bodyb_2\":0,\"bproof_2\":0,\"beard_3\":0,\"chest_1\":0,\"glasses_1\":0,\"chin_lenght\":0.0,\"hair_color_2\":0,\"jaw_1\":0.0,\"pants_2\":0,\"dad\":0.0,\"nose_6\":0.0,\"decals_2\":0,\"eye_open\":0.0,\"cheeks_2\":0.0,\"complexion_1\":0,\"nose_5\":0.0,\"chest_2\":0,\"helmet_2\":0,\"neck_thick\":0.0,\"glasses_2\":0,\"bags_2\":0,\"chin_width\":0.0,\"lipstick_1\":0,\"lips_thick\":0.0,\"cheeks_3\":0.0,\"age_2\":0,\"sun_1\":0,\"chain_1\":44,\"watches_2\":0,\"shoes_2\":0,\"blemishes_1\":0,\"bracelets_1\":-1,\"moles_2\":0,\"nose_4\":0.0,\"lipstick_4\":0,\"torso_1\":20,\"blemishes_2\":0,\"ears_1\":-1,\"blush_3\":0,\"sun_2\":0,\"makeup_3\":0,\"jaw_2\":0.0},\"label\":\"B\"}]}'),
(4, 'user_ears', 'steam:1100001088aac30', '{\"skin\":{\"ears_2\":0,\"ears_1\":4},\"hasEars\":true}'),
(5, 'user_helmet', 'steam:1100001088aac30', '{}'),
(6, 'user_glasses', 'steam:1100001088aac30', '{}'),
(7, 'user_mask', 'steam:1100001088aac30', '{}');

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
-- Table structure for table `jail`
--

CREATE TABLE `jail` (
  `identifier` varchar(100) NOT NULL,
  `jail_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('steam:1100001088aac30', 'TDA 583', '{\"modBrakes\":-1,\"modDial\":-1,\"modShifterLeavers\":-1,\"windows\":{\"1\":1,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":1},\"color2\":8,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"modRearBumper\":-1,\"modWindows\":-1,\"modAerials\":-1,\"wheelColor\":0,\"modTransmission\":-1,\"modHood\":-1,\"modTank\":-1,\"modXenon\":false,\"modEngineBlock\":-1,\"modFrame\":-1,\"doors\":{\"1\":true,\"2\":true,\"3\":true,\"4\":true,\"5\":true,\"0\":true},\"modAPlate\":-1,\"modDoorSpeaker\":-1,\"modBackWheels\":-1,\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"color1\":29,\"modFrontBumper\":-1,\"modSpoilers\":-1,\"modHydrolic\":-1,\"modLivery\":-1,\"wheels\":7,\"modHorns\":-1,\"modArmor\":-1,\"modTrunk\":-1,\"model\":1939284556,\"modSuspension\":-1,\"modSpeakers\":-1,\"modSideSkirt\":-1,\"modDashboard\":-1,\"pearlescentColor\":5,\"windowTint\":-1,\"plateIndex\":0,\"modTrimB\":-1,\"modPlateHolder\":-1,\"modExhaust\":-1,\"extras\":[],\"modRoof\":-1,\"dirtLevel\":8.0,\"tyres\":[2,2,2,2,2,2,2],\"neonColor\":[255,0,255],\"modOrnaments\":-1,\"modStruts\":-1,\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"modTurbo\":false,\"health\":1000.0,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modRightFender\":-1,\"modSeats\":-1,\"modFrontWheels\":-1,\"modAirFilter\":-1,\"modFender\":-1,\"plate\":\"TDA 583\"}', 'car', 'civ', NULL, 'Unknown', 100, 1, NULL);

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
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `entering` varchar(255) NOT NULL,
  `exit` varchar(255) NOT NULL,
  `inside` varchar(255) NOT NULL,
  `outside` varchar(255) NOT NULL,
  `ipls` varchar(255) NOT NULL,
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) NOT NULL,
  `is_room` int(11) NOT NULL,
  `is_gateway` int(11) NOT NULL,
  `room_menu` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(100, 'MedEndApartment1', 'Medium Apartment 1', '{\"y\":3107.56,\"z\":41.49,\"x\":240.6}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":3100.77,\"z\":41.49,\"x\":240.21}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(101, 'MedEndApartment2', 'Medium Apartment 2', '{\"y\":3169.1,\"z\":41.81,\"x\":246.7}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":3163.97,\"z\":41.82,\"x\":245.83}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(102, 'MedEndApartment3', 'Medium Apartment 3', '{\"y\":2667.22,\"z\":39.06,\"x\":980.38}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":2668.77,\"z\":39.06,\"x\":986.38}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(103, 'MedEndApartment4', 'Medium Apartment 4', '{\"y\":3031.08,\"z\":42.89,\"x\":195.85}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":3031.39,\"z\":42.27,\"x\":200.68}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(104, 'MedEndApartment5', 'Medium Apartment 5', '{\"y\":4642.17,\"z\":42.88,\"x\":1724.43}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":4637.34,\"z\":42.31,\"x\":1724.27}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(105, 'MedEndApartment6', 'Medium Apartment 6', '{\"y\":4739.73,\"z\":40.99,\"x\":1664.98}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":4740.93,\"z\":41.08,\"x\":1670.92}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(106, 'MedEndApartment7', 'Medium Apartment 7', '{\"y\":6577.19,\"z\":31.74,\"x\":12.57}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":6572.61,\"z\":31.72,\"x\":16.93}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(107, 'MedEndApartment8', 'Medium Apartment 8', '{\"y\":6190.84,\"z\":30.73,\"x\":-374.31}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":6186.58,\"z\":30.52,\"x\":-372.65}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(108, 'MedEndApartment9', 'Medium Apartment 9', '{\"y\":6597.56,\"z\":30.86,\"x\":-27.06}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":6601.55,\"z\":30.44,\"x\":-30.55}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(109, 'MedEndApartment10', 'Medium Apartment 10', '{\"y\":6340.1,\"z\":28.84,\"x\":-367.33}', '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}', '{\"y\":6336.97,\"z\":28.84,\"x\":-371.3}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}', 500000),
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', '', '', '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, '', 0),
(13, 'Modern1Apartment', 'Appartement Moderne 1', '', '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', '', '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', '', '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', '', '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', '', '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', '', '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Appartement Mode 1', '', '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', '', '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Appartement Mode 2', '', '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', '', '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Appartement Mode 3', '', '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', '', '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', '', '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', '', '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', '', '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', '', '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', '', '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', '', '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', '', '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', '', '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', '', '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', '', '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', '', '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', '', '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', '', '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', '', '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', '', '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', '', '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', '', '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', '', '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', '', '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', '', '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', '', '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', '', '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', '', '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', '', '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Appartement Régal 1', '', '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', '', '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Appartement Régal 2', '', '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', '', '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Appartement Régal 3', '', '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', '', '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', '', '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', '', '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', '', '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', '', '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', '', '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', '', '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', '', '', '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, '', 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', '', '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', '', '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', '', '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', '', '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', '', '', '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, '', 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', '', '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', '', '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', '', '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', '', '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000),
(43, 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', '', '', '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', NULL, 0, 0, 1, '', 0),
(44, 'OldSpiceWarm', 'Old Spice Warm', '', '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', '', '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(45, 'OldSpiceClassical', 'Old Spice Classical', '', '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', '', '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(46, 'OldSpiceVintage', 'Old Spice Vintage', '', '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', '', '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(47, 'ExecutiveRich', 'Executive Rich', '', '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', '', '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(48, 'ExecutiveCool', 'Executive Cool', '', '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', '', '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(49, 'ExecutiveContrast', 'Executive Contrast', '', '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', '', '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(50, 'PowerBrokerIce', 'Power Broker Ice', '', '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', '', '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(51, 'PowerBrokerConservative', 'Power Broker Conservative', '', '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', '', '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(52, 'PowerBrokerPolished', 'Power Broker Polished', '', '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', '', '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(53, 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', '', '', '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', NULL, 0, 0, 1, '', 0),
(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', '', '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', '', '[\"ex_sm_13_office_01a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', '', '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', '', '[\"ex_sm_13_office_01b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', '', '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', '', '[\"ex_sm_13_office_01c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(57, 'LBExecutiveRich', 'LB Executive Rich', '', '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', '', '[\"ex_sm_13_office_02b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(58, 'LBExecutiveCool', 'LB Executive Cool', '', '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', '', '[\"ex_sm_13_office_02c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(59, 'LBExecutiveContrast', 'LB Executive Contrast', '', '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', '', '[\"ex_sm_13_office_02a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', '', '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', '', '[\"ex_sm_13_office_03a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', '', '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', '', '[\"ex_sm_13_office_03b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', '', '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', '', '[\"ex_sm_13_office_03c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(63, 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', '', '', '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', NULL, 0, 0, 1, '', 0),
(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', '', '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', '', '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', '', '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', '', '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', '', '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', '', '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(67, 'MBWExecutiveRich', 'MBW Executive Rich', '', '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', '', '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(68, 'MBWExecutiveCool', 'MBW Executive Cool', '', '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', '', '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', '', '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', '', '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', '', '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', '', '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', '', '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', '', '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', '', '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', '', '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000);

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
(15, 'LTDgasoline', 'white_phone', 500),
(16, 'VendingMachine', 'bread', 35),
(17, 'VendingMachine', 'water', 20);

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
  `crypto` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`, `status`, `phone_number`, `crypto`, `is_dead`, `last_property`) VALUES
('steam:1100001088aac30', 'license:e4491b3e9cefdabcaed01d73a993b28a716dd914', 3959246, 'Luther', '{\"sun_2\":0,\"watches_2\":0,\"bags_2\":0,\"eyebrows_6\":0.0,\"chest_1\":0,\"skin\":0,\"chain_1\":44,\"lipstick_1\":0,\"tshirt_1\":15,\"bracelets_2\":0,\"complexion_1\":0,\"eyebrows_3\":0,\"arms_2\":0,\"cheeks_3\":0.0,\"moles_1\":0,\"mask_2\":0,\"eyebrows_1\":0,\"age_1\":0,\"helmet_2\":0,\"cheeks_1\":0.0,\"bproof_1\":0,\"chest_3\":0,\"chin_height\":0.0,\"hair_color_2\":0,\"shoes_1\":1,\"jaw_2\":0.0,\"age_2\":0,\"beard_4\":0,\"chin_width\":0.0,\"chin_hole\":0.0,\"moles_2\":0,\"chest_2\":0,\"lipstick_2\":0,\"nose_2\":0.0,\"nose_4\":0.0,\"bags_1\":0,\"blemishes_2\":0,\"decals_1\":0,\"decals_2\":0,\"eyebrows_2\":0,\"mom\":0.0,\"blush_1\":0,\"pants_1\":48,\"arms\":15,\"eye_open\":0.0,\"hair_2\":0,\"hair_color_1\":0,\"sex\":0,\"face\":0,\"watches_1\":-1,\"nose_1\":0.0,\"shoes_2\":0,\"glasses_2\":0,\"eye_color\":0,\"chin_lenght\":0.0,\"hair_1\":0,\"bracelets_1\":-1,\"chain_2\":0,\"jaw_1\":0.0,\"ears_2\":0,\"cheeks_2\":0.0,\"sun_1\":0,\"pants_2\":0,\"bodyb_1\":0,\"nose_6\":0.0,\"complexion_2\":0,\"makeup_2\":0,\"nose_5\":0.0,\"eyebrows_4\":0,\"torso_1\":20,\"nose_3\":0.0,\"dad\":0.0,\"neck_thick\":0.0,\"beard_1\":0,\"makeup_3\":0,\"lipstick_3\":0,\"lips_thick\":0.0,\"blush_3\":0,\"eyebrows_5\":0.0,\"beard_3\":0,\"torso_2\":0,\"bproof_2\":0,\"blemishes_1\":0,\"ears_1\":-1,\"blush_2\":0,\"mask_1\":0,\"glasses_1\":0,\"makeup_1\":0,\"bodyb_2\":0,\"makeup_4\":0,\"helmet_1\":-1,\"beard_2\":0,\"tshirt_2\":0,\"lipstick_4\":0}', 'police', 4, '[]', '{\"z\":29.3,\"y\":-798.9,\"x\":412.3}', 16500, 0, 'superadmin', 'Jay', 'Luther', '1997-06-13', 'm', '170', NULL, '[{\"name\":\"hunger\",\"val\":548200,\"percent\":54.82},{\"name\":\"thirst\",\"val\":672075,\"percent\":67.2075}]', '848-8790', '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', 0, NULL),
('steam:11000010f4c9cfd', 'license:b4e12501bfa19f28810493740988dc84bd9df6b2', 4049, 'benji donn', '{\"lipstick_3\":0,\"makeup_3\":0,\"bracelets_2\":0,\"sun_1\":0,\"torso_2\":0,\"complexion_1\":0,\"cheeks_3\":0.0,\"chain_1\":0,\"makeup_1\":0,\"nose_6\":0.0,\"chest_3\":0,\"bodyb_1\":0,\"eyebrows_5\":0.0,\"lipstick_4\":0,\"bracelets_1\":-1,\"nose_2\":0.0,\"blemishes_1\":0,\"age_1\":0,\"ears_1\":-1,\"nose_5\":0.0,\"chin_hole\":0.0,\"chest_2\":0,\"face\":0,\"nose_1\":0.0,\"moles_1\":0,\"beard_1\":0,\"decals_1\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"jaw_1\":0.0,\"hair_1\":12,\"sex\":0,\"chin_height\":0.0,\"tshirt_2\":0,\"glasses_2\":0,\"complexion_2\":0,\"nose_4\":0.0,\"chain_2\":0,\"nose_3\":0.0,\"cheeks_2\":0.0,\"makeup_4\":0,\"hair_color_2\":0,\"pants_1\":61,\"blemishes_2\":0,\"lipstick_1\":0,\"chest_1\":0,\"mask_1\":0,\"bags_2\":0,\"blush_1\":0,\"eyebrows_6\":0.0,\"glasses_1\":0,\"lipstick_2\":0,\"eyebrows_3\":0,\"eyebrows_4\":0,\"decals_2\":0,\"beard_4\":0,\"watches_1\":-1,\"blush_2\":0,\"makeup_2\":0,\"chin_lenght\":0.0,\"skin\":0,\"cheeks_1\":0.0,\"bproof_2\":0,\"eyebrows_1\":0,\"arms\":15,\"lips_thick\":0.0,\"bproof_1\":0,\"hair_2\":0,\"bodyb_2\":0,\"dad\":0.0,\"ears_2\":0,\"chin_width\":0.0,\"mask_2\":0,\"eyebrows_2\":0,\"eye_color\":0,\"eye_open\":0.0,\"age_2\":0,\"blush_3\":0,\"shoes_2\":0,\"arms_2\":0,\"beard_3\":0,\"moles_2\":0,\"helmet_2\":0,\"bags_1\":0,\"beard_2\":0,\"shoes_1\":34,\"helmet_1\":-1,\"watches_2\":0,\"neck_thick\":0.0,\"torso_1\":15,\"pants_2\":4,\"jaw_2\":0.0,\"mom\":0.0,\"sun_2\":0}', 'unemployed', 0, '[{\"name\":\"WEAPON_RPG\",\"components\":[],\"ammo\":1,\"label\":\"Rocket launcher\"}]', '{\"y\":-998.6,\"x\":158.6,\"z\":29.3}', 15000, 0, 'superadmin', 'Benji', 'Dunn', '29/03/2539', 'm', '180', NULL, '[{\"val\":251400,\"name\":\"hunger\",\"percent\":25.14},{\"val\":263550,\"name\":\"thirst\",\"percent\":26.355}]', NULL, '', 0, NULL),
('steam:11000010a665804', 'license:f6704fe2651773a6266505f80a4adc0a41c14d15', 4980, 'Demub', '{\"decals_1\":0,\"sex\":0,\"torso_2\":1,\"chain_1\":0,\"tshirt_2\":0,\"tshirt_1\":15,\"dad\":8,\"decals_2\":0,\"mom\":7,\"arms\":1,\"pants_1\":42,\"pants_2\":5,\"arms_2\":0,\"chain_2\":0,\"shoes_1\":8,\"hair_1\":6,\"torso_1\":14,\"shoes_2\":6,\"glasses_1\":0}', 'unemployed', 0, '[]', '{\"x\":227.4,\"y\":-821.5,\"z\":30.3}', 13000, 0, 'superadmin', 'Demub', 'FFF', '2511/12/12', 'm', '155', NULL, '[{\"percent\":42.82,\"name\":\"hunger\",\"val\":428200},{\"percent\":57.115,\"name\":\"thirst\",\"val\":571150}]', NULL, '', 0, NULL);

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
(2, 'steam:1100001088aac30', 'black_money', 0),
(3, 'steam:11000010f4c9cfd', 'black_money', 0);

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
(1, 'steam:1100001088aac30', 'bread', 8),
(2, 'steam:1100001088aac30', 'water', 4),
(3, 'steam:1100001088aac30', 'blue_phone', 1),
(4, 'steam:1100001088aac30', 'green_phone', 0),
(5, 'steam:1100001088aac30', 'white_phone', 0),
(10, 'steam:1100001088aac30', 'medikit', 0),
(11, 'steam:1100001088aac30', 'fixkit1', 0),
(12, 'steam:1100001088aac30', 'bandage', 0),
(13, 'steam:1100001088aac30', 'yellow_phone', 1),
(14, 'steam:11000010a665804', 'bread', 10),
(15, 'steam:11000010a665804', 'bandage', 0),
(16, 'steam:11000010a665804', 'yellow_phone', 0),
(17, 'steam:11000010a665804', 'green_phone', 0),
(18, 'steam:11000010a665804', 'water', 10),
(19, 'steam:11000010a665804', 'white_phone', 1),
(20, 'steam:11000010a665804', 'medikit', 0),
(21, 'steam:11000010a665804', 'fixkit1', 0),
(22, 'steam:11000010f4c9cfd', 'yellow_phone', 1),
(23, 'steam:11000010f4c9cfd', 'white_phone', 0),
(24, 'steam:11000010f4c9cfd', 'medikit', 0),
(25, 'steam:11000010f4c9cfd', 'bread', 8),
(26, 'steam:11000010f4c9cfd', 'bandage', 0),
(27, 'steam:11000010f4c9cfd', 'fixkit1', 0),
(28, 'steam:11000010f4c9cfd', 'water', 7),
(29, 'steam:11000010f4c9cfd', 'green_phone', 0);

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
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

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
-- Indexes for table `communityservice`
--
ALTER TABLE `communityservice`
  ADD PRIMARY KEY (`identifier`);

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
-- Indexes for table `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`identifier`);

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
-- Indexes for table `owned_properties`
--
ALTER TABLE `owned_properties`
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
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
