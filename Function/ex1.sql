DELIMITER $$
DROP FUNCTION IF EXISTS fn_media_vendas_mes $$
CREATE FUNCTION fn_media_vendas_mes(mes INT,ano INT)
RETURNS DECIMAL (10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
	
   	DECLARE media DECIMAL(10,2);

    SELECT AVG(valor_total)
    INTO media
    FROM vendas
    WHERE MONTH(data_venda) = mes AND YEAR(data_venda) = ano;

    RETURN media;
END $$

DELIMITER ;
SELECT fn_media_vendas_mes(1,2026);