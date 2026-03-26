DELIMITER $$
DROP FUNCTION IF EXISTS fn_primeira_letra $$
CREATE FUNCTION  fn_primeira_letra (letra varchar(100))
RETURNS Varchar(100)
DETERMINISTIC
CONTAINS SQL 
BEGIN
   RETURN left(letra,1);
END $$

DELIMITER ;
SELECT fn_primeira_letra("Fatec");