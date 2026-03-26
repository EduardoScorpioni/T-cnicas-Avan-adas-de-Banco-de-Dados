DELIMITER $$

DROP PROCEDURE IF EXISTS pr_distribuirBonus $$
CREATE PROCEDURE pr_distribuirBonus(
    IN p_bonus DECIMAL(10,2),  
    IN p_limite INT             
)
BEGIN
    DECLARE v_contador INT DEFAULT 1;
    DECLARE v_total_bonus DECIMAL(10,2) DEFAULT 0;

    loop_funcionarios: LOOP
        
   
        IF v_contador > p_limite THEN
            LEAVE loop_funcionarios;
        END IF;

    
        UPDATE funcionarios
        SET salario = salario + p_bonus
        WHERE id = v_contador;

       
        SET v_total_bonus = v_total_bonus + p_bonus;

        SET v_contador = v_contador + 1;

    END LOOP loop_funcionarios;

END $$

DELIMITER ;