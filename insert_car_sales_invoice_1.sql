SELECT * FROM sale_invoice;
SELECT * FROM car;
SELECT * FROM salesperson_invoice;

INSERT INTO car (
	color,
	make,
	model,
	year
)VALUES(
	'Black',
	'Subaru',
	'Forester',
	'2018'
);

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
SELECT * FROM car;