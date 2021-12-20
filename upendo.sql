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
-- TOC entry 222 (class 1259 Oid 65945)
-- name: admin; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."admin" (
    name character varying(30) NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(30) NOT NULL
);


ALTER TABLE public."admin" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 Oid 57709)
-- name: brand; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."brand" (
    name character varying(30) NOT NULL
);


ALTER TABLE public."brand" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 Oid 57745)
-- name: cart; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."cart" (
    customer character varying(256) NOT NULL,
    product character varying(30) NOT NULL,
    "dateadded" timestamp without time zone
);


ALTER TABLE public."cart" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 Oid 57712)
-- name: category; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."category" (
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public."category" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 Oid 66067)
-- name: inventory; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."inventory" (
    productsku_fk character varying(30) NOT NULL,
    quantity numeric(5,0) NOT NULL,
    warehousecode_fk character varying(10) NOT NULL
);


ALTER TABLE public."inventory" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 Oid 57724)
-- name: order; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."order" (
    "orderid" character varying(15) NOT NULL,
    "orderstatus" character varying(128) NOT NULL,
    "orderdate" timestamp without time zone NOT NULL,
    "customeremail" character varying(256) NOT NULL,
    "customeraddress" character varying(512) NOT NULL,
    "orderamount" numeric(10,2) NOT NULL,
    "deliveryservice" character varying(128) NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 Oid 57730)
-- name: orderdescription; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."orderdescription" (
    "order" character varying(15) NOT NULL,
    product character varying(30) NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public."orderdescription" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 Oid 65900)
-- name: paymentcard; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."paymentcard" (
    "cardtype" character varying(10) NOT NULL,
    "cardnumber" character varying(17) NOT NULL,
    "cardholdername" character varying(100) NOT NULL,
    "cardexpirydate" date NOT NULL,
    "customeremail" character varying(256) NOT NULL
);


ALTER TABLE public."paymentcard" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 Oid 57701)
-- name: product; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."product" (
    sku character varying(30) NOT NULL,
    name character varying(200) NOT NULL,
    color character varying(20),
    "itemcondition" character varying(20) NOT NULL,
    description character varying(512),
    "stockquantity" integer NOT NULL,
    location character varying(50) NOT NULL,
    "dateadded" timestamp without time zone NOT NULL,
    brand character varying(30),
    category character varying(30),
    "adminseller" character varying(30),
    "supplierseller" character varying(10),
    price numeric(10,2) NOT NULL,
    model character varying
);


ALTER TABLE public."product" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 Oid 57733)
-- name: productimages ; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."productimages " (
    product character varying(30) NOT NULL,
    "imageurl" character varying NOT NULL
);


ALTER TABLE public."productimages " OWNER TO postgres;

--
-- TOC entry 206 (class 1259 Oid 57739)
-- name: reviews; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."reviews" (
    author character varying(256) NOT NULL,
    about character varying(30) NOT NULL,
    "reviewbody" text NOT NULL,
    "reviewratingvalue" bigint NOT NULL,
    "datecreated" timestamp without time zone NOT NULL,
    "datemodified" timestamp without time zone NOT NULL
);


ALTER TABLE public."reviews" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 Oid 57767)
-- name: suppliesstock; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."suppliesstock" (
    supply integer NOT NULL,
    sku character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public."suppliesstock" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 Oid 57765)
-- name: suppliesstock_supply_seq; type: SEQUENCE; Schema: public; Owner: postgres
--

creatE SEQUENCE public."suppliesstock_supply_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINvalue
    NO MAXvalue
    CACHE 1;


ALTER TABLE public."suppliesstock_supply_seq" OWNER TO postgres;

--
-- TOC entry 3210 (class 0 Oid 0)
-- Dependencies: 211
-- name: suppliesstock_supply_seq; type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."suppliesstock_supply_seq" OWNED BY public."suppliesstock".supply;


--
-- TOC entry 225 (class 1259 Oid 65968)
-- name: transportcompany; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."transportcompany" (
    name character varying(50) NOT NULL,
    price_per_km double precision DEFAULT 0,
    api_key character varying(50) DEFAULT 'missing'::character varying
);


ALTER TABLE public."transportcompany" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 Oid 65936)
-- name: warehouse; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public."warehouse" (
    "warehousecode" character varying(10) NOT NULL,
    "companyname" character varying(128) NOT NULL,
    email character varying(256) NOT NULL,
    telephone character varying(20) NOT NULL,
    "addresscountry" character varying(3) NOT NULL,
    "addresscity" character varying(50) NOT NULL,
    "addresslocality" character varying(50) NOT NULL,
    "postalcode" character varying(25) NOT NULL,
    "streetaddress" character varying(256) NOT NULL
);


