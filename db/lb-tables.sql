-- Get the user from environment variables
\set db_user `echo "$POSTGRES_USER"`

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accesstoken; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE accesstoken (
    id text NOT NULL,
    ttl integer DEFAULT 1209600,
    scopes text,
    created timestamp with time zone,
    userid text
);


ALTER TABLE accesstoken OWNER TO :db_user;

--
-- Name: acl; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE acl (
    model text,
    property text,
    accesstype text,
    permission text,
    principaltype text,
    principalid text,
    id integer NOT NULL
);


ALTER TABLE acl OWNER TO :db_user;

--
-- Name: acl_id_seq; Type: SEQUENCE; Schema: public; Owner: :db_user
--

CREATE SEQUENCE acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acl_id_seq OWNER TO :db_user;

--
-- Name: acl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: :db_user
--

ALTER SEQUENCE acl_id_seq OWNED BY acl.id;


--
-- Name: actual_item; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE actual_item (
    id text NOT NULL,
    value integer NOT NULL,
    value_date timestamp with time zone,
    comment text,
    created timestamp with time zone,
    modified timestamp with time zone,
    expected_item_id text,
    budget_id text
);


ALTER TABLE actual_item OWNER TO :db_user;

--
-- Name: budget; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE budget (
    id text DEFAULT 'uuidv4'::text NOT NULL,
    name text NOT NULL,
    period text NOT NULL,
    archived boolean DEFAULT false,
    created timestamp with time zone,
    modified timestamp with time zone
);


ALTER TABLE budget OWNER TO :db_user;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE customer (
    id text NOT NULL,
    picture text,
    created timestamp with time zone,
    modified timestamp with time zone,
    realm text,
    username text,
    password text NOT NULL,
    email text NOT NULL,
    emailverified boolean,
    verificationtoken text
);


ALTER TABLE customer OWNER TO :db_user;

--
-- Name: customerbudget; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE customerbudget (
    id integer NOT NULL,
    customerid text,
    budgetid text
);


ALTER TABLE customerbudget OWNER TO :db_user;

--
-- Name: customerbudget_id_seq; Type: SEQUENCE; Schema: public; Owner: :db_user
--

CREATE SEQUENCE customerbudget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customerbudget_id_seq OWNER TO :db_user;

--
-- Name: customerbudget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: :db_user
--

ALTER SEQUENCE customerbudget_id_seq OWNED BY customerbudget.id;


--
-- Name: expected_item; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE expected_item (
    id text NOT NULL,
    item_type text NOT NULL,
    name text NOT NULL,
    period text NOT NULL,
    value integer NOT NULL,
    due_date timestamp with time zone,
    archived boolean DEFAULT false,
    created timestamp with time zone,
    modified timestamp with time zone,
    budget_id text
);


ALTER TABLE expected_item OWNER TO :db_user;

--
-- Name: role; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE role (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    created timestamp with time zone,
    modified timestamp with time zone
);


ALTER TABLE role OWNER TO :db_user;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: :db_user
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_id_seq OWNER TO :db_user;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: :db_user
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: rolemapping; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE rolemapping (
    id integer NOT NULL,
    principaltype text,
    principalid text,
    roleid integer
);


ALTER TABLE rolemapping OWNER TO :db_user;

--
-- Name: rolemapping_id_seq; Type: SEQUENCE; Schema: public; Owner: :db_user
--

CREATE SEQUENCE rolemapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rolemapping_id_seq OWNER TO :db_user;

--
-- Name: rolemapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: :db_user
--

ALTER SEQUENCE rolemapping_id_seq OWNED BY rolemapping.id;


--
-- Name: acl id; Type: DEFAULT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY acl ALTER COLUMN id SET DEFAULT nextval('acl_id_seq'::regclass);


--
-- Name: customerbudget id; Type: DEFAULT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY customerbudget ALTER COLUMN id SET DEFAULT nextval('customerbudget_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Name: rolemapping id; Type: DEFAULT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY rolemapping ALTER COLUMN id SET DEFAULT nextval('rolemapping_id_seq'::regclass);


--
-- Data for Name: accesstoken; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY accesstoken (id, ttl, scopes, created, userid) FROM stdin;
\.


--
-- Data for Name: acl; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY acl (model, property, accesstype, permission, principaltype, principalid, id) FROM stdin;
\.


--
-- Name: acl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: :db_user
--

SELECT pg_catalog.setval('acl_id_seq', 1, false);


--
-- Data for Name: actual_item; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY actual_item (id, value, value_date, comment, created, modified, expected_item_id, budget_id) FROM stdin;
\.


--
-- Data for Name: budget; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY budget (id, name, period, archived, created, modified) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY customer (id, picture, created, modified, realm, username, password, email, emailverified, verificationtoken) FROM stdin;
\.


--
-- Data for Name: customerbudget; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY customerbudget (id, customerid, budgetid) FROM stdin;
\.


--
-- Name: customerbudget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: :db_user
--

SELECT pg_catalog.setval('customerbudget_id_seq', 1, false);


--
-- Data for Name: expected_item; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY expected_item (id, item_type, name, period, value, due_date, archived, created, modified, budget_id) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY role (id, name, description, created, modified) FROM stdin;
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: :db_user
--

SELECT pg_catalog.setval('role_id_seq', 1, false);


--
-- Data for Name: rolemapping; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY rolemapping (id, principaltype, principalid, roleid) FROM stdin;
\.


--
-- Name: rolemapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: :db_user
--

SELECT pg_catalog.setval('rolemapping_id_seq', 1, false);


--
-- Name: accesstoken accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY accesstoken
    ADD CONSTRAINT accesstoken_pkey PRIMARY KEY (id);


--
-- Name: acl acl_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY acl
    ADD CONSTRAINT acl_pkey PRIMARY KEY (id);


--
-- Name: actual_item actual_item_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY actual_item
    ADD CONSTRAINT actual_item_pkey PRIMARY KEY (id);


--
-- Name: budget budget_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY budget
    ADD CONSTRAINT budget_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: customerbudget customerbudget_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY customerbudget
    ADD CONSTRAINT customerbudget_pkey PRIMARY KEY (id);


--
-- Name: expected_item expected_item_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY expected_item
    ADD CONSTRAINT expected_item_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: rolemapping rolemapping_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY rolemapping
    ADD CONSTRAINT rolemapping_pkey PRIMARY KEY (id);


--
-- Name: rolemapping_principalid_idx; Type: INDEX; Schema: public; Owner: :db_user
--

CREATE INDEX rolemapping_principalid_idx ON rolemapping USING btree (principalid);


--
-- PostgreSQL database dump complete
--

