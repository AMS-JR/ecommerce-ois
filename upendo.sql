--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2021-12-14 22:40:02

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
-- TOC entry 222 (class 1259 OID 65945)
-- Name: Admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Admin" (
    name character varying(30) NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(30) NOT NULL
);


ALTER TABLE public."Admin" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 57709)
-- Name: Brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brand" (
    name character varying(30) NOT NULL
);


ALTER TABLE public."Brand" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 57745)
-- Name: Cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cart" (
    customer character varying(256) NOT NULL,
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
-- TOC entry 226 (class 1259 OID 66067)
-- Name: Inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Inventory" (
    productsku_fk character varying(30) NOT NULL,
    quantity numeric(5,0) NOT NULL,
    warehousecode_fk character varying(10) NOT NULL
);


ALTER TABLE public."Inventory" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 57724)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    "orderID" character varying(15) NOT NULL,
    "orderStatus" character varying(128) NOT NULL,
    "orderDate" timestamp without time zone NOT NULL,
    "customerEmail" character varying(256) NOT NULL,
    "customerAddress" character varying(512) NOT NULL,
    "orderAmount" numeric(10,2) NOT NULL,
    "deliveryService" character varying(128) NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 57730)
-- Name: OrderDescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderDescription" (
    "order" character varying(15) NOT NULL,
    product character varying(30) NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public."OrderDescription" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 65900)
-- Name: PaymentCard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaymentCard" (
    "cardType" character varying(10) NOT NULL,
    "cardNumber" character varying(17) NOT NULL,
    "cardHolderName" character varying(100) NOT NULL,
    "cardExpiryDate" date NOT NULL,
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
    "supplierSeller" character varying(10),
    price numeric(10,2) NOT NULL,
    model character varying
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 57733)
-- Name: ProductImages ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductImages " (
    product character varying(30) NOT NULL,
    "imageUrl" character varying NOT NULL
);


ALTER TABLE public."ProductImages " OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 57739)
-- Name: Reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Reviews" (
    author character varying(256) NOT NULL,
    about character varying(30) NOT NULL,
    "reviewBody" text NOT NULL,
    "reviewRatingValue" bigint NOT NULL,
    "dateCreated" timestamp without time zone NOT NULL,
    "dateModified" timestamp without time zone NOT NULL
);


ALTER TABLE public."Reviews" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 57767)
-- Name: SuppliesStock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SuppliesStock" (
    supply integer NOT NULL,
    sku character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public."SuppliesStock" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 57765)
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
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 211
-- Name: SuppliesStock_supply_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SuppliesStock_supply_seq" OWNED BY public."SuppliesStock".supply;


--
-- TOC entry 225 (class 1259 OID 65968)
-- Name: TransportCompany; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransportCompany" (
    name character varying(50) NOT NULL,
    price_per_km double precision DEFAULT 0,
    api_key character varying(50) DEFAULT 'missing'::character varying
);


ALTER TABLE public."TransportCompany" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 65936)
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
-- TOC entry 214 (class 1259 OID 65903)
-- Name: customer_receipt_connector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_receipt_connector (
    email character varying(256) NOT NULL,
    receipt_id character varying(64) NOT NULL
);


ALTER TABLE public.customer_receipt_connector OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 65906)
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
-- TOC entry 216 (class 1259 OID 65912)
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
-- TOC entry 217 (class 1259 OID 65918)
-- Name: delivery_services_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_services_type (
    delivery_kind character varying(128) NOT NULL,
    price double precision NOT NULL,
    delivery_duration integer NOT NULL
);


ALTER TABLE public.delivery_services_type OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 65921)
-- Name: delivery_status_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_status_description (
    delivery_status character varying(128) NOT NULL,
    decription text NOT NULL
);


ALTER TABLE public.delivery_status_description OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 65956)
-- Name: deliverytrip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliverytrip (
    id character varying(255) NOT NULL,
    departure_time timestamp without time zone,
    arrival_time timestamp without time zone,
    truck character varying(255) NOT NULL,
    starting_warehouse character varying(10) NOT NULL
);


