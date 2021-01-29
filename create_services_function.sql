select * from services;
CREATE OR REPLACE FUNCTION create_services(_service_name VARCHAR)
RETURNS void
AS $$

BEGIN
	INSERT INTO services(service_name)
	VALUES(_service_name);
END;
$$
LANGUAGE plpgsql;

SELECT create_services('Oil Change');
SELECT create_services('Tire Rotation');
SELECT create_services('Alignment');
SELECT create_services('Head Gasket Replacement');
SELECT create_services('Spark Plug Change');
SELECT create_services('Ball Joint Replacement');
SELECT create_services('Transmission Fluid Change');
SELECT create_services('Rebuild Motor');