CREATE DATABASE grimauflorentois
    WITH
    OWNER = postgres;

\connect grimauflorentois

--
-- Tables creation
--

BEGIN;

CREATE TABLE IF NOT EXISTS warehouse(
    ID              character varying(255) NOT NULL PRIMARY KEY,
    name            CHAR(50) NOT NULL,
    location        CHAR(50)
);

CREATE TABLE IF NOT EXISTS transportcompany(
    name            CHAR(50) NOT NULL UNIQUE PRIMARY KEY,
    price_per_km    DOUBLE DEFAULT 0,
    api_key         CHAR(50) DEFAULT 'missing'
);

CREATE TABLE IF NOT EXISTS transportvehicle(
    ID              character varying(255) NOT NULL PRIMARY KEY,
    position        CHAR(50),

    company         CHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS deliverytrip(
    ID                  character varying(255) NOT NULL PRIMARY KEY,
    departure_time      TIMESTAMP,
    arrival_time        TIMESTAMP,

    truck               character varying(255) NOT NULL,
    starting_warehouse  character varying(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS order(
    ID                  character varying(255) NOT NULL PRIMARY KEY,
    email               CHAR(100),
    date                DATETIME NOT NULL,
    address             CHAR(50),

    status              character varying(128) NOT NULL,
    delivery_type       character varying(128) NOT NULL,
    trip                character varying(255),
);

CREATE TABLE public."order" (
    orderid character varying(15) NOT NULL,
    orderstatus character varying(128) NOT NULL,
    orderdate timestamp without time zone NOT NULL,
    customeremail character varying(256) NOT NULL,
    customeraddress character varying(512) NOT NULL,
    orderamount numeric(10,2) NOT NULL,
    deliveryservice character varying(128) NOT NULL
);


ALTER TABLE TransportVehicle ADD FOREIGN KEY(company) REFERENCES TransportCompany(name) ON DELETE CASCADE;

ALTER TABLE DeliveryTrip ADD FOREIGN KEY(truck) REFERENCES TransportVehicle(ID) ON DELETE CASCADE;
ALTER TABLE DeliveryTrip ADD FOREIGN KEY(starting_warehouse) REFERENCES Warehouse(ID) ON DELETE CASCADE;

ALTER TABLE Orders ADD FOREIGN KEY(trip) REFERENCES DeliveryTrip(ID) ON DELETE CASCADE;
ALTER TABLE Orders ADD FOREIGN KEY(delivery_type) REFERENCES delivery_services_types(delivery_kind) ON DELETE CASCADE;
ALTER TABLE Orders ADD FOREIGN KEY(status) REFERENCES delivery_status_description(delivery_status) ON DELETE CASCADE;

COMMIT;

--
-- Data dump
--

BEGIN;

INSERT INTO Warehouse
    (              name,    location)
VALUES
    ( 'First WareHouse', 'Bruxelles'),
    ('Second WareHouse',     'Liege');

INSERT INTO TransportCompany
    (    name, price_per_km,                   api_key)
VALUES
    ( 'BPost',            3,      'thisisanawesomekey'),
    ('PostNL',            2, 'thisisanotherawesomekey');

INSERT INTO TransportVehicle
    ( position,  company)
VALUES
    (  'Namur',        1),
    ( 'Anvers',        1),
    (   'Mons',        2),
    ('Enghien',        2);

INSERT INTO Orders
    (premium,                                    address)
VALUES
    (  false,    'Rue du chien marin 24, 1000 Bruxelles'),
    (  false,          'Rue dansaert 12, 1000 Bruxelles'),
    (  false,  'Chaussée de Bruxelles 800, 7850 Enghien'),
    (   true, 'Quai du bois à brûler 24, 1000 Bruxelles');

INSERT INTO DeliveryTrip
    (            departure_time,               arrival_time, truck)
VALUES
    ('2021-11-02 12:34:36+0100',                       NULL,     1),
    ('2021-11-02 12:34:36+0100', '2021-11-03 10:14:15+0100',     2),
    (                      NULL,                       NULL,     2),
    ('2021-11-02 12:34:36+0100', '2021-11-05 14:26:18+0100',     3),
    ('2021-11-02 12:34:36+0100',                       NULL,     4),
    ('2021-11-02 12:34:36+0100',                       NULL,     4);

INSERT INTO Package
    (   status,             size, weight, warehouse, trip, pkg_order)
VALUES
    ('Transit',       '23x34x12',    120,         1,    1,         1),
    ('Arrived',       '12x10x23',    400,         2,    2,         2),
    ('Preparation',   '10x10x10',    100,         1,    3,         3),
    ('Arrived',       '20x20x20',    483,         1,    4,         2),
    ('Transit',     '100x120x20',   7643,         2,    5,         4),
    ('Lost',          '19x34x32',    872,         1,    6,         4);

UPDATE DeliveryTrip SET package=1 WHERE ID=1;
UPDATE DeliveryTrip SET package=2 WHERE ID=2;
UPDATE DeliveryTrip SET package=3 WHERE ID=3;
UPDATE DeliveryTrip SET package=4 WHERE ID=4;
UPDATE DeliveryTrip SET package=5 WHERE ID=5;
UPDATE DeliveryTrip SET package=6 WHERE ID=6;

COMMIT;
