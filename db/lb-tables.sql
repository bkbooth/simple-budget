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
    userid integer
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
-- Name: user; Type: TABLE; Schema: public; Owner: :db_user
--

CREATE TABLE "user" (
    realm text,
    username text,
    password text NOT NULL,
    email text NOT NULL,
    emailverified boolean,
    verificationtoken text,
    id integer NOT NULL
);


ALTER TABLE "user" OWNER TO :db_user;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: :db_user
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO :db_user;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: :db_user
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: acl id; Type: DEFAULT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY acl ALTER COLUMN id SET DEFAULT nextval('acl_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Name: rolemapping id; Type: DEFAULT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY rolemapping ALTER COLUMN id SET DEFAULT nextval('rolemapping_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


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
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: :db_user
--

COPY "user" (realm, username, password, email, emailverified, verificationtoken, id) FROM stdin;
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: :db_user
--

SELECT pg_catalog.setval('user_id_seq', 1, false);


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
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: :db_user
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: rolemapping_principalid_idx; Type: INDEX; Schema: public; Owner: :db_user
--

CREATE INDEX rolemapping_principalid_idx ON rolemapping USING btree (principalid);


--
-- PostgreSQL database dump complete
--

