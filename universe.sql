--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
    name character varying(30) NOT NULL,
    size_in_light_years integer NOT NULL,
    age_in_billions numeric(6,2) NOT NULL,
    spiral_arms integer,
    contains_black_hole boolean DEFAULT false,
    galactic_interaction boolean,
    galactic_classification text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter_in_km numeric(10,2),
    classification text,
    magnetic_field boolean
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_km numeric(10,2),
    planetary_classification text,
    age_in_billions numeric(4,2)
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
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(30),
    planet_id integer,
    star_id integer,
    operational_status character varying(30)
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type text,
    size_in_solar_diameters numeric(6,3)
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13.60, 2, true, false, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 10.00, 2, true, true, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 7.00, 3, false, false, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 60000, 13.00, 2, true, true, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 50000, 9.00, 0, true, false, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 120000, 12.80, NULL, true, false, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474.80, 'Regular Moon', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.20, 'Irregular Moon', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.40, 'Irregular Moon', false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643.20, 'Regular Moon', true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121.60, 'Regular Moon', false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268.20, 'Regular Moon', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821.60, 'Regular Moon', false);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 396.40, 'Regular Moon', false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504.20, 'Regular Moon', false);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1062.80, 'Regular Moon', false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1123.40, 'Regular Moon', false);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527.60, 'Regular Moon', false);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 1527.60, 'Regular Moon', false);
INSERT INTO public.moon VALUES (15, 'Charon', 19, 1212.00, 'Regular Moon', false);
INSERT INTO public.moon VALUES (14, 'Triton', 17, 2707.20, 'Irregular Moon', true);
INSERT INTO public.moon VALUES (16, 'Miranda', 18, 471.60, 'Regular Moon', false);
INSERT INTO public.moon VALUES (17, 'Ariel', 18, 1157.80, 'Regular Moon', false);
INSERT INTO public.moon VALUES (18, 'Umbriel', 18, 1169.40, 'Regular Moon', false);
INSERT INTO public.moon VALUES (19, 'Titania', 18, 1578.80, 'Regular Moon', false);
INSERT INTO public.moon VALUES (20, 'Oberon', 18, 1523.60, 'Regular Moon', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4880.00, 'Terrestrial Planet', 4.50);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104.00, 'Terrestrial Planet', 4.50);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742.00, 'Terrestrial Planet', 4.50);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779.00, 'Terrestrial Planet', 4.50);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820.00, 'Gas Giant', 4.50);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116460.00, 'Gas Giant', 4.50);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 2, NULL, 'Terrestrial Planet', NULL);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 2, NULL, 'Terrestrial Planet', NULL);
INSERT INTO public.planet VALUES (9, 'Beta Trianguli b', 3, NULL, 'Hot Jupiter', NULL);
INSERT INTO public.planet VALUES (10, 'Beta Trianguli c', 3, NULL, 'Hot Jupiter', NULL);
INSERT INTO public.planet VALUES (11, 'Vega b', 4, NULL, 'Exoplanet', NULL);
INSERT INTO public.planet VALUES (12, 'Vega c', 4, NULL, 'Exoplanet', NULL);
INSERT INTO public.planet VALUES (13, 'Epsilon Andromedae b', 5, NULL, 'Exoplanet', NULL);
INSERT INTO public.planet VALUES (14, 'Epsilon Andromedae c', 5, NULL, 'Exoplanet', NULL);
INSERT INTO public.planet VALUES (15, 'Epsilon Tauri b', 6, NULL, 'Exoplanet', NULL);
INSERT INTO public.planet VALUES (16, 'Epsilon Tauri c', 6, NULL, 'Exoplanet', NULL);
INSERT INTO public.planet VALUES (17, 'Neptune', 1, 49244.00, 'Ice Giant', 4.50);
INSERT INTO public.planet VALUES (18, 'Uranus', 1, 50724.00, 'Ice Giant', 4.50);
INSERT INTO public.planet VALUES (19, 'Pluto', 1, 2377.00, 'Dwarf Planet', 4.60);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'International Space Station', 'Research', 3, 1, 'Operational');
INSERT INTO public.space_station VALUES (2, 'Mir Space Station', 'Research', 3, 1, 'Decommissioned');
INSERT INTO public.space_station VALUES (3, 'Tiangong Space Station', 'Research', 3, 1, 'Operational');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow Dwarf', 1.000);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'Yellow Dwarf', 1.227);
INSERT INTO public.star VALUES (3, 'Beta Trianguli', 3, 'Blue Giant', 15.560);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'White Main Sequence', 2.362);
INSERT INTO public.star VALUES (5, 'Alpha Andromedae', 2, 'Blue Subgiant', 4.150);
INSERT INTO public.star VALUES (6, 'Epsilon Tauri', 1, 'Yellow Subgiant', 1.600);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


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
-- Name: space_station name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


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
-- Name: space_station space_station_host_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_host_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_station space_station_orbiting_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_orbiting_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

