-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for legacy
CREATE DATABASE IF NOT EXISTS `legacy` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `legacy`;

-- Dumping structure for table legacy.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.addon_account: ~7 rows (approximately)
DELETE FROM `addon_account`;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'SEM', 1),
	('society_dynasty', 'Dynasty', 1),
	('society_gato', 'UWU Café', 1),
	('society_lawyer', 'Saul Goodman', 1),
	('society_mechanic', 'Benny\'s', 1),
	('society_police', 'DPLS', 1),
	('society_unemployed', 'Desempregrado', 1);

-- Dumping structure for table legacy.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.addon_account_data: ~7 rows (approximately)
DELETE FROM `addon_account_data`;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(45, 'society_gato', 0, NULL),
	(46, 'society_mechanic', 0, NULL),
	(47, 'society_lawyer', 0, NULL),
	(48, 'society_police', 0, NULL),
	(49, 'society_ambulance', 0, NULL),
	(50, 'society_unemployed', 0, NULL),
	(51, 'society_dynasty', 0, NULL);

-- Dumping structure for table legacy.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.addon_inventory: ~7 rows (approximately)
DELETE FROM `addon_inventory`;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'SEM', 1),
	('society_dynasty', 'Dynasty', 1),
	('society_gato', 'UWU Café', 1),
	('society_lawyer', 'Saul Goodman', 1),
	('society_mechanic', 'Benny\'s', 1),
	('society_police', 'DPLS', 1),
	('society_unemployed', 'Desempregrado', 1);

-- Dumping structure for table legacy.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.addon_inventory_items: ~0 rows (approximately)
DELETE FROM `addon_inventory_items`;

-- Dumping structure for table legacy.allhousing
CREATE TABLE IF NOT EXISTS `allhousing` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `ownername` varchar(50) NOT NULL,
  `owned` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `resalepercent` int(11) NOT NULL,
  `resalejob` varchar(50) NOT NULL,
  `entry` longtext DEFAULT NULL,
  `garage` longtext DEFAULT NULL,
  `furniture` longtext DEFAULT NULL,
  `shell` varchar(50) NOT NULL,
  `interior` varchar(50) NOT NULL,
  `shells` longtext DEFAULT NULL,
  `doors` longtext DEFAULT NULL,
  `housekeys` longtext DEFAULT NULL,
  `wardrobe` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `inventorylocation` longtext DEFAULT NULL,
  `mortgage_owed` int(11) NOT NULL DEFAULT 0,
  `last_repayment` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.allhousing: ~0 rows (approximately)
DELETE FROM `allhousing`;

-- Dumping structure for table legacy.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.billing: ~0 rows (approximately)
DELETE FROM `billing`;

