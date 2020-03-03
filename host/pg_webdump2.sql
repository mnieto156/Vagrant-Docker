--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 11.2

-- Started on 2019-12-02 18:46:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 50026)
-- Name: ProcLen_DB; Type: SCHEMA; Schema: -; Owner: pladmin
--

CREATE SCHEMA "ProcLen_DB";


ALTER SCHEMA "ProcLen_DB" OWNER TO pladmin;

--
-- TOC entry 189 (class 1259 OID 17206)
-- Name: alumno_id_seq; Type: SEQUENCE; Schema: public; Owner: pladmin
--

CREATE SEQUENCE public.alumno_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_id_seq OWNER TO pladmin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 17167)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: pladmin
--

CREATE TABLE public.alumnos (
    alumno_id integer DEFAULT nextval('public.alumno_id_seq'::regclass) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido_1 character varying(100) NOT NULL,
    apellido_2 character varying(100),
    correo character varying(150) NOT NULL,
    curso character varying(10),
    repositorio character varying(255)
);


ALTER TABLE public.alumnos OWNER TO pladmin;

--
-- TOC entry 196 (class 1255 OID 25450)
-- Name: nombre_completo(public.alumnos); Type: FUNCTION; Schema: public; Owner: pladmin
--

CREATE FUNCTION public.nombre_completo(public.alumnos) RETURNS text
    LANGUAGE sql
    AS $_$
	SELECT CONCAT($1.nombre,' ',$1.apellido_1,' ',$1.apellido_2 );
$_$;


ALTER FUNCTION public.nombre_completo(public.alumnos) OWNER TO pladmin;

--
-- TOC entry 192 (class 1259 OID 50027)
-- Name: flyway_schema_history; Type: TABLE; Schema: ProcLen_DB; Owner: pladmin
--

CREATE TABLE "ProcLen_DB".flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE "ProcLen_DB".flyway_schema_history OWNER TO pladmin;

--
-- TOC entry 190 (class 1259 OID 17208)
-- Name: commit_id_seq; Type: SEQUENCE; Schema: public; Owner: pladmin
--

CREATE SEQUENCE public.commit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commit_id_seq OWNER TO pladmin;

--
-- TOC entry 187 (class 1259 OID 17177)
-- Name: commits; Type: TABLE; Schema: public; Owner: pladmin
--

CREATE TABLE public.commits (
    commit_id integer DEFAULT nextval('public.commit_id_seq'::regclass) NOT NULL,
    alumno_id integer NOT NULL,
    commit_url character varying(250) NOT NULL,
    commit_fecha timestamp(2) without time zone DEFAULT now() NOT NULL,
    commit_num_errores integer NOT NULL,
    commit_num_correctos integer NOT NULL
);


ALTER TABLE public.commits OWNER TO pladmin;

--
-- TOC entry 191 (class 1259 OID 17210)
-- Name: error_id_seq; Type: SEQUENCE; Schema: public; Owner: pladmin
--

CREATE SEQUENCE public.error_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.error_id_seq OWNER TO pladmin;

--
-- TOC entry 188 (class 1259 OID 17182)
-- Name: commits_errores; Type: TABLE; Schema: public; Owner: pladmin
--

CREATE TABLE public.commits_errores (
    error_id integer DEFAULT nextval('public.error_id_seq'::regclass) NOT NULL,
    commit_id integer NOT NULL,
    error_url character varying(500) NOT NULL,
    error_stage_name character varying(50) NOT NULL
);


ALTER TABLE public.commits_errores OWNER TO pladmin;

--
-- TOC entry 193 (class 1259 OID 58231)
-- Name: role; Type: TABLE; Schema: public; Owner: pladmin
--

