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
        IF (orientation_ = 'v') THEN
    	    UPDATE board SET ship_on_board = shipName WHERE x_data = (x_ + counter) and (y_data = y_ ) and (player = playerPlayed);
        END IF;
        IF (orientation_ = 'h') THEN
    	    UPDATE board SET ship_on_board = shipName WHERE (x_data = x_) and (y_data = y_  + counter) and (player = playerPlayed);
        END IF;
        SET counter = counter + 1;
    END WHILE;
END //

create procedure initGame()
BEGIN
	delete from board;
    
    insert into board select * from board_empty;

    update ships_p1 SET placed = 0; 
    update ships_p2 SET placed = 0; 

    update game_status set status = 'initialized';
END //


create procedure checkFounded(IN ship_name varchar(255), IN player_ INT)
BEGIN
	declare hitted_count INT DEFAULT 0;
    declare ship_lentgh INT DEFAULT 0;
    
    set hitted_count := (select count(*) from board where (board.ship_on_board = ship_name) and (board.is_hitted = 'Y') and (board.player = player_));
    set ship_lentgh := (select lenght from ships_p1 WHERE ships_p1.typeofship = ship_name);
    
    IF hitted_count = ship_lentgh THEN
    	select 'Y' as message;
    ELSE
    	select 'N' as message;
    END IF;
    
END //

call placeShip('air_carrier',0,0,'h',1);

call checkFounded('air_carrier',1);