ALTER TABLE public."warehouse" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 Oid 65903)
-- name: customer_receipt_connector; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.customer_receipt_connector (
    email character varying(256) NOT NULL,
    receipt_id character varying(64) NOT NULL
);


ALTER TABLE public.customer_receipt_connector OWNER TO postgres;

--
-- TOC entry 215 (class 1259 Oid 65906)
-- name: customers_addresses; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.customers_addresses (
    email character varying(256) NOT NULL,
    country character varying(128) NOT NULL,
    city character varying(128) NOT NULL,
    address character varying(512) NOT NULL
);


ALTER TABLE public.customers_addresses OWNER TO postgres;

--
-- TOC entry 216 (class 1259 Oid 65912)
-- name: customers_information; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.customers_information (
    first_name character varying(128) NOT NULL,
    last_name character varying(128) NOT NULL,
    birth_date date,
    delivery_kind character varying(128) NOT NULL,
    email character varying(256) NOT NULL,
    phone_number character varying(20)
);


ALTER TABLE public.customers_information OWNER TO postgres;

--
-- TOC entry 217 (class 1259 Oid 65918)
-- name: delivery_services_type; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.delivery_services_type (
    delivery_kind character varying(128) NOT NULL,
    price double precision NOT NULL,
    delivery_duration integer NOT NULL
);


ALTER TABLE public.delivery_services_type OWNER TO postgres;

--
-- TOC entry 218 (class 1259 Oid 65921)
-- name: delivery_status_description; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.delivery_status_description (
    delivery_status character varying(128) NOT NULL,
    decription text NOT NULL
);


ALTER TABLE public.delivery_status_description OWNER TO postgres;

--
-- TOC entry 224 (class 1259 Oid 65956)
-- name: deliverytrip; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.deliverytrip (
    id character varying(255) NOT NULL,
    departure_time timestamp without time zone,
    arrival_time timestamp without time zone,
    truck character varying(255) NOT NULL,
    starting_warehouse character varying(10) NOT NULL
);


ALTER TABLE public.deliverytrip OWNER TO postgres;

--
-- TOC entry 219 (class 1259 Oid 65927)
-- name: goods_in_receipt; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.goods_in_receipt (
    receipt_id character varying(64) NOT NULL,
    good_id character varying(64) NOT NULL,
    numberof integer NOT NULL
);


ALTER TABLE public.goods_in_receipt OWNER TO postgres;

--
-- TOC entry 220 (class 1259 Oid 65930)
-- name: receipt_information; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.receipt_information (
    receipt_id character varying(64) NOT NULL,
    date date NOT NULL,
    delivery_status character varying(128) NOT NULL,
    delivery_type character varying(128) NOT NULL,
    email character varying(256),
    "orderamount" integer,
    address text
);


ALTER TABLE public.receipt_information OWNER TO postgres;

--
-- TOC entry 208 (class 1259 Oid 57748)
-- name: supplier; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.supplier (
    bce character varying(10) NOT NULL,
    "companyname" character varying(100) NOT NULL,
    email character varying(250) NOT NULL,
    telephone character varying(30) NOT NULL,
    url character varying(150),
    "addresscountry" character varying(3) NOT NULL,
    "addresscity" character varying(50),
    "addresslocality" character varying(50),
    "postalcode" character varying(25),
    "streetaddress" character varying(250)
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 210 (class 1259 Oid 57758)
-- name: supplies; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.supplies (
    "suppliesid" integer NOT NULL,
    "supplierBce" character varying(10) NOT NULL,
    "warehousecode" character varying(10) NOT NULL,
    "arrivaldate" timestamp without time zone DEFAULT now() NOT NULL,
    "supplyState" character(1) DEFAULT 'A'::bpchar NOT NULL
);


ALTER TABLE public.supplies OWNER TO postgres;

--
-- TOC entry 209 (class 1259 Oid 57756)
-- name: supplies_suppliesid_seq; type: SEQUENCE; Schema: public; Owner: postgres
--

creatE SEQUENCE public."supplies_suppliesid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINvalue
    NO MAXvalue
    CACHE 1;


ALTER TABLE public."supplies_suppliesid_seq" OWNER TO postgres;

--
-- TOC entry 3211 (class 0 Oid 0)
-- Dependencies: 209
-- name: supplies_suppliesid_seq; type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."supplies_suppliesid_seq" OWNED BY public.supplies."suppliesid";


--
-- TOC entry 223 (class 1259 Oid 65948)
-- name: transportvehicle; type: TABLE; Schema: public; Owner: postgres
--

creatE TABLE public.transportvehicle (
    id character varying(255) NOT NULL,
    "position" character(50),
    company character varying(255) NOT NULL
);


ALTER TABLE public.transportvehicle OWNER TO postgres;

--
-- TOC entry 2964 (class 2604 Oid 57770)
-- name: suppliesstock supply; type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."suppliesstock" ALTER COLUMN supply SET DEFAULT nextval('public."suppliesstock_supply_seq"'::regclass);


--
-- TOC entry 2961 (class 2604 Oid 57761)
-- name: supplies suppliesid; type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies ALTER COLUMN "suppliesid" SET DEFAULT nextval('public."supplies_suppliesid_seq"'::regclass);


--
-- TOC entry 3200 (class 0 Oid 65945)
-- Dependencies: 222
-- Data for name: admin; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."admin" (name, telephone, email) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 Oid 57709)
-- Dependencies: 201
-- Data for name: brand; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."brand" (name) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 Oid 57745)
-- Dependencies: 207
-- Data for name: cart; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."cart" (customer, product, "dateadded") FROM stdin;
\.


