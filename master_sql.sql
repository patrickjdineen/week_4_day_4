CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	hire_date DATE
);
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	hire_date DATE
);
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	birth_date DATE,
	email VARCHAR(150)
);
CREATE TABLE car(
	vin_id SERIAL PRIMARY KEY,
	color VARCHAR(100),
	make VARCHAR(100),
	model VARCHAR(100),
	year NUMERIC(4)
);
CREATE TABLE parts(
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(150),
	part_cost NUMERIC(10,2),
	part_quantity INTEGER
);
CREATE TABLE services(
	service_id SERIAL PRIMARY KEY,
	service_name VARCHAR(150)
);
CREATE TABLE sale_invoice (
	invoice_num SERIAL PRIMARY KEY,
	date_sold DATE,
	amount NUMERIC(10,2),
	msrp NUMERIC(10,2),
	customer_id INTEGER NOT NULL,
	vin_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (vin_id) REFERENCES car(vin_id)
);
CREATE TABLE service_invoice(
	invoice_id SERIAL PRIMARY KEY,
	date_serviced DATE,
	customer_id INTEGER NOT NULL,
	vin_id INTEGER NOT NULL,
	part_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (vin_id) REFERENCES car(vin_id),
	FOREIGN KEY (part_id) REFERENCES parts (part_id)
);

CREATE TABLE salesperson_invoice (
	salesperson_id INTEGER NOT NULL,
	invoice_num INTEGER NOT NULL,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson (salesperson_id),
	FOREIGN KEY (invoice_num) REFERENCES sale_invoice (invoice_num)
);

CREATE TABLE labor(
	invoice_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	service_id INTEGER NOT NULL,
	labor_cost NUMERIC(10,2),
	FOREIGN KEY (invoice_id) REFERENCES service_invoice (invoice_id),
	FOREIGN KEY (mechanic_id) REFERENCES mechanic (mechanic_id),
	FOREIGN KEY (service_id) REFERENCES  services (service_id)
);

--create customers function
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

--add values to mechanics/line by line
INSERT INTO mechanic(
	first_name,
	last_name,
	hire_date
)VALUES(
	'Mitch',
	'Mechy',
	'9/1/10'
);

INSERT INTO mechanic(
	first_name,
	last_name,
	hire_date
)VALUES(
	'Gina',
	'Von Fixer',
	'12/25/2018'
),(
	'Alex',
	'Wrench',
	'7/4/2017'
);

--create salesperson with function
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

--create servies function
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

--create sales invoices line by line
INSERT INTO sale_invoice(
	date_sold,
	amount,
	msrp,
	customer_id,
	vin_id
)VALUES(
	'1/2/2021',
	27824.87,
	32995.00,
	1,
	1
);

INSERT INTO car(
	color,
	make,
	model,
	year
)VALUES(
	'Silver',
	'Subaru',
	'Forester',
	2015
),(
	'Grey',
	'Subaru',
	'Impreza',
	2012
),(
	'White',
	'Subaru',
	'WRX',
	2004
),(
	'Blue',
	'Subaru',
	'WRX STi',
	2008
),(
	'Black',
	'Ford',
	'Focus SVT',
	2002
),(
	'Red',
	'Mitsubishi',
	'Eclipse GSX',
	1993
),(
	'Black',
	'Infiniti',
	'G35 Sedan',
	2004
),(
	'White',
	'Kia',
	'Forte',
	2010
)

--create parts function
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

--fill labor table line by line
INSERT INTO labor(
	invoice_id,
	mechanic_id,
	service_id,
	labor_cost
)VALUES(
	2,
	1,
	1,
	24.99
),(
	3,
	1,
	4,
	279.99
),(
	1,
	2,
	5,
	84.99
),(
	4,
	3,
	8,
	2499.99
)

--create sales invoice line by line
INSERT INTO sale_invoice(
	date_sold,
	amount,
	msrp,
	customer_id,
	vin_id
)VALUES(
	'5/17/2007',
	17834.65,
	20995,
	2,
	4
),(
	'11/4/2020',
	25224.95,
	578995.95,
	3,
	8
),(
	'3/6/2020',
	57321.00,
	45995.95,
	4,
	9
)

--fill salesperson invoice table
INSERT INTO salesperson_invoice(
	salesperson_id,
	invoice_num
)VALUES(
	1,
	2
),(
	2,
	3
),(
	3,
	4
),(
	4,
	5
)