CREATE TABLE public.role (
    authority character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.role OWNER TO pladmin;

--
-- TOC entry 194 (class 1259 OID 58239)
-- Name: user_role; Type: TABLE; Schema: public; Owner: pladmin
--

CREATE TABLE public.user_role (
    username character varying(255) NOT NULL,
    authority character varying(255) NOT NULL
);


ALTER TABLE public.user_role OWNER TO pladmin;

--
-- TOC entry 195 (class 1259 OID 58252)
-- Name: users; Type: TABLE; Schema: public; Owner: pladmin
--

CREATE TABLE public.users (
    username character varying(255) NOT NULL,
    account_non_expired boolean NOT NULL,
    account_non_locked boolean NOT NULL,
    credentials_non_expired boolean NOT NULL,
    enabled boolean NOT NULL,
    password character varying(255),
    alumno_alumno_id integer
);


ALTER TABLE public.users OWNER TO pladmin;

--
-- TOC entry 2190 (class 0 OID 50027)
-- Dependencies: 192
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: ProcLen_DB; Owner: pladmin
--

COPY "ProcLen_DB".flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
0	\N	<< Flyway Schema Creation >>	SCHEMA	"ProcLen_DB"	\N	pladmin	2019-04-09 23:32:34.666057	0	t
\.


--
-- TOC entry 2184 (class 0 OID 17167)
-- Dependencies: 186
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: pladmin
--

COPY public.alumnos (alumno_id, nombre, apellido_1, apellido_2, correo, curso, repositorio) FROM stdin;
2	Un	Usuario	\N	mnietoramiro@gmail.com	2019-2020	http://my.plci.local/gitea/mnieto156/PLci-usuario2.git
1	Mario	Nieto	Ramiro	mnieto156@alumno.uned.es	2019-2020	http://my.plci.local/gitea/mnieto156/prueba-1.git
4	Anton	Pirulero		user223@alumno.uned.es	2020-2021	http://my.plci.local/gitea/user223.git
\.


--
-- TOC entry 2185 (class 0 OID 17177)
-- Dependencies: 187
-- Data for Name: commits; Type: TABLE DATA; Schema: public; Owner: pladmin
--

COPY public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos) FROM stdin;
1	1	http://	2019-03-17 00:00:00	0	1
2	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/59/	2019-03-17 00:00:00	0	1
3	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/70/	2019-03-19 12:28:06.25	0	1
4	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/94/	2019-03-20 19:02:10.86	0	1
5	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/97/	2019-03-21 18:45:37.97	1	0
6	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/98/	2019-03-21 21:44:38.84	1	0
7	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/99/	2019-03-21 21:47:05.65	1	0
8	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/100/	2019-03-21 22:01:24.82	1	0
9	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/101/	2019-03-21 22:07:22.6	1	0
10	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/61/	2019-03-26 22:01:26.78	0	13
11	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/108/	2019-03-26 22:32:18.49	0	1
12	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/62/	2019-03-27 17:44:42.23	1	12
13	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/63/	2019-03-27 17:46:23.8	0	13
14	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/64/	2019-03-27 18:25:27.3	1	12
15	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/65/	2019-03-27 18:27:56.7	0	23
16	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/66/	2019-03-27 22:06:45.86	6	39
17	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/67/	2019-03-27 22:39:11.25	0	23
18	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/68/	2019-03-28 18:26:18.6	0	23
19	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/69/	2019-03-28 18:34:34.26	0	23
20	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/70/	2019-03-29 19:39:46.27	0	23
21	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/71/	2019-03-29 21:37:37.72	22	1
22	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/72/	2019-03-29 21:42:34.02	0	23
23	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/73/	2019-03-29 21:44:03.61	0	23
24	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/74/	2019-03-29 21:49:38.67	0	23
25	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/75/	2019-03-29 22:02:12.94	11	12
26	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/76/	2019-03-29 22:09:25.87	0	23
27	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/78/	2019-03-29 22:26:37.16	0	23
28	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/80/	2019-03-30 17:39:26.12	22	1
29	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/79/	2019-03-30 17:39:28.93	9	14
30	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/81/	2019-03-30 17:40:26.72	0	23
31	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/109/	2019-03-30 18:57:11.31	0	1
32	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/113/	2019-04-01 16:39:45.37	0	1
33	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/115/	2019-04-01 17:37:53.45	0	1
34	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/127/	2019-04-02 17:15:32.99	0	1
35	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/1/	2019-04-02 17:34:59.94	2	1
36	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/2/	2019-04-02 17:39:12.19	2	1
37	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/3/	2019-04-02 17:44:59.4	2	1
38	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/4/	2019-04-02 17:53:31.01	1	22
39	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/5/	2019-04-02 17:55:32.76	0	23
40	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/7/	2019-04-02 18:13:09.36	0	23
41	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/8/	2019-04-02 20:42:43.66	0	23
42	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/PR-1/1/	2019-04-02 21:06:18.95	0	23
43	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/82/	2019-04-02 21:07:52.89	0	23
44	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/128/	2019-04-04 21:24:19.99	0	1
45	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/155/	2019-04-07 17:49:54.37	0	1
46	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/157/	2019-04-07 18:18:12.81	0	1
47	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/83/	2019-04-07 18:19:36.35	4	19
48	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/84/	2019-04-07 18:21:59.93	0	23
49	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/85/	2019-04-07 18:23:18.26	2	21
50	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/86/	2019-04-07 18:23:52.93	0	23
51	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/87/	2019-04-07 18:33:08.41	0	23
52	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/88/	2019-04-07 18:33:36.75	0	23
53	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/89/	2019-04-07 18:50:24.99	0	23
54	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/158/	2019-04-07 20:56:42.1	0	1
55	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/159/	2019-04-12 17:30:58.11	0	1
56	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/90/	2019-04-23 17:33:31.08	0	23
57	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/167/	2019-05-09 18:10:12.25	0	1
58	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/168/	2019-05-11 18:10:26.78	0	1
59	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/91/	2019-05-13 14:32:01	0	23
60	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/92/	2019-05-14 17:17:40.27	0	23
61	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/93/	2019-05-14 17:29:38.37	23	0
62	2	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/94/	2019-05-14 17:39:42.73	0	23
63	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/95/	2019-05-16 17:21:47.63	10	13
64	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/96/	2019-05-16 19:05:01.41	0	23
65	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/172/	2019-06-06 17:37:08.35	0	1
66	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/98/	2019-06-06 17:42:11.4	0	23
67	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PL1-2014-2015/job/master/1/	2019-06-12 07:13:02.09	1	0
68	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PL1-2014-2015/job/master/2/	2019-06-14 16:30:21.81	1	0
69	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/173/	2019-06-17 21:20:57.81	0	1
70	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/99/	2019-06-19 20:03:13.52	0	23
71	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/100/	2019-07-02 18:36:07.28	12	13
72	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/101/	2019-07-02 18:47:48.95	0	23
73	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/102/	2019-07-03 18:45:38.67	11	12
74	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/103/	2019-07-03 18:54:26.27	0	23
75	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/104/	2019-07-03 18:57:51.78	0	23
76	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/105/	2019-07-03 19:08:57.87	0	23
77	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/106/	2019-07-03 19:19:22.17	0	23
78	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/107/	2019-07-04 08:19:51.5	0	24
79	1	http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/108/	2019-10-22 17:41:19.66	0	24
\.


