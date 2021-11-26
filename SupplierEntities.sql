--supplier table
CREATE TABLE supplier(
	bce CHARACTER(10) NOT NULL,
	companyName VARCHAR(100) NOT NULL,
	email VARCHAR(250) NOT NULL,
	telephone VARCHAR(30) NOT NULL,
	url VARCHAR(150),
	addressCountry CHARACTER(3) NOT NULL, --EX: BEL, PER, USA, 
	addressCity VARCHAR(50), 
	addressLocality VARCHAR(50),
	postalCode VARCHAR(25),
	streetAddress VARCHAR(250),
);
ALTER TABLE supplier
ADD CONSTRAINT supplier_pk PRIMARY KEY (bce);

--supplies a product to a warehouse
CREATE TABLE supplies(
	suppliesID SERIAL NOT NULL,
	supplierBce CHARACTER(10) NOT NULL, -- FK supplier
	warehouseCode CHARACTER(10) NOT NULL, --FK warehouse
	sku character varying(30) NOT NULL, --FK product
	arrivalDate TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(), 
	quantity NUMERIC(5,0) NOT NULL, --units
	price NUMERIC(8,2) NOT NULL DEFAULT 0.00,
	supplyState CHARACTER(1) NOT NULL DEFAULT 'A'-- state of the order
);

