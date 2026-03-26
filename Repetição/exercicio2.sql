DELIMITER $$
DROP PROCEDURE IF NOT EXISTS pr_gerar_parcelas $$
CREATE PROCEDUDRE pr_gerar_parcelas(
    IN p_qtd INT,
    IN p_valor_total DECIMAL(10,2)
)
BEGIN
    DECLARE v_contador INT DEFAULT 1;
    DECLARE v_valor_parcela DECIMAL (10,2);
 
    Set v_valor_parcela = p_valor_total / p_qtd;

    REPEAT 
        INSERT INTO parcelas (valor_parcela, data_vencimento)
        VALUES(
            v_valor_parcela,
            DATE_ADD(p_data_inicio, INTERVAL v_contador MONTH)

        );
        SET v_contador = v_contador + 1;
        END REPEAT;

    END$$
DELIMETER ; 