--
-- TOC entry 2186 (class 0 OID 17182)
-- Dependencies: 188
-- Data for Name: commits_errores; Type: TABLE DATA; Schema: public; Owner: pladmin
--

COPY public.commits_errores (error_id, commit_id, error_url, error_stage_name) FROM stdin;
1	9	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/prueba-1/branches/master/runs/101/nodes/13/	Build
2	12	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/62/nodes/87/	ens_test
3	14	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/64/nodes/87/	ens_test
4	16	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/66/nodes/87/	ens_test
5	16	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/66/nodes/214/	testCase01
6	16	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/66/nodes/214-parallel-synthetic/	Parallel
7	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/27/	ant build ens 
8	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/88/	ens run test
9	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/48/	test/testsPruebaA/testCase02.p
10	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/49/	test/testsPruebaA/testCase03.p
11	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/50/	test/testsPruebaA/testCase04.p
12	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/51/	test/testsPruebaA/testCase05.p
13	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/52/	test/testsPruebaA/testCase06.p
14	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/53/	test/testsPruebaA/testCase07.p
15	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/54/	test/testsPruebaA/testCase08.p
16	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/55/	test/testsPruebaA/testCase09.p
17	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/56/	test/testsPruebaA/testCase10.p
18	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/109/	testCase01
19	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/110/	testCase02
20	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/111/	testCase03
21	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/112/	testCase04
22	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/113/	testCase05
23	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/114/	testCase06
24	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/115/	testCase07
25	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/116/	testCase08
26	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/117/	testCase09
27	21	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/118/	testCase10
28	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/89/	ens run test
29	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/110/	testCase01
30	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/111/	testCase02
31	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/112/	testCase03
32	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/113/	testCase04
33	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/114/	testCase05
34	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/115/	testCase06
35	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/116/	testCase07
36	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/117/	testCase08
37	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/118/	testCase09
38	25	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/119/	testCase10
39	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/27/	ant build ens
40	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/88/	ens run test
41	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/48/	test/ens/testCase02.p
42	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/49/	test/ens/testCase03.p
43	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/50/	test/ens/testCase04.p
44	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/51/	test/ens/testCase05.p
45	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/52/	test/ens/testCase06.p
46	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/53/	test/ens/testCase07.p
47	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/54/	test/ens/testCase08.p
48	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/55/	test/ens/testCase09.p
49	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/56/	test/ens/testCase10.p
50	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/110/	testCase01
51	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/111/	testCase02
52	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/112/	testCase03
53	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/113/	testCase04
54	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/114/	testCase05
55	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/115/	testCase06
56	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/116/	testCase07
57	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/117/	testCase08
58	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/118/	testCase09
59	28	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/119/	testCase10
60	29	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/88/	ens run test
61	29	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/110/	testCase01
62	29	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/113/	testCase04
63	29	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/114/	testCase05
64	29	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/115/	testCase06
65	29	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/116/	testCase07
66	29	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/117/	testCase08
67	29	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/118/	testCase09
68	29	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/119/	testCase10
69	35	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/1/nodes/27/	ant build ens
70	35	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/1/nodes/45/	ens run test
71	36	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/2/nodes/27/	ant build ens
72	36	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/2/nodes/45/	ens run test
73	37	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/3/nodes/27/	ant build ens
74	37	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/3/nodes/45/	ens run test
75	38	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/4/nodes/88/	ens run test
76	47	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/83/nodes/88/	ens run test
77	47	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/83/nodes/110/	testCase01
78	47	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/83/nodes/111/	testCase02
79	47	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/83/nodes/113/	testCase04
80	49	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/85/nodes/88/	ens run test
81	49	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/85/nodes/112/	testCase03
82	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/13/	ant build compiler
83	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/27/	ant build ens
84	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/88/	ens run test
85	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/48/	testCase02.p
86	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/49/	testCase03.p
87	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/50/	testCase04.p
88	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/51/	testCase05.p
89	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/52/	testCase06.p
90	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/53/	testCase07.p
91	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/54/	testCase08.p
92	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/55/	testCase09.p
93	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/56/	testCase10.p
94	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/110/	testCase01
95	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/111/	testCase02
96	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/112/	testCase03
97	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/113/	testCase04
98	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/114/	testCase05
99	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/115/	testCase06
100	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/116/	testCase07
101	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/117/	testCase08
102	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/118/	testCase09
103	61	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/119/	testCase10
104	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/88/	ens run test
105	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/111/	testCase02
106	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/112/	testCase03
107	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/113/	testCase04
108	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/114/	testCase05
109	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/115/	testCase06
110	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/116/	testCase07
111	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/117/	testCase08
112	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/118/	testCase09
113	63	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/119/	testCase10
114	67	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PL1-2014-2015/branches/master/runs/1/nodes/13/	Build
115	68	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PL1-2014-2015/branches/master/runs/2/nodes/13/	Build
116	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/93/	ens run test
117	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/117/	testCase01
118	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/118/	testCase02
119	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/119/	testCase03
120	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/120/	testCase04
121	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/121/	testCase05
122	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/122/	testCase06
123	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/123/	testCase07
124	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/124/	testCase08
125	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/125/	testCase09
126	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/126/	testCase10
127	71	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/127/	test_MEMORIA
128	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/89/	ens run test
129	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/112/	testCase01
130	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/113/	testCase02
131	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/114/	testCase03
132	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/115/	testCase04
133	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/116/	testCase05
134	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/117/	testCase06
135	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/118/	testCase07
136	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/119/	testCase08
137	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/120/	testCase09
138	73	/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/121/	testCase10
\.