ALTER TABLE public.deliverytrip OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 65927)
-- Name: goods_in_receipt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goods_in_receipt (
    receipt_id character varying(64) NOT NULL,
    good_id character varying(64) NOT NULL,
    numberof integer NOT NULL
);


ALTER TABLE public.goods_in_receipt OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 65930)
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
-- TOC entry 208 (class 1259 OID 57748)
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
-- TOC entry 210 (class 1259 OID 57758)
-- Name: supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplies (
    "suppliesID" integer NOT NULL,
    "supplierBce" character varying(10) NOT NULL,
    "warehouseCode" character varying(10) NOT NULL,
    "arrivalDate" timestamp without time zone DEFAULT now() NOT NULL,
    "supplyState" character(1) DEFAULT 'A'::bpchar NOT NULL
);


ALTER TABLE public.supplies OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 57756)
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
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 209
-- Name: supplies_suppliesID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."supplies_suppliesID_seq" OWNED BY public.supplies."suppliesID";


--
-- TOC entry 223 (class 1259 OID 65948)
-- Name: transportvehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transportvehicle (
    id character varying(255) NOT NULL,
    "position" character(50),
    company character varying(255) NOT NULL
);


ALTER TABLE public.transportvehicle OWNER TO postgres;

--
-- TOC entry 2964 (class 2604 OID 57770)
-- Name: SuppliesStock supply; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SuppliesStock" ALTER COLUMN supply SET DEFAULT nextval('public."SuppliesStock_supply_seq"'::regclass);


--
-- TOC entry 2961 (class 2604 OID 57761)
-- Name: supplies suppliesID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies ALTER COLUMN "suppliesID" SET DEFAULT nextval('public."supplies_suppliesID_seq"'::regclass);


--
-- TOC entry 3200 (class 0 OID 65945)
-- Dependencies: 222
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Admin" (name, telephone, email) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 57709)
-- Dependencies: 201
-- Data for Name: Brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brand" (name) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 57745)
-- Dependencies: 207
-- Data for Name: Cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cart" (customer, product, "dateAdded") FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 57712)
-- Dependencies: 202
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" (name, description) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 66067)
-- Dependencies: 226
-- Data for Name: Inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Inventory" (productsku_fk, quantity, warehousecode_fk) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 57724)
-- Dependencies: 203
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" ("orderID", "orderStatus", "orderDate", "customerEmail", "customerAddress", "orderAmount", "deliveryService") FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 57730)
-- Dependencies: 204
-- Data for Name: OrderDescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderDescription" ("order", product, quantity) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 65900)
-- Dependencies: 213
-- Data for Name: PaymentCard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaymentCard" ("cardType", "cardNumber", "cardHolderName", "cardExpiryDate", "customerEmail") FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 57701)
-- Dependencies: 200
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (sku, name, color, "itemCondition", description, "stockQuantity", location, "dateAdded", brand, category, "adminSeller", "supplierSeller", price, model) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 57733)
-- Dependencies: 205
-- Data for Name: ProductImages ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductImages " (product, "imageUrl") FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 57739)
-- Dependencies: 206
-- Data for Name: Reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Reviews" (author, about, "reviewBody", "reviewRatingValue", "dateCreated", "dateModified") FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 57767)
-- Dependencies: 212
-- Data for Name: SuppliesStock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SuppliesStock" (supply, sku, name, quantity, price) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 65968)
-- Dependencies: 225
-- Data for Name: TransportCompany; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransportCompany" (name, price_per_km, api_key) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 65936)
-- Dependencies: 221
-- Data for Name: Warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Warehouse" ("warehouseCode", "companyName", email, telephone, "addressCountry", "addressCity", "addressLocality", "postalCode", "streetAddress") FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 65903)
-- Dependencies: 214
-- Data for Name: customer_receipt_connector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_receipt_connector (email, receipt_id) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 65906)
-- Dependencies: 215
-- Data for Name: customers_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_addresses (email, country, city, address) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 65912)
-- Dependencies: 216
-- Data for Name: customers_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 65918)
-- Dependencies: 217
-- Data for Name: delivery_services_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_services_type (delivery_kind, price, delivery_duration) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 65921)
-- Dependencies: 218
-- Data for Name: delivery_status_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_status_description (delivery_status, decription) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 65956)
-- Dependencies: 224
-- Data for Name: deliverytrip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliverytrip (id, departure_time, arrival_time, truck, starting_warehouse) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 65927)
-- Dependencies: 219
-- Data for Name: goods_in_receipt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goods_in_receipt (receipt_id, good_id, numberof) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 65930)
-- Dependencies: 220
-- Data for Name: receipt_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_information (receipt_id, date, delivery_status, delivery_type, email, "orderAmount", address) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 57748)
-- Dependencies: 208
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (bce, "companyName", email, telephone, url, "addressCountry", "addressCity", "addressLocality", "postalCode", "streetAddress") FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 57758)
-- Dependencies: 210
-- Data for Name: supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplies ("suppliesID", "supplierBce", "warehouseCode", "arrivalDate", "supplyState") FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 65948)
-- Dependencies: 223
-- Data for Name: transportvehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportvehicle (id, "position", company) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 211
-- Name: SuppliesStock_supply_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SuppliesStock_supply_seq"', 1, false);


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 209
-- Name: supplies_suppliesID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."supplies_suppliesID_seq"', 1, false);