--
-- TOC entry 3180 (class 0 Oid 57712)
-- Dependencies: 202
-- Data for name: category; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."category" (name, description) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 Oid 66067)
-- Dependencies: 226
-- Data for name: inventory; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."inventory" (productsku_fk, quantity, warehousecode_fk) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 Oid 57724)
-- Dependencies: 203
-- Data for name: order; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" ("orderid", "orderstatus", "orderdate", "customeremail", "customeraddress", "orderamount", "deliveryservice") FROM stdin;
\.


--
-- TOC entry 3182 (class 0 Oid 57730)
-- Dependencies: 204
-- Data for name: orderdescription; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."orderdescription" ("order", product, quantity) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 Oid 65900)
-- Dependencies: 213
-- Data for name: paymentcard; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."paymentcard" ("cardtype", "cardnumber", "cardholdername", "cardexpirydate", "customeremail") FROM stdin;
\.


--
-- TOC entry 3178 (class 0 Oid 57701)
-- Dependencies: 200
-- Data for name: product; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."product" (sku, name, color, "itemcondition", description, "stockquantity", location, "dateadded", brand, category, "adminseller", "supplierseller", price, model) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 Oid 57733)
-- Dependencies: 205
-- Data for name: productimages ; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."productimages " (product, "imageurl") FROM stdin;
\.


--
-- TOC entry 3184 (class 0 Oid 57739)
-- Dependencies: 206
-- Data for name: reviews; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reviews" (author, about, "reviewbody", "reviewratingvalue", "datecreated", "datemodified") FROM stdin;
\.


--
-- TOC entry 3190 (class 0 Oid 57767)
-- Dependencies: 212
-- Data for name: suppliesstock; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."suppliesstock" (supply, sku, name, quantity, price) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 Oid 65968)
-- Dependencies: 225
-- Data for name: transportcompany; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."transportcompany" (name, price_per_km, api_key) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 Oid 65936)
-- Dependencies: 221
-- Data for name: warehouse; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."warehouse" ("warehousecode", "companyname", email, telephone, "addresscountry", "addresscity", "addresslocality", "postalcode", "streetaddress") FROM stdin;
\.


--
-- TOC entry 3192 (class 0 Oid 65903)
-- Dependencies: 214
-- Data for name: customer_receipt_connector; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_receipt_connector (email, receipt_id) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 Oid 65906)
-- Dependencies: 215
-- Data for name: customers_addresses; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_addresses (email, country, city, address) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 Oid 65912)
-- Dependencies: 216
-- Data for name: customers_information; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 Oid 65918)
-- Dependencies: 217
-- Data for name: delivery_services_type; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_services_type (delivery_kind, price, delivery_duration) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 Oid 65921)
-- Dependencies: 218
-- Data for name: delivery_status_description; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_status_description (delivery_status, decription) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 Oid 65956)
-- Dependencies: 224
-- Data for name: deliverytrip; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliverytrip (id, departure_time, arrival_time, truck, starting_warehouse) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 Oid 65927)
-- Dependencies: 219
-- Data for name: goods_in_receipt; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goods_in_receipt (receipt_id, good_id, numberof) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 Oid 65930)
-- Dependencies: 220
-- Data for name: receipt_information; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_information (receipt_id, date, delivery_status, delivery_type, email, "orderamount", address) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 Oid 57748)
-- Dependencies: 208
-- Data for name: supplier; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (bce, "companyname", email, telephone, url, "addresscountry", "addresscity", "addresslocality", "postalcode", "streetaddress") FROM stdin;
\.