-- Dumping structure for table legacy.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.datastore: ~14 rows (approximately)
DELETE FROM `datastore`;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('dressing', 'Roupas', 0),
	('housing', 'Casa', 0),
	('property', 'Property', 0),
	('society_ambulance', 'SEM', 1),
	('society_dynasty', 'Dynasty', 1),
	('society_gato', 'UWU Café', 1),
	('society_lawyer', 'Saul Goodman', 1),
	('society_mechanic', 'Benny\'s', 1),
	('society_police', 'DPLS', 1),
	('society_unemployed', 'Unemployed', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Dumping structure for table legacy.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1411 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.datastore_data: ~0 rows (approximately)
DELETE FROM `datastore_data`;

-- Dumping structure for table legacy.doorscreator_buildings
CREATE TABLE IF NOT EXISTS `doorscreator_buildings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `default_state` tinyint(4) NOT NULL DEFAULT 0,
  `allowed_jobs` longtext DEFAULT NULL,
  `allowed_gangs` longtext DEFAULT NULL,
  `required_item` varchar(50) DEFAULT NULL,
  `requires_job_and_item` int(11) NOT NULL DEFAULT 0,
  `required_code` varchar(50) DEFAULT NULL,
  `auto_closure_seconds` int(11) DEFAULT NULL,
  `requires_identifier` int(11) NOT NULL DEFAULT 0,
  `allowed_identifiers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.doorscreator_buildings: ~5 rows (approximately)
DELETE FROM `doorscreator_buildings`;
INSERT INTO `doorscreator_buildings` (`id`, `label`, `default_state`, `allowed_jobs`, `allowed_gangs`, `required_item`, `requires_job_and_item`, `required_code`, `auto_closure_seconds`, `requires_identifier`, `allowed_identifiers`) VALUES
	(1, 'DPLS', 1, '{"police":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(2, 'Bennys', 1, '{"mechanic":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(3, 'S.E.M', 1, '{"ambulance":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(4, 'Café dos Gatos', 1, '{"ambulance":{"6":true}}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(5, 'Dynasty', 1, '{"dynasty":true}', NULL, NULL, 0, NULL, NULL, 0, '[]');

-- Dumping structure for table legacy.doorscreator_doors
CREATE TABLE IF NOT EXISTS `doorscreator_doors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `doors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `default_state` tinyint(4) NOT NULL DEFAULT 0,
  `icon_coords` longtext NOT NULL,
  `max_distance` int(11) NOT NULL,
  `allowed_jobs` longtext DEFAULT NULL,
  `allowed_gangs` longtext DEFAULT NULL,
  `required_item` varchar(50) DEFAULT NULL,
  `requires_job_and_item` int(11) NOT NULL DEFAULT 0,
  `required_code` varchar(50) DEFAULT NULL,
  `auto_closure_seconds` int(11) DEFAULT NULL,
  `parent_building` int(11) DEFAULT NULL,
  `is_sliding` int(11) NOT NULL DEFAULT 0,
  `requires_identifier` int(11) NOT NULL DEFAULT 0,
  `allowed_identifiers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `vault` longtext DEFAULT NULL,
  `can_be_lockpicked` int(11) NOT NULL DEFAULT 1,
  `alert_police_on_lockpick` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.doorscreator_doors: ~47 rows (approximately)
DELETE FROM `doorscreator_doors`;
INSERT INTO `doorscreator_doors` (`id`, `label`, `doors`, `default_state`, `icon_coords`, `max_distance`, `allowed_jobs`, `allowed_gangs`, `required_item`, `requires_job_and_item`, `required_code`, `auto_closure_seconds`, `parent_building`, `is_sliding`, `requires_identifier`, `allowed_identifiers`, `vault`, `can_be_lockpicked`, `alert_police_on_lockpick`) VALUES
	(2, 'Porta traseira', '{"2772226":{"coords":{"x":-143.92,"y":-1293.71,"z":30.1},"model":-1603817716}}', 0, '{"x":-143.89,"y":-1297.06,"z":31.1}', 10, NULL, NULL, NULL, 0, NULL, NULL, 2, 1, 0, '[]', NULL, 0, 0),
	(3, 'Porta Bennys Principal', '{"2978050":{"coords":{"x":-243.99,"y":-1302.75,"z":30.3},"model":-1603817716}}', 0, '{"x":-243.87,"y":-1305.39,"z":31.6}', 9, NULL, NULL, NULL, 0, NULL, NULL, 2, 1, 0, '[]', NULL, 0, 0),
	(4, 'Porta Privada Bennys', '{"3154946":{"model":-1726331785,"coords":{"z":23.2,"y":-1331.64,"x":-203.65}}}', 1, '{"z":23.43,"y":-1330.99,"x":-203.51}', 2, NULL, NULL, NULL, 0, '4285', 5, NULL, 1, 0, '[]', NULL, 0, 0),
	(5, 'Porta para a garagem', '{"3166722":{"coords":{"x":-214.39,"y":-1334.69,"z":31.42},"model":-1283923227}}', 0, '{"x":-214.55,"y":-1334.66,"z":31.21}', 4, NULL, NULL, NULL, 0, NULL, NULL, 2, 1, 0, '[]', NULL, 0, 0),
	(6, 'Porta para as escadas', '{"180226":{"coords":{"z":29.84,"x":-205.21,"y":-1328.09},"model":161378502}}', 0, '{"z":31.19,"x":-205.94,"y":-1328.05}', 3, NULL, NULL, NULL, 0, NULL, NULL, 2, 1, 0, '[]', NULL, 0, 0),
	(7, 'Porta Gabinete Chefe Bennys', '{"178690":{"coords":{"z":34.99,"x":-202.85,"y":-1335.84},"model":-1320876379}}', 1, '{"z":35.2,"x":-202.78,"y":-1334.94}', 2, '{"mechanic":{"4":true,"5":true}}', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, '[]', NULL, 0, 0),
	(8, 'Porta Rececao Hospital', '{"296194":{"coords":{"y":-595.46,"z":43.43,"x":313.48},"model":854291622}}', 0, '{"y":-596.27,"z":43.58,"x":313.09}', 2, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, 0, '[]', NULL, 0, 0),
	(9, 'Porta Rececao Hospital 2', '{"292354":{"coords":{"y":-597.75,"z":43.43,"x":309.13},"model":854291622}}', 0, '{"y":-597.5,"z":43.58,"x":308.4}', 2, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, 0, '[]', NULL, 0, 0),
	(10, 'Raio-X 1', '{"384514":{"coords":{"y":-572.22,"z":43.43,"x":314.42},"model":-1700911976},"384770":{"coords":{"y":-571.34,"z":43.43,"x":312.01},"model":-434783486}}', 0, '{"y":-571.81,"z":43.59,"x":313.24}', 3, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, 0, '[]', NULL, 0, 0),
	(11, 'Raio-X 2', '{"298498":{"coords":{"y":-574.35,"z":43.43,"x":320.26},"model":-1700911976},"296450":{"coords":{"y":-573.47,"z":43.43,"x":317.84},"model":-434783486}}', 0, '{"y":-573.94,"z":43.59,"x":319.05}', 3, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, 0, '[]', NULL, 0, 0),
	(12, 'Raio-X 3', '{"33282":{"coords":{"z":43.43,"y":-575.43,"x":323.24},"model":-434783486},"34306":{"coords":{"z":43.43,"y":-576.31,"x":325.66},"model":-1700911976}}', 0, '{"z":43.59,"y":-575.81,"x":324.49}', 3, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, 0, '[]', NULL, 0, 0),
	(14, 'Porta Administracao Hospital', '{"96514":{"model":854291622,"coords":{"x":339,"y":-586.7,"z":43.43}}}', 1, '{"x":339.7,"y":-586.97,"z":43.58}', 3, '{"ambulance":{"6":true}}', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, '[]', NULL, 0, 0),
	(15, 'Porta Corredor Hospital 2', '{"99586":{"model":-434783486,"coords":{"x":349.31,"y":-586.33,"z":43.43}},"99842":{"model":-1700911976,"coords":{"x":348.43,"y":-588.74,"z":43.43}}}', 0, '{"x":349.04,"y":-587.64,"z":43.58}', 3, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, 0, '[]', NULL, 0, 0),
	(16, 'Garagem Hospital 1', '{"44802":{"model":-820650556,"coords":{"x":337.28,"y":-564.43,"z":29.78}}}', 0, '{"x":337.45,"y":-564.24,"z":29.1}', 8, NULL, NULL, NULL, 0, NULL, NULL, 3, 1, 0, '[]', NULL, 0, 0),
	(17, 'Garagem Hospital 2', '{"44290":{"model":-820650556,"coords":{"x":330.13,"y":-561.83,"z":29.78}}}', 0, '{"x":330.2,"y":-561.75,"z":29.1}', 10, NULL, NULL, NULL, 0, NULL, NULL, 3, 1, 0, '[]', NULL, 0, 0),
	(18, 'Esquerda Principal DPLS', '{"1545986":{"coords":{"z":30.82,"x":440.52,"y":-977.6},"model":-1406685646}}', 0, '{"z":31.09,"x":441.27,"y":-977.58}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(19, 'Esquerda Traseiras DPLS', '{"1601282":{"coords":{"z":30.82,"x":458.21,"y":-972.25},"model":-1547307588},"1572354":{"coords":{"z":30.82,"x":455.89,"y":-972.25},"model":-1547307588}}', 0, '{"z":31.01,"x":456.82,"y":-972.15}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(20, 'Chefe DPLS', '{"1395202":{"coords":{"z":30.82,"x":458.65,"y":-990.65},"model":-96679321}}', 0, '{"z":31.09,"x":458.54,"y":-989.92}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(21, 'Direita Principal DPLS', '{"1555970":{"coords":{"z":30.82,"x":440.52,"y":-986.23},"model":-96679321}}', 0, '{"z":31.04,"x":441.22,"y":-986.25}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(22, 'Direita Traseiras DPLS', '{"1571586":{"coords":{"z":30.82,"x":443.06,"y":-998.75},"model":-1547307588},"1615106":{"coords":{"z":30.82,"x":440.74,"y":-998.75},"model":-1547307588}}', 0, '{"z":31.02,"x":442,"y":-999.02}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(23, 'Direita Garagem Entrada', '{"1560066":{"coords":{"z":26.37,"x":464.16,"y":-997.51},"model":1830360419}}', 0, '{"z":26.67,"x":464.02,"y":-997.06}', 3, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(24, 'Esquerda Garagem Entrada', '{"1559554":{"coords":{"z":26.37,"x":464.16,"y":-974.67},"model":1830360419}}', 0, '{"z":26.63,"x":463.92,"y":-975.4}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(25, 'Garagem Direita', '{"1601538":{"coords":{"z":26.7,"x":452.3,"y":-1000.77},"model":2130672747}}', 0, '{"z":26.03,"x":452.3,"y":-1000.87}', 6, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0),
	(26, 'Garagem Esquerda', '{"1600770":{"coords":{"z":26.7,"x":431.41,"y":-1000.77},"model":2130672747}}', 0, '{"z":26.04,"x":431.47,"y":-1001.09}', 7, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0),
	(27, 'Porta Corridas', '{"830466":{"model":-822900180,"coords":{"z":31.36,"y":-2366.81,"x":859.24}}}', 1, '{"z":30.65,"y":-2366.97,"x":859.07}', 6, NULL, NULL, NULL, 0, '472964', 5, NULL, 1, 0, '[]', NULL, 0, 0),
	(28, 'Porta Escritorio Saul(Rua)', '{"3187714":{"coords":{"x":-1910.58,"y":-576.01,"z":19.25},"model":1378348636}}', 1, '{"x":-1911.21,"y":-575.41,"z":19.4}', 2, '{"lawyer":{"1":true}}', NULL, NULL, 0, NULL, NULL, NULL, 1, 0, '[]', NULL, 0, 0),
	(29, 'Portas Entrada UwU Cafe', '{"8323842":{"coords":{"z":22.49,"y":-1069.63,"x":-580.36},"model":-69331849},"8330754":{"coords":{"z":22.49,"y":-1069.63,"x":-581.67},"model":526179188}}', 0, '{"z":22.66,"y":-1069.62,"x":-581}', 4, NULL, NULL, NULL, 0, NULL, NULL, 4, 0, 0, '[]', NULL, 0, 0),
	(30, 'Traseiras Single', '{"8295426":{"coords":{"z":22.71,"y":-1055.13,"x":-600.89},"model":1099436502}}', 0, '{"z":22.79,"y":-1055.75,"x":-600.95}', 4, NULL, NULL, NULL, 0, NULL, NULL, 4, 0, 0, '[]', NULL, 0, 0),
	(31, 'Traseiras Garagem', '{"8300034":{"coords":{"z":21.72,"y":-1059.22,"x":-600.91},"model":522844070}}', 0, '{"z":22.85,"y":-1059.28,"x":-601.2}', 5, NULL, NULL, NULL, 0, NULL, NULL, 4, 1, 0, '[]', NULL, 0, 0),
	(32, 'Escritorio', '{"8290050":{"coords":{"z":26.77,"y":-1063.78,"x":-575.01},"model":2089009131}}', 0, '{"z":26.93,"y":-1064.48,"x":-575.02}', 4, NULL, NULL, NULL, 0, NULL, NULL, 4, 0, 0, '[]', NULL, 0, 0),
	(33, 'Porta traseira', '{"3025922":{"model":-692649124,"coords":{"y":-1014.41,"z":26.48,"x":469.77}},"3202562":{"model":-692649124,"coords":{"y":-1014.41,"z":26.48,"x":467.37}}}', 0, '{"y":-1014.41,"z":26.72,"x":468.71}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(34, 'Entrada Celas', '{"3014146":{"model":-53345114,"coords":{"y":-1008.88,"z":26.48,"x":476.62}}}', 0, '{"y":-1008.27,"z":26.57,"x":476.88}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(35, 'Cela 1', '{"3114754":{"model":-53345114,"coords":{"y":-1012.19,"z":26.48,"x":477.91}}}', 0, '{"y":-1012.24,"z":26.6,"x":477.26}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(36, 'Cela 2', '{"3119618":{"model":-53345114,"coords":{"y":-1012.19,"z":26.48,"x":480.91}}}', 0, '{"y":-1012.13,"z":26.58,"x":480.19}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(37, 'Cela 3', '{"3119874":{"model":-53345114,"coords":{"y":-1012.19,"z":26.48,"x":483.91}}}', 0, '{"y":-1012.36,"z":26.6,"x":483.26}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(38, 'Cela 4', '{"3120130":{"model":-53345114,"coords":{"y":-1012.19,"z":26.48,"x":486.91}}}', 0, '{"y":-1012.19,"z":26.58,"x":486.16}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(39, 'Cela 5', '{"3154178":{"model":-53345114,"coords":{"y":-1007.73,"z":26.48,"x":484.18}}}', 0, '{"y":-1007.66,"z":26.59,"x":484.86}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(40, 'Entrada Celas 2', '{"3023362":{"model":-53345114,"coords":{"y":-1004.12,"z":26.48,"x":481.01}}}', 0, '{"y":-1004.19,"z":26.59,"x":481.45}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0),
	(41, 'Casa Org', '{"3926019":{"model":-1918480350,"coords":{"y":314.36,"x":-1162.05,"z":68.72}},"4188675":{"model":-349730013,"coords":{"y":309.5,"x":-1159.51,"z":68.72}}}', 1, '{"y":311.76,"x":-1161.07,"z":68.74}', 6, NULL, NULL, NULL, 0, '75321', 5, NULL, 1, 0, '[]', NULL, 0, 0),
	(42, 'Principal Bennys', '{"204802":{"coords":{"x":-205.68,"y":-1310.68,"z":30.3},"model":-427498890}}', 0, '{"x":-205.64,"y":-1310.48,"z":31.6}', 6, NULL, NULL, NULL, 0, NULL, NULL, 2, 1, 0, '[]', NULL, 0, 0),
	(43, 'Traseiras', '{"2794498":{"model":1901183774,"coords":{"z":84.82,"y":270.6,"x":-716.37}}}', 0, '{"z":85,"y":271.22,"x":-716.67}', 3, NULL, NULL, NULL, 0, NULL, NULL, 5, 0, 0, '[]', NULL, 0, 0),
	(44, 'Porta Chefe', '{"2705154":{"model":1901183774,"coords":{"z":84.19,"y":264.46,"x":-713.92}}}', 0, '{"z":84.4,"y":265.16,"x":-714.22}', 3, NULL, NULL, NULL, 0, NULL, NULL, 5, 0, 0, '[]', NULL, 0, 0),
	(45, 'Centro Forum Drive backroom1', '{"1577474":{"coords":{"z":29.64,"y":-1403.07,"x":-24.23},"model":-2003105485}}', 1, '{"z":29.75,"y":-1402.48,"x":-24.19}', 2, NULL, NULL, NULL, 0, '58789', 6, NULL, 0, 0, '[]', NULL, 0, 0),
	(46, 'Centro Forum Drive Backrooms2', '{"1578754":{"coords":{"z":29.64,"y":-1403.76,"x":-21.71},"model":-2003105485}}', 1, '{"z":29.81,"y":-1403.7,"x":-22.29}', 2, NULL, NULL, NULL, 0, '01245', 6, NULL, 0, 0, '[]', NULL, 0, 0),
	(47, 'Centro Forum Drive Garagem Porta', '{"1547778":{"coords":{"z":29.64,"y":-1406.85,"x":-21.27},"model":-2003105485}}', 1, '{"z":29.77,"y":-1406.34,"x":-21.35}', 2, NULL, NULL, NULL, 0, '01245', 10, NULL, 0, 0, '[]', NULL, 0, 0),
	(48, 'Centro Forum Drive Garagem Portão', '{"1594626":{"coords":{"z":30.51,"y":-1410.73,"x":-21.04},"model":-190780785}}', 1, '{"z":29.79,"y":-1410.59,"x":-20.95}', 4, NULL, NULL, NULL, 0, '01245', 6, NULL, 0, 0, '[]', '{"doorHeavy":false,"type":"ratio","invertedDirection":true,"speed":0.5}', 0, 0),
	(49, 'CafeDosGatos', '{"1522178":{"model":-60871655,"coords":{"z":22.41,"y":-1054.15,"x":-590.18}}}', 0, '{"z":22.66,"y":-1054.11,"x":-589.57}', 2, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, 0, '[]', NULL, 0, 0);

-- Dumping structure for table legacy.dopeplants
CREATE TABLE IF NOT EXISTS `dopeplants` (
  `owner` varchar(50) NOT NULL,
  `plant` longtext NOT NULL,
  `plantid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.dopeplants: ~0 rows (approximately)
DELETE FROM `dopeplants`;

-- Dumping structure for table legacy.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.fine_types: ~105 rows (approximately)
DELETE FROM `fine_types`;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, '1.1 - ULTRAPASSAR SINAL VERMELHO ', 75, 0),
	(2, '1.2 - ANDAR SEM CAPACETE (Moto)', 50, 0),
	(3, '1.3 - CONDUZIR SEM HABILITAÇÃO', 250, 0),
	(4, '1.4 - ANDAR COM VEICULO DANIFICADO', 50, 0),
	(5, '1.5 - ESTACIONAR EM LOCAL PROIBIDO', 75, 0),
	(6, '1.6 - CONDUZIR EMBRIAGADO', 750, 0),
	(7, '1.7 - VEICULO CLONADO/FURTO #15 Meses', 850, 0),
	(8, '1.8 - ABANDONO DE VEÍCULO', 150, 0),
	(9, '1.9 - FUGA APÓS CAUSAR UM ACIDENTE #10 Meses', 550, 0),
	(10, '1.10- EXCESSO DE VELOCIDADE', 150, 0),
	(11, '1.11 - CONDUÇÃO IMPRUDENTE', 150, 0),
	(12, '1.12 - MODIFICAÇÕES ILEGAIS', 100, 0),
	(13, '1.13 - VEÍCULOS SEM LICENÇA DE CIRCULAÇÃO', 2000, 0),
	(14, '1.14 - EXCESSO DE OCUPANTES', 2000, 0),
	(15, '1.15 - CORRIDAS ILEGAIS #15 Meses', 3500, 0),
	(16, '2.1 - TRAJES (Balístico) #8 Meses', 100, 1),
	(17, '2.2 - COLETES (Balístico) #10 Meses', 200, 1),
	(18, '2.3 - OBSTRUÇÃO FACIAL(Máscaras/ Capacetes totalmente fechados)', 250, 1),
	(19, '2.4 - CAPACETE  (Balístico)', 450, 1),
	(20, '2.5 - FUGA AO FISCO( Ter mais de 3 multas/faturas não pagas) #10 Meses', 0, 1),
	(21, '2.6 - DIFAMAÇÃO #10 Meses', 5000, 1),
	(22, '3.1 - FORMAÇÃO DE GRUPO HOSTIL #10 Meses', 500, 2),
	(23, '3.2 - ASSALTO A BANCO #60 Meses', 8000, 2),
	(24, '3.3 - ASSALTO A LOJAS #30 Meses', 2500, 2),
	(25, '3.4 - ASSALTO A CIVIL #13 Meses', 1500, 2),
	(26, '3.5 - ASSALTO A PROPIEDADE #20 Meses', 1500, 2),
	(27, '3.6 - ROUBO A JOALHERIA #25 Meses', 10000, 2),
	(28, '3.7 - ROUBO A LOJA DE ARMAS #25 Meses', 6000, 2),
	(29, '3.8 - ROUBO A IATE #30 Meses', 17000, 2),
	(30, '3.9 - POSSE DE BARRAS DE OURO #1 Mês Por Barra', 650, 2),
	(31, '4.1 - OCULTAÇÃO DE PROVAS #20 Meses', 5000, 3),
	(32, '4.2 - TENTATIVA DE SUBORNO #15 Meses', 2000, 3),
	(33, '4.3 - FALSA REPRESENTAÇÃO DE UM ADVOGADO/FUNCIONÁRIO DO GOVERNO #30 Meses', 15000, 3),
	(34, '4.4 - NÃO COMPARECER EM TRIBUNAL #15 Meses', 15000, 3),
	(35, '4.5 - OBSTRUÇÃO DE JUSTIÇA #30 Meses', 30000, 3),
	(36, '4.6 - FALSAS DECLARAÇÕES #10 Meses', 10000, 3),
	(37, '4.7 - ABUSAR DA LINHA DE EMERGÊNCIA', 1000, 3),
	(38, '4.8 - DESRESPEITO AO TRIBUNAL #20 Meses', 20000, 3),
	(39, '4.9 - NÃO APARECER NO DEPARTAMENTO DA POLÍCIA #10 Meses', 10000, 3),
	(40, '4.10 - PESCA ILEGAL', 2500, 3),
	(41, '4.11 - CÚMPLICE #50% do Culpado', 0, 3),
	(42, '4.12 - PSEUDOCÍDIO #30 Meses', 15000, 3),
	(43, '4.13 - EXERCÍCIO DE FUNÇÕES SEM ALVARÁ/LICENÇA', 50000, 3),
	(44, '5.1 - RESISTÊNCIA A PRISÃO #10 Meses', 2000, 4),
	(45, '5.2 - OMISSÃO DE SOCORRO #5 Meses', 1500, 4),
	(46, '5.3 - DANO AO PATRIMÔNIO PÚBLICO #5 Meses', 800, 4),
	(47, '5.4 - DIFAMAÇÃO #5 Meses', 500, 4),
	(48, '5.5 - FURTO #12 Meses', 2000, 4),
	(49, '5.6 - ROUBO #16 Meses', 4000, 4),
	(50, '5.7 - ATO OBSCENO #5 Meses', 1500, 4),
	(51, '5.8 - POLUIÇÃO SONORA', 500, 4),
	(52, '5.9 - TENTATIVA DE FUGA #5 Meses', 1000, 4),
	(53, '5.10 - FUGA A POLÍCIA #20 Meses', 2000, 4),
	(54, '5.11 - DESMANTELAMENTO DE VEICULOS #10 Meses', 500, 4),
	(55, '5.12 - FALSIFICAÇÃO DE DOCUMENTOS #10 Meses', 20000, 4),
	(56, '5.13 - ORGANIZAÇÃO DE EVENTOS ILEGAIS', 15000, 4),
	(57, '5.14 - ORGANIZAÇÃO DE LUTAS ILEGAIS #10 Meses', 10000, 4),
	(58, '6.1 - DESACATO #3 Meses', 1500, 5),
	(59, '6.2 - DESOBEDECER A AUTORIDADE (Serviço Público) ', 1000, 5),
	(60, '6.3 - EXTORSÃO #10 Meses', 4000, 5),
	(61, '6.4 - FALSIDADE IDEOLÓGICA #6 Meses', 2000, 5),
	(62, '6.5 - CALÚNIA #3 Meses', 500, 5),
	(63, '6.6 - PERJÚRIO #8 Meses', 1500, 5),
	(64, '6.7 - AGRESSÃO #10 Meses', 500, 5),
	(65, '6.8 - AMEAÇA #10 Meses', 500, 5),
	(66, '6.9 - SEQUESTRO #20 Meses', 5000, 5),
	(67, '6.10 - ROUBO DE VIATURA DO ESTADO #20 meses', 10000, 5),
	(68, '6.11 - INJÚRIA', 1000, 5),
	(69, '6.12 - AGRESSÃO A FUNCIONÁRIO PÚBLICO #10 Meses', 10000, 5),
	(70, '6.13 - SEQUESTRO A FUNCIONÁRIO PÚBLICO #30 Meses', 20000, 5),
	(71, '6.14 - ROUBO DE ARMAMENTO DO ESTADO #20 Meses', 0, 5),
	(72, '6.15 - ATIVIDADE ILEGAL NUMA EMPRESA #60 Meses', 500000, 5),
	(73, '6.16 - CRIAÇÃO DE LOCAL PARA FINS DE TORTURA #40 Meses', 20000, 5),
	(74, '6.17 - CRIME DE TORTURA #40 Meses', 40000, 5),
	(75, '6.18 - ASSÉDIO', 5000, 5),
	(76, '7.1 - TENTATIVA DE HOMICÍDIO DOLOSO (com intenção de matar) #20 Meses', 10000, 6),
	(77, '7.2 - TENTATIVA DE HOMICÍDIO NEGLIGENTE (sem intenção de matar) #10 Meses', 5000, 6),
	(78, '7.3 - HOMICÍDIO DOLOSO (com intenção de matar) #30 Meses', 30000, 6),
	(79, '7.4 - HOMICÍDIO NEGLIGENTE #20 Meses', 12000, 6),
	(80, '7.5 - HOMICÍDIO DE FUNCIONÁRIO PÚBLICO #80 Meses', 60000, 6),
	(81, '7.6 - TENTATIVA DE HOMICÍDIO DE FUNCIONÁRIO PÚBLICO #20 Meses', 10000, 6),
	(82, '7.7 - CORRUPÇÃO #35 Meses', 50000, 6),
	(83, '7.8 - ATOS TERRORISTAS #60 Meses', 65000, 6),
	(84, '7.9 - RACISMO E DISCRIMINAÇÃO #30 Meses', 20000, 6),
	(85, '7.10 - INCENTIVO AO ÓDIO #15 Meses', 10000, 6),
	(86, '8.1 - ARMA NÃO LETAL #5 Meses Por Arma', 3000, 7),
	(87, '8.2 - CLASSE 1 #15 Meses Por Arma', 3000, 7),
	(88, '8.3 - CLASSE 2 #20 Meses', 7000, 7),
	(89, '8.4 - CLASSE 3 #30 Meses', 25000, 7),
	(90, '8.5 - CLASSE 4 #40 Meses', 40000, 7),
	(91, '8.6 - POSSE DE MUNIÇÃO CLASSE 1 #2 Meses', 1000, 7),
	(92, '8.7 - POSSE DE MUNIÇÃO CLASSE 2 #6 Meses', 2500, 7),
	(93, '8.8 - POSSE DE MUNIÇÃO CLASSE 3 #12 Meses', 3500, 7),
	(94, '8.9 - ARMA BRANCA #10 Meses', 3000, 7),
	(95, '8.10 - POSSO DE FERRAMENTAS DE ROUBO #7 Meses', 2000, 7),
	(96, '8.11 - POSSE DE "BLUEPRINTS" ILEGAIS #15 Meses', 10000, 7),
	(97, '9.1 - TRÁFICO DE ARMAS #35 Meses', 50000, 8),
	(98, '9.2 - TRÁFICO DE HAXIXE #1 Mes Por Saco', 50, 8),
	(99, '9.3 - TRÁFICO DE PARTES DE ARMAMENTO #10 Meses', 50, 8),
	(100, '9.4 - TRÁFICO DE METAFEMININA #2 Meses', 150, 8),
	(101, '9.5 - VENDA ILEGAL DE OBJETOS', 2500, 8),
	(102, '9.6 - PLANTAÇÃO DE HAXIXE #2 Meses', 4000, 8),
	(103, '9.7 - PRODUÇÃO DE METAFETAMINA #30 Meses', 30000, 8),
	(104, '9.10 - POSSE DE EQUIPAMENTOS DE DROGAS #10 Meses', 2500, 8),
	(105, '9.11 - POSSE DE SEMENTES MACHO/FÊMEA #1 Mes Por Semente', 0, 8);

-- Dumping structure for table legacy.infinityac
CREATE TABLE IF NOT EXISTS `infinityac` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `steam` varchar(100) NOT NULL,
  `license` varchar(100) NOT NULL,
  `license2` varchar(100) NOT NULL,
  `discord` varchar(100) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `xbl` varchar(100) NOT NULL,
  `liveid` varchar(100) NOT NULL,
  `fivem` varchar(100) NOT NULL,
  `hwid` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `reason` varchar(100) NOT NULL,
  `screenshot` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.infinityac: ~0 rows (approximately)
DELETE FROM `infinityac`;

-- Dumping structure for table legacy.inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.inventories: ~0 rows (approximately)
DELETE FROM `inventories`;

-- Dumping structure for table legacy.inventorysaver
CREATE TABLE IF NOT EXISTS `inventorysaver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `loadout` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1234 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.inventorysaver: ~0 rows (approximately)
DELETE FROM `inventorysaver`;

-- Dumping structure for table legacy.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  `desc` text DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.items: ~188 rows (approximately)
DELETE FROM `items`;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `desc`) VALUES
	('2jzengine', 'Motor 2JZ', 1, 0, 1, NULL),
	('acetone', 'Acetona', 1, 0, 1, NULL),
	('advancedlockpick', 'Gazua Avançada', 1, 0, 1, NULL),
	('agua_purificada', 'Agua Purificada', 1, 0, 1, NULL),
	('aluminio', 'Aluminio', 0.1, 0, 1, NULL),
	('anel', 'Anel', 1, 0, 1, NULL),
	('anel_rubi', 'Anel de Ruby', 0.1, 0, 1, NULL),
	('armacao_pistola', 'Armação de Pistola', 1, 0, 1, NULL),
	('arma_mola', 'Mola', 1, 0, 1, NULL),
	('bag', 'Mala', 1, 0, 1, NULL),
	('bagofdope', 'Saco de Erva (2g)', 0.1, 0, 1, NULL),
	('bagofmeth', 'Saco de Meth (2g)', 0.1, 0, 1, NULL),
	('bandage', 'Bandagem', 1, 0, 1, NULL),
	('beer', 'Cerveja', 1, 0, 1, NULL),
	('binder', 'Caderneta', 1, 0, 1, NULL),
	('blowtorch', 'Maçarico', 1, 0, 1, NULL),
	('bread', 'Pão', 0.3, 0, 1, NULL),
	('burger', 'Hamburguer', 0.75, 0, 1, NULL),
	('bzgas', 'Granada de Gás (Empacotada)', 1, 0, 1, NULL),
	('cabomadeira', 'Cabo de Madeira', 1, 0, 1, NULL),
	('cano_arma', 'Cano de Arma', 1, 0, 1, NULL),
	('cao_arma', 'Cão de Arma', 1, 0, 1, NULL),
	('carbon_metal', 'Barra de Carbono', 1, 0, 1, NULL),
	('carbon_rock', 'Minério de Carbono', 1, 0, 1, NULL),
	('cartucho', 'Cartuchos de Balas', 1, 0, 1, NULL),
	('chocolate', 'Chocolate', 0.1, 0, 1, NULL),
	('cigarro', 'Cigarro', 1, 0, 1, NULL),
	('cigarrodeenrolar', 'Cigarro de Enrolar', 1, 0, 1, NULL),
	('claw2', 'Gato Emo', 1, 0, 1, NULL),
	('claw3', 'Gato Bond', 1, 0, 1, NULL),
	('claw4', 'Gato Cagado', 1, 0, 1, NULL),
	('claw5', 'Gato Drogado', 1, 0, 1, NULL),
	('claw6', 'Gato Fixe', 1, 0, 1, NULL),
	('claw7', 'Gato Sensei', 1, 0, 1, NULL),
	('claw8', 'Gato Escolar', 1, 0, 1, NULL),
	('claw9', 'Gato E-Girl', 1, 0, 1, NULL),
	('cola', 'Coca-Cola', 0.5, 0, 1, NULL),
	('colete', 'Colete', 1, 0, 1, NULL),
	('compal', 'Compal', 0.35, 0, 1, NULL),
	('contract', 'Contrato', 1, 0, 1, NULL),
	('cpu', 'Processador', 1, 0, 1, NULL),
	('cuff', 'Algemas', 1, 0, 1, NULL),
	('cutter', 'Cortador de Vidro', 1, 0, 1, NULL),
	('diamond', 'Diamente', 1, 0, 1, NULL),
	('diamond_box', 'Caixa de Diamentes', 1, 0, 1, NULL),
	('dopebag', 'Sacos de Embalar (5x)', 1, 0, 1, NULL),
	('ducttape', 'Fita Adesiva', 0, 0, 1, NULL),
	('fanta', 'Fanta', 0.5, 0, 1, NULL),
	('fertilizante', 'Fertilizante', 1, 0, 1, NULL),
	('ficha', 'Bilhete de Garras', 1, 0, 1, NULL),
	('filtro', 'Filtro', 1, 0, 1, NULL),
	('fishingknife', 'Faca Utilitária', 1, 0, 1, NULL),
	('fixkit', 'Kit de Reparação', 1, 0, 1, NULL),
	('foice', 'Foice', 1, 0, 1, NULL),
	('folhadetabaco', 'Folha de Tabaco', 1, 0, 1, NULL),
	('ganza', 'Ganza', 1, 0, 1, NULL),
	('gasmask', 'Máscara de Gás', 1, 0, 1, NULL),
	('gatilho', 'Gatilho', 1, 0, 1, NULL),
	('gold_chain', 'Corrente de Ouro', 1, 0, 1, NULL),
	('gold_metal', 'Barra de Ouro', 1, 0, 1, NULL),
	('gold_rock', 'Minério de Ouro', 1, 0, 1, NULL),
	('graodecafe', 'Grão de Café', 0.1, 0, 1, NULL),
	('gt3flat6', 'gt3flat6', 1, 0, 1, NULL),
	('heavy_pistol', 'Pistola Pesada (Descarregada)', 1, 0, 1, NULL),
	('hunter_animal_bonefragments', 'Fragmentos de Ossos de Animal', 1, 0, 1, NULL),
	('hunter_animal_cloth', 'Tecido de Animal', 1, 0, 1, NULL),
	('hunter_animal_fat', 'Gordura Animal', 1, 0, 1, NULL),
	('hunter_animal_leather', 'Couro', 1, 0, 1, NULL),
	('hunter_meat_boar', 'Carne de Javali', 1, 0, 1, NULL),
	('hunter_meat_chicken', 'Carne de Frango', 1, 0, 1, NULL),
	('hunter_meat_deer', 'Carne de Veado', 1, 0, 1, NULL),
	('hunter_meat_lion', 'Carne de Leão', 1, 0, 1, NULL),
	('icetea', 'Ice-Tea', 0.5, 0, 1, NULL),
	('iron_metal', 'Barra de Ferro', 1, 0, 1, NULL),
	('iron_rock', 'Minério de Ferro', 1, 0, 1, NULL),
	('isqueiro', 'Isqueiro', 1, 0, 1, NULL),
	('k20a', 'k20a', 1, 0, 1, NULL),
	('kevlar', 'Kevlar', 1, 0, 1, NULL),
	('key', 'Chaves de Algemas', 1, 0, 1, NULL),
	('lambov10', 'lambov10', 1, 0, 1, NULL),
	('lawyer_license', 'Licensa de Advogado', 1, 0, 1, NULL),
	('lithium', 'Bateria de Litio', 1, 0, 1, NULL),
	('lockpick', 'Gazua', 1, 0, 1, NULL),
	('m158huayra', 'm158huayra', 1, 0, 1, NULL),
	('m297zonda', 'm297zonda', 1, 0, 1, NULL),
	('mechanic_tools', 'Ferramentas de Mecânico', 1, 0, 1, NULL),
	('medikit', 'Kit Médico', 2, 0, 1, NULL),
	('meth', 'Saco de Meth (50g)', 1, 0, 1, NULL),
	('methlab', 'Kit de Meth Portátil', 1, 0, 1, NULL),
	('michelin_tires', 'Pneus Michelin', 1, 0, 1, NULL),
	('mortalha', 'Mortalha', 1, 0, 1, NULL),
	('musv8', 'musv8', 1, 0, 1, NULL),
	('nail', 'Prego', 0, 0, 1, NULL),
	('ngk_sparkplugs', 'Velas de Ignição NGK', 1, 0, 1, NULL),
	('nos', 'Nitro', 1, 0, 1, NULL),
	('onca', 'Onça de Tabaco', 1, 0, 1, NULL),
	('oxygen_mask', 'Máscara de Oxigénio', 1, 0, 1, NULL),
	('p60b40', 'p60b40', 1, 0, 1, NULL),
	('Pentrite', 'Pentrite', 1, 0, 1, NULL),
	('percursor', 'Percursor de Arma', 1, 0, 1, NULL),
	('phone', 'Telemóvel', 1, 0, 1, NULL),
	('pistola', 'Pistola (Descarregada)', 1, 0, 1, NULL),
	('pistola_sns', 'Pistola SNS (Descarregada)', 1, 0, 1, NULL),
	('pistol_ammo', 'Munição 9mm', 1, 0, 1, NULL),
	('pistol_suppressor', 'Silenciador de Pistola', 1, 0, 1, NULL),
	('pizza', 'Pizza', 0.7, 0, 1, NULL),
	('plastico', 'Plastico', 1, 0, 1, NULL),
	('polvora', 'Polvora', 1, 0, 1, NULL),
	('predatorv8', 'predatorv8', 1, 0, 1, NULL),
	('quadro', 'Obra Prima (Quadro)', 1, 0, 1, NULL),
	('race_brakes', 'Travões de Corrida', 1, 0, 1, NULL),
	('race_suspension', 'Suspensão de Corrida', 1, 0, 1, NULL),
	('race_transmission', 'Transmissão Rodas Traseiras', 1, 0, 1, NULL),
	('race_transmission_4wd', 'Transmissão 4 Rodas', 1, 0, 1, NULL),
	('race_transmission_fwd', 'Transmissão Rodas Fronteiras', 1, 0, 1, NULL),
	('radio', 'Rádio', 1, 0, 1, NULL),
	('rb26det', 'rb26det', 1, 0, 1, NULL),
	('recipe_advancedlockpick', 'BP de Gazua Avançada', 0.1, 0, 1, NULL),
	('recipe_colete', 'BP de Colete', 0.1, 0, 1, NULL),
	('recipe_lockpick', 'BP de Gazua', 0.1, 0, 1, NULL),
	('recipe_methlab', 'BP de Kit de Meth Portátil', 0.1, 0, 1, NULL),
	('recipe_pentrite', 'BP de Pentrite', 0.1, 0, 1, NULL),
	('recipe_pistol_ammo', 'BP de Munição 9mm', 0.1, 0, 1, NULL),
	('recipe_pistol_suppressor', 'BP de Silenciador de Pistola', 0.1, 0, 1, NULL),
	('recipe_rifle_ammo', 'BP de Munição 5,56×45mm', 0.1, 0, 1, NULL),
	('recipe_smg_ammo', 'BP de Munição Munição 7.62x39mm', 0.1, 0, 1, NULL),
	('recipe_weapon_heavypistol', 'BP de Heavy Pistol', 0.1, 0, 1, NULL),
	('recipe_weapon_pistol', 'BP de Pistola', 0.1, 0, 1, NULL),
	('recipe_weapon_pistolsns', 'BP de Pistola SNS', 0.1, 0, 1, NULL),
	('recipe_weapon_switchblade', 'BP de Canivete', 0.1, 0, 1, NULL),
	('regador', 'Regador', 1, 0, 1, NULL),
	('rifle_ammo', 'Munição 5,56×45mm', 0.5, 0, 1, NULL),
	('rifle_suppressor', 'Silenciador de Rifle', 0.5, 0, 1, NULL),
	('rolex', 'Rolex', 1, 0, 1, NULL),
	('rotary7', 'rotary7', 1, 0, 1, NULL),
	('rubber', 'Borracha', 1, 0, 1, NULL),
	('sandes', 'Sandes', 0.8, 0, 1, NULL),
	('screw', 'Parafusos', 0, 0, 1, NULL),
	('screwdriver', 'Chave de Fendas', 0, 0, 1, NULL),
	('semente_femea', 'Semente de Erva (Femea)', 0.1, 0, 1, NULL),
	('semente_macho', 'Semente de Erva (Macho)', 0.1, 0, 1, NULL),
	('seringa', 'Seringa', 1, 0, 1, NULL),
	('shell_oil', 'Óleo Shell', 1, 0, 1, NULL),
	('shonen', 'shonen', 1, 0, 1, NULL),
	('shotgun_ammo', 'Munição Calibre 12', 1, 0, 1, NULL),
	('simcard', 'Cartão SIM', 0, 0, 1, NULL),
	('smg_ammo', 'Munição 7.62x39mm', 1, 0, 1, NULL),
	('smg_suppressor', 'Silenciador de SMG', 1, 0, 1, NULL),
	('sponge', 'Esponja', 1, 0, 1, NULL),
	('stock_brakes', 'Travões Padrão', 1, 0, 1, NULL),
	('stock_engine', 'Motor Padrão', 1, 0, 1, NULL),
	('stock_oil', 'Óleo Padrão', 1, 0, 1, NULL),
	('stock_sparkplugs', 'Velas de Ignição Padrão', 1, 0, 1, NULL),
	('stock_suspension', 'Suspensão Padrão', 1, 0, 1, NULL),
	('stock_tires', 'Pneus Padrão', 1, 0, 1, NULL),
	('stock_transmission', 'Transmissão Padrão', 1, 0, 1, NULL),
	('stone_rock', 'Pedra', 1, 0, 1, NULL),
	('sumo', 'Sumo de Laranja', 1, 0, 1, NULL),
	('switchblade', 'Canivete (No bolso)', 1, 0, 1, NULL),
	('taco', 'Taco (Não Gasto)', 1, 0, 1, NULL),
	('tambor_arma', 'Tambor de Arma', 1, 0, 1, NULL),
	('toolbox', 'Tool Box', 1, 0, 1, NULL),
	('turbo_lvl_1', 'Turbo', 1, 0, 1, NULL),
	('uwubentobox', 'UwU Happy Meal', 1, 0, 1, NULL),
	('uwububbleteablueberry', 'UwU Sumo de Mirtilo', 1, 0, 1, NULL),
	('uwububbleteamint', 'UwU Sumo de Menta', 1, 0, 1, NULL),
	('uwububbletearose', 'UwU Sumo de Rosas', 1, 0, 1, NULL),
	('uwubudhabowl', 'UwU Salada', 1, 0, 1, NULL),
	('uwuchocsandy', 'UwU Sandes de chocolate', 1, 0, 1, NULL),
	('uwucupcake', 'UwU Cupcake', 1, 0, 1, NULL),
	('uwumisosoup', 'UwU Sopa', 1, 0, 1, NULL),
	('uwupancake', 'UwU Pancake', 1, 0, 1, NULL),
	('uwushushi', 'UwU Sushi', 1, 0, 1, NULL),
	('uwuvanillasandy', 'UwU Sandes', 1, 0, 1, NULL),
	('v8engine', 'Motor V8', 1, 0, 1, NULL),
	('vanBottle', 'Tequila Pura', 1, 0, 1, NULL),
	('vanDiamond', 'Ruby', 1, 0, 1, NULL),
	('vanNecklace', 'Colar de Diamantes', 1, 0, 1, NULL),
	('vanPanther', 'Obra Prima (Pantera)', 1, 0, 1, NULL),
	('vaso', 'Vaso', 1, 0, 1, NULL),
	('vidro', 'Vidro', 1, 0, 1, NULL),
	('water', 'Água', 1, 0, 1, NULL),
	('weapon_luxeskin', 'Skin Luxe', 1, 0, 1, NULL),
	('weed', 'Weed', 0.1, 0, 1, NULL),
	('weed_10', 'Tira de Erva (10g)', 1, 0, 1, NULL),
	('weed_100', 'Tijolo de Erva (100g)', 1, 0, 1, NULL),
	('wood_processed', 'Madeira Processada', 1, 0, 1, NULL),
	('wood_raw', 'Madeira', 1, 0, 1, NULL);

-- Dumping structure for table legacy.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  `enable_billing` int(1) DEFAULT 0,
  `can_rob` int(1) DEFAULT 0,
  `can_handcuff` int(1) DEFAULT 0,
  `can_lockpick_cars` int(1) DEFAULT 0,
  `can_wash_vehicles` int(1) DEFAULT 0,
  `can_repair_vehicles` int(1) DEFAULT 0,
  `can_impound_vehicles` int(1) DEFAULT 0,
  `can_check_identity` int(1) DEFAULT 0,
  `can_check_vehicle_owner` int(1) DEFAULT 0,
  `can_check_driving_license` int(1) DEFAULT 0,
  `can_check_weapon_license` int(1) DEFAULT 0,
  `can_heal` int(1) DEFAULT 0,
  `can_revive` int(1) DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.jobs: ~6 rows (approximately)
DELETE FROM `jobs`;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `enable_billing`, `can_rob`, `can_handcuff`, `can_lockpick_cars`, `can_wash_vehicles`, `can_repair_vehicles`, `can_impound_vehicles`, `can_check_identity`, `can_check_vehicle_owner`, `can_check_driving_license`, `can_check_weapon_license`, `can_heal`, `can_revive`) VALUES
	('ambulance', 'SEM', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	('dynasty', 'Dynasty', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	('lawyer', 'Saul Goodman', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	('mechanic', 'Benny\'s', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	('police', 'DPLS', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	('unemployed', 'Desempregrado', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Dumping structure for table legacy.jobs_armories
CREATE TABLE IF NOT EXISTS `jobs_armories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weapon` varchar(50) NOT NULL,
  `components` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ammo` int(10) unsigned NOT NULL,
  `tint` int(11) NOT NULL,
  `marker_id` int(11) NOT NULL,
  `identifier` varchar(80) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`marker_id`,`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.jobs_armories: ~0 rows (approximately)
DELETE FROM `jobs_armories`;

-- Dumping structure for table legacy.jobs_data
CREATE TABLE IF NOT EXISTS `jobs_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `coords` varchar(300) NOT NULL DEFAULT '',
  `grades_type` varchar(20) DEFAULT NULL,
  `specific_grades` varchar(255) DEFAULT NULL,
  `min_grade` smallint(6) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blip_id` int(11) DEFAULT NULL,
  `blip_color` int(11) DEFAULT 0,
  `blip_scale` float DEFAULT 1,
  `label` varchar(50) DEFAULT NULL,
  `marker_type` int(11) DEFAULT 1,
  `marker_scale_x` float DEFAULT 1.5,
  `marker_scale_y` float DEFAULT 1.5,
  `marker_scale_z` float DEFAULT 0.5,
  `marker_color_red` int(3) DEFAULT 150,
  `marker_color_green` int(3) DEFAULT 150,
  `marker_color_blue` int(3) DEFAULT 0,
  `marker_color_alpha` int(3) DEFAULT 50,
  `ped` varchar(50) DEFAULT NULL,
  `ped_heading` float DEFAULT NULL,
  `object` varchar(50) DEFAULT NULL,
  `object_pitch` float DEFAULT NULL,
  `object_roll` float DEFAULT NULL,
  `object_yaw` float DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.jobs_data: ~42 rows (approximately)
DELETE FROM `jobs_data`;
INSERT INTO `jobs_data` (`id`, `job_name`, `type`, `coords`, `grades_type`, `specific_grades`, `min_grade`, `data`, `blip_id`, `blip_color`, `blip_scale`, `label`, `marker_type`, `marker_scale_x`, `marker_scale_y`, `marker_scale_z`, `marker_color_red`, `marker_color_green`, `marker_color_blue`, `marker_color_alpha`, `ped`, `ped_heading`, `object`, `object_pitch`, `object_roll`, `object_yaw`) VALUES
	(1, 'police', 'boss', '{"y":"-984.82","x":"459.91","z":"30.69"}', 'minimumGrade', NULL, 9, '{"canEmployees":true,"canDeposit":true,"canWashMoney":false,"canGrades":true,"canWithdraw":true}', NULL, NULL, NULL, 'Menu do Chefe', 27, 0.5, 0.5, 0.5, 255, 255, 255, 178, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'mechanic', 'boss', '{"z":"34.90","y":"-1340.73","x":"-198.62"}', 'minimumGrade', NULL, 5, '{"canGrades":true,"canWashMoney":false,"canDeposit":true,"canWithdraw":true,"canEmployees":true}', NULL, NULL, NULL, 'Menu Chefe', 27, 0.5, 0.5, 0.5, 255, 255, 255, 173, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'mechanic', 'stash', '{"z":"31.09","x":"-198.41","y":"-1315.37"}', 'minimumGrade', NULL, 1, '[]', NULL, NULL, NULL, 'Armário Bennys', 27, 0.5, 0.5, 0.5, 255, 255, 255, 186, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'mechanic', 'boss', '{"y":"-1330.92","x":"-195.94","z":"34.90"}', 'minimumGrade', NULL, 3, '{"canEmployees":true,"canDeposit":true,"canWashMoney":false,"canGrades":false,"canWithdraw":false}', NULL, NULL, NULL, 'Menu Sub-Chefe / Gerente de Oficina', 27, 0.5, 0.5, 0.5, 255, 255, 255, 188, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'mechanic', 'wardrobe', '{"z":"18.46","y":"-1305.43","x":"-210.68"}', 'minimumGrade', NULL, 1, '[]', NULL, NULL, NULL, 'Roupas Bennys', 27, 0.5, 0.5, 0.5, 255, 255, 255, 169, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'mechanic', 'garage', '{"x":"-200.71","z":"31.09","y":"-1318.37"}', 'minimumGrade', NULL, 1, '{"heading":1.45,"vehicles":{"flatbed3":{"secondaryColor":"#00000000","primaryColor":"#00000000","plate":"BENNYS"}},"spawnCoords":{"x":-181.88,"z":30.3,"y":-1320.83}}', NULL, NULL, NULL, 'Reboque Bennys', 27, 0.5, 0.5, 0.5, 255, 255, 255, 179, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'mechanic', 'garage', '{"z":"31.30","y":"-1315.07","x":"-182.59"}', 'minimumGrade', NULL, 1, '{"vehicles":{"flatbed3":{"primaryColor":"#111111","plate":"BENNYS","secondaryColor":"#111111"}},"spawnCoords":{"z":30.3,"y":-1315.07,"x":-182.59},"heading":355.75}', NULL, NULL, NULL, 'Guardar Reboque Bennys', 27, 0.5, 0.5, 0.5, 255, 255, 255, 188, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'ambulance', 'job_outfit', '{"y":"-600.22","z":"43.28","x":"301.77"}', 'minimumGrade', NULL, 1, '{"outfits":[]}', NULL, NULL, NULL, 'Roupa de Trabalho Hospital', 27, 0.5, 0.5, 0.5, 255, 255, 255, 181, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'ambulance', 'stash', '{"y":"-600.70","z":"43.28","x":"303.69"}', 'minimumGrade', NULL, 1, NULL, NULL, NULL, NULL, 'Armario Hospital', 27, 0.5, 0.5, 0.5, 255, 255, 255, 183, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'ambulance', 'boss', '{"y":"-594.06","x":"334.84","z":"43.28"}', 'minimumGrade', NULL, 6, '{"canEmployees":true,"canDeposit":true,"canWashMoney":false,"canGrades":true,"canWithdraw":true}', NULL, NULL, NULL, 'Boss Menu Hospital', 27, 0.5, 0.5, 0.5, 255, 255, 255, 142, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'public_marker', 'teleport', '{"x":"332.32","y":"-595.66","z":"43.28"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"x":341.52,"y":-581.04,"z":27.8}}', NULL, NULL, NULL, 'Elevador Hospital Descer', 27, 0.5, 0.5, 0.5, 255, 255, 255, 183, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'public_marker', 'teleport', '{"x":"341.40","y":"-581.07","z":"28.80"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"x":332.33,"y":-595.65,"z":42.28}}', NULL, NULL, NULL, 'Elevador Hospital Subir', 27, 0.5, 0.5, 0.5, 255, 255, 255, 173, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'ambulance', 'garage', '{"x":"336.92","y":"-580.50","z":"28.80"}', 'minimumGrade', NULL, 1, '{"vehicles":{"ambulance":{"primaryColor":"#111111","plate":"SEM","secondaryColor":"#111111"},"qrv":{"primaryColor":"#111111","plate":"SEM","secondaryColor":"#111111"}},"spawnCoords":{"x":336.92,"y":-580.5,"z":27.8},"heading":337.66}', NULL, NULL, NULL, 'Garagem S.E.M', 27, 0.5, 0.5, 0.5, 255, 255, 255, 176, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'ambulance', 'garage_owned', '{"x":"320.63","y":"-565.54","z":"28.80"}', 'minimumGrade', NULL, 1, '{"spawnCoords":{"x":318.24,"y":-564.58,"z":27.8},"heading":252.69}', NULL, NULL, NULL, 'Carros Pessoais Hospital', 27, 0.5, 0.5, 0.5, 255, 255, 255, 185, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 'public_marker', 'crafting_table', '{"z":"30.90","y":"-2008.09","x":"1109.84"}', 'minimumGrade', NULL, 0, '{"craftablesItems":{"iron_metal":{"quantity":2,"animations":[{"type":"scenario","scenarioName":"PROP_HUMAN_BUM_BIN","scenarioDuration":15}],"craftingTime":17,"recipes":{"iron_rock":{"quantity":2,"loseOnUse":true}}},"gold_metal":{"quantity":2,"animations":[{"type":"scenario","scenarioName":"PROP_HUMAN_BUM_BIN","scenarioDuration":15}],"craftingTime":15,"recipes":{"gold_rock":{"quantity":2,"loseOnUse":true}}},"carbon_metal":{"quantity":2,"animations":[{"type":"scenario","scenarioName":"PROP_HUMAN_BUM_BIN","scenarioDuration":15}],"craftingTime":15,"recipes":{"carbon_rock":{"quantity":2,"loseOnUse":true}}}}}', 617, 17, 0.7, 'Fundição', 27, 0.5, 0.5, 0.5, 255, 255, 255, 157, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, 'public_marker', 'crafting_table', '{"z":"73.59","x":"-552.27","y":"5327.81"}', 'minimumGrade', NULL, 0, '{"craftablesItems":{"wood_processed":{"quantity":1,"animations":[{"scenarioDuration":15,"type":"scenario","scenarioName":"PROP_HUMAN_BUM_BIN"}],"recipes":{"wood_raw":{"quantity":2,"loseOnUse":true}},"craftingTime":8}}}', 478, 17, 0.7, 'Serraria', 27, 0.5, 0.5, 0.5, 255, 255, 255, 176, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 'police', 'garage', '{"z":"25.70","x":"459.02","y":"-993.54"}', 'minimumGrade', NULL, 1, '{"vehicles":{"polvic":{"secondaryColor":"#111111","plate":"DPLS","primaryColor":"#111111"},"camaroRB":{"secondaryColor":"#111111","plate":"DPLS","primaryColor":"#111111"},"poltah":{"secondaryColor":"#111111","plate":"DPLS","primaryColor":"#111111"},"polchar":{"secondaryColor":"#111111","plate":"DPLS","primaryColor":"#111111"},"polraptor":{"secondaryColor":"#111111","plate":"DPLS","primaryColor":"#111111"},"poltaurus":{"secondaryColor":"#111111","plate":"DPLS","primaryColor":"#111111"},"uccoquette":{"primaryColor":"#111111","secondaryColor":"#111111"}},"heading":266.67,"spawnCoords":{"z":24.7,"x":446.56,"y":-994.29}}', NULL, NULL, NULL, 'Garagem DPLS', 27, 0.5, 0.5, 0.5, 255, 255, 255, 178, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 'public_marker', 'market', '{"z":"35.36","y":"-1270.54","x":"1220.92"}', 'minimumGrade', NULL, 0, '{"percentageForSociety":0,"items":{"wood_processed":{"sellTime":0,"blackMoney":false,"maxPrice":60,"minPrice":45}}}', 85, 31, 0.7, 'Venda de Madeira', 27, 0.5, 0.5, 0.5, 255, 255, 255, 181, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, 'public_marker', 'market', '{"z":"38.06","y":"-229.84","x":"-622.34"}', 'minimumGrade', NULL, 0, '{"percentageForSociety":0,"items":{"iron_metal":{"sellTime":0,"blackMoney":false,"maxPrice":50,"minPrice":37},"gold_metal":{"sellTime":0,"blackMoney":false,"maxPrice":70,"minPrice":55},"carbon_metal":{"sellTime":0,"blackMoney":false,"maxPrice":40,"minPrice":27}}}', 617, 48, 0.7, 'Venda de Minérios', 27, 0.5, 0.5, 0.5, 255, 255, 255, 162, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 'public_marker', 'market', '{"y":"-1162.46","x":"-218.57","z":"23.02"}', 'minimumGrade', NULL, 0, '{"percentageForSociety":0,"items":{"hunter_animal_bonefragments":{"maxPrice":70,"blackMoney":false,"sellTime":0,"minPrice":50},"hunter_meat_boar":{"maxPrice":90,"blackMoney":false,"sellTime":0,"minPrice":80},"hunter_animal_fat":{"maxPrice":40,"blackMoney":false,"sellTime":0,"minPrice":20},"hunter_meat_lion":{"maxPrice":120,"blackMoney":false,"sellTime":0,"minPrice":95},"hunter_animal_leather":{"maxPrice":150,"blackMoney":false,"sellTime":0,"minPrice":120},"hunter_animal_cloth":{"maxPrice":90,"blackMoney":false,"sellTime":0,"minPrice":80},"hunter_meat_chicken":{"maxPrice":50,"blackMoney":false,"sellTime":0,"minPrice":40},"hunter_meat_deer":{"maxPrice":120,"blackMoney":false,"sellTime":0,"minPrice":95}}}', 442, 1, 0.7, 'Venda de Caça', 27, 0.5, 0.5, 0.5, 255, 255, 255, 183, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, 'public_marker', 'teleport', '{"z":"28.12","y":"3675.80","x":"3540.70"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"z":19.99,"y":3676.21,"x":3540.66}}', NULL, NULL, NULL, 'Elevador Human labs - Descer', 127, 0.5, 0.5, 0.5, 255, 255, 255, 173, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, 'public_marker', 'teleport', '{"z":"20.99","y":"3676.21","x":"3540.66"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"z":27.12,"y":3675.7,"x":3540.72}}', NULL, NULL, NULL, 'Elevador Human Labs - Subir', 27, 0.5, 0.5, 0.5, 255, 255, 255, 178, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, 'lawyer', 'boss', '{"z":"19.10","x":"-1912.31","y":"-570.38"}', 'minimumGrade', NULL, 1, '{"canGrades":false,"canWithdraw":true,"canWashMoney":false,"canDeposit":true,"canEmployees":false}', NULL, NULL, NULL, 'Menu Chefe Saul', 27, 0.5, 0.5, 0.5, 255, 255, 255, 183, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, 'lawyer', 'wardrobe', '{"z":"19.10","x":"-1902.20","y":"-572.26"}', 'minimumGrade', NULL, 1, '[]', NULL, NULL, NULL, 'Guarda-Roupa Saul', 27, 0.5, 0.5, 0.5, 255, 255, 255, 186, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, 'mechanic', 'shop', '{"x":"-216.37","y":"-1318.56","z":"30.89"}', 'minimumGrade', NULL, 1, '{"itemsOnSale":{"fixkit":{"price":0,"blackMoney":false},"sponge":{"price":0,"blackMoney":false}}}', NULL, NULL, NULL, 'Loja Bennys', 27, 0.5, 0.5, 0.5, 255, 255, 255, 181, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, 'ambulance', 'wardrobe', '{"z":"43.28","y":"-596.36","x":"297.87"}', 'minimumGrade', NULL, 1, '[]', NULL, NULL, NULL, 'Roupas Player Hospital', 27, 1.5, 1.5, 0.5, 255, 255, 255, 185, NULL, NULL, NULL, NULL, NULL, NULL),
	(34, 'ambulance', 'duty', '{"y":"-599.51","x":"298.10","z":"43.28"}', 'minimumGrade', NULL, 1, '[]', NULL, NULL, NULL, 'Entrar / Sair de Serviço S.E.M', 27, 0.5, 0.5, 0.5, 255, 255, 255, 179, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, 'police', 'garage', '{"x":"450.22","y":"-981.20","z":"43.69"}', 'minimumGrade', NULL, 1, '{"heading":104.8,"vehicles":{"polmav":{"primaryColor":"#111111","plate":"DPLS","secondaryColor":"#111111"}},"spawnCoords":{"x":450.22,"y":-981.2,"z":42.69}}', NULL, NULL, NULL, 'Garagem Heli Esquadra', 27, 0.5, 0.5, 0.5, 255, 255, 255, 176, NULL, NULL, NULL, NULL, NULL, NULL),
	(36, 'police', 'duty', '{"x":"454.03","y":"-989.95","z":"30.65"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Entrada e Saída de serviço', 27, 0.5, 0.5, 0.5, 255, 255, 255, 174, NULL, NULL, NULL, NULL, NULL, NULL),
	(37, 'ambulance', 'duty', '{"x":"303.76","y":"-600.62","z":"42.28"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Entrada e Saída de serviço', 27, 0.5, 0.5, 0.5, 255, 255, 255, 190, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, 'police', 'wardrobe', '{"x":"461.83","y":"-999.26","z":"30.69"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Guarda Roupa', 27, 0.5, 0.5, 0.5, 255, 255, 255, 188, NULL, NULL, NULL, NULL, NULL, NULL),
	(39, 'public_marker', 'teleport', '{"x":"-176.59","y":"-1015.44","z":"27.18"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"x":-145.7,"y":-997.22,"z":52.06}}', NULL, NULL, NULL, 'Elevador Subir Predio Praca', 27, 0.5, 0.5, 0.5, 255, 255, 255, 188, NULL, NULL, NULL, NULL, NULL, NULL),
	(40, 'public_marker', 'teleport', '{"x":"-145.70","y":"-997.22","z":"53.06"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"x":-176.54,"y":-1015.45,"z":26.18}}', NULL, NULL, NULL, 'Elevador Descer Predio Praca', 27, 0.5, 0.5, 0.5, 255, 255, 255, 181, NULL, NULL, NULL, NULL, NULL, NULL),
	(41, 'ambulance', 'garage', '{"z":"74.16","x":"351.89","y":"-587.96"}', 'minimumGrade', NULL, 0, '{"spawnCoords":{"z":73.16,"x":351.89,"y":-587.96},"heading":298.55,"vehicles":{"supervolito":{"primaryColor":"#ecfc03","secondaryColor":"#111111"}}}', NULL, NULL, NULL, 'Helicópteros', 27, 1, 1, 1, 255, 255, 255, 197, NULL, NULL, NULL, NULL, NULL, NULL),
	(42, 'ambulance', 'teleport', '{"z":"74.16","x":"338.63","y":"-583.79"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"z":42.28,"x":327.17,"y":-603.61}}', NULL, NULL, NULL, 'Descer', 27, 0.5, 0.5, 0.5, 255, 255, 255, 185, NULL, NULL, NULL, NULL, NULL, NULL),
	(43, 'ambulance', 'teleport', '{"z":"43.28","x":"327.17","y":"-603.61"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"z":73.16,"x":338.55,"y":-583.76}}', NULL, NULL, NULL, 'Subir', 27, 0.5, 0.5, 0.5, 255, 255, 255, 181, NULL, NULL, NULL, NULL, NULL, NULL),
	(44, 'mechanic', 'shop', '{"x":"-239.75","z":"18.38","y":"-1315.71"}', 'minimumGrade', NULL, 3, '{"itemsOnSale":{"turbo_lvl_1":{"blackMoney":false,"price":0},"stock_tires":{"blackMoney":false,"price":0},"nos":{"blackMoney":false,"price":0},"stock_oil":{"blackMoney":false,"price":0},"stock_brakes":{"blackMoney":false,"price":0},"stock_suspension":{"blackMoney":false,"price":0},"race_brakes":{"blackMoney":false,"price":0},"ngk_sparkplugs":{"blackMoney":false,"price":0},"race_suspension":{"blackMoney":false,"price":0},"race_transmission":{"blackMoney":false,"price":0},"shell_oil":{"blackMoney":false,"price":0},"race_transmission_4wd":{"blackMoney":false,"price":0},"race_transmission_fwd":{"blackMoney":false,"price":0},"v8engine":{"blackMoney":false,"price":0},"2jzengine":{"blackMoney":false,"price":0},"stock_engine":{"blackMoney":false,"price":0},"stock_transmission":{"blackMoney":false,"price":0},"michelin_tires":{"blackMoney":false,"price":0},"stock_sparkplugs":{"blackMoney":false,"price":0}}}', NULL, NULL, NULL, 'Modificações', 27, 0.5, 0.5, 0.5, 255, 255, 255, 186, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, 'public_marker', 'stash', '{"y":"-1395.68","z":"29.47","x":"-31.72"}', 'minimumGrade', NULL, 0, NULL, NULL, NULL, NULL, 'Frigorífico', 27, 0.5, 0.5, 0.5, 255, 255, 255, 197, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, 'dynasty', 'boss', '{"y":"261.02","z":"84.14","x":"-714.76"}', 'minimumGrade', NULL, 2, '{"canWithdraw":true,"canGrades":false,"canWashMoney":false,"canDeposit":true,"canEmployees":true}', NULL, NULL, NULL, 'Menu Chefe', 27, 0.5, 0.5, 0.5, 255, 255, 255, 197, NULL, NULL, NULL, NULL, NULL, NULL),
	(47, 'ambulance', 'boss', '{"x":"-577.57","z":"26.57","y":"-1067.56"}', 'minimumGrade', NULL, 6, '{"canWithdraw":true,"canEmployees":true,"canWashMoney":false,"canDeposit":true,"canGrades":false}', NULL, NULL, NULL, 'Menu Chefe', 27, 0.5, 0.5, 0.5, 255, 255, 255, 179, NULL, NULL, NULL, NULL, NULL, NULL),
	(48, 'ambulance', 'wardrobe', '{"x":"-586.81","z":"22.30","y":"-1049.64"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Guarda-roupa', 27, 0.5, 0.5, 0.5, 255, 255, 255, 178, NULL, NULL, NULL, NULL, NULL, NULL),
	(49, 'mechanic', 'stash', '{"z":"18.40","y":"-1332.92","x":"-219.39"}', 'minimumGrade', NULL, 4, NULL, NULL, NULL, NULL, 'Armário Chefe e SubChefe', 27, 0.5, 0.5, 0.5, 255, 255, 255, 185, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table legacy.jobs_garages
CREATE TABLE IF NOT EXISTS `jobs_garages` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `marker_id` int(11) NOT NULL,
  `vehicle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `vehicle_props` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`) USING BTREE,
  KEY `identifier` (`identifier`,`marker_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.jobs_garages: ~0 rows (approximately)
DELETE FROM `jobs_garages`;

-- Dumping structure for table legacy.jobs_shops
CREATE TABLE IF NOT EXISTS `jobs_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marker_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_type` varchar(50) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `marker_id` (`marker_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.jobs_shops: ~0 rows (approximately)
DELETE FROM `jobs_shops`;

-- Dumping structure for table legacy.jobs_wardrobes
CREATE TABLE IF NOT EXISTS `jobs_wardrobes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `label` varchar(50) NOT NULL,
  `outfit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.jobs_wardrobes: ~54 rows (approximately)
DELETE FROM `jobs_wardrobes`;
INSERT INTO `jobs_wardrobes` (`id`, `identifier`, `label`, `outfit`) VALUES
	(2, '335d7672af7086622ea4b7002a2c6b23e72845fe', 'Work', '{"torso_2":2,"mask_2":0,"beard_4":0,"moles_1":0,"chest_1":0,"beard_3":0,"skin":21,"chain_2":11,"tshirt_2":2,"glasses_2":0,"hair_color_2":0,"makeup_3":0,"sun_1":0,"helmet_2":0,"beard_2":0,"ears_2":0,"helmet_1":-1,"hair_2":3,"bproof_2":0,"eyebrows_1":1,"sun_2":0,"bodyb_1":0,"lipstick_2":0,"complexion_1":0,"complexion_2":0,"makeup_1":0,"blemishes_1":0,"age_1":5,"lipstick_3":0,"decals_2":0,"pants_1":28,"chest_2":0,"beard_1":0,"bodyb_2":0,"torso_1":72,"eyebrows_3":0,"makeup_2":0,"arms":4,"decals_1":0,"tshirt_1":21,"bags_2":0,"hair_color_1":4,"eyebrows_4":0,"watches_2":0,"face":44,"makeup_4":0,"moles_2":0,"lipstick_1":0,"lipstick_4":0,"bracelets_2":0,"eye_color":0,"hair_1":18,"blush_3":0,"bproof_1":0,"sex":0,"bracelets_1":-1,"pants_2":1,"chain_1":38,"blush_1":0,"glasses_1":0,"chest_3":0,"eyebrows_2":10,"arms_2":0,"bags_1":0,"shoes_1":15,"blemishes_2":0,"mask_1":0,"ears_1":-1,"shoes_2":0,"watches_1":-1,"blush_2":0,"age_2":10}'),
	(4, '833f45496e937270a4ecf076b0fe5d12d9b6ce51', 'Vestido Amarelo', '{"bproof_2":0,"beard_1":0,"beard_3":0,"blush_3":16,"shoes_2":0,"chest_2":0,"bags_2":0,"sun_1":0,"mask_1":0,"moles_2":0,"arms_2":0,"glasses_1":5,"makeup_2":0,"bracelets_1":-1,"bodyb_1":0,"blemishes_1":0,"blush_1":2,"chain_1":0,"hair_1":59,"age_1":0,"helmet_2":0,"eye_color":3,"beard_4":0,"face":45,"bproof_1":0,"ears_1":-1,"tshirt_1":2,"bags_1":0,"sun_2":0,"torso_1":415,"blush_2":2,"arms":11,"tshirt_2":0,"eyebrows_2":5,"skin":10,"watches_1":-1,"moles_1":0,"glasses_2":0,"bodyb_2":0,"makeup_1":3,"eyebrows_3":7,"complexion_2":0,"chain_2":0,"eyebrows_4":5,"hair_color_2":0,"makeup_3":0,"blemishes_2":0,"hair_color_1":0,"complexion_1":0,"pants_1":15,"decals_1":0,"makeup_4":0,"lipstick_1":0,"chest_3":0,"lipstick_3":52,"age_2":0,"hair_2":0,"ears_2":0,"beard_2":0,"helmet_1":-1,"lipstick_4":0,"shoes_1":1,"torso_2":10,"decals_2":0,"lipstick_2":3,"bracelets_2":0,"eyebrows_1":0,"sex":1,"watches_2":0,"mask_2":0,"pants_2":0,"chest_1":0}'),
	(5, '335d7672af7086622ea4b7002a2c6b23e72845fe', 'Casual', '{"beard_3":0,"lipstick_4":0,"helmet_2":0,"tshirt_1":75,"decals_2":0,"sun_1":0,"helmet_1":-1,"hair_color_1":4,"eyebrows_3":0,"eye_color":0,"beard_4":0,"bracelets_1":-1,"glasses_2":4,"beard_2":0,"glasses_1":3,"mask_1":0,"shoes_2":0,"bags_2":0,"face":44,"eyebrows_2":10,"chain_1":0,"arms":4,"age_2":10,"bproof_2":0,"watches_2":0,"chest_1":0,"complexion_2":0,"sun_2":0,"torso_1":338,"torso_2":2,"skin":21,"chest_3":0,"tshirt_2":0,"lipstick_3":0,"blush_3":0,"hair_2":3,"makeup_1":0,"blush_2":0,"complexion_1":0,"shoes_1":24,"moles_1":0,"blush_1":0,"bodyb_2":0,"eyebrows_1":1,"arms_2":0,"bproof_1":0,"age_1":5,"makeup_2":0,"makeup_3":0,"blemishes_2":0,"decals_1":0,"pants_1":4,"chest_2":0,"ears_1":-1,"moles_2":0,"bodyb_1":0,"bags_1":0,"hair_1":18,"eyebrows_4":0,"sex":0,"lipstick_2":0,"lipstick_1":0,"bracelets_2":0,"blemishes_1":0,"chain_2":0,"watches_1":-1,"ears_2":0,"hair_color_2":0,"mask_2":0,"beard_1":0,"pants_2":0,"makeup_4":0}'),
	(6, '13d25ca9c27b07d2558f4677d68fb9e4a97f6b05', 'negocio', '{"beard_3":29,"lipstick_4":0,"helmet_2":0,"tshirt_1":15,"decals_2":0,"sun_1":0,"hair_color_2":0,"hair_color_1":29,"eyebrows_3":0,"eye_color":3,"beard_4":0,"bracelets_1":-1,"glasses_2":0,"beard_2":10,"glasses_1":3,"mask_1":0,"shoes_2":0,"bags_2":0,"face":0,"eyebrows_2":10,"decals_1":0,"arms":11,"age_2":0,"bproof_2":0,"watches_2":0,"chest_1":0,"complexion_2":0,"sun_2":0,"torso_1":133,"torso_2":0,"skin":4,"chest_3":0,"tshirt_2":0,"lipstick_3":0,"blush_3":0,"hair_2":0,"makeup_1":22,"bags_1":0,"complexion_1":0,"shoes_1":10,"moles_1":0,"blush_1":0,"bodyb_2":0,"lipstick_1":0,"eyebrows_1":29,"ears_2":0,"arms_2":0,"makeup_2":10,"age_1":0,"chain_2":0,"ears_1":-1,"hair_1":37,"chest_2":0,"bracelets_2":0,"moles_2":0,"bodyb_1":0,"blemishes_1":0,"makeup_3":0,"eyebrows_4":0,"lipstick_2":0,"chain_1":0,"blush_2":0,"pants_1":10,"helmet_1":-1,"blemishes_2":0,"sex":0,"bproof_1":0,"watches_1":-1,"mask_2":0,"beard_1":3,"pants_2":0,"makeup_4":0}'),
	(7, '335d7672af7086622ea4b7002a2c6b23e72845fe', 'Work2(Grey/Blue)', '{"bags_2":0,"eye_color":0,"bodyb_1":0,"makeup_3":0,"chest_3":0,"beard_4":0,"hair_1":18,"bracelets_1":-1,"glasses_2":0,"blemishes_1":0,"moles_2":0,"face":44,"lipstick_1":0,"watches_2":0,"moles_1":0,"sex":0,"bodyb_2":0,"lipstick_3":0,"skin":21,"makeup_2":0,"helmet_2":0,"hair_color_2":0,"glasses_1":0,"bproof_1":0,"makeup_1":0,"age_1":5,"makeup_4":0,"eyebrows_1":1,"tshirt_2":12,"eyebrows_4":0,"beard_3":0,"eyebrows_3":0,"arms_2":0,"eyebrows_2":10,"shoes_1":15,"chest_1":0,"lipstick_2":0,"beard_1":0,"decals_1":0,"sun_1":0,"blemishes_2":0,"decals_2":0,"pants_2":6,"ears_1":-1,"bproof_2":0,"watches_1":-1,"hair_2":3,"lipstick_4":0,"mask_2":0,"mask_1":0,"torso_1":295,"sun_2":0,"blush_2":0,"age_2":10,"chain_1":28,"complexion_1":0,"tshirt_1":96,"bracelets_2":0,"arms":4,"complexion_2":0,"blush_1":0,"torso_2":3,"beard_2":0,"helmet_1":-1,"blush_3":0,"chest_2":0,"chain_2":12,"shoes_2":4,"pants_1":28,"ears_2":0,"bags_1":0,"hair_color_1":4}'),
	(9, '53f0a005d2985717ed1caacf8e23f271722ab38a', 'Tiburcio', '{"hair_color_1":0,"eye_color":0,"bodyb_1":0,"makeup_3":0,"chest_3":0,"beard_4":0,"hair_1":15,"bracelets_1":-1,"glasses_2":4,"blemishes_1":0,"moles_2":0,"face":44,"lipstick_1":0,"watches_2":0,"moles_1":0,"sex":0,"bodyb_2":0,"lipstick_3":0,"skin":0,"makeup_2":0,"helmet_2":2,"hair_color_2":0,"glasses_1":5,"bproof_1":0,"complexion_2":0,"age_1":4,"makeup_4":0,"eyebrows_1":9,"tshirt_2":0,"eyebrows_4":0,"beard_3":0,"eyebrows_3":0,"arms_2":0,"eyebrows_2":3,"shoes_1":1,"chest_1":0,"lipstick_2":0,"beard_1":3,"decals_1":0,"sun_1":0,"blemishes_2":0,"decals_2":0,"pants_2":0,"chest_2":0,"chain_2":0,"watches_1":-1,"blush_1":0,"arms":11,"blush_3":0,"chain_1":12,"mask_1":0,"sun_2":0,"blush_2":0,"age_2":0,"lipstick_4":0,"complexion_1":0,"mask_2":0,"bracelets_2":0,"helmet_1":7,"makeup_1":0,"ears_1":0,"torso_2":0,"beard_2":8,"tshirt_1":15,"hair_2":0,"bproof_2":0,"torso_1":26,"shoes_2":0,"pants_1":3,"ears_2":0,"bags_1":0,"bags_2":0}'),
	(10, '07462e41f6d5c397f819fdd5880b31f1fce505f5', 'normal1', '{"helmet_1":-1,"eyebrows_1":1,"skin":5,"complexion_1":0,"torso_1":25,"blush_3":0,"lipstick_3":0,"ears_1":-1,"makeup_3":2,"watches_2":0,"moles_1":0,"decals_2":0,"beard_1":0,"chain_2":0,"blemishes_1":0,"beard_4":0,"eye_color":2,"sun_2":0,"mask_1":0,"bodyb_2":0,"decals_1":0,"ears_2":0,"lipstick_1":1,"hair_color_1":6,"bags_2":0,"face":45,"pants_2":0,"eyebrows_3":2,"bodyb_1":0,"makeup_1":4,"bracelets_1":-1,"shoes_2":0,"glasses_1":20,"complexion_2":0,"makeup_2":7,"chain_1":0,"helmet_2":0,"sex":1,"moles_2":10,"bracelets_2":0,"arms_2":0,"torso_2":0,"pants_1":89,"chest_2":0,"lipstick_2":7,"beard_3":0,"blush_1":0,"beard_2":0,"bproof_2":0,"age_2":0,"bags_1":0,"mask_2":0,"arms":6,"blemishes_2":0,"glasses_2":0,"makeup_4":0,"hair_2":0,"hair_color_2":7,"shoes_1":11,"tshirt_2":0,"watches_1":-1,"blush_2":0,"chest_3":0,"age_1":0,"eyebrows_2":8,"lipstick_4":0,"chest_1":0,"sun_1":0,"eyebrows_4":0,"bproof_1":0,"tshirt_1":14,"hair_1":13}'),
	(11, '13d25ca9c27b07d2558f4677d68fb9e4a97f6b05', 'CAÇA', '{"helmet_1":-1,"eyebrows_1":29,"lipstick_2":0,"complexion_1":0,"torso_1":139,"blush_3":0,"lipstick_3":0,"bags_1":0,"makeup_3":0,"watches_2":0,"moles_1":0,"decals_2":0,"beard_1":3,"chain_2":0,"makeup_4":0,"beard_4":0,"eye_color":3,"watches_1":-1,"mask_1":0,"bodyb_2":0,"bproof_2":0,"ears_2":0,"lipstick_1":0,"hair_color_1":29,"bags_2":0,"face":0,"pants_2":0,"eyebrows_3":0,"sun_1":0,"makeup_1":22,"bracelets_1":-1,"shoes_2":0,"glasses_1":3,"complexion_2":0,"makeup_2":10,"chain_1":0,"helmet_2":0,"sex":0,"moles_2":0,"bracelets_2":0,"arms_2":0,"torso_2":3,"pants_1":46,"chest_2":0,"sun_2":0,"skin":4,"chest_3":0,"blush_1":0,"mask_2":0,"bproof_1":0,"blemishes_1":0,"beard_3":29,"arms":4,"blemishes_2":0,"beard_2":10,"hair_color_2":0,"hair_2":0,"glasses_2":0,"shoes_1":8,"decals_1":0,"tshirt_2":0,"blush_2":0,"bodyb_1":0,"age_1":0,"eyebrows_2":10,"lipstick_4":0,"ears_1":-1,"chest_1":0,"eyebrows_4":0,"age_2":0,"tshirt_1":15,"hair_1":37}'),
	(12, '833f45496e937270a4ecf076b0fe5d12d9b6ce51', 'Roupa Caça', '{"helmet_1":-1,"eyebrows_1":0,"lipstick_2":3,"complexion_1":0,"torso_1":63,"blush_3":16,"lipstick_3":52,"bags_1":0,"makeup_3":0,"watches_2":0,"moles_1":0,"decals_2":0,"beard_1":0,"chain_2":0,"makeup_4":0,"beard_4":0,"eye_color":3,"age_2":0,"mask_1":0,"bodyb_2":0,"decals_1":0,"ears_2":0,"lipstick_1":0,"hair_color_1":0,"bags_2":0,"face":45,"pants_2":0,"eyebrows_3":7,"bodyb_1":0,"makeup_1":3,"bracelets_1":-1,"shoes_2":0,"glasses_1":5,"hair_2":0,"makeup_2":0,"chain_1":0,"helmet_2":0,"sex":1,"hair_color_2":0,"bracelets_2":0,"arms_2":0,"torso_2":0,"pants_1":30,"chest_2":0,"complexion_2":0,"beard_3":0,"bproof_2":0,"beard_2":0,"skin":10,"ears_1":-1,"chest_3":0,"blush_1":2,"arms":1,"blemishes_2":0,"blemishes_1":0,"watches_1":-1,"chest_1":0,"blush_2":2,"shoes_1":24,"tshirt_2":0,"bproof_1":0,"glasses_2":0,"sun_2":0,"age_1":0,"eyebrows_2":5,"lipstick_4":0,"moles_2":0,"sun_1":0,"mask_2":0,"eyebrows_4":5,"tshirt_1":31,"hair_1":37}'),
	(13, '13d25ca9c27b07d2558f4677d68fb9e4a97f6b05', 'rua SEM temporaria', '{"helmet_1":-1,"eyebrows_1":29,"lipstick_2":0,"complexion_1":0,"torso_1":384,"blush_3":0,"lipstick_3":0,"bags_1":0,"makeup_3":0,"watches_2":0,"moles_1":0,"decals_2":0,"beard_1":3,"chain_2":0,"makeup_4":0,"beard_4":0,"eye_color":3,"watches_1":-1,"mask_1":0,"bodyb_2":0,"bproof_2":0,"ears_2":0,"lipstick_1":0,"hair_color_1":29,"bags_2":0,"face":0,"pants_2":1,"eyebrows_3":0,"sun_1":0,"makeup_1":22,"bracelets_1":-1,"shoes_2":0,"glasses_1":3,"complexion_2":0,"makeup_2":10,"chain_1":126,"helmet_2":0,"sex":0,"moles_2":0,"bracelets_2":0,"arms_2":0,"torso_2":13,"pants_1":52,"chest_2":0,"sun_2":0,"skin":4,"chest_3":0,"blush_1":0,"mask_2":0,"bproof_1":0,"blemishes_1":0,"beard_3":29,"arms":4,"blemishes_2":0,"beard_2":10,"hair_color_2":0,"hair_2":0,"glasses_2":0,"shoes_1":24,"decals_1":0,"tshirt_2":0,"blush_2":0,"bodyb_1":0,"age_1":0,"eyebrows_2":10,"lipstick_4":0,"ears_1":-1,"chest_1":0,"eyebrows_4":0,"age_2":0,"tshirt_1":15,"hair_1":37}'),
	(15, '53f0a005d2985717ed1caacf8e23f271722ab38a', 'INEM RUA TEMP', '{"helmet_1":7,"eyebrows_1":9,"skin":0,"complexion_1":0,"torso_1":384,"blush_3":0,"lipstick_3":0,"ears_1":0,"makeup_3":0,"watches_2":0,"moles_1":0,"decals_2":0,"beard_1":3,"chain_2":0,"makeup_4":0,"beard_4":0,"eye_color":0,"sun_2":0,"mask_1":0,"bodyb_2":0,"decals_1":0,"ears_2":0,"lipstick_1":0,"hair_color_1":0,"bags_2":0,"face":44,"pants_2":1,"eyebrows_3":0,"sun_1":0,"makeup_1":0,"bracelets_1":-1,"shoes_2":0,"glasses_1":5,"complexion_2":0,"makeup_2":0,"chain_1":126,"helmet_2":2,"sex":0,"hair_color_2":0,"bracelets_2":0,"arms_2":0,"torso_2":13,"pants_1":52,"chest_1":0,"bags_1":0,"bodyb_1":0,"age_2":0,"blush_1":0,"bproof_1":0,"mask_2":0,"beard_3":0,"chest_3":0,"arms":4,"blemishes_2":0,"watches_1":-1,"beard_2":8,"tshirt_2":0,"blush_2":0,"shoes_1":24,"bproof_2":0,"lipstick_2":0,"glasses_2":4,"moles_2":0,"age_1":4,"eyebrows_2":3,"lipstick_4":0,"hair_2":0,"chest_2":0,"eyebrows_4":0,"blemishes_1":0,"tshirt_1":15,"hair_1":15}'),
	(17, '67c44ee6e3e6b355099fa6f8f10605f881f9b882', 'roma', '{"bracelets_2":0,"mask_1":0,"eyebrows_1":30,"chest_3":0,"lipstick_2":0,"beard_1":10,"blush_1":0,"lipstick_1":0,"beard_2":10,"shoes_1":1,"pants_1":15,"decals_1":0,"blush_2":0,"sun_2":0,"eyebrows_4":0,"mask_2":0,"makeup_2":0,"chain_2":0,"lipstick_3":0,"arms_2":0,"chest_1":0,"bags_1":0,"eyebrows_2":10,"hair_color_2":0,"bodyb_2":0,"torso_1":221,"blemishes_1":0,"makeup_1":0,"torso_2":9,"ears_1":-1,"complexion_1":0,"watches_2":0,"bodyb_1":0,"beard_4":0,"tshirt_2":0,"arms":0,"makeup_4":0,"chain_1":0,"age_1":0,"eyebrows_3":0,"moles_2":0,"sun_1":0,"bproof_1":0,"lipstick_4":0,"hair_color_1":0,"moles_1":0,"helmet_1":143,"bracelets_1":-1,"hair_1":73,"beard_3":0,"chest_2":0,"blush_3":0,"glasses_2":0,"bproof_2":0,"decals_2":0,"tshirt_1":15,"sex":0,"eye_color":3,"helmet_2":0,"hair_2":0,"makeup_3":0,"pants_2":3,"shoes_2":9,"blemishes_2":0,"face":44,"skin":10,"complexion_2":0,"ears_2":0,"watches_1":-1,"glasses_1":0,"bags_2":0,"age_2":0}'),
	(18, '3df15eabfc06ab108e09828ad648dc6bacbcbc9d', 'sair', '{"bracelets_2":0,"decals_2":0,"eyebrows_1":2,"chest_3":0,"lipstick_2":10,"age_2":0,"blush_1":2,"lipstick_1":4,"beard_2":0,"shoes_1":24,"moles_2":7,"decals_1":0,"blush_2":4,"sun_2":0,"eyebrows_4":0,"mask_2":0,"makeup_2":0,"chain_2":0,"lipstick_3":23,"arms_2":0,"chest_1":0,"bags_1":0,"eyebrows_2":8,"hair_color_2":5,"bodyb_2":0,"torso_1":45,"blemishes_1":0,"makeup_1":0,"torso_2":0,"ears_1":12,"complexion_1":0,"watches_2":0,"bodyb_1":0,"beard_4":0,"hair_2":0,"arms":1,"makeup_4":0,"chain_1":1,"age_1":0,"helmet_2":0,"watches_1":-1,"bags_2":0,"bproof_1":0,"lipstick_4":3,"hair_color_1":13,"bproof_2":0,"skin":4,"bracelets_1":-1,"hair_1":37,"sex":1,"blush_3":13,"complexion_2":0,"glasses_2":0,"face":21,"blemishes_2":0,"eyebrows_3":3,"pants_2":0,"chest_2":0,"moles_1":4,"pants_1":30,"makeup_3":0,"eye_color":2,"shoes_2":0,"tshirt_1":31,"glasses_1":36,"helmet_1":-1,"sun_1":0,"ears_2":0,"mask_1":0,"beard_1":0,"beard_3":0,"tshirt_2":0}'),
	(20, '833f45496e937270a4ecf076b0fe5d12d9b6ce51', 'Cirurgia', '{"age_2":0,"eyebrows_2":5,"bodyb_2":0,"chain_2":0,"face":45,"mask_1":0,"sun_1":0,"sex":1,"makeup_3":0,"torso_2":0,"makeup_1":3,"beard_2":0,"bags_1":0,"lipstick_1":0,"eye_color":3,"complexion_2":0,"moles_1":0,"hair_color_2":0,"bracelets_1":-1,"blush_2":2,"hair_2":0,"eyebrows_1":0,"bodyb_1":0,"torso_1":229,"skin":10,"bags_2":0,"sun_2":0,"tshirt_2":0,"moles_2":0,"ears_2":0,"beard_1":0,"beard_3":0,"beard_4":0,"decals_2":0,"bracelets_2":0,"blush_1":2,"lipstick_2":3,"tshirt_1":2,"lipstick_3":52,"ears_1":-1,"blush_3":16,"mask_2":0,"chest_3":0,"decals_1":0,"age_1":0,"hair_1":37,"arms_2":0,"shoes_1":4,"eyebrows_4":5,"helmet_1":-1,"glasses_2":0,"helmet_2":0,"bproof_1":0,"chest_2":0,"hair_color_1":0,"makeup_2":0,"chest_1":0,"blemishes_1":0,"bproof_2":0,"watches_1":-1,"makeup_4":0,"pants_2":0,"chain_1":0,"glasses_1":5,"eyebrows_3":7,"lipstick_4":0,"complexion_1":0,"blemishes_2":0,"watches_2":0,"arms":109,"shoes_2":0,"pants_1":23}'),
	(21, '335d7672af7086622ea4b7002a2c6b23e72845fe', 'Work (Grey/Red)', '{"ears_2":0,"arms":4,"sun_1":0,"makeup_1":0,"decals_1":0,"makeup_4":0,"face":44,"complexion_2":0,"watches_1":-1,"shoes_2":0,"lipstick_1":0,"tshirt_2":1,"beard_3":0,"watches_2":0,"bags_2":0,"moles_1":0,"lipstick_4":0,"eyebrows_3":0,"chest_3":0,"beard_1":0,"ears_1":-1,"pants_1":28,"blemishes_1":0,"blush_2":0,"beard_4":0,"bproof_2":0,"glasses_1":0,"blush_3":0,"helmet_1":-1,"bracelets_1":-1,"chest_1":0,"arms_2":0,"lipstick_2":0,"sex":0,"chain_2":13,"decals_2":0,"pants_2":3,"tshirt_1":96,"chest_2":0,"torso_2":2,"hair_2":3,"chain_1":28,"blemishes_2":0,"bodyb_1":0,"beard_2":0,"makeup_3":0,"hair_color_1":4,"eye_color":0,"complexion_1":0,"age_2":10,"mask_1":0,"bproof_1":0,"skin":21,"moles_2":0,"eyebrows_1":1,"sun_2":0,"mask_2":0,"helmet_2":0,"torso_1":295,"hair_1":18,"hair_color_2":0,"glasses_2":0,"bracelets_2":0,"bags_1":0,"makeup_2":0,"blush_1":0,"eyebrows_4":0,"eyebrows_2":10,"age_1":5,"bodyb_2":0,"shoes_1":15,"lipstick_3":0}'),
	(22, '335d7672af7086622ea4b7002a2c6b23e72845fe', 'Robberies', '{"ears_2":0,"arms":26,"sun_1":0,"makeup_1":0,"decals_1":0,"makeup_4":0,"face":44,"complexion_2":0,"watches_1":-1,"shoes_2":0,"lipstick_1":0,"tshirt_2":3,"beard_3":0,"watches_2":0,"bags_2":0,"moles_1":0,"lipstick_4":0,"eyebrows_3":0,"chest_3":0,"beard_1":0,"ears_1":-1,"pants_1":38,"blemishes_1":0,"blush_2":0,"beard_4":0,"bproof_2":0,"glasses_1":7,"blush_3":0,"helmet_1":-1,"bracelets_1":-1,"chest_1":0,"arms_2":0,"lipstick_2":0,"sex":0,"chain_2":0,"decals_2":0,"pants_2":1,"tshirt_1":72,"chest_2":0,"torso_2":9,"hair_2":3,"chain_1":0,"blemishes_2":0,"bodyb_1":0,"beard_2":0,"makeup_3":0,"hair_color_1":4,"eye_color":0,"complexion_1":0,"age_2":10,"mask_1":52,"bproof_1":0,"skin":21,"moles_2":0,"eyebrows_1":1,"sun_2":0,"mask_2":8,"helmet_2":0,"torso_1":306,"hair_1":18,"hair_color_2":0,"glasses_2":1,"bracelets_2":0,"bags_1":0,"makeup_2":0,"blush_1":0,"eyebrows_4":0,"eyebrows_2":10,"age_1":5,"bodyb_2":0,"shoes_1":24,"lipstick_3":0}'),
	(23, '13d25ca9c27b07d2558f4677d68fb9e4a97f6b05', 'SEM Roupa normal', '{"helmet_1":-1,"arms_2":0,"ears_1":-1,"glasses_1":3,"blemishes_2":0,"chest_1":0,"bodyb_2":0,"beard_1":3,"makeup_4":0,"lipstick_4":0,"watches_2":0,"hair_1":37,"eyebrows_3":0,"bproof_1":0,"blush_3":0,"torso_1":18,"chest_2":0,"bodyb_1":0,"hair_color_2":0,"moles_1":0,"hair_2":0,"bags_2":0,"beard_4":0,"shoes_1":24,"eye_color":3,"shoes_2":0,"mask_1":0,"bracelets_2":0,"sex":0,"blush_1":0,"blemishes_1":0,"bproof_2":0,"beard_2":10,"eyebrows_4":0,"eyebrows_2":10,"hair_color_1":29,"blush_2":0,"ears_2":0,"bracelets_1":-1,"torso_2":0,"lipstick_2":0,"age_1":0,"sun_2":0,"complexion_1":0,"chain_1":0,"beard_3":29,"pants_2":1,"complexion_2":0,"chest_3":0,"lipstick_1":0,"lipstick_3":0,"eyebrows_1":29,"skin":4,"sun_1":0,"makeup_2":10,"makeup_3":0,"mask_2":0,"glasses_2":0,"age_2":0,"tshirt_2":0,"helmet_2":0,"bags_1":0,"moles_2":0,"decals_1":0,"makeup_1":22,"watches_1":-1,"face":0,"arms":4,"chain_2":0,"decals_2":0,"tshirt_1":0,"pants_1":52}'),
	(24, '6c60bb59352c712e4d63af8779088475c5282413', 'Inem Rua', '{"helmet_1":-1,"arms_2":0,"ears_1":-1,"glasses_1":0,"blemishes_2":0,"chest_1":0,"bodyb_2":0,"beard_1":0,"pants_1":52,"lipstick_4":0,"watches_2":0,"hair_1":38,"eyebrows_3":0,"bproof_1":0,"blush_3":0,"torso_1":18,"arms":4,"bodyb_1":0,"hair_color_2":0,"moles_1":0,"hair_2":0,"bags_2":0,"beard_4":0,"shoes_1":24,"complexion_2":0,"shoes_2":0,"mask_1":0,"bracelets_2":0,"sex":0,"blush_1":0,"blemishes_1":0,"bproof_2":0,"beard_2":0,"eyebrows_4":0,"eyebrows_2":6,"hair_color_1":10,"blush_2":0,"ears_2":0,"bracelets_1":-1,"chest_3":0,"lipstick_2":0,"age_1":0,"sun_2":0,"complexion_1":0,"chain_1":0,"mask_2":0,"pants_2":1,"decals_2":0,"chest_2":0,"age_2":0,"lipstick_3":0,"eyebrows_1":2,"makeup_4":0,"sun_1":0,"chain_2":0,"makeup_3":0,"bags_1":0,"glasses_2":0,"moles_2":0,"tshirt_2":0,"helmet_2":0,"torso_2":0,"decals_1":0,"eye_color":0,"makeup_1":0,"watches_1":-1,"face":2,"skin":4,"beard_3":0,"makeup_2":0,"tshirt_1":0,"lipstick_1":0}'),
	(25, '6c60bb59352c712e4d63af8779088475c5282413', 'Caça', '{"makeup_2":0,"decals_1":0,"helmet_1":-1,"lipstick_1":0,"lipstick_4":0,"sun_2":0,"lipstick_3":0,"chest_1":0,"shoes_2":3,"bodyb_2":0,"beard_3":0,"blemishes_2":0,"eyebrows_3":0,"age_2":0,"watches_2":0,"blush_1":0,"arms_2":0,"hair_color_1":10,"shoes_1":12,"bracelets_1":-1,"tshirt_2":0,"eyebrows_4":0,"glasses_2":0,"beard_4":0,"blemishes_1":0,"mask_1":0,"sun_1":0,"beard_2":0,"pants_2":1,"eyebrows_2":6,"moles_1":0,"tshirt_1":15,"bproof_1":0,"helmet_2":0,"skin":4,"decals_2":0,"bags_1":0,"moles_2":0,"bproof_2":0,"lipstick_2":0,"chest_2":0,"chain_1":0,"arms":5,"bodyb_1":0,"chest_3":0,"blush_2":0,"ears_2":0,"mask_2":0,"ears_1":-1,"bags_2":0,"watches_1":-1,"sex":0,"age_1":0,"makeup_1":0,"makeup_4":0,"beard_1":0,"eye_color":0,"face":2,"glasses_1":0,"makeup_3":0,"torso_1":37,"complexion_1":0,"pants_1":69,"blush_3":0,"complexion_2":0,"torso_2":0,"hair_color_2":0,"chain_2":0,"bracelets_2":0,"hair_2":0,"eyebrows_1":2,"hair_1":38}'),
	(26, 'fef6a9eec97d38bea8d27ce412571fc48ce2b58c', 'DPLS \\', '{"torso_2":0,"tshirt_2":0,"hair_2":0,"makeup_3":0,"decals_2":0,"eyebrows_3":0,"chest_3":0,"lipstick_1":0,"arms_2":0,"blemishes_1":0,"arms":28,"sun_2":0,"bags_1":0,"makeup_1":0,"age_1":0,"blemishes_2":0,"glasses_1":20,"lipstick_3":0,"chest_1":0,"makeup_4":0,"bracelets_1":-1,"chest_2":0,"sun_1":0,"moles_1":0,"complexion_2":0,"mask_1":121,"hair_color_1":29,"beard_3":0,"eyebrows_4":0,"beard_1":0,"eyebrows_1":30,"mask_2":0,"blush_3":0,"face":31,"blush_1":0,"shoes_2":0,"helmet_2":0,"bodyb_1":0,"chain_2":0,"lipstick_4":0,"watches_1":-1,"bodyb_2":0,"pants_2":0,"moles_2":10,"sex":1,"hair_1":64,"hair_color_2":29,"eye_color":5,"pants_1":30,"torso_1":388,"helmet_1":-1,"makeup_2":0,"eyebrows_2":10,"tshirt_1":152,"glasses_2":0,"ears_2":0,"lipstick_2":0,"complexion_1":0,"chain_1":0,"bags_2":0,"age_2":0,"blush_2":0,"decals_1":0,"ears_1":-1,"beard_4":0,"bracelets_2":0,"bproof_2":0,"watches_2":0,"beard_2":0,"shoes_1":25,"skin":31,"bproof_1":7}'),
	(27, '833f45496e937270a4ecf076b0fe5d12d9b6ce51', 'Sem Rua', '{"torso_2":0,"tshirt_2":0,"beard_4":0,"makeup_3":0,"decals_2":0,"eyebrows_3":7,"chest_3":0,"lipstick_1":0,"arms_2":0,"blemishes_1":0,"arms":1,"sun_2":0,"bags_1":0,"bproof_2":0,"age_1":0,"blemishes_2":0,"glasses_1":5,"lipstick_3":52,"chest_1":0,"sex":1,"bracelets_1":-1,"chest_2":0,"sun_1":0,"moles_1":0,"complexion_2":0,"lipstick_4":0,"hair_color_1":0,"beard_3":0,"beard_2":0,"ears_1":-1,"eyebrows_1":0,"mask_2":0,"blush_3":16,"face":45,"blush_1":2,"shoes_2":0,"helmet_2":0,"bodyb_1":0,"chain_2":0,"pants_2":0,"shoes_1":24,"bodyb_2":0,"beard_1":0,"moles_2":0,"pants_1":30,"eyebrows_4":5,"hair_2":0,"makeup_2":0,"hair_color_2":0,"torso_1":45,"helmet_1":-1,"skin":10,"eyebrows_2":5,"tshirt_1":26,"glasses_2":0,"bracelets_2":0,"lipstick_2":3,"complexion_1":0,"chain_1":0,"age_2":0,"bags_2":0,"blush_2":2,"decals_1":0,"makeup_4":0,"eye_color":3,"ears_2":0,"mask_1":0,"watches_2":0,"makeup_1":3,"hair_1":37,"watches_1":-1,"bproof_1":0}'),
	(28, '53f0a005d2985717ed1caacf8e23f271722ab38a', 'INEM RUA', '{"sun_2":0,"lipstick_4":0,"chain_2":0,"lipstick_1":0,"makeup_4":0,"mask_2":0,"eyebrows_3":0,"complexion_1":0,"arms":4,"helmet_1":7,"torso_2":0,"bracelets_2":0,"bproof_2":0,"face":44,"decals_1":0,"watches_2":0,"eyebrows_1":9,"bracelets_1":-1,"sun_1":0,"shoes_2":0,"blush_2":0,"moles_2":0,"ears_1":0,"shoes_1":24,"lipstick_2":0,"decals_2":0,"hair_1":15,"makeup_2":0,"skin":0,"complexion_2":0,"hair_color_2":0,"beard_3":0,"age_1":4,"beard_2":8,"tshirt_1":0,"helmet_2":2,"torso_1":18,"hair_color_1":0,"beard_4":0,"watches_1":-1,"blush_1":0,"makeup_1":0,"sex":0,"tshirt_2":7,"chest_2":0,"lipstick_3":0,"bodyb_1":0,"hair_2":0,"blemishes_2":0,"beard_1":3,"chain_1":0,"blemishes_1":0,"age_2":0,"pants_1":59,"eyebrows_2":3,"bags_2":0,"chest_1":0,"arms_2":0,"bproof_1":0,"pants_2":0,"eye_color":0,"glasses_2":4,"blush_3":0,"bags_1":0,"moles_1":0,"makeup_3":0,"glasses_1":5,"bodyb_2":0,"ears_2":0,"chest_3":0,"eyebrows_4":0,"mask_1":0}'),
	(29, '53f0a005d2985717ed1caacf8e23f271722ab38a', 'Consulta', '{"sun_2":0,"lipstick_4":0,"chain_2":0,"lipstick_1":0,"makeup_4":0,"mask_2":0,"eyebrows_3":0,"complexion_1":0,"arms":4,"helmet_1":7,"torso_2":0,"bracelets_2":0,"bproof_2":0,"face":44,"decals_1":0,"watches_2":0,"eyebrows_1":9,"bracelets_1":-1,"sun_1":0,"shoes_2":0,"blush_2":0,"moles_2":0,"ears_1":0,"shoes_1":21,"lipstick_2":0,"decals_2":0,"hair_1":15,"makeup_2":0,"skin":0,"complexion_2":0,"hair_color_2":0,"beard_3":0,"age_1":4,"beard_2":8,"tshirt_1":31,"helmet_2":2,"torso_1":115,"hair_color_1":0,"beard_4":0,"watches_1":-1,"blush_1":0,"makeup_1":0,"sex":0,"tshirt_2":0,"chest_2":0,"lipstick_3":0,"bodyb_1":0,"hair_2":0,"blemishes_2":0,"beard_1":3,"chain_1":0,"blemishes_1":0,"age_2":0,"pants_1":10,"eyebrows_2":3,"bags_2":0,"chest_1":0,"arms_2":0,"bproof_1":0,"pants_2":0,"eye_color":0,"glasses_2":4,"blush_3":0,"bags_1":0,"moles_1":0,"makeup_3":0,"glasses_1":5,"bodyb_2":0,"ears_2":0,"chest_3":0,"eyebrows_4":0,"mask_1":0}'),
	(30, '833f45496e937270a4ecf076b0fe5d12d9b6ce51', 'Lenço', '{"blush_2":2,"beard_4":0,"complexion_1":0,"moles_2":0,"age_2":0,"lipstick_1":0,"shoes_2":0,"makeup_4":0,"bodyb_2":0,"hair_2":0,"bproof_1":0,"hair_color_2":0,"decals_2":0,"bproof_2":0,"eyebrows_3":7,"hair_color_1":0,"ears_2":0,"torso_1":23,"bodyb_1":0,"eyebrows_2":5,"helmet_1":-1,"moles_1":0,"age_1":0,"beard_1":0,"sun_2":0,"pants_2":0,"makeup_2":0,"chain_1":83,"arms":12,"blemishes_2":0,"pants_1":44,"lipstick_2":3,"glasses_2":0,"bags_2":0,"shoes_1":24,"beard_3":0,"watches_1":-1,"tshirt_2":0,"makeup_1":3,"hair_1":37,"blush_1":2,"mask_2":0,"decals_1":0,"chest_2":0,"bracelets_1":-1,"torso_2":0,"lipstick_3":52,"lipstick_4":0,"eye_color":3,"bags_1":0,"arms_2":0,"sex":1,"sun_1":0,"tshirt_1":2,"helmet_2":0,"bracelets_2":0,"chest_1":0,"skin":10,"beard_2":0,"glasses_1":5,"ears_1":-1,"complexion_2":0,"watches_2":0,"blush_3":16,"face":45,"eyebrows_4":5,"makeup_3":0,"mask_1":0,"chain_2":2,"eyebrows_1":0,"chest_3":0,"blemishes_1":0}'),
	(31, 'eb75d2784ddc333b724a5304e2c202eef5a1fc32', 'police_1', '{"moles_2":0,"blemishes_1":0,"chain_1":0,"hair_color_1":0,"hair_2":0,"torso_1":30,"blush_3":0,"beard_1":0,"helmet_1":11,"beard_3":0,"eyebrows_4":0,"bracelets_2":0,"complexion_2":0,"blush_1":0,"blush_2":0,"lipstick_3":0,"glasses_2":0,"arms_2":0,"arms":0,"hair_1":1,"beard_2":0,"makeup_4":0,"lipstick_4":0,"hair_color_2":3,"lipstick_2":0,"sun_2":0,"eyebrows_3":0,"torso_2":0,"bodyb_1":0,"sun_1":0,"face":10,"ears_2":0,"watches_2":0,"chest_2":0,"makeup_1":0,"bproof_2":0,"chest_3":0,"age_1":0,"age_2":0,"tshirt_1":1,"makeup_3":0,"eyebrows_1":0,"ears_1":-1,"pants_2":2,"eye_color":0,"makeup_2":0,"skin":1,"glasses_1":3,"decals_2":0,"helmet_2":0,"shoes_2":0,"decals_1":0,"watches_1":-1,"bags_1":0,"mask_2":0,"chain_2":0,"eyebrows_2":0,"chest_1":0,"lipstick_1":0,"shoes_1":25,"pants_1":31,"bracelets_1":-1,"beard_4":0,"tshirt_2":0,"sex":0,"bags_2":0,"mask_1":0,"complexion_1":0,"bodyb_2":0,"blemishes_2":0,"moles_1":0,"bproof_1":0}'),
	(32, 'b9048c0bc7d826e3b8f4f396aaff5cdb85280f9d', 'chefe', '{"makeup_1":0,"lipstick_4":0,"makeup_4":0,"complexion_2":0,"ears_2":0,"eyebrows_3":57,"arms":174,"bproof_2":0,"decals_1":0,"lipstick_1":0,"mask_2":0,"eyebrows_1":2,"blush_2":0,"eye_color":2,"beard_4":0,"bodyb_2":0,"sun_1":0,"bracelets_1":-1,"helmet_1":-1,"torso_2":0,"lipstick_2":0,"eyebrows_2":10,"shoes_2":0,"complexion_1":0,"arms_2":0,"shoes_1":24,"chest_3":0,"face":0,"glasses_2":0,"bproof_1":0,"lipstick_3":0,"moles_1":0,"makeup_2":0,"beard_2":10,"bags_2":0,"skin":4,"sun_2":0,"blemishes_2":0,"ears_1":-1,"decals_2":0,"makeup_3":0,"moles_2":0,"helmet_2":0,"mask_1":121,"watches_1":3,"tshirt_2":0,"torso_1":215,"watches_2":0,"chain_2":0,"hair_color_2":0,"beard_1":3,"hair_1":10,"blush_3":0,"pants_2":0,"pants_1":46,"bodyb_1":0,"beard_3":56,"bracelets_2":0,"blemishes_1":0,"age_1":14,"sex":0,"glasses_1":38,"tshirt_1":1,"blush_1":0,"chest_1":0,"chest_2":0,"age_2":2,"hair_2":0,"chain_1":0,"bags_1":0,"hair_color_1":58,"eyebrows_4":0}'),
	(33, '5601ae6d3c079b9b0b090712d5228da05695835d', 'cu', '{"makeup_1":0,"lipstick_4":0,"makeup_4":0,"complexion_2":0,"ears_2":0,"eyebrows_3":0,"arms":0,"bproof_2":0,"decals_1":0,"lipstick_1":0,"mask_2":0,"eyebrows_1":0,"blush_2":0,"eye_color":0,"beard_4":0,"bodyb_2":0,"hair_color_1":0,"bracelets_1":-1,"helmet_1":58,"torso_2":1,"lipstick_2":0,"eyebrows_2":0,"shoes_2":0,"blush_1":0,"arms_2":0,"shoes_1":25,"chest_3":0,"face":0,"glasses_2":1,"bproof_1":11,"lipstick_3":0,"moles_1":0,"makeup_2":0,"beard_2":10,"bags_2":0,"skin":2,"sun_2":0,"blemishes_2":0,"ears_1":-1,"decals_2":0,"makeup_3":0,"moles_2":0,"helmet_2":2,"mask_1":0,"watches_1":-1,"tshirt_2":0,"torso_1":93,"watches_2":0,"chain_2":2,"hair_color_2":0,"sex":0,"age_1":0,"beard_1":2,"eyebrows_4":0,"sun_1":0,"bodyb_1":0,"beard_3":0,"pants_2":0,"blemishes_1":0,"pants_1":46,"blush_3":0,"glasses_1":15,"tshirt_1":2,"hair_2":0,"complexion_1":0,"chest_2":0,"age_2":0,"bracelets_2":0,"chain_1":0,"bags_1":0,"chest_1":0,"hair_1":8}'),
	(34, 'eb75d2784ddc333b724a5304e2c202eef5a1fc32', 'PSP_Colete', '{"makeup_1":0,"lipstick_4":0,"makeup_4":0,"complexion_2":0,"ears_2":0,"eyebrows_3":0,"arms":0,"bproof_2":0,"decals_1":0,"lipstick_1":0,"mask_2":0,"eyebrows_1":0,"blush_2":0,"eye_color":0,"beard_4":0,"bodyb_2":0,"hair_color_1":0,"bracelets_1":-1,"sex":0,"age_2":0,"lipstick_2":0,"eyebrows_2":0,"shoes_2":0,"blush_1":0,"arms_2":0,"shoes_1":25,"chest_3":0,"face":10,"glasses_2":0,"pants_1":31,"lipstick_3":0,"moles_1":0,"makeup_2":0,"beard_2":0,"bags_2":0,"skin":1,"sun_2":0,"blemishes_2":0,"ears_1":-1,"decals_2":0,"makeup_3":0,"chest_1":0,"helmet_2":0,"mask_1":0,"watches_1":-1,"pants_2":2,"torso_1":30,"watches_2":0,"chain_2":0,"hair_color_2":3,"tshirt_2":0,"complexion_1":0,"beard_1":0,"helmet_1":11,"eyebrows_4":0,"bodyb_1":0,"beard_3":0,"moles_2":0,"blemishes_1":0,"sun_1":0,"torso_2":0,"glasses_1":3,"tshirt_1":1,"bproof_1":11,"age_1":0,"chest_2":0,"hair_2":0,"blush_3":0,"chain_1":0,"bags_1":0,"bracelets_2":0,"hair_1":1}'),
	(35, '97db8e3d13e595160015172726c58d2a74f020bd', 'Pinho 4 ( Psp 4 )', '{"makeup_1":0,"lipstick_4":0,"makeup_4":0,"complexion_2":0,"ears_2":0,"eyebrows_3":0,"arms":19,"bproof_2":0,"decals_1":0,"lipstick_1":0,"mask_2":0,"eyebrows_1":2,"blush_2":0,"eye_color":0,"beard_4":0,"bracelets_2":0,"sun_1":0,"bracelets_1":0,"sex":0,"torso_2":1,"lipstick_2":0,"eyebrows_2":10,"shoes_2":0,"complexion_1":0,"arms_2":0,"shoes_1":25,"chest_3":0,"face":0,"glasses_2":1,"pants_1":59,"lipstick_3":0,"moles_1":0,"makeup_2":0,"beard_2":10,"bags_2":0,"skin":4,"sun_2":0,"blemishes_2":0,"ears_1":-1,"decals_2":0,"makeup_3":0,"chest_1":0,"helmet_2":0,"mask_1":121,"watches_1":10,"tshirt_2":0,"torso_1":93,"watches_2":0,"chain_2":0,"hair_color_2":0,"bproof_1":11,"hair_2":0,"blush_3":0,"beard_1":3,"eyebrows_4":0,"age_1":0,"beard_3":0,"bodyb_2":0,"blemishes_1":0,"hair_color_1":0,"moles_2":0,"glasses_1":15,"tshirt_1":3,"bodyb_1":0,"age_2":0,"chest_2":0,"blush_1":0,"helmet_1":83,"chain_1":125,"bags_1":0,"pants_2":0,"hair_1":0}'),
	(36, '833f45496e937270a4ecf076b0fe5d12d9b6ce51', 'Calções', '{"chest_1":0,"pants_1":25,"eyebrows_2":5,"eye_color":3,"bags_1":0,"moles_1":0,"makeup_3":0,"sun_1":0,"skin":10,"blush_1":2,"beard_3":0,"shoes_2":2,"chain_1":0,"chest_3":0,"complexion_1":0,"bracelets_1":-1,"bproof_2":0,"makeup_2":0,"mask_2":0,"lipstick_1":0,"helmet_1":-1,"sex":1,"chest_2":0,"age_1":0,"face":45,"tshirt_2":0,"torso_1":30,"glasses_2":0,"mask_1":0,"torso_2":2,"helmet_2":0,"hair_2":0,"watches_1":-1,"bracelets_2":0,"bodyb_1":0,"lipstick_4":0,"chain_2":0,"tshirt_1":2,"hair_1":37,"arms":2,"lipstick_3":52,"bodyb_2":0,"ears_2":0,"decals_1":0,"beard_2":0,"hair_color_1":0,"decals_2":0,"makeup_1":3,"shoes_1":3,"makeup_4":0,"sun_2":0,"beard_1":0,"eyebrows_4":5,"hair_color_2":0,"eyebrows_1":0,"glasses_1":5,"eyebrows_3":7,"blemishes_2":0,"pants_2":1,"ears_1":-1,"watches_2":0,"bproof_1":0,"moles_2":0,"age_2":0,"blush_2":2,"lipstick_2":3,"complexion_2":0,"bags_2":0,"blush_3":16,"blemishes_1":0,"beard_4":0,"arms_2":0}'),
	(38, '5f0ec45c5ddb077675b9d2276223c5eb1154f67a', 'Joana Bennys', '{"hair_2":0,"hair_color_1":37,"eye_color":0,"moles_1":0,"moles_2":0,"bags_2":0,"lipstick_2":10,"decals_1":0,"mask_1":111,"lipstick_4":0,"chest_1":0,"blush_2":5,"tshirt_1":14,"chest_2":0,"arms":15,"torso_1":232,"bracelets_1":-1,"pants_2":1,"face":21,"shoes_1":3,"mask_2":15,"blemishes_2":0,"beard_3":0,"eyebrows_1":12,"watches_1":-1,"helmet_2":0,"lipstick_3":18,"pants_1":9,"sun_1":0,"bproof_1":0,"beard_4":0,"ears_1":-1,"torso_2":8,"makeup_3":0,"eyebrows_4":0,"makeup_2":10,"complexion_1":0,"decals_2":0,"tshirt_2":0,"sex":1,"chain_1":0,"hair_1":70,"arms_2":0,"beard_1":0,"bags_1":0,"eyebrows_2":10,"complexion_2":0,"ears_2":0,"helmet_1":-1,"blemishes_1":0,"chain_2":0,"hair_color_2":29,"bproof_2":0,"lipstick_1":3,"age_2":0,"bracelets_2":0,"blush_1":4,"sun_2":0,"watches_2":0,"shoes_2":11,"chest_3":0,"skin":5,"makeup_4":0,"bodyb_1":0,"bodyb_2":0,"makeup_1":3,"eyebrows_3":0,"glasses_2":1,"age_1":0,"beard_2":0,"glasses_1":20,"blush_3":7}'),
	(39, '833f45496e937270a4ecf076b0fe5d12d9b6ce51', 'Top Verde', '{"lipstick_1":0,"pants_1":0,"blush_1":2,"glasses_2":0,"sun_1":0,"arms":15,"blemishes_2":0,"complexion_2":0,"chain_2":0,"eye_color":3,"mask_1":0,"ears_2":0,"sun_2":0,"tshirt_2":0,"helmet_2":0,"chest_2":0,"ears_1":-1,"moles_2":0,"blush_2":2,"bracelets_1":-1,"decals_2":0,"glasses_1":5,"bproof_2":0,"hair_2":0,"hair_color_1":0,"beard_3":0,"complexion_1":0,"torso_1":221,"mask_2":0,"makeup_4":0,"hair_color_2":0,"arms_2":0,"lipstick_2":3,"shoes_1":3,"chain_1":0,"beard_1":0,"skin":10,"age_1":0,"makeup_2":0,"torso_2":2,"makeup_3":0,"lipstick_4":0,"pants_2":11,"beard_2":0,"sex":1,"decals_1":0,"chest_1":0,"tshirt_1":2,"bodyb_2":0,"eyebrows_1":0,"moles_1":0,"chest_3":0,"blush_3":16,"beard_4":0,"eyebrows_3":7,"bags_2":0,"watches_2":0,"blemishes_1":0,"lipstick_3":52,"watches_1":-1,"eyebrows_4":5,"age_2":0,"shoes_2":0,"helmet_1":-1,"eyebrows_2":5,"bodyb_1":0,"bags_1":0,"hair_1":37,"face":45,"bracelets_2":0,"bproof_1":0,"makeup_1":3}'),
	(40, 'eb75d2784ddc333b724a5304e2c202eef5a1fc32', 'pj', '{"decals_1":0,"lipstick_1":0,"glasses_1":3,"mask_2":0,"tshirt_1":4,"watches_2":0,"beard_3":0,"moles_1":0,"mask_1":0,"beard_4":0,"arms":0,"chain_1":0,"hair_color_1":0,"bracelets_1":-1,"eyebrows_4":0,"sex":0,"chest_3":0,"blush_2":0,"makeup_3":0,"hair_color_2":3,"hair_1":1,"face":10,"blush_1":0,"bracelets_2":0,"eyebrows_2":0,"decals_2":0,"moles_2":0,"lipstick_2":0,"blemishes_1":0,"complexion_1":0,"makeup_1":0,"complexion_2":0,"bags_1":0,"hair_2":0,"shoes_1":26,"age_1":0,"bproof_1":11,"bodyb_1":0,"torso_2":0,"ears_1":-1,"shoes_2":0,"lipstick_3":0,"bags_2":0,"sun_1":0,"ears_2":0,"blush_3":0,"bodyb_2":0,"age_2":0,"arms_2":0,"beard_1":0,"chest_2":0,"helmet_2":0,"sun_2":0,"tshirt_2":0,"blemishes_2":0,"pants_1":0,"beard_2":0,"eye_color":0,"bproof_2":0,"helmet_1":142,"torso_1":262,"glasses_2":0,"eyebrows_3":0,"pants_2":2,"eyebrows_1":0,"lipstick_4":0,"watches_1":-1,"chest_1":0,"makeup_2":0,"skin":1,"chain_2":0,"makeup_4":0}'),
	(41, 'a271460b66cf34b436f0c69d3cac32b3832bfd6d', 'Bennys', '{"bags_1":0,"mask_2":0,"beard_3":0,"bproof_2":0,"skin":4,"arms_2":0,"chain_1":0,"lipstick_2":0,"chest_3":0,"arms":4,"beard_1":10,"chain_2":0,"blemishes_1":0,"eye_color":0,"moles_2":0,"blush_1":0,"helmet_1":56,"eyebrows_3":0,"makeup_3":0,"age_2":0,"decals_1":0,"helmet_2":4,"torso_1":387,"mask_1":0,"watches_1":-1,"chest_2":0,"bracelets_1":-1,"sun_2":0,"glasses_2":0,"hair_color_1":0,"pants_1":9,"complexion_2":0,"eyebrows_4":0,"sex":0,"eyebrows_2":0,"ears_1":-1,"age_1":0,"torso_2":0,"beard_2":8,"ears_2":0,"glasses_1":14,"complexion_1":0,"bproof_1":0,"tshirt_2":0,"sun_1":0,"hair_2":0,"eyebrows_1":0,"hair_color_2":0,"watches_2":0,"lipstick_4":0,"blush_3":0,"makeup_2":0,"hair_1":0,"bodyb_1":0,"face":0,"bodyb_2":0,"bracelets_2":0,"blush_2":0,"beard_4":0,"shoes_1":7,"shoes_2":7,"pants_2":1,"makeup_1":0,"moles_1":0,"makeup_4":0,"decals_2":0,"bags_2":0,"blemishes_2":0,"lipstick_3":0,"chest_1":0,"lipstick_1":0,"tshirt_1":0}'),
	(42, 'a271460b66cf34b436f0c69d3cac32b3832bfd6d', 'Farda Bennys', '{"mask_1":0,"blush_1":0,"bags_1":0,"bodyb_2":0,"pants_2":0,"eyebrows_1":0,"arms":41,"sun_1":0,"hair_2":0,"ears_2":0,"decals_1":0,"helmet_2":4,"beard_4":0,"lipstick_1":0,"sun_2":0,"blemishes_1":0,"bags_2":0,"eyebrows_4":0,"glasses_1":5,"sex":0,"skin":4,"beard_2":8,"chain_1":0,"bracelets_1":-1,"pants_1":98,"eyebrows_3":0,"complexion_1":0,"makeup_4":0,"beard_3":0,"beard_1":10,"makeup_3":0,"chest_1":0,"eye_color":0,"complexion_2":0,"blush_2":0,"helmet_1":56,"lipstick_3":0,"makeup_1":0,"bracelets_2":0,"moles_1":0,"torso_2":0,"shoes_2":0,"torso_1":241,"blemishes_2":0,"shoes_1":24,"lipstick_2":0,"chain_2":0,"eyebrows_2":0,"blush_3":0,"age_2":0,"makeup_2":0,"chest_2":0,"age_1":0,"face":0,"arms_2":0,"bproof_1":0,"chest_3":0,"moles_2":0,"mask_2":0,"decals_2":0,"watches_2":0,"hair_color_1":0,"tshirt_1":15,"ears_1":-1,"bodyb_1":0,"tshirt_2":0,"watches_1":-1,"lipstick_4":0,"hair_color_2":0,"hair_1":0,"bproof_2":0,"glasses_2":0}'),
	(43, '40d49d077f6b2f8890289c6001e589a168c77f21', 'Bennys', '{"mask_1":0,"blush_1":0,"bags_1":0,"bodyb_2":0,"pants_2":0,"eyebrows_1":0,"arms":41,"sun_1":0,"blush_3":0,"ears_2":0,"bproof_2":0,"helmet_2":4,"beard_4":0,"lipstick_1":0,"sun_2":0,"blemishes_1":0,"bags_2":0,"eyebrows_4":0,"hair_color_1":29,"sex":0,"skin":3,"beard_2":0,"moles_2":0,"bracelets_1":-1,"pants_1":98,"eyebrows_3":0,"complexion_1":0,"makeup_4":0,"beard_3":0,"beard_1":0,"makeup_3":0,"eyebrows_2":0,"glasses_2":0,"complexion_2":0,"blush_2":0,"helmet_1":56,"lipstick_3":0,"makeup_1":0,"bracelets_2":0,"moles_1":0,"torso_2":0,"shoes_2":0,"torso_1":241,"watches_1":-1,"shoes_1":24,"lipstick_2":0,"chain_2":0,"eye_color":0,"bodyb_1":0,"age_2":0,"tshirt_2":0,"chest_2":0,"age_1":0,"hair_2":0,"arms_2":0,"bproof_1":0,"chest_3":0,"chain_1":0,"mask_2":0,"decals_1":0,"watches_2":0,"lipstick_4":0,"tshirt_1":15,"ears_1":-1,"glasses_1":7,"decals_2":0,"blemishes_2":0,"makeup_2":0,"face":0,"hair_1":14,"hair_color_2":8,"chest_1":0}'),
	(44, 'b56cb4a42ea1c35c19dbb1d6b6401701befd664b', 'Bennys Outfit', '{"mask_1":0,"blush_1":0,"bags_1":0,"bodyb_2":0,"pants_2":0,"eyebrows_1":0,"arms":41,"sun_1":0,"blush_3":0,"ears_2":0,"bproof_2":0,"helmet_2":4,"beard_4":0,"lipstick_1":0,"sun_2":0,"blemishes_1":0,"bags_2":0,"eyebrows_4":0,"glasses_1":7,"sex":0,"skin":5,"beard_2":10,"chain_1":0,"bracelets_1":-1,"bproof_1":0,"eyebrows_3":0,"complexion_1":0,"makeup_4":0,"beard_3":0,"beard_1":10,"makeup_3":0,"eyebrows_2":0,"makeup_2":0,"complexion_2":0,"blush_2":0,"helmet_1":56,"lipstick_3":0,"makeup_1":0,"bracelets_2":0,"moles_1":0,"torso_2":0,"hair_color_2":0,"torso_1":241,"watches_1":-1,"shoes_1":24,"lipstick_2":0,"chain_2":0,"face":7,"shoes_2":0,"age_2":0,"pants_1":98,"chest_2":0,"hair_2":0,"age_1":0,"arms_2":0,"eye_color":0,"chest_3":0,"hair_color_1":3,"mask_2":0,"tshirt_2":0,"watches_2":0,"bodyb_1":0,"tshirt_1":15,"ears_1":-1,"lipstick_4":0,"decals_2":0,"glasses_2":0,"chest_1":0,"decals_1":0,"hair_1":21,"blemishes_2":0,"moles_2":0}'),
	(45, '40d49d077f6b2f8890289c6001e589a168c77f21', 'Casual', '{"mask_1":0,"blush_1":0,"bags_1":0,"bodyb_2":0,"pants_2":0,"eyebrows_1":0,"arms":41,"sun_1":0,"blush_3":0,"ears_2":0,"bproof_2":0,"helmet_2":0,"beard_4":0,"lipstick_1":0,"sun_2":0,"blemishes_1":0,"bags_2":0,"eyebrows_4":0,"hair_color_1":29,"sex":0,"skin":3,"beard_2":0,"moles_2":0,"bracelets_1":-1,"pants_1":46,"eyebrows_3":0,"complexion_1":0,"makeup_4":0,"beard_3":0,"beard_1":0,"makeup_3":0,"eyebrows_2":0,"glasses_2":0,"complexion_2":0,"blush_2":0,"helmet_1":-1,"lipstick_3":0,"makeup_1":0,"bracelets_2":0,"moles_1":0,"torso_2":0,"shoes_2":2,"torso_1":117,"watches_1":-1,"shoes_1":7,"lipstick_2":0,"chain_2":0,"eye_color":0,"bodyb_1":0,"age_2":0,"tshirt_2":0,"chest_2":0,"age_1":0,"hair_2":0,"arms_2":0,"bproof_1":0,"chest_3":0,"chain_1":0,"mask_2":0,"decals_1":0,"watches_2":0,"lipstick_4":0,"tshirt_1":15,"ears_1":-1,"glasses_1":6,"decals_2":0,"blemishes_2":0,"makeup_2":0,"face":0,"hair_1":14,"hair_color_2":8,"chest_1":0}'),
	(46, 'b56cb4a42ea1c35c19dbb1d6b6401701befd664b', 'Chill', '{"mask_1":0,"blush_1":0,"bags_1":0,"bodyb_2":0,"pants_2":0,"eyebrows_1":0,"arms":1,"sun_1":0,"blush_3":0,"ears_2":0,"bproof_2":0,"helmet_2":0,"beard_4":0,"lipstick_1":0,"sun_2":0,"blemishes_1":0,"bags_2":0,"eyebrows_4":0,"glasses_1":7,"sex":0,"skin":5,"beard_2":10,"chain_1":0,"bracelets_1":-1,"bproof_1":0,"eyebrows_3":0,"complexion_1":0,"makeup_4":0,"beard_3":0,"beard_1":10,"makeup_3":0,"eyebrows_2":0,"makeup_2":0,"complexion_2":0,"blush_2":0,"helmet_1":-1,"lipstick_3":0,"makeup_1":0,"bracelets_2":0,"moles_1":0,"torso_2":13,"hair_color_2":0,"torso_1":191,"watches_1":-1,"shoes_1":55,"lipstick_2":0,"chain_2":0,"face":7,"shoes_2":1,"age_2":0,"pants_1":26,"chest_2":0,"hair_2":0,"age_1":0,"arms_2":0,"eye_color":0,"chest_3":0,"hair_color_1":3,"mask_2":0,"tshirt_2":0,"watches_2":0,"bodyb_1":0,"tshirt_1":16,"ears_1":-1,"lipstick_4":0,"decals_2":0,"glasses_2":0,"chest_1":0,"decals_1":0,"hair_1":21,"blemishes_2":0,"moles_2":0}'),
	(47, 'a271460b66cf34b436f0c69d3cac32b3832bfd6d', 'Casual 1', '{"mask_1":0,"blush_1":0,"bags_1":0,"bodyb_2":0,"pants_2":0,"eyebrows_1":0,"arms":1,"sun_1":0,"hair_2":0,"ears_2":0,"decals_1":0,"helmet_2":0,"beard_4":0,"lipstick_1":0,"sun_2":0,"blemishes_1":0,"bags_2":0,"eyebrows_4":0,"glasses_1":5,"sex":0,"skin":4,"beard_2":8,"chain_1":0,"bracelets_1":-1,"pants_1":0,"eyebrows_3":0,"complexion_1":0,"makeup_4":0,"beard_3":0,"beard_1":10,"makeup_3":0,"chest_1":0,"eye_color":0,"complexion_2":0,"blush_2":0,"helmet_1":-1,"lipstick_3":0,"makeup_1":0,"bracelets_2":0,"moles_1":0,"torso_2":0,"shoes_2":0,"torso_1":23,"blemishes_2":0,"shoes_1":1,"lipstick_2":0,"chain_2":0,"eyebrows_2":0,"blush_3":0,"age_2":0,"makeup_2":0,"chest_2":0,"age_1":0,"face":0,"arms_2":0,"bproof_1":0,"chest_3":0,"moles_2":0,"mask_2":0,"decals_2":0,"watches_2":0,"hair_color_1":0,"tshirt_1":0,"ears_1":-1,"bodyb_1":0,"tshirt_2":0,"watches_1":-1,"lipstick_4":0,"hair_color_2":0,"hair_1":0,"bproof_2":0,"glasses_2":0}'),
	(48, 'eb75d2784ddc333b724a5304e2c202eef5a1fc32', 'POLICE_3', '{"mask_1":0,"blush_1":0,"bags_1":0,"bodyb_2":0,"pants_2":2,"eyebrows_1":0,"arms":6,"sun_1":0,"blush_3":0,"ears_2":0,"bproof_2":0,"helmet_2":0,"beard_4":0,"lipstick_1":0,"sun_2":0,"blemishes_1":0,"bags_2":0,"eyebrows_4":0,"hair_color_1":0,"sex":0,"skin":1,"beard_2":0,"chain_1":0,"bracelets_1":-1,"bproof_1":11,"eyebrows_3":0,"complexion_1":0,"makeup_4":0,"beard_3":0,"beard_1":0,"makeup_3":0,"eyebrows_2":0,"makeup_2":0,"complexion_2":0,"blush_2":0,"helmet_1":11,"lipstick_3":0,"makeup_1":0,"bracelets_2":0,"moles_1":0,"torso_2":0,"shoes_2":0,"torso_1":220,"watches_1":-1,"shoes_1":25,"lipstick_2":0,"chain_2":0,"face":10,"decals_1":0,"age_2":0,"chest_1":0,"chest_2":0,"lipstick_4":0,"age_1":0,"arms_2":0,"pants_1":31,"chest_3":0,"tshirt_1":2,"mask_2":0,"moles_2":0,"watches_2":0,"decals_2":0,"bodyb_1":0,"ears_1":-1,"glasses_1":3,"tshirt_2":0,"blemishes_2":0,"eye_color":0,"hair_2":0,"hair_1":1,"hair_color_2":3,"glasses_2":0}'),
	(49, 'a271460b66cf34b436f0c69d3cac32b3832bfd6d', 'Roupa Mascara', '{"mask_1":23,"blush_1":0,"bags_1":0,"bodyb_2":0,"pants_2":1,"eyebrows_1":0,"arms":4,"sun_1":0,"hair_2":0,"ears_2":0,"decals_1":0,"helmet_2":0,"beard_4":0,"lipstick_1":0,"sun_2":0,"blemishes_1":0,"bags_2":0,"eyebrows_4":0,"glasses_1":0,"sex":0,"skin":4,"beard_2":8,"chain_1":112,"bracelets_1":-1,"pants_1":9,"eyebrows_3":0,"complexion_1":0,"makeup_4":0,"beard_3":0,"beard_1":10,"makeup_3":0,"chest_1":0,"eye_color":0,"complexion_2":0,"blush_2":0,"helmet_1":-1,"lipstick_3":0,"makeup_1":0,"bracelets_2":0,"moles_1":0,"torso_2":7,"shoes_2":0,"torso_1":70,"blemishes_2":0,"shoes_1":1,"lipstick_2":0,"chain_2":0,"eyebrows_2":0,"blush_3":0,"age_2":0,"makeup_2":0,"chest_2":0,"age_1":0,"face":0,"arms_2":0,"bproof_1":0,"chest_3":0,"moles_2":0,"mask_2":0,"decals_2":0,"watches_2":0,"hair_color_1":0,"tshirt_1":105,"ears_1":-1,"bodyb_1":0,"tshirt_2":0,"watches_1":-1,"lipstick_4":0,"hair_color_2":0,"hair_1":0,"bproof_2":0,"glasses_2":0}'),
	(50, '53f0a005d2985717ed1caacf8e23f271722ab38a', 'Chefia', '{"lipstick_2":0,"lipstick_3":0,"complexion_2":0,"blush_3":0,"eye_color":0,"watches_2":0,"eyebrows_1":9,"hair_color_1":0,"beard_1":3,"eyebrows_4":0,"blemishes_1":0,"lipstick_1":0,"ears_2":0,"decals_2":0,"mask_2":0,"eyebrows_3":0,"age_2":0,"makeup_2":0,"shoes_2":0,"arms_2":0,"chain_2":0,"torso_1":213,"pants_2":2,"bags_1":0,"tshirt_2":0,"ears_1":0,"helmet_2":20,"bproof_1":0,"bodyb_2":0,"decals_1":1,"glasses_1":5,"chest_1":0,"blemishes_2":0,"sun_1":0,"tshirt_1":3,"torso_2":0,"beard_2":8,"hair_color_2":0,"moles_1":0,"moles_2":0,"beard_3":0,"shoes_1":25,"arms":11,"makeup_1":0,"lipstick_4":0,"bracelets_1":-1,"face":44,"glasses_2":4,"makeup_4":0,"helmet_1":106,"complexion_1":0,"bproof_2":0,"beard_4":0,"blush_1":0,"sex":0,"mask_1":0,"bags_2":0,"makeup_3":0,"hair_1":15,"blush_2":0,"bodyb_1":0,"bracelets_2":0,"chest_3":0,"hair_2":0,"skin":0,"watches_1":-1,"pants_1":87,"chest_2":0,"sun_2":0,"chain_1":0,"age_1":4,"eyebrows_2":3}'),
	(51, '6c60bb59352c712e4d63af8779088475c5282413', 'Normal 1', '{"mask_1":0,"bodyb_1":0,"tshirt_2":2,"makeup_4":0,"hair_2":0,"chest_3":0,"pants_2":1,"hair_color_1":10,"bags_2":0,"eyebrows_3":0,"eyebrows_1":2,"sun_2":0,"glasses_1":0,"beard_4":0,"bodyb_2":0,"chain_2":0,"beard_3":0,"torso_1":72,"chain_1":0,"decals_1":0,"makeup_2":0,"complexion_2":0,"bracelets_1":-1,"bproof_2":0,"beard_1":0,"lipstick_4":0,"hair_1":38,"eye_color":0,"helmet_1":-1,"arms":0,"moles_1":0,"blush_1":0,"watches_1":-1,"torso_2":2,"blush_2":0,"chest_2":0,"hair_color_2":0,"age_1":0,"ears_2":0,"skin":4,"complexion_1":0,"age_2":0,"blush_3":0,"lipstick_1":0,"watches_2":0,"sun_1":0,"bags_1":0,"shoes_2":0,"tshirt_1":0,"eyebrows_2":6,"bracelets_2":0,"mask_2":0,"sex":0,"blemishes_2":0,"ears_1":-1,"makeup_3":0,"lipstick_2":0,"beard_2":0,"decals_2":0,"face":2,"arms_2":0,"pants_1":4,"moles_2":0,"helmet_2":0,"glasses_2":0,"eyebrows_4":0,"shoes_1":12,"bproof_1":0,"chest_1":0,"lipstick_3":0,"blemishes_1":0,"makeup_1":0}'),
	(52, 'b56cb4a42ea1c35c19dbb1d6b6401701befd664b', 'yooo', '{"complexion_2":0,"beard_1":10,"bracelets_2":0,"eyebrows_1":0,"lipstick_2":0,"chest_3":0,"chain_2":0,"makeup_1":0,"hair_2":0,"lipstick_3":0,"shoes_2":4,"chain_1":0,"helmet_2":0,"hair_color_2":0,"sun_2":0,"eye_color":0,"glasses_2":1,"sun_1":0,"bags_1":0,"blemishes_2":0,"mask_1":0,"pants_1":27,"tshirt_1":15,"ears_1":-1,"tshirt_2":0,"bracelets_1":-1,"bproof_1":0,"ears_2":0,"sex":0,"makeup_2":0,"moles_2":0,"beard_2":10,"arms_2":0,"mask_2":0,"hair_1":21,"blush_3":0,"makeup_4":0,"blush_2":0,"shoes_1":57,"decals_1":0,"beard_3":0,"lipstick_4":0,"lipstick_1":0,"eyebrows_3":0,"makeup_3":0,"bags_2":0,"eyebrows_2":0,"hair_color_1":3,"bodyb_1":0,"pants_2":3,"torso_2":1,"chest_2":0,"beard_4":0,"bodyb_2":0,"glasses_1":10,"skin":5,"chest_1":0,"helmet_1":-1,"blush_1":0,"arms":1,"age_1":0,"age_2":0,"blemishes_1":0,"moles_1":0,"torso_1":235,"watches_2":0,"watches_1":-1,"bproof_2":0,"complexion_1":0,"decals_2":0,"face":7,"eyebrows_4":0}'),
	(53, '833f45496e937270a4ecf076b0fe5d12d9b6ce51', 'Farda Café', '{"blush_1":2,"shoes_2":6,"bproof_1":0,"complexion_2":0,"blemishes_1":0,"bracelets_1":-1,"hair_color_2":61,"age_2":0,"bproof_2":0,"makeup_4":0,"mask_1":0,"bodyb_1":0,"makeup_3":0,"eye_color":3,"sun_1":0,"tshirt_2":0,"arms_2":0,"age_1":0,"moles_2":0,"beard_2":0,"lipstick_1":0,"makeup_2":0,"makeup_1":3,"shoes_1":3,"glasses_1":5,"pants_2":10,"sex":1,"ears_2":0,"torso_1":268,"decals_2":0,"chest_2":0,"eyebrows_4":5,"sun_2":0,"eyebrows_2":5,"bags_1":0,"chest_1":0,"face":45,"ears_1":-1,"bracelets_2":0,"hair_color_1":0,"complexion_1":0,"helmet_1":-1,"beard_3":0,"hair_1":34,"watches_2":0,"blemishes_2":0,"beard_4":0,"tshirt_1":2,"pants_1":0,"chain_2":5,"hair_2":0,"arms":9,"eyebrows_3":7,"beard_1":0,"blush_2":2,"mask_2":0,"eyebrows_1":0,"helmet_2":0,"watches_1":-1,"glasses_2":0,"blush_3":16,"lipstick_3":52,"torso_2":25,"chest_3":0,"bags_2":0,"lipstick_4":0,"bodyb_2":0,"lipstick_2":3,"chain_1":0,"decals_1":0,"moles_1":0,"skin":10}'),
	(54, 'a271460b66cf34b436f0c69d3cac32b3832bfd6d', 'Mobfit 1', '{"bproof_2":0,"complexion_1":0,"helmet_1":7,"bracelets_1":-1,"mask_2":0,"bproof_1":0,"chest_1":0,"bags_2":0,"makeup_1":0,"chain_1":0,"pants_2":0,"arms_2":0,"eyebrows_4":0,"eyebrows_2":0,"sun_2":0,"ears_2":0,"eyebrows_3":0,"hair_color_2":0,"lipstick_3":0,"torso_1":192,"blemishes_2":0,"blemishes_1":0,"bags_1":0,"beard_2":8,"blush_2":0,"tshirt_1":4,"bracelets_2":0,"shoes_1":10,"watches_1":-1,"chest_2":0,"torso_2":9,"blush_1":0,"hair_color_1":0,"eyebrows_1":0,"shoes_2":0,"sun_1":0,"lipstick_4":0,"moles_1":0,"beard_3":0,"pants_1":10,"skin":4,"lipstick_2":0,"eye_color":0,"glasses_1":5,"hair_2":0,"beard_4":0,"complexion_2":0,"ears_1":-1,"moles_2":0,"watches_2":0,"bodyb_1":0,"face":0,"glasses_2":0,"makeup_2":0,"tshirt_2":0,"chain_2":0,"chest_3":0,"mask_1":0,"hair_1":0,"age_2":0,"decals_2":0,"lipstick_1":0,"beard_1":10,"bodyb_2":0,"blush_3":0,"arms":4,"makeup_3":0,"decals_1":0,"age_1":0,"sex":0,"makeup_4":0,"helmet_2":2}'),
	(55, 'eb75d2784ddc333b724a5304e2c202eef5a1fc32', 'Transito', '{"chain_1":0,"eye_color":0,"helmet_2":0,"hair_1":1,"lipstick_3":0,"makeup_2":0,"makeup_4":0,"lipstick_1":0,"ears_2":0,"glasses_1":3,"bodyb_1":0,"decals_2":0,"bodyb_2":0,"torso_1":49,"sun_2":0,"chain_2":0,"decals_1":0,"hair_color_2":3,"sun_1":0,"mask_1":0,"torso_2":4,"lipstick_2":0,"shoes_2":0,"bracelets_1":-1,"helmet_1":11,"bags_2":0,"beard_3":0,"arms_2":0,"face":26,"skin":1,"tshirt_2":0,"blush_3":0,"hair_color_1":0,"hair_2":0,"complexion_1":0,"blemishes_1":0,"moles_2":0,"watches_2":0,"blemishes_2":0,"bproof_1":0,"beard_1":0,"age_1":0,"glasses_2":0,"chest_3":0,"moles_1":0,"makeup_3":0,"blush_1":0,"pants_2":2,"pants_1":31,"lipstick_4":0,"arms":1,"age_2":0,"eyebrows_3":0,"bracelets_2":0,"ears_1":-1,"blush_2":0,"eyebrows_1":0,"eyebrows_2":0,"bags_1":0,"beard_4":0,"bproof_2":0,"chest_1":0,"beard_2":0,"tshirt_1":10,"makeup_1":0,"eyebrows_4":0,"chest_2":0,"watches_1":-1,"mask_2":0,"sex":0,"complexion_2":0,"shoes_1":25}'),
	(57, '56f798b04a36fa5f430641815db89cd5b5ba9a5e', 'casual', '{"chain_1":125,"eye_color":2,"helmet_2":0,"hair_1":19,"lipstick_3":0,"eyebrows_4":0,"makeup_4":0,"lipstick_1":0,"ears_2":2,"glasses_1":5,"bodyb_1":0,"decals_2":0,"bodyb_2":0,"torso_1":347,"sun_2":0,"blush_1":0,"decals_1":0,"hair_color_2":0,"sun_1":0,"mask_1":0,"torso_2":5,"lipstick_2":0,"shoes_2":1,"bracelets_1":-1,"helmet_1":143,"bags_2":0,"beard_3":61,"pants_2":0,"bracelets_2":0,"sex":0,"tshirt_2":0,"lipstick_4":0,"hair_color_1":15,"watches_1":-1,"eyebrows_2":10,"blemishes_1":0,"moles_2":0,"watches_2":0,"blemishes_2":0,"bproof_1":0,"beard_1":3,"age_1":0,"glasses_2":4,"chest_3":0,"moles_1":0,"makeup_3":0,"blush_3":0,"makeup_2":0,"pants_1":12,"beard_2":10,"blush_2":0,"age_2":0,"eyebrows_3":0,"mask_2":0,"ears_1":17,"face":0,"chest_2":0,"hair_2":0,"arms_2":0,"beard_4":0,"bags_1":0,"bproof_2":0,"chest_1":0,"tshirt_1":23,"makeup_1":0,"skin":29,"arms":26,"eyebrows_1":30,"chain_2":0,"complexion_2":0,"complexion_1":0,"shoes_1":42}'),
	(58, '53f0a005d2985717ed1caacf8e23f271722ab38a', 'Bennys', '{"lipstick_3":0,"bodyb_2":0,"blush_2":0,"chain_1":0,"eyebrows_4":0,"torso_2":0,"makeup_2":0,"lipstick_2":0,"age_1":4,"hair_color_2":0,"hair_color_1":0,"sun_2":0,"ears_2":0,"pants_2":0,"blemishes_2":0,"tshirt_2":0,"beard_2":8,"mask_2":0,"bags_1":0,"bproof_1":0,"sun_1":0,"eye_color":0,"sex":0,"shoes_2":0,"helmet_2":4,"skin":0,"eyebrows_3":0,"ears_1":0,"bodyb_1":0,"makeup_4":0,"moles_1":0,"eyebrows_1":9,"moles_2":0,"hair_2":0,"face":44,"tshirt_1":15,"chest_2":0,"blemishes_1":0,"age_2":0,"bproof_2":0,"glasses_2":4,"chest_1":0,"hair_1":15,"chest_3":0,"complexion_1":0,"lipstick_1":0,"eyebrows_2":3,"lipstick_4":0,"beard_3":0,"pants_1":98,"blush_1":0,"chain_2":0,"makeup_3":0,"watches_2":0,"helmet_1":56,"torso_1":241,"decals_1":0,"blush_3":0,"shoes_1":24,"bags_2":0,"makeup_1":0,"mask_1":0,"watches_1":-1,"arms_2":0,"decals_2":0,"bracelets_1":-1,"arms":41,"beard_1":3,"beard_4":0,"glasses_1":5,"complexion_2":0,"bracelets_2":0}'),
	(59, '53f0a005d2985717ed1caacf8e23f271722ab38a', 'Tiburcio2', '{"lipstick_3":0,"bodyb_2":0,"blush_2":0,"chain_1":12,"eyebrows_4":0,"torso_2":0,"makeup_2":0,"lipstick_2":0,"age_1":4,"hair_color_2":0,"hair_color_1":0,"sun_2":0,"ears_2":0,"pants_2":0,"blemishes_2":0,"tshirt_2":0,"beard_2":8,"mask_2":0,"bags_1":0,"bproof_1":0,"sun_1":0,"eye_color":0,"sex":0,"shoes_2":0,"helmet_2":2,"skin":0,"eyebrows_3":0,"ears_1":0,"bodyb_1":0,"makeup_4":0,"moles_1":0,"eyebrows_1":9,"moles_2":0,"hair_2":0,"face":44,"tshirt_1":15,"chest_2":0,"blemishes_1":0,"age_2":0,"bproof_2":0,"glasses_2":4,"chest_1":0,"hair_1":15,"chest_3":0,"complexion_1":0,"lipstick_1":0,"eyebrows_2":3,"lipstick_4":0,"beard_3":0,"pants_1":47,"blush_1":0,"chain_2":0,"makeup_3":0,"watches_2":0,"helmet_1":7,"torso_1":26,"decals_1":0,"blush_3":0,"shoes_1":1,"bags_2":0,"makeup_1":0,"mask_1":0,"watches_1":-1,"arms_2":0,"decals_2":0,"bracelets_1":-1,"arms":11,"beard_1":3,"beard_4":0,"glasses_1":5,"complexion_2":0,"bracelets_2":0}'),
	(60, 'a271460b66cf34b436f0c69d3cac32b3832bfd6d', 'Outfit Mascara', '{"beard_4":0,"hair_color_2":0,"hair_1":0,"makeup_4":0,"arms_2":0,"bodyb_2":0,"watches_1":-1,"lipstick_4":0,"eyebrows_1":0,"moles_2":0,"bproof_2":0,"beard_3":0,"glasses_2":0,"eyebrows_3":0,"tshirt_1":105,"decals_2":0,"lipstick_3":0,"sun_2":0,"complexion_2":0,"shoes_2":0,"torso_2":7,"face":0,"ears_1":-1,"mask_1":23,"beard_2":8,"bags_1":0,"beard_1":10,"helmet_2":0,"watches_2":0,"eyebrows_2":0,"mask_2":0,"makeup_1":0,"helmet_1":-1,"sex":0,"torso_1":70,"ears_2":0,"complexion_1":0,"blemishes_2":0,"blush_2":0,"hair_2":0,"arms":4,"blush_3":0,"tshirt_2":0,"hair_color_1":0,"blush_1":0,"chest_3":0,"bodyb_1":0,"eyebrows_4":0,"moles_1":0,"sun_1":0,"age_1":0,"lipstick_1":0,"decals_1":0,"lipstick_2":0,"makeup_2":0,"pants_2":1,"bracelets_1":-1,"chain_2":0,"chain_1":112,"eye_color":0,"blemishes_1":0,"shoes_1":1,"chest_2":0,"bproof_1":0,"skin":4,"makeup_3":0,"bags_2":0,"chest_1":0,"pants_1":9,"glasses_1":0,"age_2":0,"bracelets_2":0}'),
	(61, '13d25ca9c27b07d2558f4677d68fb9e4a97f6b05', 'bennys', '{"shoes_2":0,"lipstick_2":0,"lipstick_1":0,"blush_3":0,"beard_3":29,"skin":4,"blush_1":0,"eyebrows_2":10,"makeup_3":0,"chest_1":0,"makeup_4":0,"glasses_1":3,"chest_2":0,"ears_2":0,"watches_2":0,"age_2":0,"hair_1":37,"mask_1":169,"torso_1":241,"ears_1":-1,"lipstick_3":0,"tshirt_2":0,"makeup_1":22,"face":0,"decals_1":0,"arms":41,"beard_2":10,"pants_2":0,"beard_4":0,"sun_2":0,"bracelets_2":0,"bproof_1":0,"watches_1":-1,"helmet_2":0,"hair_color_2":0,"decals_2":0,"complexion_1":0,"age_1":0,"moles_1":0,"blemishes_2":0,"tshirt_1":15,"helmet_1":-1,"bodyb_1":0,"eye_color":3,"bags_1":0,"bags_2":0,"eyebrows_1":29,"sex":0,"complexion_2":0,"bproof_2":0,"chain_1":0,"moles_2":0,"bracelets_1":-1,"blemishes_1":0,"shoes_1":24,"arms_2":0,"sun_1":0,"lipstick_4":0,"eyebrows_4":0,"eyebrows_3":0,"makeup_2":10,"glasses_2":0,"beard_1":3,"chain_2":0,"hair_2":0,"chest_3":0,"hair_color_1":29,"pants_1":98,"bodyb_2":0,"mask_2":0,"blush_2":0,"torso_2":0}'),
	(62, 'eb75d2784ddc333b724a5304e2c202eef5a1fc32', 'SWAT', '{"bproof_1":11,"decals_1":1,"blemishes_1":0,"blush_1":0,"decals_2":0,"torso_2":2,"eyebrows_2":0,"lipstick_1":0,"chest_1":0,"chain_1":0,"makeup_2":0,"sun_1":0,"mask_1":56,"helmet_1":117,"hair_color_2":3,"blush_2":0,"ears_2":0,"chest_3":0,"sex":0,"makeup_4":0,"arms":17,"bracelets_1":-1,"torso_1":220,"mask_2":1,"hair_1":1,"bodyb_1":0,"glasses_2":4,"beard_4":0,"arms_2":0,"eyebrows_3":0,"bracelets_2":0,"moles_1":0,"lipstick_4":0,"helmet_2":0,"face":26,"tshirt_1":2,"moles_2":0,"bags_1":0,"pants_1":31,"hair_2":0,"makeup_1":0,"beard_3":0,"eyebrows_1":0,"beard_2":0,"watches_1":-1,"beard_1":0,"bproof_2":0,"glasses_1":25,"skin":1,"bodyb_2":0,"age_1":0,"hair_color_1":0,"eye_color":0,"sun_2":0,"ears_1":-1,"pants_2":2,"blush_3":0,"tshirt_2":0,"chest_2":0,"watches_2":0,"lipstick_2":0,"lipstick_3":0,"chain_2":0,"blemishes_2":0,"complexion_2":0,"shoes_1":25,"age_2":0,"bags_2":0,"eyebrows_4":0,"makeup_3":0,"shoes_2":0,"complexion_1":0}');

-- Dumping structure for table legacy.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.job_grades: ~24 rows (approximately)
DELETE FROM `job_grades`;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(0, 'unemployed', 0, 'unemployed', 'Desempregado', 50, '{}', '{}'),
	(1, 'police', 1, 'recruta', 'Recruta', 1000, '{}', '{}'),
	(2, 'police', 2, 'agente', 'Agente', 1200, '{}', '{}'),
	(3, 'police', 3, 'agenteprincipal', 'Agente Principal', 1500, '{}', '{}'),
	(4, 'police', 4, 'agentecoordenador', 'Agente Coordenador', 2000, '{}', '{}'),
	(5, 'police', 5, 'capitao', 'Capitão', 2200, '{}', '{}'),
	(6, 'police', 6, 'sargento', 'Sargento', 2500, '{}', '{}'),
	(7, 'police', 7, 'tenente', 'Tenente', 3000, '{}', '{}'),
	(8, 'police', 8, 'subchefe', 'Sub-Chefe', 3500, '{}', '{}'),
	(9, 'police', 9, 'boss', 'Chefe da DPLS', 4000, '{}', '{}'),
	(10, 'mechanic', 1, 'Recruta', 'Recruta', 1, '{}', '{}'),
	(11, 'mechanic', 2, 'funcionario', 'Funcionário', 1, '{}', '{}'),
	(12, 'mechanic', 3, 'gerente', 'Gerente de Oficina', 1, '{}', '{}'),
	(13, 'mechanic', 4, 'subchefe', 'Sub-Chefe da Benny\'s', 1, '{}', '{}'),
	(14, 'mechanic', 5, 'boss', 'Chefe da Benny\'s', 1, '{}', '{}'),
	(15, 'ambulance', 1, 'estagiario', 'Estagiario', 2000, '{}', '{}'),
	(16, 'ambulance', 2, 'paramedico', 'paramedico', 2200, '{}', '{}'),
	(17, 'ambulance', 3, 'medicodefamilia', 'Médico de Família', 2500, '{}', '{}'),
	(18, 'ambulance', 4, 'psicologo', 'Psicólogo', 3000, '{}', '{}'),
	(19, 'ambulance', 5, 'cirurgiao', 'Cirurgião', 3500, '{}', '{}'),
	(20, 'ambulance', 6, 'boss', 'Diretor SEM', 4000, '{}', '{}'),
	(24, 'lawyer', 1, 'advogado', 'Advogado', 2000, '{}', '{}'),
	(25, 'dynasty', 2, 'boss', 'Chefe', 200, '{}', '{}'),
	(26, 'dynasty', 1, 'imobiliario', 'Imobiliário', 200, '{}', '{}');

-- Dumping structure for table legacy.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.licenses: ~6 rows (approximately)
DELETE FROM `licenses`;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('caca', 'Licença de Caça'),
	('dmv', 'Código da Estrada'),
	('drive', 'Carta de Condução'),
	('drive_bike', 'Carta de Mota'),
	('drive_truck', 'Carta de Camião'),
	('weapon', 'Licença de uso e porte de arma');

-- Dumping structure for table legacy.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.mdt_reports: ~0 rows (approximately)
DELETE FROM `mdt_reports`;

-- Dumping structure for table legacy.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.mdt_warrants: ~0 rows (approximately)
DELETE FROM `mdt_warrants`;

-- Dumping structure for table legacy.okokbanking_societies
CREATE TABLE IF NOT EXISTS `okokbanking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.okokbanking_societies: ~0 rows (approximately)
DELETE FROM `okokbanking_societies`;

-- Dumping structure for table legacy.okokbanking_transactions
CREATE TABLE IF NOT EXISTS `okokbanking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `sender_identifier` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `value` int(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=902 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.okokbanking_transactions: ~0 rows (approximately)
DELETE FROM `okokbanking_transactions`;

-- Dumping structure for table legacy.okokvehicleshop_orders
CREATE TABLE IF NOT EXISTS `okokvehicleshop_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) NOT NULL,
  `shop_type` varchar(255) NOT NULL,
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `reward` varchar(255) NOT NULL,
  `in_progress` varchar(255) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.okokvehicleshop_orders: ~0 rows (approximately)
DELETE FROM `okokvehicleshop_orders`;

-- Dumping structure for table legacy.okokvehicleshop_saleshistory
CREATE TABLE IF NOT EXISTS `okokvehicleshop_saleshistory` (
  `shop_id` varchar(255) NOT NULL,
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `buyer_id` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.okokvehicleshop_saleshistory: ~0 rows (approximately)
DELETE FROM `okokvehicleshop_saleshistory`;

-- Dumping structure for table legacy.okokvehicleshop_shops
CREATE TABLE IF NOT EXISTS `okokvehicleshop_shops` (
  `shop_name` varchar(255) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `money` varchar(255) NOT NULL,
  `employees` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.okokvehicleshop_shops: ~0 rows (approximately)
DELETE FROM `okokvehicleshop_shops`;

-- Dumping structure for table legacy.okokvehicleshop_vehicles
CREATE TABLE IF NOT EXISTS `okokvehicleshop_vehicles` (
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `stock` longtext DEFAULT NULL,
  `unlisted` longtext DEFAULT NULL,
  `min_price` varchar(255) NOT NULL,
  `max_price` varchar(255) NOT NULL DEFAULT '0',
  `owner_buy_price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.okokvehicleshop_vehicles: ~329 rows (approximately)
DELETE FROM `okokvehicleshop_vehicles`;
INSERT INTO `okokvehicleshop_vehicles` (`vehicle_name`, `vehicle_id`, `category`, `type`, `stock`, `unlisted`, `min_price`, `max_price`, `owner_buy_price`) VALUES
	('Adder', 'adder', 'super', 'vehicles', '{"vehicles1":{"price":"920000","amount":10}}', NULL, '920000', '1200000', '828000'),
	('Akuma', 'akuma', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"11250","amount":10}}', NULL, '11250', '110000', '10125'),
	('Alpha', 'alpha', 'sports', 'vehicles', '{"vehicles1":{"price":"90000","amount":10}}', NULL, '90000', '65000', '65000'),
	('Alpha Z1', 'alphaz1', 'planes', 'air', '{"air1":{"price":"1121000","amount":10}}', NULL, '1121000', '1135000', '1008900'),
	('Asbo', 'asbo', 'compacts', 'vehicles', '{"vehicles1":{"price":"14000","amount":10}}', NULL, '14000', '23000', '12600'),
	('Asea', 'asea', 'sedans', 'vehicles', '{"vehicles1":{"price":"8250","amount":10}}', NULL, '8250', '40000', '7425'),
	('Avarus', 'avarus', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"27000","amount":10}}', NULL, '27000', '27000', '24300'),
	('Bagger', 'bagger', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"20250","amount":10}}', NULL, '20250', '23000', '18225'),
	('Baller', 'baller2', 'suvs', 'vehicles', '{"vehicles1":{"price":"60000","amount":10}}', NULL, '60000', '20000', '54000'),
	('Baller Sport', 'baller3', 'suvs', 'vehicles', '{"vehicles1":{"price":"90000","amount":10}}', NULL, '90000', '70000', '81000'),
	('Banshee', 'banshee', 'sports', 'vehicles', '{"vehicles1":{"price":"105000","amount":10}}', NULL, '105000', '70000', '94500'),
	('Banshee 900R', 'banshee2', 'super', 'vehicles', '{"vehicles1":{"price":"328500","amount":10}}', NULL, '328500', '250000', '295650'),
	('Bati 801', 'bati', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"18000","amount":10}}', NULL, '18000', '100000', '16200'),
	('Bati 801RR', 'bati2', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"28500","amount":10}}', NULL, '28500', '120000', '25650'),
	('Benson', 'benson', 'box', 'truck', '{"truck1":{"price":"550000","amount":10}}', NULL, '540000', '560000', '486000'),
	('Besra', 'besra', 'planes', 'air', '{"air1":{"price":"2480000","amount":10}}', NULL, '2480000', '2500000', '2232000'),
	('Bestia GTS', 'bestiagts', 'sports', 'vehicles', '{"vehicles1":{"price":"83750","amount":10}}', NULL, '83750', '100000', '75375'),
	('BF 400', 'bf400', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"9750","amount":10}}', NULL, '9750', '80000', '8775'),
	('Bf Injection', 'bfinjection', 'offroads', 'vehicles', '{"vehicles1":{"price":"24000","amount":10}}', NULL, '24000', '30000', '21600'),
	('Bifta', 'bifta', 'offroads', 'vehicles', '{"vehicles1":{"price":"18000","amount":10}}', NULL, '18000', '45000', '16200'),
	('Bison', 'bison', 'vans', 'vehicles', '{"vehicles1":{"price":"67500","amount":10}}', NULL, '67500', '25000', '60750'),
	('Blade', 'blade', 'muscle', 'vehicles', '{"vehicles1":{"price":"22500","amount":10}}', NULL, '22500', '40000', '20250'),
	('Blazer', 'blazer', 'offroads', 'vehicles', '{"vehicles1":{"price":"10000","amount":10}}', NULL, '10000', '25000', '9000'),
	('Blazer Sport', 'blazer4', 'offroads', 'vehicles', '{"vehicles1":{"price":"12750","amount":10}}', NULL, '12750', '40000', '11475'),
	('Blista', 'blista', 'compacts', 'vehicles', '{"vehicles1":{"price":"12000","amount":10}}', NULL, '12000', '35000', '10800'),
	('BMX', 'bmx', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"240","amount":10}}', NULL, '240', '2000', '216'),
	('Bobcat XL', 'bobcatxl', 'vans', 'vehicles', '{"vehicles1":{"price":"48000","amount":10}}', NULL, '48000', '30000', '43200'),
	('Brawler', 'brawler', 'offroads', 'vehicles', '{"vehicles1":{"price":"275000","amount":10}}', NULL, '675000', '70000', '607500'),
	('Brioso R/A', 'brioso', 'compacts', 'vehicles', '{"vehicles1":{"price":"27000","amount":10}}', NULL, '27000', '55000', '24300'),
	('Btype', 'btype', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"93500","amount":10}}', NULL, '93500', '80000', '84150'),
	('Btype Hotroad', 'btype2', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"232500","amount":10}}', NULL, '232500', '120000', '209250'),
	('Btype Luxe', 'btype3', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"127500","amount":10}}', NULL, '127500', '180000', '114750'),
	('Buccaneer', 'buccaneer', 'muscle', 'vehicles', '{"vehicles1":{"price":"27000","amount":10}}', NULL, '27000', '50000', '24300'),
	('Buccaneer Rider', 'buccaneer2', 'muscle', 'vehicles', '{"vehicles1":{"price":"36000","amount":10}}', NULL, '36000', '80000', '32400'),
	('Buffalo', 'buffalo', 'sports', 'vehicles', '{"vehicles1":{"price":"18000","amount":10}}', NULL, '18000', '55000', '16200'),
	('Buffalo S', 'buffalo2', 'sports', 'vehicles', '{"vehicles1":{"price":"30000","amount":10}}', NULL, '30000', '70000', '27000'),
	('Bullet', 'bullet', 'super', 'vehicles', '{"vehicles1":{"price":"135000","amount":10}}', NULL, '135000', '400000', '121500'),
	('Burrito', 'burrito3', 'vans', 'vehicles', '{"vehicles1":{"price":"28500","amount":10}}', NULL, '28500', '40000', '25650'),
	('Bus', 'bus', 'trans', 'truck', '{"truck1":{"price":"500000","amount":10}}', NULL, '490000', '510000', '441000'),
	('Buzzard', 'buzzard2', 'helicopter', 'air', '{"air1":{"price":"1500000","amount":10}}', NULL, '1500000', '1515000', '1350000'),
	('Calico GTF', 'calico', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '140000', '130500'),
	('Camper', 'camper', 'vans', 'vehicles', '{"vehicles1":{"price":"63000","amount":10}}', NULL, '63000', '35000', '56700'),
	('Caracara', 'caracara2', 'offroads', 'vehicles', '{"vehicles1":{"price":"517000","amount":10}}', NULL, '517000', '110000', '465300'),
	('Carbonizzare', 'carbonizzare', 'sports', 'vehicles', '{"vehicles1":{"price":"112500","amount":10}}', NULL, '112500', '250000', '101250'),
	('Carbon RS', 'carbonrs', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"27000","amount":10}}', NULL, '27000', '64000', '24300'),
	('Casco', 'casco', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"45000","amount":10}}', NULL, '45000', '100000', '40500'),
	('Cavalcade', 'cavalcade2', 'suvs', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '25000', '74250'),
	('Cheetah', 'cheetah', 'super', 'vehicles', '{"vehicles1":{"price":"562500","amount":10}}', NULL, '562500', '600000', '506250'),
	('Chimera', 'chimera', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"57000","amount":10}}', NULL, '57000', '97000', '51300'),
	('Chino', 'chino', 'muscle', 'vehicles', '{"vehicles1":{"price":"22500","amount":10}}', NULL, '22500', '50000', '20250'),
	('Chino Luxe', 'chino2', 'muscle', 'vehicles', '{"vehicles1":{"price":"28500","amount":10}}', NULL, '28500', '80000', '25650'),
	('Cliffhanger', 'cliffhanger', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"14250","amount":10}}', NULL, '14250', '86000', '12825'),
	('Reisebus', 'coach', 'trans', 'truck', '{"truck1":{"price":"770000","amount":10}}', NULL, '760000', '780000', '684000'),
	('Gognoscenti Cabrio', 'cogcabrio', 'coupes', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '38000', '74250'),
	('Cognoscenti', 'cognoscenti', 'sedans', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '160000', '74250'),
	('Comet', 'comet2', 'sports', 'vehicles', '{"vehicles1":{"price":"94500","amount":10}}', NULL, '94500', '130000', '85050'),
	('Comet 3', 'comet3', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"200000","amount":10}}', NULL, '200000', '210000', '180000'),
	('Comet 4', 'comet4', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"190000","amount":10}}', NULL, '190000', '250000', '171000'),
	('Comet 5', 'comet5', 'sports', 'vehicles', '{"vehicles1":{"price":"171750","amount":10}}', NULL, '171750', '350000', '154575'),
	('Comet 812', 'comet6', 'sports', 'vehicles', '{"vehicles1":{"price":"345000","amount":10}}', NULL, '345000', '510000', '310500'),
	('Contender', 'contender', 'suvs', 'vehicles', '{"vehicles1":{"price":"10500","amount":10}}', NULL, '10500', '40000', '9450'),
	('Coquette', 'coquette', 'sports', 'vehicles', '{"vehicles1":{"price":"94500","amount":10}}', NULL, '94500', '200000', '85050'),
	('Coquette BlackFin', 'coquette3', 'muscle', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '120000', '74250'),
	('Cruiser', 'cruiser', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"765","amount":10}}', NULL, '765', '3000', '688'),
	('Cuban 800', 'cuban800', 'planes', 'air', '{"air1":{"price":"1240000","amount":10}}', NULL, '1240000', '1250000', '1116000'),
	('Cyclone', 'cyclone', 'super', 'vehicles', '{"vehicles1":{"price":"283500","amount":10}}', NULL, '283500', '700000', '255150'),
	('Cypher', 'cypher', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '150000', '130500'),
	('Daemon', 'daemon', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"17250","amount":10}}', NULL, '17250', '19000', '15525'),
	('Daemon High', 'daemon2', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"20250","amount":10}}', NULL, '20250', '27000', '18225'),
	('Defiler', 'defiler', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"14700","amount":10}}', NULL, '14700', '42000', '13230'),
	('Dinghy 4S', 'dinghy', 'boats', 'water', '{"water1":{"price":"55000","amount":10}}', NULL, '55000', '60000', '49500'),
	('Dinghy 2S', 'dinghy2', 'boats', 'water', '{"water1":{"price":"50000","amount":10}}', NULL, '50000', '55000', '45000'),
	('Dinghy Yacht', 'dinghy4', 'boats', 'water', '{"water1":{"price":"55000","amount":10}}', NULL, '55000', '60000', '49500'),
	('Dodo', 'dodo', 'planes', 'air', '{"air1":{"price":"1500000","amount":10}}', NULL, '1500000', '1510000', '1350000'),
	('Dominator', 'dominator', 'muscle', 'vehicles', '{"vehicles1":{"price":"52000","amount":10}}', NULL, '52000', '70000', '46800'),
	('Dominator RTX', 'dominator7', 'muscle', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '150000', '130500'),
	('Dominator GTT', 'dominator8', 'muscle', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '230000', '130500'),
	('Double T', 'double', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"42000","amount":10}}', NULL, '42000', '85000', '37800'),
	('Dubsta', 'dubsta', 'suvs', 'vehicles', '{"vehicles1":{"price":"67550","amount":10}}', NULL, '67550', '50000', '60795'),
	('Dubsta Luxuary', 'dubsta2', 'suvs', 'vehicles', '{"vehicles1":{"price":"90000","amount":10}}', NULL, '90000', '80000', '81000'),
	('Dubsta 6x6', 'dubsta3', 'offroads', 'vehicles', '{"vehicles1":{"price":"180000","amount":10}}', NULL, '180000', '200000', '162000'),
	('Dukes', 'dukes', 'muscle', 'vehicles', '{"vehicles1":{"price":"42000","amount":10}}', NULL, '42000', '57000', '37800'),
	('Dynasty', 'dynasty', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '120000', '74250'),
	('Elegy', 'elegy2', 'sports', 'vehicles', '{"vehicles1":{"price":"57750","amount":10}}', NULL, '57750', '280000', '51975'),
	('Emerus', 'emerus', 'super', 'vehicles', '{"vehicles1":{"price":"435620","amount":10}}', NULL, '435620', '750000', '392058'),
	('Emperor', 'emperor', 'sedans', 'vehicles', '{"vehicles1":{"price":"12750","amount":10}}', NULL, '12750', '35000', '11475'),
	('Enduro', 'enduro', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"8250","amount":10}}', NULL, '8250', '60000', '7425'),
	('Entity XF', 'entityxf', 'super', 'vehicles', '{"vehicles1":{"price":"637500","amount":10}}', NULL, '637500', '600000', '573750'),
	('Esskey', 'esskey', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"6300","amount":10}}', NULL, '6300', '40000', '4000'),
	('Euros', 'euros', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '180000', '130500'),
	('Everon', 'everon', 'offroads', 'vehicles', '{"vehicles1":{"price":"518000","amount":10}}', NULL, '518000', '95000', '466200'),
	('Exemplar', 'exemplar', 'coupes', 'vehicles', '{"vehicles1":{"price":"48000","amount":10}}', NULL, '48000', '70000', '43200'),
	('F620', 'f620', 'coupes', 'vehicles', '{"vehicles1":{"price":"60000","amount":10}}', NULL, '60000', '43000', '54000'),
	('Faction', 'faction', 'muscle', 'vehicles', '{"vehicles1":{"price":"30000","amount":10}}', NULL, '30000', '50000', '27000'),
	('Faction Rider', 'faction2', 'muscle', 'vehicles', '{"vehicles1":{"price":"45000","amount":10}}', NULL, '45000', '80000', '40500'),
	('Faction XL', 'faction3', 'muscle', 'vehicles', '{"vehicles1":{"price":"60000","amount":10}}', NULL, '60000', '90000', '54000'),
	('Faggio', 'faggio', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"2850","amount":10}}', NULL, '2850', '5850', '8000'),
	('Vespa', 'faggio2', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"4200","amount":10}}', NULL, '4200', '6000', '8000'),
	('Felon', 'felon', 'coupes', 'vehicles', '{"vehicles1":{"price":"63000","amount":10}}', NULL, '63000', '45000', '56700'),
	('Felon GT', 'felon2', 'coupes', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '55000', '74250'),
	('Feltzer', 'feltzer2', 'sports', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '70000', '74250'),
	('Feltzer 3', 'feltzer3', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"91500","amount":10}}', NULL, '91500', '140000', '82350'),
	('Furia', 'furia', 'super', 'vehicles', '{"vehicles1":{"price":"487500","amount":10}}', NULL, '487500', '900000', '438750'),
	('Fixter', 'fixter', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"338","amount":10}}', NULL, '338', '500', '3000'),
	('Phantom', 'fq2', 'suvs', 'vehicles', '{"vehicles1":{"price":"25500","amount":10}}', NULL, '25500', '60000', '22950'),
	('Frogger', 'frogger', 'helicopter', 'air', '{"air1":{"price":"1800000","amount":10}}', NULL, '1800000', '1820000', '1620000'),
	('Fugitive', 'fugitive', 'sedans', 'vehicles', '{"vehicles1":{"price":"18000","amount":10}}', NULL, '18000', '65000', '16200'),
	('Furore GT', 'furoregt', 'sports', 'vehicles', '{"vehicles1":{"price":"67500","amount":10}}', NULL, '67500', '220000', '60750'),
	('Fusilade', 'fusilade', 'sports', 'vehicles', '{"vehicles1":{"price":"60000","amount":10}}', NULL, '60000', '85000', '54000'),
	('Futo GTX', 'futo2', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '115000', '130500'),
	('Gargoyle', 'gargoyle', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"24750","amount":10}}', NULL, '24750', '29750', '75000'),
	('Gauntlet', 'gauntlet', 'muscle', 'vehicles', '{"vehicles1":{"price":"45000","amount":10}}', NULL, '45000', '40000', '40500'),
	('Gang Burrito', 'gburrito', 'vans', 'vehicles', '{"vehicles1":{"price":"67500","amount":10}}', NULL, '67500', '40000', '60750'),
	('Burrito', 'gburrito2', 'vans', 'vehicles', '{"vehicles1":{"price":"43500","amount":10}}', NULL, '43500', '38000', '39150'),
	('Glendale', 'glendale', 'sedans', 'vehicles', '{"vehicles1":{"price":"9750","amount":10}}', NULL, '9750', '90000', '8775'),
	('Granger', 'granger', 'suvs', 'vehicles', '{"vehicles1":{"price":"75000","amount":10}}', NULL, '75000', '25000', '67500'),
	('Gresley', 'gresley', 'suvs', 'vehicles', '{"vehicles1":{"price":"71250","amount":10}}', NULL, '71250', '28000', '64125'),
	('Comet RTT2', 'growler', 'sports', 'vehicles', '{"vehicles1":{"price":"345000","amount":10}}', NULL, '345000', '530000', '310500'),
	('GT 500', 'gt500', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"117750","amount":10}}', NULL, '117750', '150000', '105975'),
	('Guardian', 'guardian', 'offroads', 'vehicles', '{"vehicles1":{"price":"367500","amount":10}}', NULL, '367500', '90000', '330750'),
	('Hakuchou', 'hakuchou', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"46500","amount":10}}', NULL, '46500', '51500', '50000'),
	('Hakuchou Sport', 'hakuchou2', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '87500', '65000'),
	('Havok', 'havok', 'helicopter', 'air', '{"air1":{"price":"1250000","amount":10}}', NULL, '1250000', '1265000', '1125000'),
	('Hermes', 'hermes', 'muscle', 'vehicles', '{"vehicles1":{"price":"802500","amount":10}}', NULL, '802500', '700000', '722250'),
	('Hexer', 'hexer', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"18000","amount":10}}', NULL, '18000', '22000', '25000'),
	('Hotknife', 'hotknife', 'muscle', 'vehicles', '{"vehicles1":{"price":"187500","amount":10}}', NULL, '187500', '500000', '168750'),
	('Howard NX25', 'howard', 'planes', 'air', '{"air1":{"price":"1975000","amount":10}}', NULL, '1975000', '0', '1777500'),
	('Huntley S', 'huntley', 'suvs', 'vehicles', '{"vehicles1":{"price":"60250","amount":10}}', NULL, '60250', '48000', '54225'),
	('Hustler', 'hustler', 'muscle', 'vehicles', '{"vehicles1":{"price":"937500","amount":10}}', NULL, '937500', '500000', '843750'),
	('Imorgon', 'imorgon', 'sports', 'vehicles', '{"vehicles1":{"price":"94000","amount":10}}', NULL, '94000', '700000', '84600'),
	('Infernus', 'infernus', 'super', 'vehicles', '{"vehicles1":{"price":"356890","amount":10}}', NULL, '356890', '380000', '321201'),
	('Innovation', 'innovation', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"35250","amount":10}}', NULL, '35250', '40250', '40000'),
	('Intruder', 'intruder', 'sedans', 'vehicles', '{"vehicles1":{"price":"11250","amount":10}}', NULL, '11250', '29000', '10125'),
	('Issi', 'issi2', 'compacts', 'vehicles', '{"vehicles1":{"price":"15000","amount":10}}', NULL, '15000', '20000', '13500'),
	('Jackal', 'jackal', 'coupes', 'vehicles', '{"vehicles1":{"price":"57000","amount":10}}', NULL, '57000', '34000', '51300'),
	('JB7002', 'jb7002', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '100000', '74250'),
	('Jester', 'jester', 'sports', 'vehicles', '{"vehicles1":{"price":"94500","amount":10}}', NULL, '94500', '250000', '85050'),
	('Jester Racecar', 'jester2', 'sports', 'vehicles', '{"vehicles1":{"price":"202500","amount":10}}', NULL, '202500', '270000', '182250'),
	('Jester RR', 'jester4', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '340000', '130500'),
	('Jetmax', 'jetmax', 'boats', 'water', '{"water1":{"price":"60000","amount":10}}', NULL, '60000', '65000', '54000'),
	('Journey', 'journey', 'vans', 'vehicles', '{"vehicles1":{"price":"10750","amount":10}}', NULL, '10750', '15000', '9675'),
	('Jugular', 'jugular', 'sports', 'vehicles', '{"vehicles1":{"price":"94000","amount":10}}', NULL, '94000', '470000', '84600'),
	('Kamacho', 'kamacho', 'offroads', 'vehicles', '{"vehicles1":{"price":"23500","amount":10}}', NULL, '23500', '80000', '21150'),
	('Khamelion', 'khamelion', 'sports', 'vehicles', '{"vehicles1":{"price":"57000","amount":10}}', NULL, '57000', '200000', '51300'),
	('Komoda', 'komoda', 'sports', 'vehicles', '{"vehicles1":{"price":"94000","amount":10}}', NULL, '94000', '320000', '84600'),
	('Krieger', 'krieger', 'super', 'vehicles', '{"vehicles1":{"price":"532278","amount":10}}', NULL, '532278', '980000', '479050'),
	('Kuruma', 'kuruma', 'sports', 'vehicles', '{"vehicles1":{"price":"45000","amount":10}}', NULL, '45000', '170000', '40500'),
	('Landstalker', 'landstalker', 'suvs', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '20000', '47250'),
	('Locust', 'locust', 'sports', 'vehicles', '{"vehicles1":{"price":"90000","amount":10}}', NULL, '90000', '660000', '81000'),
	('Luxor', 'luxor', 'planes', 'air', '{"air1":{"price":"2500000","amount":10}}', NULL, '2500000', '2520000', '2250000'),
	('Luxor Deluxe', 'luxor2', 'planes', 'air', '{"air1":{"price":"4750000","amount":10}}', NULL, '4750000', '4800000', '4275000'),
	('Lynx', 'lynx', 'sports', 'vehicles', '{"vehicles1":{"price":"60000","amount":10}}', NULL, '60000', '90000', '54000'),
	('Mamba', 'mamba', 'sports', 'vehicles', '{"vehicles1":{"price":"105000","amount":10}}', NULL, '105000', '190000', '94500'),
	('Mammatus', 'mammatus', 'planes', 'air', '{"air1":{"price":"1300000","amount":10}}', NULL, '1300000', '1320000', '1170000'),
	('Manana', 'manana', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"19260","amount":10}}', NULL, '19260', '65000', '17334'),
	('Manchez', 'manchez', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"7950","amount":10}}', NULL, '7950', '10000', '65000'),
	('Marquis', 'marquis', 'boats', 'water', '{"water1":{"price":"85000","amount":10}}', NULL, '85000', '98000', '76500'),
	('Massacro', 'massacro', 'sports', 'vehicles', '{"vehicles1":{"price":"94500","amount":10}}', NULL, '94500', '280000', '85050'),
	('Massacro Racecar', 'massacro2', 'sports', 'vehicles', '{"vehicles1":{"price":"195000","amount":10}}', NULL, '195000', '310000', '175500'),
	('Marverick', 'maverick', 'helicopter', 'air', '{"air1":{"price":"1750000","amount":10}}', NULL, '1750000', '1765000', '1575000'),
	('Mesa', 'mesa', 'suvs', 'vehicles', '{"vehicles1":{"price":"24500","amount":10}}', NULL, '24500', '24000', '22050'),
	('Mesa Trail', 'mesa3', 'suvs', 'vehicles', '{"vehicles1":{"price":"60500","amount":10}}', NULL, '60500', '30000', '54450'),
	('Ultra Light', 'microlight', 'planes', 'air', '{"air1":{"price":"150000","amount":10}}', NULL, '150000', '160000', '135000'),
	('Minivan', 'minivan', 'vans', 'vehicles', '{"vehicles1":{"price":"19500","amount":10}}', NULL, '19500', '20000', '17550'),
	('Moonbeam Rider', 'moonbeam', 'vans', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '35000', '47250'),
	('Moonbeam Rider', 'moonbeam2', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '52500', '70000', '47250'),
	('Mule', 'mule', 'box', 'truck', '{"truck1":{"price":"400000","amount":10}}', NULL, '390000', '410000', '351000'),
	('Nebula', 'nebula', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"82750","amount":10}}', NULL, '82750', '40000', '74475'),
	('Nemesis', 'nemesis', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"8700","amount":10}}', NULL, '8700', '10000', '20000'),
	('Neo', 'neo', 'sports', 'vehicles', '{"vehicles1":{"price":"98000","amount":10}}', NULL, '98000', '650000', '88200'),
	('Neon', 'neon', 'sports', 'vehicles', '{"vehicles1":{"price":"237500","amount":10}}', NULL, '237500', '420000', '213750'),
	('Nightblade', 'nightblade', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '57500', '80000'),
	('Nightshade', 'nightshade', 'muscle', 'vehicles', '{"vehicles1":{"price":"97500","amount":10}}', NULL, '97500', '150000', '87750'),
	('Nimbus', 'nimbus', 'planes', 'air', '{"air1":{"price":"1900000","amount":10}}', NULL, '1900000', '1915000', '1710000'),
	('9F', 'ninef', 'sports', 'vehicles', '{"vehicles1":{"price":"90000","amount":10}}', NULL, '90000', '250000', '81000'),
	('9F Cabrio', 'ninef2', 'sports', 'vehicles', '{"vehicles1":{"price":"120000","amount":10}}', NULL, '120000', '260000', '108000'),
	('Omnis', 'omnis', 'sports', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '300000', '47250'),
	('Oracle XS', 'oracle2', 'coupes', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '20000', '47250'),
	('Osiris', 'osiris', 'super', 'vehicles', '{"vehicles1":{"price":"240000","amount":10}}', NULL, '240000', '950000', '216000'),
	('Panto', 'panto', 'compacts', 'vehicles', '{"vehicles1":{"price":"15000","amount":10}}', NULL, '15000', '20000', '13500'),
	('Paradise', 'paradise', 'vans', 'vehicles', '{"vehicles1":{"price":"28500","amount":10}}', NULL, '28500', '26000', '25650'),
	('Paragon', 'paragon', 'sports', 'vehicles', '{"vehicles1":{"price":"100000","amount":10}}', NULL, '100000', '700000', '90000'),
	('Pariah', 'pariah', 'sports', 'vehicles', '{"vehicles1":{"price":"213000","amount":10}}', NULL, '213000', '400000', '191700'),
	('Patriot', 'patriot', 'suvs', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '22000', '74250'),
	('PCJ 600', 'pcj', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"9300","amount":10}}', NULL, '9300', '11500', '25000'),
	('Penumbra', 'penumbra', 'sports', 'vehicles', '{"vehicles1":{"price":"42000","amount":10}}', NULL, '42000', '120000', '37800'),
	('Pfister 811', 'pfister811', 'super', 'vehicles', '{"vehicles1":{"price":"127530","amount":10}}', NULL, '127530', '550000', '114777'),
	('Phoenix', 'phoenix', 'muscle', 'vehicles', '{"vehicles1":{"price":"18750","amount":10}}', NULL, '18750', '60000', '16875'),
	('Picador', 'picador', 'muscle', 'vehicles', '{"vehicles1":{"price":"27500","amount":10}}', NULL, '27500', '40000', '24750'),
	('Pigalle', 'pigalle', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"30000","amount":10}}', NULL, '30000', '35000', '27000'),
	('Pounder', 'pounder', 'box', 'truck', '{"truck1":{"price":"550000","amount":10}}', NULL, '540000', '560000', '486000'),
	('Prairie', 'prairie', 'compacts', 'vehicles', '{"vehicles1":{"price":"18000","amount":10}}', NULL, '18000', '60000', '16200'),
	('Premier', 'premier', 'sedans', 'vehicles', '{"vehicles1":{"price":"12000","amount":10}}', NULL, '12000', '38000', '10800'),
	('Previon', 'previon', 'coupes', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '100000', '130500'),
	('Radius', 'radi', 'suvs', 'vehicles', '{"vehicles1":{"price":"43500","amount":10}}', NULL, '43500', '18000', '39150'),
	('Raiden', 'raiden', 'sports', 'vehicles', '{"vehicles1":{"price":"206250","amount":10}}', NULL, '206250', '240000', '185625'),
	('Rapid GT', 'rapidgt', 'sports', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '280000', '47250'),
	('Rapid GT Convertible', 'rapidgt2', 'sports', 'vehicles', '{"vehicles1":{"price":"67500","amount":10}}', NULL, '67500', '290000', '60750'),
	('Rapid GT3', 'rapidgt3', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"132750","amount":10}}', NULL, '132750', '130000', '119475'),
	('Rebel', 'rebel2', 'offroads', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '40000', '47250'),
	('Rebla', 'rebla', 'suvs', 'vehicles', '{"vehicles1":{"price":"52000","amount":10}}', NULL, '52000', '75000', '46800'),
	('Regina', 'regina', 'sedans', 'vehicles', '{"vehicles1":{"price":"7500","amount":10}}', NULL, '7500', '20000', '6750'),
	('Remus', 'remus', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '330000', '130500'),
	('Retinue', 'retinue', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"92250","amount":10}}', NULL, '92250', '90000', '83025'),
	('Revolter', 'revolter', 'sports', 'vehicles', '{"vehicles1":{"price":"415000","amount":10}}', NULL, '415000', '435000', '373500'),
	('Riata', 'riata', 'offroads', 'vehicles', '{"vehicles1":{"price":"570000","amount":10}}', NULL, '570000', '65000', '513000'),
	('Rocoto', 'rocoto', 'suvs', 'vehicles', '{"vehicles1":{"price":"67250","amount":10}}', NULL, '67250', '34000', '60525'),
	('Rogue', 'rogue', 'planes', 'air', '{"air1":{"price":"2000000","amount":10}}', NULL, '2000000', '2020000', '1800000'),
	('RT3000', 'rt3000', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '310000', '130500'),
	('Ruffian', 'ruffian', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"10200","amount":10}}', NULL, '10200', '15200', '25000'),
	('Rumpo', 'rumpo', 'vans', 'vehicles', '{"vehicles1":{"price":"22500","amount":10}}', NULL, '22500', '40000', '20250'),
	('Rumpo Trail', 'rumpo3', 'vans', 'vehicles', '{"vehicles1":{"price":"29250","amount":10}}', NULL, '29250', '40000', '26325'),
	('Sabre Turbo', 'sabregt', 'muscle', 'vehicles', '{"vehicles1":{"price":"30000","amount":10}}', NULL, '30000', '20000', '27000'),
	('Sabre GT', 'sabregt2', 'muscle', 'vehicles', '{"vehicles1":{"price":"37500","amount":10}}', NULL, '37500', '60000', '33750'),
	('Sanchez', 'sanchez', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"7950","amount":10}}', NULL, '7950', '10000', '20000'),
	('Sanchez Sport', 'sanchez2', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"7950","amount":10}}', NULL, '7950', '10000', '25000'),
	('Sanctus', 'sanctus', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"37500","amount":10}}', NULL, '37500', '42500', '8000'),
	('Sandking', 'sandking', 'offroads', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '38000', '74250'),
	('Savestra', 'savestra', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"148500","amount":10}}', NULL, '148500', '95000', '133650'),
	('SC 1', 'sc1', 'super', 'vehicles', '{"vehicles1":{"price":"240450","amount":10}}', NULL, '240450', '270000', '216405'),
	('Schafter', 'schafter2', 'sedans', 'vehicles', '{"vehicles1":{"price":"56250","amount":10}}', NULL, '56250', '110000', '50625'),
	('Schafter V12', 'schafter3', 'sports', 'vehicles', '{"vehicles1":{"price":"75000","amount":10}}', NULL, '75000', '150000', '67500'),
	('Scorcher', 'scorcher', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"420","amount":10}}', NULL, '420', '800', '3000'),
	('Sea Breeze', 'seabreeze', 'planes', 'air', '{"air1":{"price":"1850000","amount":10}}', NULL, '1850000', '1870000', '1665000'),
	('Jetski', 'seashark', 'boats', 'water', '{"water1":{"price":"30000","amount":10}}', NULL, '30000', '35000', '27000'),
	('Jetski S3', 'seashark3', 'boats', 'water', '{"water1":{"price":"30000","amount":10}}', NULL, '30000', '35000', '27000'),
	('Sea Sparrow', 'seasparrow', 'helicopter', 'air', '{"air1":{"price":"1815000","amount":10}}', NULL, '1815000', '1830000', '1633500'),
	('Seminole', 'seminole', 'suvs', 'vehicles', '{"vehicles1":{"price":"56250","amount":10}}', NULL, '56250', '23000', '50625'),
	('Sentinel', 'sentinel', 'coupes', 'vehicles', '{"vehicles1":{"price":"48000","amount":10}}', NULL, '48000', '50000', '43200'),
	('Sentinel XS', 'sentinel2', 'coupes', 'vehicles', '{"vehicles1":{"price":"60000","amount":10}}', NULL, '60000', '62000', '54000'),
	('Sentinel 3', 'sentinel3', 'sports', 'vehicles', '{"vehicles1":{"price":"75000","amount":10}}', NULL, '75000', '200000', '67500'),
	('Seven 70', 'seven70', 'sports', 'vehicles', '{"vehicles1":{"price":"59250","amount":10}}', NULL, '59250', '425000', '53325'),
	('Shamal', 'shamal', 'planes', 'air', '{"air1":{"price":"2150000","amount":10}}', NULL, '2150000', '2165000', '1935000'),
	('Sovereign', 'sovereign', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"33000","amount":10}}', NULL, '33000', '38000', '35000'),
	('Speeder', 'speeder', 'boats', 'water', '{"water1":{"price":"70000","amount":10}}', NULL, '70000', '75000', '63000'),
	('Stinger', 'stinger', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"120000","amount":10}}', NULL, '120000', '140000', '108000'),
	('Stinger GT', 'stingergt', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"112500","amount":10}}', NULL, '112500', '195000', '101250'),
	('Streiter', 'streiter', 'sports', 'vehicles', '{"vehicles1":{"price":"75000","amount":10}}', NULL, '75000', '180000', '67500'),
	('Stretch', 'stretch', 'sedans', 'vehicles', '{"vehicles1":{"price":"135000","amount":10}}', NULL, '135000', '300000', '121500'),
	('Mallard', 'stunt', 'planes', 'air', '{"air1":{"price":"1250000","amount":10}}', NULL, '1250000', '1260000', '1125000'),
	('U-Boot', 'submersible', 'submarine', 'water', '{"water1":{"price":"590000","amount":10}}', NULL, '590000', '600000', '531000'),
	('Kraken', 'submersible2', 'submarine', 'water', '{"water1":{"price":"610000","amount":10}}', NULL, '610000', '625000', '549000'),
	('Sultan', 'sultan', 'sports', 'vehicles', '{"vehicles1":{"price":"22500","amount":10}}', NULL, '22500', '210000', '20250'),
	('Sultan-Classic', 'sultan2', 'sports', 'vehicles', '{"vehicles1":{"price":"90000","amount":10}}', NULL, '90000', '310000', '81000'),
	('Sultan RS Classic', 'sultan3', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '390000', '130500'),
	('Sultan RS', 'sultanrs', 'super', 'vehicles', '{"vehicles1":{"price":"93500","amount":10}}', NULL, '93500', '320000', '84150'),
	('Suntrap', 'suntrap', 'boats', 'water', '{"water1":{"price":"64000","amount":10}}', NULL, '64000', '70000', '57600'),
	('Super Diamond', 'superd', 'sedans', 'vehicles', '{"vehicles1":{"price":"312000","amount":10}}', NULL, '312000', '190000', '280800'),
	('Supervolito', 'supervolito', 'helicopter', 'air', '{"air1":{"price":"2000000","amount":10}}', NULL, '2000000', '2020000', '1800000'),
	('Supervolito Carbon', 'supervolito2', 'helicopter', 'air', '{"air1":{"price":"2250000","amount":10}}', NULL, '2250000', '2270000', '2025000'),
	('Surano', 'surano', 'sports', 'vehicles', '{"vehicles1":{"price":"75000","amount":10}}', NULL, '75000', '230000', '67500'),
	('Surfer', 'surfer', 'vans', 'vehicles', '{"vehicles1":{"price":"18000","amount":10}}', NULL, '18000', '15000', '16200'),
	('Swift', 'swift', 'helicopter', 'air', '{"air1":{"price":"2000000","amount":10}}', NULL, '2000000', '2020000', '1800000'),
	('Swift Deluxe', 'swift2', 'helicopter', 'air', '{"air1":{"price":"4250000","amount":10}}', NULL, '4250000', '4280000', '3825000'),
	('T20', 't20', 'super', 'vehicles', '{"vehicles1":{"price":"450000","amount":10}}', NULL, '450000', '920000', '405000'),
	('Tailgater', 'tailgater', 'sedans', 'vehicles', '{"vehicles1":{"price":"45000","amount":10}}', NULL, '45000', '70000', '40500'),
	('Tailgater S', 'tailgater2', 'sedans', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '230000', '130500'),
	('Drift Tampa', 'tampa2', 'muscle', 'vehicles', '{"vehicles1":{"price":"120000","amount":10}}', NULL, '120000', '125000', '108000'),
	('Thrax', 'thrax', 'super', 'vehicles', '{"vehicles1":{"price":"420000","amount":10}}', NULL, '420000', '1700000', '378000'),
	('Thrust', 'thrust', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"36000","amount":10}}', NULL, '36000', '41000', '40000'),
	('Toro', 'toro', 'boats', 'water', '{"water1":{"price":"68000","amount":10}}', NULL, '68000', '73000', '61200'),
	('Toro Yacht', 'toro2', 'boats', 'water', '{"water1":{"price":"68000","amount":10}}', NULL, '68000', '73000', '61200'),
	('Tourbus', 'tourbus', 'trans', 'truck', '{"truck1":{"price":"350000","amount":10}}', NULL, '340000', '360000', '306000'),
	('Tribike', 'tribike3', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"780","amount":10}}', NULL, '780', '1000', '3000'),
	('Trophy Truck', 'trophytruck', 'offroads', 'vehicles', '{"vehicles1":{"price":"90000","amount":10}}', NULL, '90000', '60000', '81000'),
	('Trophy Truck Limited', 'trophytruck2', 'offroads', 'vehicles', '{"vehicles1":{"price":"120000","amount":10}}', NULL, '120000', '80000', '108000'),
	('Tropic', 'tropic', 'boats', 'water', '{"water1":{"price":"57000","amount":10}}', NULL, '57000', '60000', '51300'),
	('Tropic Yacht', 'tropic2', 'boats', 'water', '{"water1":{"price":"57000","amount":10}}', NULL, '57000', '60000', '51300'),
	('Tropos', 'tropos', 'sports', 'vehicles', '{"vehicles1":{"price":"60000","amount":10}}', NULL, '60000', '390000', '54000'),
	('Turismo 2', 'turismo2', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"50000","amount":10}}', NULL, '50000', '350000', '45000'),
	('Turismo R', 'turismor', 'super', 'vehicles', '{"vehicles1":{"price":"525000","amount":10}}', NULL, '525000', '600000', '472500'),
	('Vacca', 'vacca', 'super', 'vehicles', '{"vehicles1":{"price":"180000","amount":10}}', NULL, '180000', '460000', '162000'),
	('Vader', 'vader', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"10800","amount":10}}', NULL, '10800', '15800', '20000'),
	('Vectre', 'vectre', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '280000', '130500'),
	('Velum', 'velum2', 'planes', 'air', '{"air1":{"price":"1450000","amount":10}}', NULL, '1450000', '1465000', '1305000'),
	('Verlierer', 'verlierer2', 'sports', 'vehicles', '{"vehicles1":{"price":"105000","amount":10}}', NULL, '105000', '300000', '94500'),
	('Vestra', 'vestra', 'planes', 'air', '{"air1":{"price":"1950000","amount":10}}', NULL, '1950000', '1965000', '1755000'),
	('Virgo', 'virgo', 'muscle', 'vehicles', '{"vehicles1":{"price":"21000","amount":10}}', NULL, '21000', '40000', '18900'),
	('Viseris', 'viseris', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"131250","amount":10}}', NULL, '131250', '220000', '118125'),
	('Volatus', 'volatus', 'helicopter', 'air', '{"air1":{"price":"102500","amount":10}}', NULL, '1025000', '1040000', '922500'),
	('Voltic', 'voltic', 'super', 'vehicles', '{"vehicles1":{"price":"135000","amount":10}}', NULL, '135000', '220000', '121500'),
	('Voodoo', 'voodoo', 'muscle', 'vehicles', '{"vehicles1":{"price":"10800","amount":10}}', NULL, '10800', '50000', '9720'),
	('Vortex', 'vortex', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"14700","amount":10}}', NULL, '14700', '19700', '45000'),
	('Vstr', 'vstr', 'sports', 'vehicles', '{"vehicles1":{"price":"100000","amount":10}}', NULL, '100000', '370000', '90000'),
	('Warrener', 'warrener', 'sedans', 'vehicles', '{"vehicles1":{"price":"6000","amount":10}}', NULL, '6000', '85000', '5400'),
	('Warrener HKR', 'warrener2', 'sedans', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '120000', '130500'),
	('Washington', 'washington', 'sedans', 'vehicles', '{"vehicles1":{"price":"12000","amount":10}}', NULL, '12000', '23000', '10800'),
	('Windsor', 'windsor', 'coupes', 'vehicles', '{"vehicles1":{"price":"242500","amount":10}}', NULL, '242500', '200000', '218250'),
	('Windsor Cabrio', 'windsor2', 'coupes', 'vehicles', '{"vehicles1":{"price":"406250","amount":10}}', NULL, '406250', '250000', '365625'),
	('Wolfsbane', 'wolfsbane', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"12000","amount":10}}', NULL, '12000', '17000', '30000'),
	('XA21', 'xa21', 'super', 'vehicles', '{"vehicles1":{"price":"750000","amount":10}}', NULL, '750000', '1000000', '675000'),
	('XLS', 'xls', 'suvs', 'vehicles', '{"vehicles1":{"price":"48000","amount":10}}', NULL, '48000', '55000', '43200'),
	('Yosemite', 'yosemite', 'muscle', 'vehicles', '{"vehicles1":{"price":"727500","amount":10}}', NULL, '727500', '30000', '654750'),
	('Yosemite 2', 'yosemite2', 'muscle', 'vehicles', '{"vehicles1":{"price":"187000","amount":10}}', NULL, '187000', '60000', '168300'),
	('Youga', 'youga', 'vans', 'vehicles', '{"vehicles1":{"price":"16200","amount":10}}', NULL, '16200', '38000', '14580'),
	('Youga Luxuary', 'youga2', 'vans', 'vehicles', '{"vehicles1":{"price":"21750","amount":10}}', NULL, '21750', '44000', '19575'),
	('Z190', 'z190', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"120000","amount":10}}', NULL, '120000', '100000', '108000'),
	('Zentorno', 'zentorno', 'super', 'vehicles', '{"vehicles1":{"price":"220000","amount":10}}', NULL, '220000', '720000', '198000'),
	('Zion', 'zion', 'coupes', 'vehicles', '{"vehicles1":{"price":"54000","amount":10}}', NULL, '54000', '45000', '48600'),
	('Zion Cabrio', 'zion2', 'coupes', 'vehicles', '{"vehicles1":{"price":"67500","amount":10}}', NULL, '67500', '54000', '60750'),
	('Zion 3', 'zion3', 'sportsclassic', 'vehicles', '{"vehicles1":{"price":"82500","amount":10}}', NULL, '82500', '76000', '74250'),
	('Zombie', 'zombiea', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"14250","amount":10}}', NULL, '14250', '19250', '28000'),
	('Zombie Luxuary', 'zombieb', 'motorcycles', 'vehicles', '{"vehicles1":{"price":"18000","amount":10}}', NULL, '18000', '23000', '36000'),
	('Zorrusso', 'zorrusso', 'super', 'vehicles', '{"vehicles1":{"price":"487500","amount":10}}', NULL, '487500', '530000', '438750'),
	('ZR350', 'zr350', 'sports', 'vehicles', '{"vehicles1":{"price":"145000","amount":10}}', NULL, '145000', '290000', '130500'),
	('Elegy Retro', 'elegy', 'sports', 'vehicles', '{"vehicles1":{"price":"57750","amount":10}}', NULL, '57750', '350000', '51975'),
	('Tulip', 'tulip', 'muscle', 'vehicles', '{"vehicles1":{"price":"105000","amount":10}}', NULL, '105000', '60000', '94500'),
	('Vamos', 'vamos', 'muscle', 'vehicles', '{"vehicles1":{"price":"328500","amount":10}}', NULL, '328500', '80000', '295650'),
	('Virgo 2', 'virgo2', 'muscle', 'vehicles', '{"vehicles1":{"price":"21000","amount":10}}', NULL, '21000', '70000', '18900'),
	('Virgo 3', 'virgo3', 'muscle', 'vehicles', '{"vehicles1":{"price":"21000","amount":10}}', NULL, '21000', '60000', '18900'),
	('Peyote', 'peyote2', 'muscle', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '65000', '47250'),
	('Ratloader', 'ratloader', 'muscle', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '20000', '47250'),
	('Ratloader 2', 'ratloader2', 'muscle', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '50000', '47250'),
	('Ruiner', 'ruiner', 'muscle', 'vehicles', '{"vehicles1":{"price":"52500","amount":10}}', NULL, '52500', '35000', '47250'),
	('Slam Van', 'slamvan', 'muscle', 'vehicles', '{"vehicles1":{"price":"17250","amount":10}}', NULL, '17250', '40000', '15525'),
	('Slam Van 2', 'slamvan2', 'muscle', 'vehicles', '{"vehicles1":{"price":"17250","amount":10}}', NULL, '17250', '60000', '15525'),
	('Entity 2', 'entity2', 'super', 'vehicles', '{"vehicles1":{"price":"637500","amount":10}}', NULL, '637500', '830000', '573750'),
	('GP 1', 'gp1', 'super', 'vehicles', '{"vehicles1":{"price":"450000","amount":10}}', NULL, '450000', '480000', '405000'),
	('Italy GTB', 'italygtb', 'super', 'vehicles', '{"vehicles1":{"price":"450000","amount":10}}', NULL, '450000', '500000', '405000'),
	('Italy GTB 2', 'italygtb2', 'super', 'vehicles', '{"vehicles1":{"price":"450000","amount":10}}', NULL, '450000', '590000', '405000'),
	('Tempesta', 'Tempesta', 'super', 'vehicles', '{"vehicles1":{"price":"450000","amount":10}}', NULL, '450000', '800000', '405000'),
	('Camaro', 'camaroRB', 'dpls', 'dpls', '{"dpls":{"price":"1000","amount":10}}', NULL, '1000', '1000', '1000'),
	('Dodge Charger', 'polchar', 'dpls', 'dpls', '{"dpls":{"price":"1000","amount":10}}', NULL, '1000', '1000', '1000'),
	('Ford Raptor', 'polraptor', 'dpls', 'dpls', '{"dpls":{"price":"1000","amount":10}}', NULL, '1000', '1000', '1000'),
	('Chevrolet', 'poltah', 'dpls', 'dpls', '{"dpls":{"price":"1000","amount":10}}', NULL, '1000', '1000', '1000'),
	('Ford Taurus', 'poltaurus', 'dpls', 'dpls', '{"dpls":{"price":"1000","amount":10}}', NULL, '1000', '1000', '1000'),
	('Ford Crown Vic', 'polvic', 'dpls', 'dpls', '{"dpls":{"price":"1000","amount":10}}', NULL, '1000', '1000', '1000'),
	('Trator', 'tractor2', 'offroads', 'vehicles', NULL, NULL, '0', '7000', '7000'),
	('Coquette Descaracterizado', 'uccoquette', 'dpls', 'dpls', '{"dpls":{"price":"1000","amount":10}}', NULL, '1000', '1000', '1000');

-- Dumping structure for table legacy.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(60) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) NOT NULL,
  `x` varchar(20) NOT NULL DEFAULT '232.22',
  `y` varchar(20) NOT NULL DEFAULT '-800.74',
  `z` varchar(20) NOT NULL DEFAULT '30.52',
  `h` varchar(20) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT 0,
  `garage` varchar(20) NOT NULL DEFAULT 'A',
  `lockcheck` int(11) NOT NULL DEFAULT 1,
  `stored` int(11) NOT NULL DEFAULT 1,
  `finance` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.owned_vehicles: ~0 rows (approximately)
DELETE FROM `owned_vehicles`;

-- Dumping structure for table legacy.pawnshops
CREATE TABLE IF NOT EXISTS `pawnshops` (
  `shopdata` longtext DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table legacy.pawnshops: ~0 rows (approximately)
DELETE FROM `pawnshops`;

-- Dumping structure for table legacy.pedmanager
CREATE TABLE IF NOT EXISTS `pedmanager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `peds` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.pedmanager: ~0 rows (approximately)
DELETE FROM `pedmanager`;

-- Dumping structure for table legacy.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` varchar(12) NOT NULL,
  `receiver` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 0,
  `anon` int(1) NOT NULL DEFAULT 0,
  `sender_deleted` int(1) NOT NULL DEFAULT 0,
  `receiver_deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=latin1;

-- Dumping data for table legacy.phone_calls: ~0 rows (approximately)
DELETE FROM `phone_calls`;

-- Dumping structure for table legacy.phone_contacts
CREATE TABLE IF NOT EXISTS `phone_contacts` (
  `identifier` varchar(40) NOT NULL,
  `name` longtext NOT NULL,
  `number` longtext NOT NULL,
  `avatar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.phone_contacts: ~0 rows (approximately)
DELETE FROM `phone_contacts`;

-- Dumping structure for table legacy.phone_instas
CREATE TABLE IF NOT EXISTS `phone_instas` (
  `identifier` varchar(60) DEFAULT NULL,
  `author` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.phone_instas: ~0 rows (approximately)
DELETE FROM `phone_instas`;

-- Dumping structure for table legacy.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` longtext NOT NULL DEFAULT 'current_timestamp()',
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table legacy.phone_messages: 0 rows
DELETE FROM `phone_messages`;
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table legacy.phone_texts
CREATE TABLE IF NOT EXISTS `phone_texts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` varchar(12) NOT NULL DEFAULT '0',
  `receiver` varchar(12) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '0',
  `sent_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sender_read` int(1) NOT NULL DEFAULT 1,
  `sender_deleted` int(1) NOT NULL DEFAULT 0,
  `receiver_read` int(1) NOT NULL DEFAULT 0,
  `receiver_deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.phone_texts: ~0 rows (approximately)
DELETE FROM `phone_texts`;

-- Dumping structure for table legacy.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `author` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table legacy.phone_tweets: ~0 rows (approximately)
DELETE FROM `phone_tweets`;

-- Dumping structure for table legacy.phone_yp
CREATE TABLE IF NOT EXISTS `phone_yp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `advert` varchar(500) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.phone_yp: ~0 rows (approximately)
DELETE FROM `phone_yp`;

-- Dumping structure for table legacy.props_spawn
CREATE TABLE IF NOT EXISTS `props_spawn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prop` varchar(200) DEFAULT NULL,
  `pos_x` varchar(10) DEFAULT NULL,
  `pos_y` varchar(10) DEFAULT NULL,
  `pos_z` varchar(10) DEFAULT NULL,
  `heading` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `folder` varchar(50) DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.props_spawn: ~0 rows (approximately)
DELETE FROM `props_spawn`;

-- Dumping structure for table legacy.qs_ammo
CREATE TABLE IF NOT EXISTS `qs_ammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `ammo` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3638 DEFAULT CHARSET=latin1;

-- Dumping data for table legacy.qs_ammo: ~0 rows (approximately)
DELETE FROM `qs_ammo`;

-- Dumping structure for table legacy.qs_customshops
CREATE TABLE IF NOT EXISTS `qs_customshops` (
  `cid` varchar(50) DEFAULT NULL,
  `shopname` varchar(50) DEFAULT NULL,
  `shopdata` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table legacy.qs_customshops: ~0 rows (approximately)
DELETE FROM `qs_customshops`;

-- Dumping structure for table legacy.qs_glovebox
CREATE TABLE IF NOT EXISTS `qs_glovebox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- Dumping data for table legacy.qs_glovebox: ~0 rows (approximately)
DELETE FROM `qs_glovebox`;

-- Dumping structure for table legacy.qs_stash
CREATE TABLE IF NOT EXISTS `qs_stash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stash` (`stash`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- Dumping data for table legacy.qs_stash: ~0 rows (approximately)
DELETE FROM `qs_stash`;

-- Dumping structure for table legacy.qs_trunk
CREATE TABLE IF NOT EXISTS `qs_trunk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1199 DEFAULT CHARSET=latin1;

-- Dumping data for table legacy.qs_trunk: ~0 rows (approximately)
DELETE FROM `qs_trunk`;

-- Dumping structure for table legacy.radiocar_music
CREATE TABLE IF NOT EXISTS `radiocar_music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `url` varchar(256) NOT NULL,
  `plate` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.radiocar_music: ~0 rows (approximately)
DELETE FROM `radiocar_music`;

-- Dumping structure for table legacy.radiocar_owned
CREATE TABLE IF NOT EXISTS `radiocar_owned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spz` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.radiocar_owned: ~0 rows (approximately)
DELETE FROM `radiocar_owned`;

-- Dumping structure for table legacy.rd_animations_favourites
CREATE TABLE IF NOT EXISTS `rd_animations_favourites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `animation` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

-- Dumping data for table legacy.rd_animations_favourites: ~0 rows (approximately)
DELETE FROM `rd_animations_favourites`;

-- Dumping structure for table legacy.rd_animations_profiles
CREATE TABLE IF NOT EXISTS `rd_animations_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `sets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `walkstyle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `face` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- Dumping data for table legacy.rd_animations_profiles: ~0 rows (approximately)
DELETE FROM `rd_animations_profiles`;

-- Dumping structure for table legacy.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.society_moneywash: ~0 rows (approximately)
DELETE FROM `society_moneywash`;

-- Dumping structure for table legacy.tweets
CREATE TABLE IF NOT EXISTS `tweets` (
  `handle` longtext NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` longtext NOT NULL,
  `photo` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.tweets: ~0 rows (approximately)
DELETE FROM `tweets`;

-- Dumping structure for table legacy.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(60) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(16) NOT NULL DEFAULT '',
  `lastname` varchar(16) NOT NULL DEFAULT '',
  `dateofbirth` varchar(10) NOT NULL DEFAULT '',
  `sex` varchar(1) NOT NULL DEFAULT '',
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `iban` varchar(255) DEFAULT NULL,
  `pincode` int(50) DEFAULT NULL,
  `hotbar` longtext DEFAULT NULL,
  `phone_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `metadata` mediumtext DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.users: ~0 rows (approximately)
DELETE FROM `users`;

-- Dumping structure for table legacy.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.user_convictions: ~0 rows (approximately)
DELETE FROM `user_convictions`;

-- Dumping structure for table legacy.user_documents
CREATE TABLE IF NOT EXISTS `user_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(45) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.user_documents: ~0 rows (approximately)
DELETE FROM `user_documents`;

-- Dumping structure for table legacy.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.user_licenses: ~0 rows (approximately)
DELETE FROM `user_licenses`;

-- Dumping structure for table legacy.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.user_mdt: ~0 rows (approximately)
DELETE FROM `user_mdt`;

-- Dumping structure for table legacy.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.vehicles: ~240 rows (approximately)
DELETE FROM `vehicles`;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');

-- Dumping structure for table legacy.vehicle_parts
CREATE TABLE IF NOT EXISTS `vehicle_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(100) NOT NULL,
  `parts` longtext NOT NULL,
  `mileage` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.vehicle_parts: ~0 rows (approximately)
DELETE FROM `vehicle_parts`;

-- Dumping structure for table legacy.vipcars
CREATE TABLE IF NOT EXISTS `vipcars` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` varchar(50) NOT NULL,
  `CarLabel` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CarID` (`CarID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.vipcars: ~33 rows (approximately)
DELETE FROM `vipcars`;
INSERT INTO `vipcars` (`ID`, `CarID`, `CarLabel`) VALUES
	(1, 'rmodx6', 'BMW X6M'),
	(2, 'bmwg07', 'BMW X7'),
	(3, 'terzo', 'Lamborghini Terzo'),
	(4, 'urus', 'Lamborghini Urus'),
	(5, 'G63AMG6x6', 'Mercedes 6x6'),
	(6, '718gts', 'Porsche 718 GTS'),
	(7, 'AMGGT ', 'Mercedes AMG GT'),
	(8, 's1000rr', 'BMW S1000'),
	(9, 'zl12017', 'Chevrolet Camaro'),
	(10, 'PCS18', 'Porsche Cayenne'),
	(11, 'HCBR17', 'CBR1000'),
	(12, 'chiron', 'Bugatti Chiron'),
	(13, 'f8t', 'Ferrari F8 Tributo'),
	(14, 'G65', 'Mercedes G65'),
	(15, 'pgt3', 'Porsche GT3'),
	(16, 'amggt63s', 'Mercedes AMG GT Coupe'),
	(17, 'gtr', 'Nissan R35 GTR'),
	(18, 'm2f22 ', 'BMW M2'),
	(19, 'M4F82', 'BMW M4'),
	(20, 'BMWM8', 'BMW M8'),
	(21, 'P1', 'McLaren P1'),
	(22, 'PANAMERA17TURBO', 'Porsche Panamera'),
	(23, 'q8prior', 'Audi Q8'),
	(24, 'rmodsianr', 'Lamborghini Sian'),
	(25, 'Demonhawkk', 'Jeep Demonhawk'),
	(26, 'nissantitan17', 'Nissan Titan'),
	(27, 'Rmodmustang', 'Ford Mustang'),
	(28, '2ncsgt63s', 'Mercedes AMG C63S'),
	(29, 'r1250', 'BMW R1250'),
	(30, 'skyline', 'Nissan R34 Skyline'),
	(31, 'svj63 ', 'Lamborghini SVJ63'),
	(32, 'i8', 'BMW I8'),
	(33, 'nh2r', 'Ninja H2R');

-- Dumping structure for table legacy.weedplants
CREATE TABLE IF NOT EXISTS `weedplants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stage` int(3) unsigned NOT NULL DEFAULT 1,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `soil` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stage` (`stage`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table legacy.weedplants: ~0 rows (approximately)
DELETE FROM `weedplants`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
