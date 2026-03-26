DELIMITER $$
DROP FUNCTION IF fn_fahrenheit_para_celsius $$
CREATE FUNCTION fn_fahrenheit_para_celsius(fah INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE celsius DECIMAL(10,2);

    SET celsius = (fah - 32) * 5 / 9;

    RETURN celsius;
END $$

DELIMITER ;