--
-- TOC entry 3008 (class 2606 OID 65976)
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (email);


--
-- TOC entry 2970 (class 2606 OID 65996)
-- Name: Brand Brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (name);


--
-- TOC entry 2982 (class 2606 OID 66035)
-- Name: Cart Cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT "Cart_pkey" PRIMARY KEY (customer, product);


--
-- TOC entry 2972 (class 2606 OID 66003)
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (name);


--
-- TOC entry 3016 (class 2606 OID 66071)
-- Name: Inventory Inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT "Inventory_pkey" PRIMARY KEY (productsku_fk, warehousecode_fk);


--
-- TOC entry 2976 (class 2606 OID 66090)
-- Name: OrderDescription OrderDescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription"
    ADD CONSTRAINT "OrderDescription_pkey" PRIMARY KEY ("order", product);


--
-- TOC entry 2974 (class 2606 OID 66083)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("orderID");


--
-- TOC entry 2990 (class 2606 OID 66102)
-- Name: PaymentCard PaymentCard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentCard"
    ADD CONSTRAINT "PaymentCard_pkey" PRIMARY KEY ("cardType", "cardNumber");


--
-- TOC entry 2978 (class 2606 OID 66010)
-- Name: ProductImages  ProductImages _pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImages "
    ADD CONSTRAINT "ProductImages _pkey" PRIMARY KEY (product, "imageUrl");


--
-- TOC entry 2968 (class 2606 OID 57708)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (sku);


--
-- TOC entry 2980 (class 2606 OID 66021)
-- Name: Reviews Reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reviews"
    ADD CONSTRAINT "Reviews_pkey" PRIMARY KEY (author, about);


--
-- TOC entry 2988 (class 2606 OID 66061)
-- Name: SuppliesStock SuppliesStock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SuppliesStock"
    ADD CONSTRAINT "SuppliesStock_pkey" PRIMARY KEY (supply, sku);


--
-- TOC entry 3014 (class 2606 OID 66171)
-- Name: TransportCompany TransportCompany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransportCompany"
    ADD CONSTRAINT "TransportCompany_pkey" PRIMARY KEY (name);


--
-- TOC entry 3006 (class 2606 OID 66047)
-- Name: Warehouse Warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Warehouse"
    ADD CONSTRAINT "Warehouse_pkey" PRIMARY KEY ("warehouseCode");


--
-- TOC entry 2992 (class 2606 OID 66111)
-- Name: customer_receipt_connector customer_receipt_connector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT customer_receipt_connector_pkey PRIMARY KEY (email, receipt_id);