--
-- TOC entry 3188 (class 0 Oid 57758)
-- Dependencies: 210
-- Data for name: supplies; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplies ("suppliesid", "supplierBce", "warehousecode", "arrivaldate", "supplyState") FROM stdin;
\.


--
-- TOC entry 3201 (class 0 Oid 65948)
-- Dependencies: 223
-- Data for name: transportvehicle; type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportvehicle (id, "position", company) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 Oid 0)
-- Dependencies: 211
-- name: suppliesstock_supply_seq; type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."suppliesstock_supply_seq"', 1, false);


--
-- TOC entry 3213 (class 0 Oid 0)
-- Dependencies: 209
-- name: supplies_suppliesid_seq; type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."supplies_suppliesid_seq"', 1, false);


--
-- TOC entry 3008 (class 2606 Oid 65976)
-- name: admin admin_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."admin"
    add CONSTRAINT "admin_pkey" PRIMARY KEY (email);


--
-- TOC entry 2970 (class 2606 Oid 65996)
-- name: brand brand_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."brand"
    add CONSTRAINT "brand_pkey" PRIMARY KEY (name);


--
-- TOC entry 2982 (class 2606 Oid 66035)
-- name: cart cart_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cart"
    add CONSTRAINT "cart_pkey" PRIMARY KEY (customer, product);


--
-- TOC entry 2972 (class 2606 Oid 66003)
-- name: category category_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."category"
    add CONSTRAINT "category_pkey" PRIMARY KEY (name);


--
-- TOC entry 3016 (class 2606 Oid 66071)
-- name: inventory inventory_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."inventory"
    add CONSTRAINT "inventory_pkey" PRIMARY KEY (productsku_fk, warehousecode_fk);


--
-- TOC entry 2976 (class 2606 Oid 66090)
-- name: orderdescription orderdescription_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."orderdescription"
    add CONSTRAINT "orderdescription_pkey" PRIMARY KEY ("order", product);


--
-- TOC entry 2974 (class 2606 Oid 66083)
-- name: order order_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    add CONSTRAINT "order_pkey" PRIMARY KEY ("orderid");


--
-- TOC entry 2990 (class 2606 Oid 66102)
-- name: paymentcard paymentcard_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."paymentcard"
    add CONSTRAINT "paymentcard_pkey" PRIMARY KEY ("cardtype", "cardnumber");


--
-- TOC entry 2978 (class 2606 Oid 66010)
-- name: productimages  productimages _pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productimages "
    add CONSTRAINT "productimages _pkey" PRIMARY KEY (product, "imageurl");


--
-- TOC entry 2968 (class 2606 Oid 57708)
-- name: product product_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."product"
    add CONSTRAINT "product_pkey" PRIMARY KEY (sku);


--
-- TOC entry 2980 (class 2606 Oid 66021)
-- name: reviews reviews_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reviews"
    add CONSTRAINT "reviews_pkey" PRIMARY KEY (author, about);


--
-- TOC entry 2988 (class 2606 Oid 66061)
-- name: suppliesstock suppliesstock_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."suppliesstock"
    add CONSTRAINT "suppliesstock_pkey" PRIMARY KEY (supply, sku);


--
-- TOC entry 3014 (class 2606 Oid 66171)
-- name: transportcompany transportcompany_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."transportcompany"
    add CONSTRAINT "transportcompany_pkey" PRIMARY KEY (name);


--
-- TOC entry 3006 (class 2606 Oid 66047)
-- name: warehouse warehouse_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."warehouse"
    add CONSTRAINT "warehouse_pkey" PRIMARY KEY ("warehousecode");


--
-- TOC entry 2992 (class 2606 Oid 66111)
-- name: customer_receipt_connector customer_receipt_connector_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    add CONSTRAINT customer_receipt_connector_pkey PRIMARY KEY (email, receipt_id);


--
-- TOC entry 2994 (class 2606 Oid 66113)
-- name: customers_addresses customers_addresses_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    add CONSTRAINT customers_addresses_pkey PRIMARY KEY (email, country, city, address);


