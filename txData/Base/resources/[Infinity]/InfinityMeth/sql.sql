/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for essentialmode
CREATE DATABASE IF NOT EXISTS `essentialmode` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('acetone', 'Acetona', 5, 0, 1),
	('methlab', 'Kit de Meth Portátil', 1, 0, 1),
	('meth', 'metanfetamína', 30, 0, 1),
	('fishingknife', 'Faca Utilitária', 1, 0, 1),
	('dopebag', 'Sacos de Embalar (50x)', 5, 0, 1),
	('bagofmeth', 'Sacos de Meth (2g)', 2, 0, 1),
	('lithium', 'Bateria de Litio', 10, 0, 1);
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;