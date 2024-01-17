-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 17 Ιαν 2024 στις 21:46:11
-- Έκδοση διακομιστή: 10.4.28-MariaDB
-- Έκδοση PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `naval_battle`
--

DELIMITER $$
--
-- Διαδικασίες
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkFounded` (IN `ship_name` VARCHAR(255), IN `player_` INT)   BEGIN
	declare hitted_count INT DEFAULT 0;
    declare ship_lentgh INT DEFAULT 0;
    
    set hitted_count := (select count(*) from board where (board.ship_on_board = ship_name) and (board.is_hitted = 'Y') and (board.player = player_));
    set ship_lentgh := (select lenght from ships_p1 WHERE ships_p1.typeofship = ship_name);
    
    IF hitted_count = ship_lentgh THEN
    	select 'Y' as message;
    ELSE
    	select 'N' as message;
    END IF;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `initGame` ()   BEGIN
	delete from board;
    
    insert into board select * from board_empty;

    update ships_p1 SET placed = 0; 
    update ships_p2 SET placed = 0; 

    update game_status set status = 'initialized';
    update game_status set result = NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `placeShip` (IN `shipName` VARCHAR(255), IN `x_` INT, IN `y_` INT, IN `orientation_` VARCHAR(255), IN `playerPlayed` INT)   BEGIN
	DECLARE max_count INT;
    DECLARE counter INT DEFAULT 0;

    IF (playerPlayed = 1) THEN
        UPDATE ships_p1 SET placed = 1 WHERE typeofship = shipName;
    END IF;

    IF (playerPlayed = 2) THEN
        UPDATE ships_p2 SET placed = 1 WHERE typeofship = shipName;
    END IF;
    
    SET max_count := (SELECT lenght from ships_p1 where typeofship = shipName);
    
    WHILE counter < max_count DO
        IF (orientation_ = 'v') THEN
    	    UPDATE board SET ship_on_board = shipName WHERE x_data = (x_ + counter) and (y_data = y_ ) and (player = playerPlayed);
        END IF;
        IF (orientation_ = 'h') THEN
    	    UPDATE board SET ship_on_board = shipName WHERE (x_data = x_) and (y_data = y_  + counter) and (player = playerPlayed);
        END IF;
        SET counter = counter + 1;
    END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board`
--