--
-- TOC entry 2191 (class 0 OID 58231)
-- Dependencies: 193
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: pladmin
--

COPY public.role (authority, description) FROM stdin;
Alumno	Usuario Alumno
Admin	Administrador de pagina
ROLE_ADMIN	Administrador
ROLE_ALUMNO	Alumno de la asignatura
\.


--
-- TOC entry 2192 (class 0 OID 58239)
-- Dependencies: 194
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: pladmin
--

COPY public.user_role (username, authority) FROM stdin;
admin	ROLE_ADMIN
mnieto156	ROLE_ALUMNO
mnietoramiro	Alumno
user223	Alumno
\.


--
-- TOC entry 2193 (class 0 OID 58252)
-- Dependencies: 195
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pladmin
--

COPY public.users (username, account_non_expired, account_non_locked, credentials_non_expired, enabled, password, alumno_alumno_id) FROM stdin;
admin	t	t	t	t	$2a$10$jFM3SzNmyRgqKBBUb3v3vOBiFEW3.6lzZZUspex1DNzEADcxtf.Oe	\N
mnieto156	t	t	t	t	$2a$10$LKBXM1pJXavSlRrtbdv45.TUH1Xcqlow8AzV3Gbz.XrAmW8iKBKkG	1
mnietoramiro	t	t	t	t	$2a$10$Rv1aN00RKFznPzHhjgWnDufDD2z2UfE5SW1NuEgA/QdXovKS4qzCC	2
user223	t	t	t	t	$2a$10$X.LR477J2hYgp9DSUjHmROTLmmgbcDQxtZedZSvU1KaYPOOeYsdxW	4
\.


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 189
-- Name: alumno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pladmin
--

