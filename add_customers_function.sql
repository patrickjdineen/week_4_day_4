SELECT * FROM customer;

CREATE OR REPLACE FUNCTION add_customer (_first_name VARCHAR, _last_name VARCHAR, _birth_date DATE, _email VARCHAR)
RETURNS void
AS $$

BEGIN
	INSERT INTO customer(first_name,last_name,birth_date,email)
	VALUES(_first_name,_last_name,_birth_date,_email);
END;
$$
LANGUAGE plpgsql;

SELECT add_customer('Patrick','Dineen','5/17/1986','patrickjdineen@gmail.com');
SELECT add_customer('Felicity','Dineen','10/22/1986','felicitycdineen@gmail.com');
SELECT add_customer('Tim','Dineen','8/27/1950','tpdineen@email.com');
SELECT add_customer('Jill','Dineen','10/1/1953','tjdineen71@email.com');
SELECT * FROM customer;