--
-- TOC entry 2994 (class 2606 OID 66113)
-- Name: customers_addresses customers_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    ADD CONSTRAINT customers_addresses_pkey PRIMARY KEY (email, country, city, address);


--
-- TOC entry 2996 (class 2606 OID 66019)
-- Name: customers_information customers_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    ADD CONSTRAINT customers_information_pkey PRIMARY KEY (email);


--
-- TOC entry 2998 (class 2606 OID 66115)
-- Name: delivery_services_type delivery_services_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_services_type
    ADD CONSTRAINT delivery_services_type_pkey PRIMARY KEY (delivery_kind);


--
-- TOC entry 3000 (class 2606 OID 66117)
-- Name: delivery_status_description delivery_status_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_status_description
    ADD CONSTRAINT delivery_status_description_pkey PRIMARY KEY (delivery_status);


--
-- TOC entry 3012 (class 2606 OID 65963)
-- Name: deliverytrip deliverytrip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverytrip
    ADD CONSTRAINT deliverytrip_pkey PRIMARY KEY (id);


--
-- TOC entry 3002 (class 2606 OID 66119)
-- Name: goods_in_receipt goods_in_receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_in_receipt
    ADD CONSTRAINT goods_in_receipt_pkey PRIMARY KEY (receipt_id, good_id);


--
-- TOC entry 3004 (class 2606 OID 66109)
-- Name: receipt_information receipt_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT receipt_information_pkey PRIMARY KEY (receipt_id);


--
-- TOC entry 2984 (class 2606 OID 57755)
-- Name: supplier supplier_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pk PRIMARY KEY (bce);


--
-- TOC entry 2986 (class 2606 OID 66049)
-- Name: supplies supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY ("suppliesID");


--
-- TOC entry 3010 (class 2606 OID 65955)
-- Name: transportvehicle transportvehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportvehicle
    ADD CONSTRAINT transportvehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 3028 (class 2606 OID 66027)
-- Name: Reviews about_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reviews"
    ADD CONSTRAINT about_fkey FOREIGN KEY (about) REFERENCES public."Product"(sku) NOT VALID;


--
-- TOC entry 3018 (class 2606 OID 65985)
-- Name: Product adminSeller_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "adminSeller_fkey" FOREIGN KEY ("adminSeller") REFERENCES public."Admin"(email) NOT VALID;


--
-- TOC entry 3027 (class 2606 OID 66022)
-- Name: Reviews author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reviews"
    ADD CONSTRAINT author_fkey FOREIGN KEY (author) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3019 (class 2606 OID 65997)
-- Name: Product brand_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT brand_fkey FOREIGN KEY (brand) REFERENCES public."Brand"(name) NOT VALID;


--
-- TOC entry 3020 (class 2606 OID 66004)
-- Name: Product category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT category_fkey FOREIGN KEY (category) REFERENCES public."Category"(name) NOT VALID;


--
-- TOC entry 3043 (class 2606 OID 66177)
-- Name: transportvehicle company_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportvehicle
    ADD CONSTRAINT company_fkey FOREIGN KEY (company) REFERENCES public."TransportCompany"(name) NOT VALID;


--
-- TOC entry 3029 (class 2606 OID 66036)
-- Name: Cart customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3021 (class 2606 OID 66084)
-- Name: Order customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT customer_fkey FOREIGN KEY ("customerEmail") REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3034 (class 2606 OID 66103)
-- Name: PaymentCard customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentCard"
    ADD CONSTRAINT customer_fkey FOREIGN KEY ("customerEmail") REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3038 (class 2606 OID 66120)
-- Name: customers_information delivery_kind_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    ADD CONSTRAINT delivery_kind_fkey FOREIGN KEY (delivery_kind) REFERENCES public.delivery_services_type(delivery_kind) NOT VALID;


--
-- TOC entry 3040 (class 2606 OID 66125)
-- Name: receipt_information delivery_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT delivery_status_fkey FOREIGN KEY (delivery_status) REFERENCES public.delivery_status_description(delivery_status) NOT VALID;


