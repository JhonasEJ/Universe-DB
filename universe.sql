--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    description text,
    num_stars integer NOT NULL,
    age_billion_years numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: liveable; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.liveable (
    liveable_id integer NOT NULL,
    name character varying(100) NOT NULL,
    object_type character varying(10) NOT NULL,
    object_id integer NOT NULL,
    has_oxygen boolean NOT NULL,
    water_available boolean NOT NULL,
    climate_description text,
    temperature_avg numeric,
    visitor_capacity integer,
    CONSTRAINT liveable_object_type_check CHECK (((object_type)::text = ANY ((ARRAY['planet'::character varying, 'moon'::character varying])::text[])))
);


ALTER TABLE public.liveable OWNER TO freecodecamp;

--
-- Name: liveable_liveable_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.liveable_liveable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.liveable_liveable_id_seq OWNER TO freecodecamp;

--
-- Name: liveable_liveable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.liveable_liveable_id_seq OWNED BY public.liveable.liveable_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    diameter_km integer,
    composition text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    is_habitable boolean NOT NULL,
    diameter_km integer,
    population_estimate integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    description text,
    has_planets boolean NOT NULL,
    mass_solar numeric,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: liveable liveable_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.liveable ALTER COLUMN liveable_id SET DEFAULT nextval('public.liveable_liveable_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, type, description, num_stars, age_billion_years) FROM stdin;
1	Milky Way	Spiral	Our home galaxy	100000	13.6
2	Andromeda	Spiral	Nearest spiral galaxy	100000	10
3	Triangulum	Spiral	Third-largest in local group	40000	9.5
4	Whirlpool	Spiral	Galaxy with well-defined arms	30000	11
5	Sombrero	Elliptical	Bright central bulge	60000	12.2
6	Centaurus A	Elliptical	Active radio galaxy	50000	13
\.


--
-- Data for Name: liveable; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.liveable (liveable_id, name, object_type, object_id, has_oxygen, water_available, climate_description, temperature_avg, visitor_capacity) FROM stdin;
1	Earth	planet	1	t	t	Temperate and diverse	15.0	100000
2	Proxima b	planet	5	f	t	Unconfirmed conditions	-39.0	0
3	Vega II	planet	9	t	t	Earth-like gravity and atmosphere	20.5	200000
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, planet_id, has_atmosphere, diameter_km, composition) FROM stdin;
1	Moon	1	f	3474	Rock
2	Phobos	2	f	22	Rock
3	Deimos	2	f	12	Rock
4	Europa	6	t	3122	Ice
5	Ganymede	6	t	5262	Rock/Ice
6	Callisto	6	f	4821	Rock/Ice
7	Io	6	t	3643	Volcanic
8	Titan	5	t	5150	Ice/Atmosphere
9	Triton	8	t	2707	Ice
10	Charon	3	f	1212	Ice
11	Vega I Moon 1	8	f	1500	Ice
12	Vega II Moon 1	9	f	1000	Rock
13	Vega II Moon 2	9	f	900	Rock
14	Betelgeuse I Moon 1	10	f	2000	Gas
15	Betelgeuse I Moon 2	10	f	1800	Gas
16	Rigel I Moon 1	11	f	1900	Ice
17	Rigel I Moon 2	11	f	1600	Ice
18	Rigel II Moon 1	12	f	1000	Rock
19	Rigel II Moon 2	12	f	1100	Rock
20	Rigel II Moon 3	12	f	1200	Rock
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, type, is_habitable, diameter_km, population_estimate, star_id) FROM stdin;
1	Earth	Terrestrial	t	12742	8000000	1
2	Mars	Terrestrial	f	6779	0	1
3	Venus	Terrestrial	f	12104	0	1
4	Mercury	Terrestrial	f	4879	0	1
5	Proxima b	Terrestrial	t	11400	0	2
6	Sirius b I	Gas Giant	f	50000	0	3
7	Sirius b II	Gas Giant	f	60000	0	3
8	Vega I	Ice Giant	f	48000	0	6
9	Vega II	Terrestrial	t	13000	0	6
10	Betelgeuse I	Gas Giant	f	70000	0	4
11	Rigel I	Ice Giant	f	66000	0	5
12	Rigel II	Terrestrial	f	12000	0	5
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, type, description, has_planets, mass_solar, galaxy_id) FROM stdin;
1	Sun	G-type	Our star	t	1.0	1
2	Proxima Centauri	M-type	Closest to Sun	t	0.123	1
3	Sirius	A-type	Brightest star	t	2.1	1
4	Betelgeuse	Red Supergiant	Massive and bright	f	20.0	1
5	Rigel	Blue Supergiant	Extremely luminous	f	21.0	2
6	Vega	A-type	Bright star in Lyra	t	2.1	2
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: liveable_liveable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.liveable_liveable_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: liveable liveable_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.liveable
    ADD CONSTRAINT liveable_name_key UNIQUE (name);


--
-- Name: liveable liveable_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.liveable
    ADD CONSTRAINT liveable_pkey PRIMARY KEY (liveable_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

