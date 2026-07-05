--
-- PostgreSQL database dump
--

\restrict W6jOkcFjc6CgEhLTSAvNDlGGu9PhTpaEtQMMTfq3FYCXjTC3sOPuSeGfXwyegpD

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    patient_id integer,
    doctor_id integer,
    appointment_date date NOT NULL,
    reason text,
    status character varying(20) DEFAULT 'pendig'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_appointment_id_seq OWNER TO postgres;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    doctor_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    specialty character varying(100) NOT NULL,
    phone character varying(20),
    email character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- Name: doctors_doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctors_doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctors_doctor_id_seq OWNER TO postgres;

--
-- Name: doctors_doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctors_doctor_id_seq OWNED BY public.doctors.doctor_id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    gender character varying(10) NOT NULL,
    date_of_birth date NOT NULL,
    phone character varying(20),
    email character varying(100),
    address text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Name: hospital_report; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.hospital_report AS
 SELECT p.first_name AS patient,
    d.first_name AS doctor,
    a.appointment_date,
    a.reason
   FROM ((public.appointments a
     JOIN public.patients p ON ((a.patient_id = p.patient_id)))
     JOIN public.doctors d ON ((a.doctor_id = d.doctor_id)));


ALTER VIEW public.hospital_report OWNER TO postgres;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patients_patient_id_seq OWNER TO postgres;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: doctors doctor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors ALTER COLUMN doctor_id SET DEFAULT nextval('public.doctors_doctor_id_seq'::regclass);


--
-- Name: patients patient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (appointment_id, patient_id, doctor_id, appointment_date, reason, status, created_at) FROM stdin;
7	3	1	2026-04-12	Fever and headache	pendig	2026-07-05 01:06:33.955369
8	4	5	2026-11-09	Child consultation	pendig	2026-07-05 01:06:33.955369
9	5	4	2026-06-14	Chest pain and heart examinattion	pendig	2026-07-05 01:06:33.955369
10	3	4	2026-02-01	Injury from accient	pendig	2026-07-05 01:06:33.955369
6	1	3	2026-06-08	Regular chekup	Completed	2026-07-05 01:06:33.955369
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (doctor_id, first_name, last_name, specialty, phone, email, created_at) FROM stdin;
1	Rama	Mwangi	Cardiologist	0812635547	rama@hospitalgmail.com	2026-07-05 00:45:10.701588
2	Marry	Joseph	Pediatrician	0629984763	marry@hospitalgmail.com	2026-07-05 00:45:10.701588
3	David	Miraj	Dentist	0635443325	david@hospitalgmail.com	2026-07-05 00:45:10.701588
4	Sophia	Nyanda	oculist	0712346543	sophia@hospitalgmail.com	2026-07-05 00:45:10.701588
5	Lucia	Kabido	Dematologist	0624443122	lucia@hospitalgmail.com	2026-07-05 00:45:10.701588
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (patient_id, first_name, last_name, gender, date_of_birth, phone, email, address, created_at) FROM stdin;
3	Leah	Khamis	Female	2000-09-17	0734873456	leah@gmail.com	Dodoma	2026-07-04 23:52:44.354501
4	Marco	Robert	Male	2001-03-23	0743123456	marco@gmail.com	Singida	2026-07-04 23:52:44.354501
5	Sauda	Kalori	Female	2002-08-19	0623834567	sauda@gmail.com	Mara	2026-07-04 23:52:44.354501
1	Neema	Bonny	Female	1999-05-15	0655557334	neema@gmail.com	Dar es salaam	2026-07-04 23:52:44.354501
\.


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 10, true);


--
-- Name: doctors_doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_doctor_id_seq', 5, true);


--
-- Name: patients_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_patient_id_seq', 5, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: doctors doctors_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_email_key UNIQUE (email);


--
-- Name: doctors doctors_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_phone_key UNIQUE (phone);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);


--
-- Name: patients patients_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_email_key UNIQUE (email);


--
-- Name: patients patients_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_phone_key UNIQUE (phone);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- Name: idx_patient_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_patient_name ON public.patients USING btree (first_name);


--
-- Name: appointments appointments_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id);


--
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- PostgreSQL database dump complete
--

\unrestrict W6jOkcFjc6CgEhLTSAvNDlGGu9PhTpaEtQMMTfq3FYCXjTC3sOPuSeGfXwyegpD

