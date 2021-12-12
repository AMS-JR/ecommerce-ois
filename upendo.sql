--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2021-12-12 18:02:09

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 57709)
-- Name: Brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brand" (
    name character varying(30) NOT NULL
);


ALTER TABLE public."Brand" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 57745)
-- Name: Cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cart" (
    customer character varying(30) NOT NULL,
    product character varying(30) NOT NULL,
    "dateAdded" timestamp without time zone
);


ALTER TABLE public."Cart" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 57712)
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 57718)
-- Name: Image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Image" (
    url character varying(30) NOT NULL
);


ALTER TABLE public."Image" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 65942)
-- Name: Inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Inventory" (
    supplyid_fk integer NOT NULL,
    productsku character varying(30) NOT NULL,
    product character varying(100) NOT NULL,
    quantity numeric(5,0) NOT NULL
);


ALTER TABLE public."Inventory" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 57724)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    "orderID" character varying(15) NOT NULL,
    "orderStatus" character varying(10) NOT NULL,
    "orderDate" timestamp without time zone NOT NULL,
    "customerEmail" character varying(30) NOT NULL,
    "customerAddress" character varying(512) NOT NULL,
    "orderAmount" numeric(10,2) NOT NULL,
    "deliveryService" character varying(50) NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 57730)
-- Name: OrderDescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderDescription" (
    "order" character varying(15) NOT NULL,
    product character varying(30) NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public."OrderDescription" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 65900)
-- Name: PaymentCard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaymentCard" (
    "cardType" character varying(10) NOT NULL,
    "cardNumber" character varying(17) NOT NULL,
    "cardHolderName" character varying(100) NOT NULL,
    "cardExpiryDate" date NOT NULL,
    customer character varying(100) NOT NULL,
    "customerEmail" character varying(256) NOT NULL
);


ALTER TABLE public."PaymentCard" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 57701)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    sku character varying(30) NOT NULL,
    name character varying(200) NOT NULL,
    color character varying(20),
    "itemCondition" character varying(20) NOT NULL,
    description character varying(512),
    "stockQuantity" integer NOT NULL,
    location character varying(50) NOT NULL,
    "dateAdded" timestamp without time zone NOT NULL,
    brand character varying(30),
    category character varying(30),
    "adminSeller" character varying(30),
    "supplierSeller" character varying(30),
    price numeric(10,2) NOT NULL,
    model character varying
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 57733)
-- Name: ProductImages ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductImages " (
    product character varying(30) NOT NULL,
    "imageUrl" character varying NOT NULL
);


ALTER TABLE public."ProductImages " OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 57739)
-- Name: Reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Reviews" (
    author character varying(30) NOT NULL,
    about character varying(30) NOT NULL,
    "reviewBody" text NOT NULL,
    "reviewRatingValue" bigint NOT NULL,
    "dateCreated" timestamp without time zone NOT NULL,
    "dateModified" timestamp without time zone NOT NULL
);


ALTER TABLE public."Reviews" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 57767)
-- Name: SuppliesStock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SuppliesStock" (
    supply integer NOT NULL,
    sku character varying(30),
    name character varying(30) NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public."SuppliesStock" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 57765)
-- Name: SuppliesStock_supply_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SuppliesStock_supply_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SuppliesStock_supply_seq" OWNER TO postgres;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 212
-- Name: SuppliesStock_supply_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SuppliesStock_supply_seq" OWNED BY public."SuppliesStock".supply;


--
-- TOC entry 222 (class 1259 OID 65936)
-- Name: Warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Warehouse" (
    "warehouseCode" character varying(10) NOT NULL,
    "companyName" character varying(128) NOT NULL,
    email character varying(256) NOT NULL,
    telephone character varying(20) NOT NULL,
    "addressCountry" character varying(3) NOT NULL,
    "addressCity" character varying(50) NOT NULL,
    "addressLocality" character varying(50) NOT NULL,
    "postalCode" character varying(25) NOT NULL,
    "streetAddress" character varying(256) NOT NULL
);


ALTER TABLE public."Warehouse" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 65903)
-- Name: customer_receipt_connector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_receipt_connector (
    email character varying(256) NOT NULL,
    receipt_id character varying(64) NOT NULL
);


ALTER TABLE public.customer_receipt_connector OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 65906)
-- Name: customers_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_addresses (
    email character varying(256) NOT NULL,
    country character varying(128) NOT NULL,
    city character varying(128) NOT NULL,
    address character varying(512) NOT NULL
);


ALTER TABLE public.customers_addresses OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 65912)
-- Name: customers_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_information (
    first_name character varying(128) NOT NULL,
    last_name character varying(128) NOT NULL,
    birth_date date,
    delivery_kind character varying(128) NOT NULL,
    email character varying(256) NOT NULL,
    phone_number character varying(20)
);


ALTER TABLE public.customers_information OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 65918)
-- Name: delivery_services_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_services_type (
    delivery_kind character varying(128) NOT NULL,
    price double precision NOT NULL,
    delivery_duration integer NOT NULL
);


ALTER TABLE public.delivery_services_type OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 65921)
-- Name: delivery_status_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_status_description (
    delivery_status character varying(128) NOT NULL,
    decription text NOT NULL
);


ALTER TABLE public.delivery_status_description OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 65927)
-- Name: goods_in_receipt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goods_in_receipt (
    receipt_id character varying(64) NOT NULL,
    good_id character varying(64) NOT NULL,
    numberof integer NOT NULL
);