CREATE TABLE `board` (
  `x_data` tinyint(1) NOT NULL,
  `y_data` tinyint(1) NOT NULL,
  `player` int(11) NOT NULL,
  `ship_on_board` varchar(255) DEFAULT NULL,
  `is_hitted` enum('Y','N') DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `board`
--

INSERT INTO `board` (`x_data`, `y_data`, `player`, `ship_on_board`, `is_hitted`) VALUES
(0, 0, 1, NULL, 'N'),
(0, 0, 2, NULL, 'N'),
(0, 1, 1, NULL, 'N'),
(0, 1, 2, NULL, 'N'),
(0, 2, 1, NULL, 'N'),
(0, 2, 2, NULL, 'N'),
(0, 3, 1, NULL, 'N'),
(0, 3, 2, NULL, 'N'),
(0, 4, 1, NULL, 'N'),
(0, 4, 2, NULL, 'N'),
(0, 5, 1, NULL, 'N'),
(0, 5, 2, NULL, 'N'),
(0, 6, 1, NULL, 'N'),
(0, 6, 2, NULL, 'N'),
(0, 7, 1, NULL, 'N'),
(0, 7, 2, NULL, 'N'),
(0, 8, 1, NULL, 'N'),
(0, 8, 2, NULL, 'N'),
(0, 9, 1, NULL, 'N'),
(0, 9, 2, NULL, 'N'),
(1, 0, 1, NULL, 'N'),
(1, 0, 2, NULL, 'N'),
(1, 1, 1, NULL, 'N'),
(1, 1, 2, NULL, 'N'),
(1, 2, 1, NULL, 'N'),
(1, 2, 2, NULL, 'N'),
(1, 3, 1, NULL, 'N'),
(1, 3, 2, NULL, 'N'),
(1, 4, 1, NULL, 'N'),
(1, 4, 2, NULL, 'N'),
(1, 5, 1, NULL, 'N'),
(1, 5, 2, NULL, 'N'),
(1, 6, 1, NULL, 'N'),
(1, 6, 2, NULL, 'N'),
(1, 7, 1, NULL, 'N'),
(1, 7, 2, NULL, 'N'),
(1, 8, 1, NULL, 'N'),
(1, 8, 2, NULL, 'N'),
(1, 9, 1, NULL, 'N'),
(1, 9, 2, NULL, 'N'),
(2, 0, 1, NULL, 'N'),
(2, 0, 2, NULL, 'N'),
(2, 1, 1, NULL, 'N'),
(2, 1, 2, NULL, 'N'),
(2, 2, 1, NULL, 'N'),
(2, 2, 2, NULL, 'N'),
(2, 3, 1, NULL, 'N'),
(2, 3, 2, NULL, 'N'),
(2, 4, 1, NULL, 'N'),
(2, 4, 2, NULL, 'N'),
(2, 5, 1, NULL, 'N'),
(2, 5, 2, NULL, 'N'),
(2, 6, 1, NULL, 'N'),
(2, 6, 2, NULL, 'N'),
(2, 7, 1, NULL, 'N'),
(2, 7, 2, NULL, 'N'),
(2, 8, 1, NULL, 'N'),
(2, 8, 2, NULL, 'N'),
(2, 9, 1, NULL, 'N'),
(2, 9, 2, NULL, 'N'),
(3, 0, 1, NULL, 'N'),
(3, 0, 2, NULL, 'N'),
(3, 1, 1, NULL, 'N'),
(3, 1, 2, NULL, 'N'),
(3, 2, 1, NULL, 'N'),
(3, 2, 2, NULL, 'N'),
(3, 3, 1, NULL, 'N'),
(3, 3, 2, NULL, 'N'),
(3, 4, 1, NULL, 'N'),
(3, 4, 2, NULL, 'N'),
(3, 5, 1, NULL, 'N'),
(3, 5, 2, NULL, 'N'),
(3, 6, 1, NULL, 'N'),
(3, 6, 2, NULL, 'N'),
(3, 7, 1, NULL, 'N'),
(3, 7, 2, NULL, 'N'),
(3, 8, 1, NULL, 'N'),
(3, 8, 2, NULL, 'N'),
(3, 9, 1, NULL, 'N'),
(3, 9, 2, NULL, 'N'),
(4, 0, 1, NULL, 'N'),
(4, 0, 2, NULL, 'N'),
(4, 1, 1, NULL, 'N'),
(4, 1, 2, NULL, 'N'),
(4, 2, 1, NULL, 'N'),
(4, 2, 2, NULL, 'N'),
(4, 3, 1, NULL, 'N'),
(4, 3, 2, NULL, 'N'),
(4, 4, 1, NULL, 'N'),
(4, 4, 2, NULL, 'N'),
(4, 5, 1, NULL, 'N'),
(4, 5, 2, NULL, 'N'),
(4, 6, 1, NULL, 'N'),
(4, 6, 2, NULL, 'N'),
(4, 7, 1, NULL, 'N'),
(4, 7, 2, NULL, 'N'),
(4, 8, 1, NULL, 'N'),
(4, 8, 2, NULL, 'N'),
(4, 9, 1, NULL, 'N'),
(4, 9, 2, NULL, 'N');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board_empty`
--

CREATE TABLE `board_empty` (
  `x_data` tinyint(1) NOT NULL,
  `y_data` tinyint(1) NOT NULL,
  `player` int(11) NOT NULL,
  `ship_on_board` varchar(255) DEFAULT NULL,
  `is_hitted` enum('Y','N') DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Άδειασμα δεδομένων του πίνακα `board_empty`
--

INSERT INTO `board_empty` (`x_data`, `y_data`, `player`, `ship_on_board`, `is_hitted`) VALUES
(0, 0, 1, NULL, 'N'),
(0, 0, 2, NULL, 'N'),
(0, 1, 1, NULL, 'N'),
(0, 1, 2, NULL, 'N'),
(0, 2, 1, NULL, 'N'),
(0, 2, 2, NULL, 'N'),
(0, 3, 1, NULL, 'N'),
(0, 3, 2, NULL, 'N'),
(0, 4, 1, NULL, 'N'),
(0, 4, 2, NULL, 'N'),
(0, 5, 1, NULL, 'N'),
(0, 5, 2, NULL, 'N'),
(0, 6, 1, NULL, 'N'),
(0, 6, 2, NULL, 'N'),
(0, 7, 1, NULL, 'N'),
(0, 7, 2, NULL, 'N'),
(0, 8, 1, NULL, 'N'),
(0, 8, 2, NULL, 'N'),
(0, 9, 1, NULL, 'N'),
(0, 9, 2, NULL, 'N'),
(1, 0, 1, NULL, 'N'),
(1, 0, 2, NULL, 'N'),
(1, 1, 1, NULL, 'N'),
(1, 1, 2, NULL, 'N'),
(1, 2, 1, NULL, 'N'),
(1, 2, 2, NULL, 'N'),
(1, 3, 1, NULL, 'N'),
(1, 3, 2, NULL, 'N'),
(1, 4, 1, NULL, 'N'),
(1, 4, 2, NULL, 'N'),
(1, 5, 1, NULL, 'N'),
(1, 5, 2, NULL, 'N'),
(1, 6, 1, NULL, 'N'),
(1, 6, 2, NULL, 'N'),
(1, 7, 1, NULL, 'N'),
(1, 7, 2, NULL, 'N'),
(1, 8, 1, NULL, 'N'),
(1, 8, 2, NULL, 'N'),
(1, 9, 1, NULL, 'N'),
(1, 9, 2, NULL, 'N'),
(2, 0, 1, NULL, 'N'),
(2, 0, 2, NULL, 'N'),
(2, 1, 1, NULL, 'N'),
(2, 1, 2, NULL, 'N'),
(2, 2, 1, NULL, 'N'),
(2, 2, 2, NULL, 'N'),
(2, 3, 1, NULL, 'N'),
(2, 3, 2, NULL, 'N'),
(2, 4, 1, NULL, 'N'),
(2, 4, 2, NULL, 'N'),
(2, 5, 1, NULL, 'N'),
(2, 5, 2, NULL, 'N'),
(2, 6, 1, NULL, 'N'),
(2, 6, 2, NULL, 'N'),
(2, 7, 1, NULL, 'N'),
(2, 7, 2, NULL, 'N'),
(2, 8, 1, NULL, 'N'),
(2, 8, 2, NULL, 'N'),
(2, 9, 1, NULL, 'N'),
(2, 9, 2, NULL, 'N'),
(3, 0, 1, NULL, 'N'),
(3, 0, 2, NULL, 'N'),
(3, 1, 1, NULL, 'N'),
(3, 1, 2, NULL, 'N'),
(3, 2, 1, NULL, 'N'),
(3, 2, 2, NULL, 'N'),
(3, 3, 1, NULL, 'N'),
(3, 3, 2, NULL, 'N'),
(3, 4, 1, NULL, 'N'),
(3, 4, 2, NULL, 'N'),
(3, 5, 1, NULL, 'N'),
(3, 5, 2, NULL, 'N'),
(3, 6, 1, NULL, 'N'),
(3, 6, 2, NULL, 'N'),
(3, 7, 1, NULL, 'N'),
(3, 7, 2, NULL, 'N'),
(3, 8, 1, NULL, 'N'),
(3, 8, 2, NULL, 'N'),
(3, 9, 1, NULL, 'N'),
(3, 9, 2, NULL, 'N'),
(4, 0, 1, NULL, 'N'),
(4, 0, 2, NULL, 'N'),
(4, 1, 1, NULL, 'N'),
(4, 1, 2, NULL, 'N'),
(4, 2, 1, NULL, 'N'),
(4, 2, 2, NULL, 'N'),
(4, 3, 1, NULL, 'N'),
(4, 3, 2, NULL, 'N'),
(4, 4, 1, NULL, 'N'),
(4, 4, 2, NULL, 'N'),
(4, 5, 1, NULL, 'N'),
(4, 5, 2, NULL, 'N'),
(4, 6, 1, NULL, 'N'),
(4, 6, 2, NULL, 'N'),
(4, 7, 1, NULL, 'N'),
(4, 7, 2, NULL, 'N'),
(4, 8, 1, NULL, 'N'),
(4, 8, 2, NULL, 'N'),
(4, 9, 1, NULL, 'N'),
(4, 9, 2, NULL, 'N');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `game_status`
--

CREATE TABLE `game_status` (
  `id` int(11) NOT NULL,
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('1','2') DEFAULT NULL,
  `result` enum('1','2') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `game_status`
--

INSERT INTO `game_status` (`id`, `status`, `p_turn`, `result`, `last_change`) VALUES
(1, 'initialized', '2', NULL, '2023-11-16 12:14:14');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `player_num` enum('1','2') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `players`
--

INSERT INTO `players` (`username`, `player_num`, `token`, `last_action`) VALUES
('antonis', '1', 'qwerty', NULL),
('makis', '2', 'ytrewq', NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `ships_p1`
--

CREATE TABLE `ships_p1` (
  `typeofship` varchar(20) NOT NULL,
  `player_num` enum('1','2') NOT NULL,
  `lenght` int(11) DEFAULT NULL,
  `placed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `ships_p1`
--

INSERT INTO `ships_p1` (`typeofship`, `player_num`, `lenght`, `placed`) VALUES
('air_carrier', '1', 4, 0),
('f_vessel', '1', 2, 0),
('pass_ship', '1', 5, 0),
('submarine', '1', 3, 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `ships_p2`
--

CREATE TABLE `ships_p2` (
  `typeofship` varchar(20) NOT NULL,
  `player_num` enum('1','2') NOT NULL,
  `lenght` int(11) DEFAULT NULL,
  `placed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Άδειασμα δεδομένων του πίνακα `ships_p2`
--

INSERT INTO `ships_p2` (`typeofship`, `player_num`, `lenght`, `placed`) VALUES
('air_carrier', '2', 4, 0),
('f_vessel', '2', 2, 0),
('pass_ship', '2', 5, 0),
('submarine', '2', 3, 0);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`x_data`,`y_data`,`player`) USING BTREE;

--
-- Ευρετήρια για πίνακα `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`x_data`,`y_data`,`player`) USING BTREE;

--
-- Ευρετήρια για πίνακα `game_status`
--
ALTER TABLE `game_status`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_num`);

--
-- Ευρετήρια για πίνακα `ships_p1`
--
ALTER TABLE `ships_p1`
  ADD PRIMARY KEY (`typeofship`) USING BTREE;

--
-- Ευρετήρια για πίνακα `ships_p2`
--
ALTER TABLE `ships_p2`
  ADD PRIMARY KEY (`typeofship`) USING BTREE;

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `game_status`
--
ALTER TABLE `game_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