--
-- TOC entry 2996 (class 2606 Oid 66019)
-- name: customers_information customers_information_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    add CONSTRAINT customers_information_pkey PRIMARY KEY (email);


--
-- TOC entry 2998 (class 2606 Oid 66115)
-- name: delivery_services_type delivery_services_type_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_services_type
    add CONSTRAINT delivery_services_type_pkey PRIMARY KEY (delivery_kind);


--
-- TOC entry 3000 (class 2606 Oid 66117)
-- name: delivery_status_description delivery_status_description_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_status_description
    add CONSTRAINT delivery_status_description_pkey PRIMARY KEY (delivery_status);


--
-- TOC entry 3012 (class 2606 Oid 65963)
-- name: deliverytrip deliverytrip_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverytrip
    add CONSTRAINT deliverytrip_pkey PRIMARY KEY (id);


--
-- TOC entry 3002 (class 2606 Oid 66119)
-- name: goods_in_receipt goods_in_receipt_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_in_receipt
    add CONSTRAINT goods_in_receipt_pkey PRIMARY KEY (receipt_id, good_id);


--
-- TOC entry 3004 (class 2606 Oid 66109)
-- name: receipt_information receipt_information_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    add CONSTRAINT receipt_information_pkey PRIMARY KEY (receipt_id);


--
-- TOC entry 2984 (class 2606 Oid 57755)
-- name: supplier supplier_pk; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    add CONSTRAINT supplier_pk PRIMARY KEY (bce);


--
-- TOC entry 2986 (class 2606 Oid 66049)
-- name: supplies supplies_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    add CONSTRAINT supplies_pkey PRIMARY KEY ("suppliesid");


--
-- TOC entry 3010 (class 2606 Oid 65955)
-- name: transportvehicle transportvehicle_pkey; type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportvehicle
    add CONSTRAINT transportvehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 3028 (class 2606 Oid 66027)
-- name: reviews about_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reviews"
    add CONSTRAINT about_fkey FOREIGN KEY (about) REFERENCES public."product"(sku) NOT VALid;


--
-- TOC entry 3018 (class 2606 Oid 65985)
-- name: product adminseller_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."product"
    add CONSTRAINT "adminseller_fkey" FOREIGN KEY ("adminseller") REFERENCES public."admin"(email) NOT VALid;


--
-- TOC entry 3027 (class 2606 Oid 66022)
-- name: reviews author_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reviews"
    add CONSTRAINT author_fkey FOREIGN KEY (author) REFERENCES public.customers_information(email) NOT VALid;


--
-- TOC entry 3019 (class 2606 Oid 65997)
-- name: product brand_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."product"
    add CONSTRAINT brand_fkey FOREIGN KEY (brand) REFERENCES public."brand"(name) NOT VALid;


--
-- TOC entry 3020 (class 2606 Oid 66004)
-- name: product category_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."product"
    add CONSTRAINT category_fkey FOREIGN KEY (category) REFERENCES public."category"(name) NOT VALid;


--
-- TOC entry 3043 (class 2606 Oid 66177)
-- name: transportvehicle company_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportvehicle
    add CONSTRAINT company_fkey FOREIGN KEY (company) REFERENCES public."transportcompany"(name) NOT VALid;


--
-- TOC entry 3029 (class 2606 Oid 66036)
-- name: cart customer_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cart"
    add CONSTRAINT customer_fkey FOREIGN KEY (customer) REFERENCES public.customers_information(email) NOT VALid;


--
-- TOC entry 3021 (class 2606 Oid 66084)
-- name: order customer_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    add CONSTRAINT customer_fkey FOREIGN KEY ("customeremail") REFERENCES public.customers_information(email) NOT VALid;


--
-- TOC entry 3034 (class 2606 Oid 66103)
-- name: paymentcard customer_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."paymentcard"
    add CONSTRAINT customer_fkey FOREIGN KEY ("customeremail") REFERENCES public.customers_information(email) NOT VALid;


--
-- TOC entry 3038 (class 2606 Oid 66120)
-- name: customers_information delivery_kind_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    add CONSTRAINT delivery_kind_fkey FOREIGN KEY (delivery_kind) REFERENCES public.delivery_services_type(delivery_kind) NOT VALid;


--
-- TOC entry 3040 (class 2606 Oid 66125)
-- name: receipt_information delivery_status_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    add CONSTRAINT delivery_status_fkey FOREIGN KEY (delivery_status) REFERENCES public.delivery_status_description(delivery_status) NOT VALid;


