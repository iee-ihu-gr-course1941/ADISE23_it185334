-- --------------------------------------------------------
-- Διακομιστής:                  127.0.0.1
-- Έκδοση διακομιστή:            10.4.28-MariaDB - mariadb.org binary distribution
-- Λειτ. σύστημα διακομιστή:     Win64
-- HeidiSQL Έκδοση:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for πίνακας naval_battle.board
CREATE TABLE IF NOT EXISTS `board` (
  `x_data` tinyint(1) NOT NULL,
  `y_data` tinyint(1) NOT NULL,
  `ship` varchar(50) NOT NULL DEFAULT '',
  `class` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`x_data`,`y_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table naval_battle.board: ~100 rows (approximately)
INSERT INTO `board` (`x_data`, `y_data`, `ship`, `class`) VALUES
	(1, 1, '', NULL),
	(1, 2, '', NULL),
	(1, 3, '', NULL),
	(1, 4, '', NULL),
	(1, 5, '', NULL),
	(1, 6, '', NULL),
	(1, 7, '', NULL),
	(1, 8, '', NULL),
	(1, 9, '', NULL),
	(1, 10, '', NULL),
	(2, 1, '', NULL),
	(2, 2, '', NULL),
	(2, 3, '', NULL),
	(2, 4, '', NULL),
	(2, 5, '', NULL),
	(2, 6, '', NULL),
	(2, 7, '', NULL),
	(2, 8, '', NULL),
	(2, 9, '', NULL),
	(2, 10, '', NULL),
	(3, 1, '', NULL),
	(3, 2, '', NULL),
	(3, 3, '', NULL),
	(3, 4, '', NULL),
	(3, 5, '', NULL),
	(3, 6, '', NULL),
	(3, 7, '', NULL),
	(3, 8, '', NULL),
	(3, 9, '', NULL),
	(3, 10, '', NULL),
	(4, 1, '', NULL),
	(4, 2, '', NULL),
	(4, 3, '', NULL),
	(4, 4, '', NULL),
	(4, 5, '', NULL),
	(4, 6, '', NULL),
	(4, 7, '', NULL),
	(4, 8, '', NULL),
	(4, 9, '', NULL),
	(4, 10, '', NULL),
	(5, 1, '', NULL),
	(5, 2, '', NULL),
	(5, 3, '', NULL),
	(5, 4, '', NULL),
	(5, 5, '', NULL),
	(5, 6, '', NULL),
	(5, 7, '', NULL),
	(5, 8, '', NULL),
	(5, 9, '', NULL),
	(5, 10, '', NULL),
	(6, 1, '', NULL),
	(6, 2, '', NULL),
	(6, 3, '', NULL),
	(6, 4, '', NULL),
	(6, 5, '', NULL),
	(6, 6, '', NULL),
	(6, 7, '', NULL),
	(6, 8, '', NULL),
	(6, 9, '', NULL),
	(6, 10, '', NULL),
	(7, 1, '', NULL),
	(7, 2, '', NULL),
	(7, 3, '', NULL),
	(7, 4, '', NULL),
	(7, 5, '', NULL),
	(7, 6, '', NULL),
	(7, 7, '', NULL),
	(7, 8, '', NULL),
	(7, 9, '', NULL),
	(7, 10, '', NULL),
	(8, 1, '', NULL),
	(8, 2, '', NULL),
	(8, 3, '', NULL),
	(8, 4, '', NULL),
	(8, 5, '', NULL),
	(8, 6, '', NULL),
	(8, 7, '', NULL),
	(8, 8, '', NULL),
	(8, 9, '', NULL),
	(8, 10, '', NULL),
	(9, 1, '', NULL),
	(9, 2, '', NULL),
	(9, 3, '', NULL),
	(9, 4, '', NULL),
	(9, 5, '', NULL),
	(9, 6, '', NULL),
	(9, 7, '', NULL),
	(9, 8, '', NULL),
	(9, 9, '', NULL),
	(9, 10, '', NULL),
	(10, 1, '', NULL),
	(10, 2, '', NULL),
	(10, 3, '', NULL),
	(10, 4, '', NULL),
	(10, 5, '', NULL),
	(10, 6, '', NULL),
	(10, 7, '', NULL),
	(10, 8, '', NULL),
	(10, 9, '', NULL),
	(10, 10, '', NULL);

-- Dumping structure for πίνακας naval_battle.board_empty
CREATE TABLE IF NOT EXISTS `board_empty` (
  `x_data` tinyint(1) NOT NULL,
  `y_data` tinyint(1) NOT NULL,
  `ship` varchar(50) NOT NULL DEFAULT '',
  `class` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`x_data`,`y_data`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table naval_battle.board_empty: ~100 rows (approximately)
INSERT INTO `board_empty` (`x_data`, `y_data`, `ship`, `class`) VALUES
	(1, 1, '', NULL),
	(1, 2, '', NULL),
	(1, 3, '', NULL),
	(1, 4, '', NULL),
	(1, 5, '', NULL),
	(1, 6, '', NULL),
	(1, 7, '', NULL),
	(1, 8, '', NULL),
	(1, 9, '', NULL),
	(1, 10, '', NULL),
	(2, 1, '', NULL),
	(2, 2, '', NULL),
	(2, 3, '', NULL),
	(2, 4, '', NULL),
	(2, 5, '', NULL),
	(2, 6, '', NULL),
	(2, 7, '', NULL),
	(2, 8, '', NULL),
	(2, 9, '', NULL),
	(2, 10, '', NULL),
	(3, 1, '', NULL),
	(3, 2, '', NULL),
	(3, 3, '', NULL),
	(3, 4, '', NULL),
	(3, 5, '', NULL),
	(3, 6, '', NULL),
	(3, 7, '', NULL),
	(3, 8, '', NULL),
	(3, 9, '', NULL),
	(3, 10, '', NULL),
	(4, 1, '', NULL),
	(4, 2, '', NULL),
	(4, 3, '', NULL),
	(4, 4, '', NULL),
	(4, 5, '', NULL),
	(4, 6, '', NULL),
	(4, 7, '', NULL),
	(4, 8, '', NULL),
	(4, 9, '', NULL),
	(4, 10, '', NULL),
	(5, 1, '', NULL),
	(5, 2, '', NULL),
	(5, 3, '', NULL),
	(5, 4, '', NULL),
	(5, 5, '', NULL),
	(5, 6, '', NULL),
	(5, 7, '', NULL),
	(5, 8, '', NULL),
	(5, 9, '', NULL),
	(5, 10, '', NULL),
	(6, 1, '', NULL),
	(6, 2, '', NULL),
	(6, 3, '', NULL),
	(6, 4, '', NULL),
	(6, 5, '', NULL),
	(6, 6, '', NULL),
	(6, 7, '', NULL),
	(6, 8, '', NULL),
	(6, 9, '', NULL),
	(6, 10, '', NULL),
	(7, 1, '', NULL),
	(7, 2, '', NULL),
	(7, 3, '', NULL),
	(7, 4, '', NULL),
	(7, 5, '', NULL),
	(7, 6, '', NULL),
	(7, 7, '', NULL),
	(7, 8, '', NULL),
	(7, 9, '', NULL),
	(7, 10, '', NULL),
	(8, 1, '', NULL),
	(8, 2, '', NULL),
	(8, 3, '', NULL),
	(8, 4, '', NULL),
	(8, 5, '', NULL),
	(8, 6, '', NULL),
	(8, 7, '', NULL),
	(8, 8, '', NULL),
	(8, 9, '', NULL),
	(8, 10, '', NULL),
	(9, 1, '', NULL),
	(9, 2, '', NULL),
	(9, 3, '', NULL),
	(9, 4, '', NULL),
	(9, 5, '', NULL),
	(9, 6, '', NULL),
	(9, 7, '', NULL),
	(9, 8, '', NULL),
	(9, 9, '', NULL),
	(9, 10, '', NULL),
	(10, 1, '', NULL),
	(10, 2, '', NULL),
	(10, 3, '', NULL),
	(10, 4, '', NULL),
	(10, 5, '', NULL),
	(10, 6, '', NULL),
	(10, 7, '', NULL),
	(10, 8, '', NULL),
	(10, 9, '', NULL),
	(10, 10, '', NULL);

-- Dumping structure for procedure naval_battle.clean_board
DELIMITER //
CREATE PROCEDURE `clean_board`()
BEGIN
REPLACE INTO board SELECT * FROM board_empty;
END//
DELIMITER ;

-- Dumping structure for πίνακας naval_battle.game_status
CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('1','2') DEFAULT NULL,
  `result` enum('1','2') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table naval_battle.game_status: ~0 rows (approximately)
INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
	('not active', NULL, NULL, '2023-11-16 12:14:14');

-- Dumping structure for πίνακας naval_battle.players
CREATE TABLE IF NOT EXISTS `players` (
  `username` varchar(20) DEFAULT NULL,
  `player_num` enum('1','2') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`player_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table naval_battle.players: ~2 rows (approximately)
INSERT INTO `players` (`username`, `player_num`, `token`, `last_action`) VALUES
	(NULL, '1', NULL, NULL),
	(NULL, '2', NULL, NULL);

-- Dumping structure for πίνακας naval_battle.ships_p1
CREATE TABLE IF NOT EXISTS `ships_p1` (
  `typeofship` varchar(20) NOT NULL,
  `player_num` enum('1','2') NOT NULL,
  `lenght` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeofship`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table naval_battle.ships_p1: ~4 rows (approximately)
INSERT INTO `ships_p1` (`typeofship`, `player_num`, `lenght`) VALUES
	('air_carrier', '1', 4),
	('f_vessel', '1', 2),
	('pass_ship', '1', 5),
	('submarine', '1', 3);

-- Dumping structure for πίνακας naval_battle.ships_p2
CREATE TABLE IF NOT EXISTS `ships_p2` (
  `typeofship` varchar(20) NOT NULL,
  `player_num` enum('1','2') NOT NULL,
  `lenght` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeofship`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table naval_battle.ships_p2: ~4 rows (approximately)
INSERT INTO `ships_p2` (`typeofship`, `player_num`, `lenght`) VALUES
	('air_carrier', '2', 4),
	('f_vessel', '2', 2),
	('pass_ship', '2', 5),
	('submarine', '2', 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