--
-- TOC entry 3022 (class 2606 OID 66130)
-- Name: Order delivery_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT delivery_status_fkey FOREIGN KEY ("orderStatus") REFERENCES public.delivery_status_description(delivery_status) NOT VALID;


--
-- TOC entry 3041 (class 2606 OID 66135)
-- Name: receipt_information delivery_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT delivery_type_fkey FOREIGN KEY (delivery_type) REFERENCES public.delivery_services_type(delivery_kind) NOT VALID;


--
-- TOC entry 3023 (class 2606 OID 66140)
-- Name: Order delivery_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT delivery_type_fkey FOREIGN KEY ("deliveryService") REFERENCES public.delivery_services_type(delivery_kind) NOT VALID;


--
-- TOC entry 3035 (class 2606 OID 66145)
-- Name: customer_receipt_connector email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3037 (class 2606 OID 66150)
-- Name: customers_addresses email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    ADD CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3042 (class 2606 OID 66155)
-- Name: receipt_information email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3024 (class 2606 OID 66091)
-- Name: OrderDescription order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription"
    ADD CONSTRAINT order_fkey FOREIGN KEY ("order") REFERENCES public."Order"("orderID") NOT VALID;


--
-- TOC entry 3026 (class 2606 OID 66011)
-- Name: ProductImages  product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImages "
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public."Product"(sku) NOT VALID;


--
-- TOC entry 3030 (class 2606 OID 66041)
-- Name: Cart product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public."Product"(sku) NOT VALID;


--
-- TOC entry 3025 (class 2606 OID 66096)
-- Name: OrderDescription product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription"
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public."Product"(sku) NOT VALID;


--
-- TOC entry 3046 (class 2606 OID 66072)
-- Name: Inventory productsku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT productsku_fkey FOREIGN KEY (productsku_fk) REFERENCES public."Product"(sku) NOT VALID;


--
-- TOC entry 3036 (class 2606 OID 66160)
-- Name: customer_receipt_connector receipt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) NOT VALID;


--
-- TOC entry 3039 (class 2606 OID 66165)
-- Name: goods_in_receipt receipt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_in_receipt
    ADD CONSTRAINT receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) NOT VALID;


--
-- TOC entry 3017 (class 2606 OID 65990)
-- Name: Product supplierSeller_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "supplierSeller_fkey" FOREIGN KEY ("supplierSeller") REFERENCES public.supplier(bce) NOT VALID;


--
-- TOC entry 3031 (class 2606 OID 66050)
-- Name: supplies supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplier_fkey FOREIGN KEY ("supplierBce") REFERENCES public.supplier(bce) NOT VALID;


--
-- TOC entry 3033 (class 2606 OID 66062)
-- Name: SuppliesStock supply_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SuppliesStock"
    ADD CONSTRAINT supply_fkey FOREIGN KEY (supply) REFERENCES public.supplies("suppliesID") NOT VALID;


--
-- TOC entry 3044 (class 2606 OID 66172)
-- Name: deliverytrip truck_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverytrip
    ADD CONSTRAINT truck_fkey FOREIGN KEY (truck) REFERENCES public.transportvehicle(id) NOT VALID;


--
-- TOC entry 3032 (class 2606 OID 66055)
-- Name: supplies warehouse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT warehouse_fkey FOREIGN KEY ("warehouseCode") REFERENCES public."Warehouse"("warehouseCode") NOT VALID;


--
-- TOC entry 3045 (class 2606 OID 66189)
-- Name: deliverytrip warehouse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverytrip
    ADD CONSTRAINT warehouse_fkey FOREIGN KEY (starting_warehouse) REFERENCES public."Warehouse"("warehouseCode") NOT VALID;


--
-- TOC entry 3047 (class 2606 OID 66077)
-- Name: Inventory warehousecode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT warehousecode_fkey FOREIGN KEY (warehousecode_fk) REFERENCES public."Warehouse"("warehouseCode") NOT VALID;


-- Completed on 2021-12-14 22:40:05

--
-- PostgreSQL database dump complete
--

