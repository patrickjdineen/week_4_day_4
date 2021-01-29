SELECT * FROM parts;
CREATE OR REPLACE FUNCTION add_parts(_part_name VARCHAR,_part_cost NUMERIC,_part_quantity INTEGER)
RETURNS void
AS $$

BEGIN
	INSERT INTO parts(part_name,part_cost,part_quantity)
	VALUES(_part_name,_part_cost,_part_quantity);
END;
$$
LANGUAGE plpgsql;

SELECT add_parts('bumper',275.63,7);
SELECT add_parts('Oil Filter',24.99,50);
SELECT add_parts('Air Filter',13.99,84);
SELECT add_parts('Head Gasket',72.57,12);
SELECT add_parts('Piston Ring',7.83,175);
SELECT add_parts('Ball Joint',28.94,27);
SELECT add_parts('Tie Rod',172.12,7);
SELECT add_parts('Aux Port',8.73,46);