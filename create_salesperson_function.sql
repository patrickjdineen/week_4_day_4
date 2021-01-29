SELECT * FROM salesperson;

CREATE OR REPLACE FUNCTION add_salesperson (_first_name VARCHAR, _last_name VARCHAR, _hire_date DATE)
RETURNS void
AS $$

BEGIN
	INSERT INTO salesperson(first_name,last_name,hire_date)
	VALUES(_first_name,_last_name,_hire_date);
END;
$$
LANGUAGE plpgsql;

SELECT add_salesperson('Jeff','Sellerman','3/6/2017');
SELECT add_salesperson('Ryne','Dursa','4/12/2013');
SELECT add_salesperson('Dru','Tomisam','6/1/2015')
SELECT add_salesperson('Evin','Mackewich','8/19/2020')

select * from salesperson;