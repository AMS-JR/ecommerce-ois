--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2021-11-25 18:14:29

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
-- TOC entry 204 (class 1259 OID 57724)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    "orderID" character varying(15) NOT NULL,
    "orderStatus" character varying(10) NOT NULL,
    "orderDate" timestamp without time zone NOT NULL,
    "customerEmail" character varying(30) NOT NULL,
    "customerAddress" character varying(512) NOT NULL,
    "deliveryService" uuid NOT NULL,
    "orderAmount" numeric(10,2) NOT NULL
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
    model character(50)
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
-- TOC entry 3018 (class 0 OID 57709)
-- Dependencies: 201
-- Data for Name: Brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brand" (name) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 57745)
-- Dependencies: 208
-- Data for Name: Cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cart" (customer, product, "dateAdded") FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 57712)
-- Dependencies: 202
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" (name, description) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 57718)
-- Dependencies: 203
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Image" (url) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 57724)
-- Dependencies: 204
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" ("orderID", "orderStatus", "orderDate", "customerEmail", "customerAddress", "deliveryService", "orderAmount") FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 57730)
-- Dependencies: 205
-- Data for Name: OrderDescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderDescription" ("order", product, quantity) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 57701)
-- Dependencies: 200
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (sku, name, color, "itemCondition", description, "stockQuantity", location, "dateAdded", brand, category, "adminSeller", "supplierSeller", price, model) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 57733)
-- Dependencies: 206
-- Data for Name: ProductImages ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductImages " (product, "imageUrl") FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 57739)
-- Dependencies: 207
-- Data for Name: Reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Reviews" (author, about, "reviewBody", "reviewRatingValue", "dateCreated", "dateModified") FROM stdin;
\.


--
-- TOC entry 2886 (class 2606 OID 57708)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (sku);


-- Completed on 2021-11-25 18:14:30

--
-- PostgreSQL database dump complete
--

