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