SELECT * FROM sale_invoice;
SELECT * FROM salesperson;
SELECT * FROM salesperson_invoice;

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