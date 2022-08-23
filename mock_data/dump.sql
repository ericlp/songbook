--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: image; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.image (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.image OWNER TO songbook;

--
-- Name: melody; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.melody (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    melody text NOT NULL,
    link text NOT NULL
);


ALTER TABLE public.melody OWNER TO songbook;

--
-- Name: official_song_book; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.official_song_book (
    song_book_id uuid NOT NULL
);


ALTER TABLE public.official_song_book OWNER TO songbook;

--
-- Name: owner; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.owner (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.owner OWNER TO songbook;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO songbook;

--
-- Name: song; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.song (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    author text NOT NULL,
    unique_name text NOT NULL,
    primary_melody uuid NOT NULL,
    secondary_melody uuid,
    text text NOT NULL,
    deleted boolean NOT NULL,
    owned_by uuid NOT NULL
);


ALTER TABLE public.song OWNER TO songbook;

--
-- Name: song_book; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.song_book (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    unique_name text NOT NULL,
    deleted boolean NOT NULL,
    owned_by uuid NOT NULL
);


ALTER TABLE public.song_book OWNER TO songbook;

--
-- Name: song_book_image; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.song_book_image (
    song_book_id uuid NOT NULL,
    image_id uuid NOT NULL
);


ALTER TABLE public.song_book_image OWNER TO songbook;

--
-- Name: song_book_song; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.song_book_song (
    song_book_id uuid NOT NULL,
    song_id uuid NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.song_book_song OWNER TO songbook;

--
-- Name: song_tag; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.song_tag (
    song_id uuid NOT NULL,
    tag_id uuid NOT NULL
);


ALTER TABLE public.song_tag OWNER TO songbook;

--
-- Name: songbook_user; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.songbook_user (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    nick text NOT NULL,
    cid text NOT NULL
);


ALTER TABLE public.songbook_user OWNER TO songbook;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.tag (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    color_red integer NOT NULL,
    color_green integer NOT NULL,
    color_blue integer NOT NULL,
    owned_by uuid NOT NULL
);


ALTER TABLE public.tag OWNER TO songbook;

--
-- Name: user_owner; Type: TABLE; Schema: public; Owner: songbook
--

CREATE TABLE public.user_owner (
    owner_id uuid NOT NULL,
    songbook_user_id uuid NOT NULL
);


ALTER TABLE public.user_owner OWNER TO songbook;

--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.image (id, name) FROM stdin;
\.


--
-- Data for Name: melody; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.melody (id, melody, link) FROM stdin;
\.


--
-- Data for Name: official_song_book; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.official_song_book (song_book_id) FROM stdin;
\.


--
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.owner (id, name) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.schema_migrations (version, dirty) FROM stdin;
20220819221951	f
\.


--
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.song (id, title, author, unique_name, primary_melody, secondary_melody, text, deleted, owned_by) FROM stdin;
\.


--
-- Data for Name: song_book; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.song_book (id, name, unique_name, deleted, owned_by) FROM stdin;
\.


--
-- Data for Name: song_book_image; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.song_book_image (song_book_id, image_id) FROM stdin;
\.


--
-- Data for Name: song_book_song; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.song_book_song (song_book_id, song_id, number) FROM stdin;
\.


--
-- Data for Name: song_tag; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.song_tag (song_id, tag_id) FROM stdin;
\.


--
-- Data for Name: songbook_user; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.songbook_user (id, nick, cid) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.tag (id, name, description, color_red, color_green, color_blue, owned_by) FROM stdin;
\.


--
-- Data for Name: user_owner; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.user_owner (owner_id, songbook_user_id) FROM stdin;
\.


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: melody melody_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.melody
    ADD CONSTRAINT melody_pkey PRIMARY KEY (id);


--
-- Name: owner owner_name_key; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_name_key UNIQUE (name);


--
-- Name: owner owner_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: song_book_image song_book_image_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book_image
    ADD CONSTRAINT song_book_image_pkey PRIMARY KEY (song_book_id, image_id);


--
-- Name: song_book song_book_name_key; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book
    ADD CONSTRAINT song_book_name_key UNIQUE (name);


--
-- Name: song_book song_book_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book
    ADD CONSTRAINT song_book_pkey PRIMARY KEY (id);


--
-- Name: song_book_song song_book_song_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book_song
    ADD CONSTRAINT song_book_song_pkey PRIMARY KEY (song_book_id, song_id);


--
-- Name: song_book_song song_book_song_song_book_id_number_key; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book_song
    ADD CONSTRAINT song_book_song_song_book_id_number_key UNIQUE (song_book_id, number);


--
-- Name: song_book song_book_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book
    ADD CONSTRAINT song_book_unique_name_key UNIQUE (unique_name);


--
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id);


--
-- Name: song_tag song_tag_song_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_tag
    ADD CONSTRAINT song_tag_song_id_tag_id_key UNIQUE (song_id, tag_id);


--
-- Name: song song_title_key; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_title_key UNIQUE (title);


--
-- Name: song song_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_unique_name_key UNIQUE (unique_name);


--
-- Name: songbook_user songbook_user_cid_key; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.songbook_user
    ADD CONSTRAINT songbook_user_cid_key UNIQUE (cid);


--
-- Name: songbook_user songbook_user_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.songbook_user
    ADD CONSTRAINT songbook_user_pkey PRIMARY KEY (id);


--
-- Name: tag tag_name_key; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: user_owner user_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.user_owner
    ADD CONSTRAINT user_owner_pkey PRIMARY KEY (owner_id, songbook_user_id);


--
-- Name: official_song_book official_song_book_song_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.official_song_book
    ADD CONSTRAINT official_song_book_song_book_id_fkey FOREIGN KEY (song_book_id) REFERENCES public.song_book(id);


--
-- Name: song_book_image song_book_image_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book_image
    ADD CONSTRAINT song_book_image_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.image(id);


--
-- Name: song_book_image song_book_image_song_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book_image
    ADD CONSTRAINT song_book_image_song_book_id_fkey FOREIGN KEY (song_book_id) REFERENCES public.song_book(id);


--
-- Name: song_book song_book_owned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book
    ADD CONSTRAINT song_book_owned_by_fkey FOREIGN KEY (owned_by) REFERENCES public.owner(id);


--
-- Name: song_book_song song_book_song_song_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book_song
    ADD CONSTRAINT song_book_song_song_book_id_fkey FOREIGN KEY (song_book_id) REFERENCES public.song_book(id);


--
-- Name: song_book_song song_book_song_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_book_song
    ADD CONSTRAINT song_book_song_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.song(id);


--
-- Name: song song_owned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_owned_by_fkey FOREIGN KEY (owned_by) REFERENCES public.owner(id);


--
-- Name: song song_primary_melody_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_primary_melody_fkey FOREIGN KEY (primary_melody) REFERENCES public.melody(id);


--
-- Name: song song_secondary_melody_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_secondary_melody_fkey FOREIGN KEY (secondary_melody) REFERENCES public.melody(id);


--
-- Name: song_tag song_tag_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_tag
    ADD CONSTRAINT song_tag_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.song(id);


--
-- Name: song_tag song_tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.song_tag
    ADD CONSTRAINT song_tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: tag tag_owned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_owned_by_fkey FOREIGN KEY (owned_by) REFERENCES public.owner(id);


--
-- Name: user_owner user_owner_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.user_owner
    ADD CONSTRAINT user_owner_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owner(id);


--
-- Name: user_owner user_owner_songbook_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: songbook
--

ALTER TABLE ONLY public.user_owner
    ADD CONSTRAINT user_owner_songbook_user_id_fkey FOREIGN KEY (songbook_user_id) REFERENCES public.songbook_user(id);


--
-- PostgreSQL database dump complete
--

