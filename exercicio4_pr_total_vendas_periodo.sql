

  DELIMITER $$

  CREATE PROCEDURE pr_total_vendas_periodo(
    IN  p_data_inicio DATE,
    IN  p_data_fim    DATE,
    OUT p_total_final DECIMAL(10,2)
  )
  BEGIN
    SELECT IFNULL(SUM(valor), 0)
    INTO p_total_final
    FROM vendas
    WHERE data_venda BETWEEN p_data_inicio AND p_data_fim;
  END$$

  DELIMITER ;

  SET @resultado = 0;
  CALL pr_total_vendas_periodo('2026-01-10', '2026-03-12', @resultado);
  SELECT @resultado;

