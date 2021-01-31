SELECT * FROM SERVICE_INVOICE;
SELECT * FROM labor;
SELECT * FROM mechanic;
SELECT * FROM services;

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