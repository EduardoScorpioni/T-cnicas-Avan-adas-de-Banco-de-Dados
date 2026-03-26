DELIMITER $$

CREATE PROCEDURE pr_popularLogs(IN p_quantidade INT)
BEGIN
    DECLARE v_contador INT DEFAULT 1;

    WHILE v_contador <= p_quantidade DO
        INSERT INTO logs_acesso (mensagem, data_registro)
        VALUES (CONCAT('Log número ', v_contador), NOW());

        SET v_contador = v_contador + 1;
    END WHILE;

END $$

DELIMITER ;  