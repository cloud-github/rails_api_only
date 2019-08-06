--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4 (Ubuntu 11.4-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.4 (Ubuntu 11.4-1.pgdg18.04+1)

-- Started on 2019-08-05 22:33:30 +0545

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

SET default_with_oids = false;

--
-- TOC entry 257 (class 1259 OID 16830)
-- Name: macro_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.macro_categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 16828)
-- Name: macro_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.macro_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 256
-- Name: macro_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.macro_categories_id_seq OWNED BY public.macro_categories.id;


--
-- TOC entry 3164 (class 2604 OID 16833)
-- Name: macro_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.macro_categories ALTER COLUMN id SET DEFAULT nextval('public.macro_categories_id_seq'::regclass);


--
-- TOC entry 3289 (class 0 OID 16830)
-- Dependencies: 257
-- Data for Name: macro_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.macro_categories (id, name, created_at, updated_at) FROM stdin;
1	cat1	2019-06-19 13:31:33.098102	2019-06-19 13:31:33.098102
\.


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 256
-- Name: macro_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.macro_categories_id_seq', 1, true);


--
-- TOC entry 3166 (class 2606 OID 16838)
-- Name: macro_categories macro_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.macro_categories
    ADD CONSTRAINT macro_categories_pkey PRIMARY KEY (id);


-- Completed on 2019-08-05 22:33:30 +0545

--
-- PostgreSQL database dump complete
--

