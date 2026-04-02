DELIMITER $$

DROP FUNCTION IF EXISTS fn_atualiza_estoque $$
CREATE FUNCTION fn_atualiza_estoque (p_id INT, p_qtd_vendida INT)
RETURNS INT
MODIFIES SQL DATA
BEGIN
    DECLARE v_novo_estoque INT;

    UPDATE produtos
    SET estoque = estoque - p_qtd_vendida
    WHERE id = p_id;

    SELECT estoque INTO v_novo_estoque
    FROM produtos
    WHERE id = p_id;

    RETURN v_novo_estoque;
END $$

DELIMITER ;


SELECT fn_atualiza_estoque(1, 5);