SELECT pg_catalog.setval('public.alumno_id_seq', 53, true);


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 190
-- Name: commit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pladmin
--

SELECT pg_catalog.setval('public.commit_id_seq', 79, true);


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 191
-- Name: error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pladmin
--

SELECT pg_catalog.setval('public.error_id_seq', 138, true);


--
-- TOC entry 2054 (class 2606 OID 50035)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: ProcLen_DB; Owner: pladmin
--

ALTER TABLE ONLY "ProcLen_DB".flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 2048 (class 2606 OID 17171)
-- Name: alumnos pk_alumnos; Type: CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT pk_alumnos PRIMARY KEY (alumno_id);


--
-- TOC entry 2050 (class 2606 OID 17181)
-- Name: commits pk_commits; Type: CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT pk_commits PRIMARY KEY (commit_id);


--
-- TOC entry 2052 (class 2606 OID 17189)
-- Name: commits_errores pk_commits_errores; Type: CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.commits_errores
    ADD CONSTRAINT pk_commits_errores PRIMARY KEY (error_id);


--
-- TOC entry 2057 (class 2606 OID 58238)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (authority);


--
-- TOC entry 2059 (class 2606 OID 58246)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (username, authority);


--
-- TOC entry 2061 (class 2606 OID 58259)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- TOC entry 2055 (class 1259 OID 50036)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: ProcLen_DB; Owner: pladmin
--

CREATE INDEX flyway_schema_history_s_idx ON "ProcLen_DB".flyway_schema_history USING btree (success);


--
-- TOC entry 2046 (class 1259 OID 17190)
-- Name: idx_ix_alumno_id_alumnos; Type: INDEX; Schema: public; Owner: pladmin
--

CREATE UNIQUE INDEX idx_ix_alumno_id_alumnos ON public.alumnos USING btree (alumno_id);


--
-- TOC entry 2065 (class 2606 OID 58260)
-- Name: user_role fk2svos04wv92op6gs17m9omli1; Type: FK CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk2svos04wv92op6gs17m9omli1 FOREIGN KEY (username) REFERENCES public.users(username);


--
-- TOC entry 2062 (class 2606 OID 17196)
-- Name: commits fk_alumno_id_commit; Type: FK CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT fk_alumno_id_commit FOREIGN KEY (alumno_id) REFERENCES public.alumnos(alumno_id) ON DELETE CASCADE;


--
-- TOC entry 2063 (class 2606 OID 17201)
-- Name: commits_errores fk_commit_id_error; Type: FK CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.commits_errores
    ADD CONSTRAINT fk_commit_id_error FOREIGN KEY (commit_id) REFERENCES public.commits(commit_id) ON DELETE CASCADE;


--
-- TOC entry 2064 (class 2606 OID 58247)
-- Name: user_role fkep5tcvsl2ep5uuysgi1fmfp0a; Type: FK CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkep5tcvsl2ep5uuysgi1fmfp0a FOREIGN KEY (authority) REFERENCES public.role(authority);


--
-- TOC entry 2066 (class 2606 OID 58265)
-- Name: users fkiro9udj0k2qfi88an5ayx4gvv; Type: FK CONSTRAINT; Schema: public; Owner: pladmin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkiro9udj0k2qfi88an5ayx4gvv FOREIGN KEY (alumno_alumno_id) REFERENCES public.alumnos(alumno_id);


-- Completed on 2019-12-02 18:46:47

--
-- PostgreSQL database dump complete
--