ALTER TABLE public.goods_in_receipt OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 65930)
-- Name: receipt_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_information (
    receipt_id character varying(64) NOT NULL,
    date date NOT NULL,
    delivery_status character varying(128) NOT NULL,
    delivery_type character varying(128) NOT NULL,
    email character varying(256),
    "orderAmount" integer,
    address text
);


ALTER TABLE public.receipt_information OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 57748)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    bce character varying(10) NOT NULL,
    "companyName" character varying(100) NOT NULL,
    email character varying(250) NOT NULL,
    telephone character varying(30) NOT NULL,
    url character varying(150),
    "addressCountry" character varying(3) NOT NULL,
    "addressCity" character varying(50),
    "addressLocality" character varying(50),
    "postalCode" character varying(25),
    "streetAddress" character varying(250)
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 57758)
-- Name: supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplies (
    "suppliesID" integer NOT NULL,
    "supplierBce" character varying(10) NOT NULL,
    "warehouseCode" character varying(10) NOT NULL,
    sku character varying(30) NOT NULL,
    "arrivalDate" timestamp without time zone DEFAULT now() NOT NULL,
    quantity numeric(5,0) NOT NULL,
    price numeric(8,2) DEFAULT 0.00 NOT NULL,
    "supplyState" character(1) DEFAULT 'A'::bpchar NOT NULL
);


ALTER TABLE public.supplies OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 57756)
-- Name: supplies_suppliesID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."supplies_suppliesID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."supplies_suppliesID_seq" OWNER TO postgres;

--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 210
-- Name: supplies_suppliesID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."supplies_suppliesID_seq" OWNED BY public.supplies."suppliesID";


--
-- TOC entry 2951 (class 2604 OID 57770)
-- Name: SuppliesStock supply; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SuppliesStock" ALTER COLUMN supply SET DEFAULT nextval('public."SuppliesStock_supply_seq"'::regclass);


--
-- TOC entry 2947 (class 2604 OID 57761)
-- Name: supplies suppliesID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies ALTER COLUMN "suppliesID" SET DEFAULT nextval('public."supplies_suppliesID_seq"'::regclass);


--
-- TOC entry 3087 (class 0 OID 57709)
-- Dependencies: 201
-- Data for Name: Brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brand" (name) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 57745)
-- Dependencies: 208
-- Data for Name: Cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cart" (customer, product, "dateAdded") FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 57712)
-- Dependencies: 202
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" (name, description) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 57718)
-- Dependencies: 203
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Image" (url) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 65942)
-- Dependencies: 223
-- Data for Name: Inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Inventory" (supplyid_fk, productsku, product, quantity) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 57724)
-- Dependencies: 204
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" ("orderID", "orderStatus", "orderDate", "customerEmail", "customerAddress", "orderAmount", "deliveryService") FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 57730)
-- Dependencies: 205
-- Data for Name: OrderDescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderDescription" ("order", product, quantity) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 65900)
-- Dependencies: 214
-- Data for Name: PaymentCard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaymentCard" ("cardType", "cardNumber", "cardHolderName", "cardExpiryDate", customer, "customerEmail") FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 57701)
-- Dependencies: 200
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (sku, name, color, "itemCondition", description, "stockQuantity", location, "dateAdded", brand, category, "adminSeller", "supplierSeller", price, model) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 57733)
-- Dependencies: 206
-- Data for Name: ProductImages ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductImages " (product, "imageUrl") FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 57739)
-- Dependencies: 207
-- Data for Name: Reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Reviews" (author, about, "reviewBody", "reviewRatingValue", "dateCreated", "dateModified") FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 57767)
-- Dependencies: 213
-- Data for Name: SuppliesStock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SuppliesStock" (supply, sku, name, quantity, price) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 65936)
-- Dependencies: 222
-- Data for Name: Warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Warehouse" ("warehouseCode", "companyName", email, telephone, "addressCountry", "addressCity", "addressLocality", "postalCode", "streetAddress") FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 65903)
-- Dependencies: 215
-- Data for Name: customer_receipt_connector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_receipt_connector (email, receipt_id) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 65906)
-- Dependencies: 216
-- Data for Name: customers_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_addresses (email, country, city, address) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 65912)
-- Dependencies: 217
-- Data for Name: customers_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 65918)
-- Dependencies: 218
-- Data for Name: delivery_services_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_services_type (delivery_kind, price, delivery_duration) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 65921)
-- Dependencies: 219
-- Data for Name: delivery_status_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_status_description (delivery_status, decription) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 65927)
-- Dependencies: 220
-- Data for Name: goods_in_receipt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goods_in_receipt (receipt_id, good_id, numberof) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 65930)
-- Dependencies: 221
-- Data for Name: receipt_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_information (receipt_id, date, delivery_status, delivery_type, email, "orderAmount", address) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 57748)
-- Dependencies: 209
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (bce, "companyName", email, telephone, url, "addressCountry", "addressCity", "addressLocality", "postalCode", "streetAddress") FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 57758)
-- Dependencies: 211
-- Data for Name: supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplies ("suppliesID", "supplierBce", "warehouseCode", sku, "arrivalDate", quantity, price, "supplyState") FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 212
-- Name: SuppliesStock_supply_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SuppliesStock_supply_seq"', 1, false);


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 210
-- Name: supplies_suppliesID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."supplies_suppliesID_seq"', 1, false);


--
-- TOC entry 2953 (class 2606 OID 57708)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (sku);


--
-- TOC entry 2955 (class 2606 OID 57755)
-- Name: supplier supplier_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pk PRIMARY KEY (bce);


-- Completed on 2021-12-12 18:02:11

--
-- PostgreSQL database dump complete
--

