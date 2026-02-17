/*
Enter your query here.
*/

DELIMITER $$

CREATE PROCEDURE while_p()
BEGIN
    DECLARE i INT DEFAULT 20;
    
    WHILE i > 0 DO
        SELECT REPEAT('* ', i);
        SET i = i - 1;
    END WHILE;
    
END$$

DELIMITER ;

CALL while_p();
