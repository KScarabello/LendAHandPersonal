--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-11-29 12:31:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "PersonalProject";
--
-- TOC entry 2161 (class 1262 OID 24585)
-- Name: PersonalProject; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "PersonalProject" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "PersonalProject" OWNER TO postgres;

\connect "PersonalProject"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 24614)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE events (
    id integer NOT NULL,
    user_id integer,
    title text NOT NULL,
    description text NOT NULL,
    date text NOT NULL,
    starttime text NOT NULL,
    endtime text NOT NULL,
    venue text,
    address text NOT NULL,
    city text NOT NULL,
    zipcode text NOT NULL,
    imageurl text NOT NULL,
    category text NOT NULL,
    perks text,
    quantofvols integer
);


ALTER TABLE events OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 24612)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO postgres;

--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 187
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- TOC entry 189 (class 1259 OID 24651)
-- Name: rosters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rosters (
    id integer NOT NULL,
    event_id integer,
    phone character varying(20)
);


ALTER TABLE rosters OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 24656)
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    event_id integer,
    user_id integer
);


ALTER TABLE subscriptions OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 24659)
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subscriptions_id_seq OWNER TO postgres;

--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 191
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- TOC entry 186 (class 1259 OID 24603)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    firstname character varying(20),
    lastname character varying(35),
    email character varying(100),
    city character varying(100),
    state character varying(100),
    zipcode character varying(5),
    bio character varying(500),
    auth_id text,
    picture text
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24601)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 185
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2020 (class 2604 OID 24617)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 24661)
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 24606)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2153 (class 0 OID 24614)
-- Dependencies: 188
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (479, NULL, 'Be a Curator for the Local Lantern Festival', 'http://floweventservices.com/wp-content/uploads/2012/04/port3.jpg', '10/21/2017', '12:29 PM', '01:29 PM', 'Provo Park', '123 Street', 'Provo ', '84601', 'http://floweventservices.com/wp-content/uploads/2012/04/port3.jpg', 'free t-shirts', NULL, 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (2, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (3, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (4, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (5, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (6, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (7, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (8, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (9, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (10, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (11, 8, 'Out of the Darkness Suicide Prevention Walk Needs Volunteers', 'I am helping to organize the annual Out of the Darkness suicide prevention walk in Provo, UT, which will be occuring 10/24/2017 at the
near the BYU campus. We could really use some lenders help with crowd management, handing out water, and staffing the information table. Our volunteers always have a great time, and it goes to an incredible
cause. It is an incredible way to make a true impact on the suicide epidemic.', '10/24/2017', '9:00 AM', '12:00 PM', 'The BYU Quad', 'ASB Campus Drive', 'Provo', 'UT', 'http://media.masslive.com/breakingnews/photo/2012/09/11641060-large.jpg', 'event staffing', 'a free t-shirt will be provided to all volunteers', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (481, NULL, 'dFsdfSFD', 'dfSDFsfd', '', '', '', '', '', '', '', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'free coffee', NULL, 1);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (486, NULL, 'DevMountain Building Deep Clean', 'We will come together to perform a deep cleaning of DevMountain''s building', '10/07/2017', '07:00 AM', '12:00 PM', 'DevMountain', '560 S 100 West Street', 'Provo', '84601', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'Household Tasks', 'Free coffee', 20);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (12, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (13, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (14, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (15, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (16, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (17, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (18, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (19, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (20, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (21, 2, 'Remove invasive Tamarisk plants from Utah Lake', 'A large patch of Tamarisk has started sprouting up on the shore of Utah Lake, near the visitor center. It strangles out all the native plants, disturbs the soil content, and generally causes problems for animals and humans alike.
There is too much of it for one person to take on, but if about 5 nature-loving lenders can come together, we can knock all the Tamarisk out in about 2 hours. Tools and instruction provided - no experience necessary! Waders will be provided - so be prepared to get wet!', '11/01/2017', '10:00 AM', '12:00 PM', 'Utah Lake Visitor Center', '4400 W. Center Street', 'Provo', '84601', 'https://img.ksl.com/slc/2626/262628/26262899.jpg?filter=ksl/img614', 'environmental', 'free training', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (22, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (482, NULL, 'adfasdfadf', 'adfasdf', '', '', '', '', '', '', '', 'adfadfa', 'free coffee', NULL, 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (23, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (24, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (25, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (26, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (27, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (28, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (29, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (30, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (31, 3, 'Mt. Timpanagos trail needs your help!', 'fkjadhfaldjfakakjfgakjfdhakdsjf', '10/4/2017', '9:00 AM', '11:00 AM', 'Trailhead', '1afadsf asdf', 'adfadsf', 'adf', 'https://i.ytimg.com/vi/C_o82U2AyQU/maxresdefault.jpg', 'parks and rec', 'gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (32, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (33, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (34, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (35, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (36, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (37, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (38, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (39, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (40, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (41, 4, 'Make Christmas cards for the elderly', 'afjglakfdjgalkfdjgalfdjg', '11/25/2017', '6:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E. University', 'Orem', 'UT', 'http://www.epsomguardian.co.uk/resources/images/2779134.jpg?type=articleLandscape', 'arts and crafts', 'gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (42, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (43, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (44, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (45, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (46, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (47, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (48, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (49, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (50, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (51, 5, 'Habitat for Humanity build', 'afadfgadfgdfdgafg', '11/01/2017', '11:00 AM', '1:00 PM', 'iadljkfadf', 'adfafg', 'adfadf', 'adfadsf', 'http://www.habitatmidohio.org/wp-content/uploads/2015/08/Thirvent-Builds-Wall_WEB.jpg', 'infrastructure', 'gratitude', 10);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (89, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (484, NULL, '', '', '', '', '', '', '', '', '', '', 'Household Tasks', 'coffee', 1);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (52, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (53, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (54, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (55, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (56, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (57, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (58, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (59, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (60, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (61, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (62, 6, 'Be a conversation partner with newly-arrived Syrian refugees', 'A Syrian refugee couple, Adnan and Samira, recently arrived here in Provo, after escaping persecution in their homeland. They would love to practice their English
conversation skills and learn more about American culture by interacting with American people. Any lenders would just be expected to sit down with Adnan and Samira and have a friendly chat with
them. Any and all interactions will help them learn English and make them feel more at home in their new country. Thanks.', '10/01/2017', '7:00 PM', '8:00 PM', 'Starbucks in Orem', '725 E University Pkwy', 'Orem', '84097', 'https://thirdeyemom.files.wordpress.com/2017/02/syrian-couple-interviewed.jpg', 'Education', 'I will treat you to a free Starbucks drink and pastry', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (63, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (64, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (65, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (66, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (67, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (68, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (69, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (70, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (71, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (72, 7, 'Please help the animals mwaaaah', 'klahgakjlfgakjdfgakdjfgakdfjh', '10/31/2017', '3:00PM', '5:00PM', 'Animal Shelter', 'adlfkjadf', 'adf', '11111', 'https://www.amoeba.com/admin/uploads/blog/LACatShelter-4.jpg', 'animals', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (73, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (74, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (75, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (76, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (77, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (78, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (79, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (80, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (81, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (82, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (83, 8, 'Please help remove insulation from under my mobile home', 'adfadfaafgafggfgg', '11/02/2017', '2:00 PM', '5:00 PM', 'Mobile Home Park', 'kljaf', 'aadfgadf', '11111', 'https://sprayfoamkit.com/wp-content/uploads/Testimonial-images/leo_r03.jpg', 'disaster relief', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (84, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (85, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (86, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (87, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (88, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (90, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (91, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (92, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (93, 9, 'PLeasekljaglkafjgalfgkjafdglkj', 'kakfal;kjaddlkjfdaj;klfsdalkj', '11/01/2017', '2:00 PM', '5:00 PM', 'Trailer Park', 'aafgafg', 'adfaass', '11111', 'https://i.pinimg.com/736x/73/de/32/73de32f9e5a0db66ec7805bb7cb3f807--navy-blue-houses-blue-and-white-houses-exterior.jpg', 'household tasks', 'just gratitude', 2);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (480, NULL, 'DevMountain Deep Cleaning', 'We, the students of DevMountain, will perform a deep cleaning of the building to express our appreciation.', '10/07/2017', '07:00 AM', '12:00 PM', 'DevMountain', '560 S 100 W St', 'Provo', '84601', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'free Rugged Grounds coffee', NULL, 20);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (95, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (96, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (97, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (98, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (99, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (100, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (101, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (102, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (103, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (104, 10, 'Additional help needed at soup kitchen', ';kdfkljafgkjafgkjafgkjafg', '11/01/2017', '4:00 PM', '6:00 PM', 'The Road Home', 'afgadfgadfg', 'adfgadfg', '11111', 'http://media.gettyimages.com/videos/group-of-young-volunteers-serving-food-at-soup-kitchen-in-homeless-video-id484371195?s=640x640', 'poverty alleviation', 'just gratitude', 3);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (105, NULL, 'title', 'this is a description', '01/01/01', '1:00PM', '12:00PM', 'Starbucks', '123 Street', 'Provo', '12345', 'www.hi.com', 'environmental', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (106, NULL, 'title', 'this is a description', '01/01/01', '1:00PM', '12:00PM', 'Starbucks', '123 Street', 'Provo', '12345', 'www.hi.com', 'environmental', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (107, NULL, 'title', 'this is a description', '01/01/01', '1:00PM', '12:00PM', 'Starbucks', '123 Street', 'Provo', '12345', 'www.hi.com', 'environmental', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (238, NULL, 'title', 'this is a description', '01/01/01', '1:00PM', '12:00PM', 'Starbucks', '123 Street', 'Provo', '12345', 'www.hi.com', 'environmental', 'just gratitude', 5);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (353, NULL, '', '', '', '', '', '', '', '', '', '', '', 'Category', 1);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (485, NULL, 'DevMountain Deep Cleaning', 'We the students of DevMountain will perform a deep cleaning of the building to show our appreciation.', '10/02/2017', '12:00 AM', '12:01 AM', 'DevMountain', '560 S 100 W Street', 'Provo', '84601', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'Household Tasks', 'free Rugged Grounds coffee', 20);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (487, NULL, 'DevMountain Deep Cleaning', 'To show our appreciation, we will clean every inch of the DevMountain building.', '10/07/2017', '07:01 PM', '12:19 PM', 'DevMountain', '560 S 100 West Street', 'Provo', '84601', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'Household Tasks', 'free Rugged Grounds coffee', 20);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (488, NULL, 'DevMountain Building Deep Clean', 'Out of appreciation, we are going to do a deep clean of the building.', '10/07/2017', '07:00 AM', '12:30 PM', 'DevMountain', '560 S 100 W Street', 'Provo', '84601', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'Environmental', 'free Rugged Grounds coffee', 20);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (489, NULL, 'DevMountain Deep Cleaning', 'Out of appreciation, we are going to do a deep clean of DevMountain.', '10/07/2017', '07:00 PM', '12:00 PM', 'DevMountain', '560 S 100 West Street', 'Provo', '84601', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'Household Tasks', 'free Rugged Grounds coffee', 20);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (490, NULL, 'DevMountain Buliding Deep Clean', 'We, the grateful students of DevMountain, pledge to perform a deep clean of the entire building.', '10/07/2017', '07:00 AM', '12:00 PM', 'DevMoutain', '560 S 100 West Street', 'Provo', '84601', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'Household Tasks', 'Free Rugged Grounds coffee', 20);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (491, NULL, 'DevMountain Deep Cleaning', 'We the students of DevMountain will perform a deep clean of the building.', '10/07/2017', '07:00 AM', '12:00 PM', 'DevMountain', '560 S 100 West Street', 'Provo', '84601', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'Household Tasks', 'free coffee', 20);
INSERT INTO events (id, user_id, title, description, date, starttime, endtime, venue, address, city, zipcode, imageurl, category, perks, quantofvols) VALUES (492, NULL, 'DevMountain deep cleaning', 'We are going to deep clean the buliding!!!', '10/07/2017', '07:00 AM', '12:00 PM', 'DevMountain', '560 S 100 West', 'Provo', '84601', 'https://cdn-images-1.medium.com/max/800/1*gYPFlVGuaxkiXii3BnM0qg.jpeg', 'Household Tasks', 'free Rugged Groundds', 20);


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 187
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 492, true);


--
-- TOC entry 2154 (class 0 OID 24651)
-- Dependencies: 189
-- Data for Name: rosters; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2155 (class 0 OID 24656)
-- Dependencies: 190
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO subscriptions (id, event_id, user_id) VALUES (5, 52, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (6, 63, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (7, 63, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (8, 42, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (9, 49, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (10, 52, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (11, 63, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (12, 52, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (13, 52, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (14, 52, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (15, 32, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (16, 42, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (17, 42, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (18, 52, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (19, 22, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (20, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (21, 52, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (22, 32, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (23, 22, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (24, 52, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (25, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (26, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (27, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (28, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (29, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (30, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (31, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (32, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (33, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (34, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (35, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (36, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (37, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (38, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (39, 12, NULL);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (40, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (41, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (42, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (43, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (44, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (45, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (46, 12, 13);
INSERT INTO subscriptions (id, event_id, user_id) VALUES (47, 12, 13);


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 191
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subscriptions_id_seq', 47, true);


--
-- TOC entry 2151 (class 0 OID 24603)
-- Dependencies: 186
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (1, 'Kimberly', 'Scarabello', 'kimberly.scarabello@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to get out there and lend a hand.', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (2, 'Jane', 'Doe', 'janedoe@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to get out there and lend a hand.', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (3, 'Michael', 'Wilson', 'michaelwilson@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to get out there and lend a hand.', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (4, 'Bob', 'Smith', 'bobsmith@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to get out there and lend a hand.', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (5, 'Beth', 'Johnson', 'bethjohnson@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to get out there and lend a hand.', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (6, 'David', 'Bean', 'davebean@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to get out there and lend a hand.', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (7, 'Jillian', 'Shoemaker', 'JillianShoemaker@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to get out there and lend a hand.', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (8, 'Chris', 'Cornell', 'Chriscornell@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to get out there and lend a hand.', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (9, 'Edward', 'Higgins', 'EdwardHiggins@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to get out there and lend a hand.', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (10, 'Kevin', 'Smith', 'kevinsmith@gmail.com', 'Provo', 'UT', '84601', 'I am super excited to help!', NULL, NULL);
INSERT INTO users (id, firstname, lastname, email, city, state, zipcode, bio, auth_id, picture) VALUES (13, 'Kim', 'Scarabello', 'kimberly.scarabello@gmail.com', 'Provo', 'UT', '84601', 'kjkfjgkjflkjgl', 'google-oauth2|115753298367709818210', 'https://lh6.googleusercontent.com/-ZLgoK2WygqA/AAAAAAAAAAI/AAAAAAAABkU/9mGK_1YISd0/photo.jp
g');


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 185
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 13, true);


--
-- TOC entry 2025 (class 2606 OID 24622)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 2027 (class 2606 OID 24655)
-- Name: rosters rosters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rosters
    ADD CONSTRAINT rosters_pkey PRIMARY KEY (id);


--
-- TOC entry 2029 (class 2606 OID 24663)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 2023 (class 2606 OID 24611)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2030 (class 2606 OID 24623)
-- Name: events events_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2031 (class 2606 OID 24668)
-- Name: subscriptions subscriptions_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_event_id_fkey FOREIGN KEY (event_id) REFERENCES events(id);


--
-- TOC entry 2032 (class 2606 OID 24673)
-- Name: subscriptions subscriptions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-11-29 12:31:07

--
-- PostgreSQL database dump complete
--

