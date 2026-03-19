-- Exercício 5: Controle de Estoque com Verificação Existencial
-- Procedure: pr_remover_produto

DELIMITER $$

CREATE PROCEDURE pr_remover_produto(
  IN p_id INT
)
BEGIN
  IF EXISTS (SELECT 1 FROM produtos WHERE id = p_id) THEN
    DELETE FROM produtos WHERE id = p_id;
    SELECT 'Sucesso' AS mensagem;
  ELSE
    SELECT 'Produto Não encontrado na base de dados' AS mensagem;
  END IF;
END$$

DELIMITER ;

CALL pr_remover_produto(9);