--
-- TOC entry 3022 (class 2606 Oid 66130)
-- name: order delivery_status_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    add CONSTRAINT delivery_status_fkey FOREIGN KEY ("orderstatus") REFERENCES public.delivery_status_description(delivery_status) NOT VALid;


--
-- TOC entry 3041 (class 2606 Oid 66135)
-- name: receipt_information delivery_type_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    add CONSTRAINT delivery_type_fkey FOREIGN KEY (delivery_type) REFERENCES public.delivery_services_type(delivery_kind) NOT VALid;


--
-- TOC entry 3023 (class 2606 Oid 66140)
-- name: order delivery_type_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    add CONSTRAINT delivery_type_fkey FOREIGN KEY ("deliveryservice") REFERENCES public.delivery_services_type(delivery_kind) NOT VALid;


--
-- TOC entry 3035 (class 2606 Oid 66145)
-- name: customer_receipt_connector email_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    add CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALid;


--
-- TOC entry 3037 (class 2606 Oid 66150)
-- name: customers_addresses email_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    add CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALid;


--
-- TOC entry 3042 (class 2606 Oid 66155)
-- name: receipt_information email_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    add CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALid;


--
-- TOC entry 3024 (class 2606 Oid 66091)
-- name: orderdescription order_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."orderdescription"
    add CONSTRAINT order_fkey FOREIGN KEY ("order") REFERENCES public."order"("orderid") NOT VALid;


--
-- TOC entry 3026 (class 2606 Oid 66011)
-- name: productimages  product_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productimages "
    add CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public."product"(sku) NOT VALid;


--
-- TOC entry 3030 (class 2606 Oid 66041)
-- name: cart product_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cart"
    add CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public."product"(sku) NOT VALid;


--
-- TOC entry 3025 (class 2606 Oid 66096)
-- name: orderdescription product_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."orderdescription"
    add CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public."product"(sku) NOT VALid;


--
-- TOC entry 3046 (class 2606 Oid 66072)
-- name: inventory productsku_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."inventory"
    add CONSTRAINT productsku_fkey FOREIGN KEY (productsku_fk) REFERENCES public."product"(sku) NOT VALid;


--
-- TOC entry 3036 (class 2606 Oid 66160)
-- name: customer_receipt_connector receipt_id_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    add CONSTRAINT receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) NOT VALid;


--
-- TOC entry 3039 (class 2606 Oid 66165)
-- name: goods_in_receipt receipt_id_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_in_receipt
    add CONSTRAINT receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) NOT VALid;


--
-- TOC entry 3017 (class 2606 Oid 65990)
-- name: product supplierseller_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."product"
    add CONSTRAINT "supplierseller_fkey" FOREIGN KEY ("supplierseller") REFERENCES public.supplier(bce) NOT VALid;


--
-- TOC entry 3031 (class 2606 Oid 66050)
-- name: supplies supplier_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    add CONSTRAINT supplier_fkey FOREIGN KEY ("supplierBce") REFERENCES public.supplier(bce) NOT VALid;


--
-- TOC entry 3033 (class 2606 Oid 66062)
-- name: suppliesstock supply_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."suppliesstock"
    add CONSTRAINT supply_fkey FOREIGN KEY (supply) REFERENCES public.supplies("suppliesid") NOT VALid;


--
-- TOC entry 3044 (class 2606 Oid 66172)
-- name: deliverytrip truck_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverytrip
    add CONSTRAINT truck_fkey FOREIGN KEY (truck) REFERENCES public.transportvehicle(id) NOT VALid;


--
-- TOC entry 3032 (class 2606 Oid 66055)
-- name: supplies warehouse_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    add CONSTRAINT warehouse_fkey FOREIGN KEY ("warehousecode") REFERENCES public."warehouse"("warehousecode") NOT VALid;


--
-- TOC entry 3045 (class 2606 Oid 66189)
-- name: deliverytrip warehouse_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverytrip
    add CONSTRAINT warehouse_fkey FOREIGN KEY (starting_warehouse) REFERENCES public."warehouse"("warehousecode") NOT VALid;


--
-- TOC entry 3047 (class 2606 Oid 66077)
-- name: inventory warehousecode_fkey; type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."inventory"
    add CONSTRAINT warehousecode_fkey FOREIGN KEY (warehousecode_fk) REFERENCES public."warehouse"("warehousecode") NOT VALid;


-- Completed on 2021-12-14 22:40:05

--
-- PostgreSQL database dump complete
--
