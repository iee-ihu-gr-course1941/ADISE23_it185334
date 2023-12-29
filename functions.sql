create procedure placeShip(IN shipName varchar(255), IN x_ INT,IN y_ INT, IN orientation_ varchar(255), IN playerPlayed INT)
BEGIN
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
        IF (orientation_ = 'h') THEN
    	    UPDATE board SET ship_on_board = 1 WHERE x_data = (x_ + counter) and (y_data = y_ ) and (player = playerPlayed);
        END IF;
        IF (orientation_ = 'v') THEN
    	    UPDATE board SET ship_on_board = 1 WHERE (x_data = x_) and (y_data = y_  + counter) and (player = playerPlayed);
        END IF;
        SET counter = counter + 1;
    END WHILE;
END //

create procedure initGame()
BEGIN
	delete from board;
    
    insert into board select * from board_empty;
END //


call placeShip('air_carrier',1,1,'h',1);