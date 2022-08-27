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
    secondary_melody uuid NOT NULL,
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
    author text NOT NULL,
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
bf5a9104-552f-402d-9c94-48e2008acfdc	UNKNOWN	https://www.google.com/search?hl=en&q=unknown%20melody
53fcad8b-9c6b-492e-9af6-26ecb593720f		
e2840ea8-56c9-41ed-851e-b2e851f131b6	Röda kavalleriet	https://www.google.com/search?hl=en&q=unknown%20melody
f0242e6f-9999-437d-ba7b-43d37350932f	Bättre och bättre dag för dag	https://www.google.com/search?hl=en&q=unknown%20melody
1d7de628-fff1-4b5e-81df-894f1e73c264	Vem kan segla...	https://www.google.com/search?hl=en&q=unknown%20melody
0fba4229-b88a-44f0-a549-2f4d3e1fadd1	Sjösala vals	https://www.google.com/search?hl=en&q=unknown%20melody
a1f327cc-c2a5-4820-a748-c2162cd3402c	O helga natt	https://www.google.com/search?hl=en&q=unknown%20melody
8c8b4bc4-1440-4c7d-be1f-057626834780	Marsche militaire av Franz Schubert	https://www.google.com/search?hl=en&q=unknown%20melody
650430c7-d7e0-48e5-95df-70074bb5cc6e	Lambeth walk	https://www.google.com/search?hl=en&q=unknown%20melody
c9ba108f-f09c-43df-8a6b-93aba0dd29c5	Mors lille Olle	https://www.google.com/search?hl=en&q=unknown%20melody
af5d2c6f-0f69-4289-af33-ba3d85d3d424	Uti vår hage	https://www.google.com/search?hl=en&q=unknown%20melody
e7d2dacc-7ed1-4dc9-a793-8b1efcf41d03	My Bonnie	https://www.google.com/search?hl=en&q=unknown%20melody
ae592868-6fb3-45e3-a977-0e1d4d5a124e	refr. Av tre trallande jäntor	https://www.google.com/search?hl=en&q=unknown%20melody
cedefb22-3b0c-4174-a0da-4fa9605f5953	Fritjof och Carmencita	https://www.google.com/search?hl=en&q=unknown%20melody
7d11c773-75e2-40d9-bc15-5c892fe79683	Änglamark	https://www.google.com/search?hl=en&q=unknown%20melody
dda2d3b0-1ed4-4079-aeb8-8f2ccc23e00d	En sockerbagare	https://www.google.com/search?hl=en&q=unknown%20melody
36965f53-2c74-4c42-b96f-d8485b040b20	Nu tändas tusen juleljus	https://www.google.com/search?hl=en&q=unknown%20melody
f88aaa46-da41-485e-a38c-208c5d0e5122	Räven raskar över isen.	https://www.google.com/search?hl=en&q=unknown%20melody
26ee5e7f-a5db-4bc0-ae81-732f58ce43fb	Kamomilla stad	https://www.google.com/search?hl=en&q=unknown%20melody
b3332fb7-bb1b-483b-8b42-16ece9b2a0f6	Vila vid denna källa	https://www.google.com/search?hl=en&q=unknown%20melody
66b4bd76-c249-424f-b80a-a0ca989a1346	Lille Katt	https://www.google.com/search?hl=en&q=unknown%20melody
38af3380-6c93-4106-b935-54f6d74087fb	Byssan lull	https://www.google.com/search?hl=en&q=unknown%20melody
ec2da08f-5cbc-43ff-af89-5d3ccddfd8f7	Kalle på spången	https://www.google.com/search?hl=en&q=unknown%20melody
5e9731e1-3115-49e1-b51d-8bbf466c11f2	Old man river	https://www.google.com/search?hl=en&q=unknown%20melody
a79d19bc-7985-4308-8779-dbd0f2a930f7	I sommarens soliga dagar	https://www.google.com/search?hl=en&q=unknown%20melody
b5fddba9-c171-4464-8ac9-0b2ae489008f	Bär ner mig till sjön	https://www.google.com/search?hl=en&q=unknown%20melody
0b133575-dec2-4305-be53-2119470bd449	Röda kavalleriet	https://www.google.com/search?hl=en&q=unknown%20melody
a61882a9-da03-4d43-baaf-62a5268083d2	Sudda bort din sura min	https://www.google.com/search?hl=en&q=unknown%20melody
07142a23-153d-453a-8d39-91277ede921d	Jag har en gammal moster	https://www.google.com/search?hl=en&q=unknown%20melody
bf4527d6-f3ca-4524-bb64-7352feebe611	Glada Änkan	https://www.google.com/search?hl=en&q=unknown%20melody
7d6d43dc-ec09-40a9-b06d-bbcb55f646ab	Du ska få min gamla cykel	https://www.google.com/search?hl=en&q=unknown%20melody
e636e963-b79e-4034-ae43-3be6bbedb742	Når månen vandrar...	https://www.google.com/search?hl=en&q=unknown%20melody
86030790-4b79-4a71-b26b-56a0570b4cbd	Schottis på Valhall	https://www.google.com/search?hl=en&q=unknown%20melody
3c593ffe-87d1-4b3a-84a0-bc437c585996	Ja se det snöar	https://www.google.com/search?hl=en&q=unknown%20melody
fd754077-88bd-44f5-bc7c-54f7080ec055	Sov du lilla videung	https://www.google.com/search?hl=en&q=unknown%20melody
3fefad04-935e-4e33-8846-5d02748a3265	Gubben Noak	https://www.google.com/search?hl=en&q=unknown%20melody
7f70eb14-75d1-46f8-824b-32e5ca5a1d44	Du skall få min gamla...	https://www.google.com/search?hl=en&q=unknown%20melody
a8fddde8-5388-4bbb-9aaf-5f522d14e2f8	We will rock you - Queen	https://www.google.com/search?hl=en&q=unknown%20melody
1c50b4dd-910d-4341-bfaf-0ae4ee19d9a5	Ritsch, ratsch, filibom\\...	https://www.google.com/search?hl=en&q=unknown%20melody
94696550-e89f-48ff-a398-686b3d8bb4f9	Annie get your gun	https://www.google.com/search?hl=en&q=unknown%20melody
fcb5b7b3-e422-4c81-bce8-8ec06dc4ce42	Armen i vinkel (ramsa)	https://www.google.com/search?hl=en&q=unknown%20melody
113b741a-1a30-476b-bb15-5d875afd29df	Pippi Långstrump	https://www.google.com/search?hl=en&q=unknown%20melody
824478fe-360b-4152-a78a-e163353f9766	Marseljäsen	https://www.google.com/search?hl=en&q=unknown%20melody
85a96098-bd67-4165-8d00-f916766fded2	Sjösala vals	https://www.google.com/search?hl=en&q=unknown%20melody
721b0c12-9336-474d-99b9-0161b591f0c7	Internationalen	https://www.google.com/search?hl=en&q=unknown%20melody
15726ba3-cd80-445d-8971-ecaa3f820eee	It's a long way to...	https://www.google.com/search?hl=en&q=unknown%20melody
c84cdaaf-a722-43ea-9401-0917ee6a0f5f	Gärdebylåten	https://www.google.com/search?hl=en&q=unknown%20melody
8d925b9d-6252-40fe-b0df-18b4834822e2	My Bonnie	https://www.google.com/search?hl=en&q=unknown%20melody
ccfc6367-0a92-4ded-b5e7-82506b01b164	My Bonnie	https://www.google.com/search?hl=en&q=unknown%20melody
f574319a-99b7-4925-9e26-46b442d20438	Oh when the saints	https://www.google.com/search?hl=en&q=unknown%20melody
d8d2baa1-18be-4bcb-a47b-ce9db1610801	Oh, Tannenbaum	https://www.google.com/search?hl=en&q=unknown%20melody
b01bf346-2844-493c-9257-63a3b64f165b	Svenska nationalsången	https://www.google.com/search?hl=en&q=unknown%20melody
36231403-8759-4f32-b3a7-cd8d227b1ab6	En sockerbagare	https://www.google.com/search?hl=en&q=unknown%20melody
643863b3-9a93-42df-a435-770f987fb3a0	Hej tomtegubbar	https://www.google.com/search?hl=en&q=unknown%20melody
a4791ce3-e94c-4a45-8cdb-57f75c082b14	En sockerbagare	https://www.google.com/search?hl=en&q=unknown%20melody
cc581ecb-59cc-417a-aeb4-79c918e50c12	White christmas	https://www.google.com/search?hl=en&q=unknown%20melody
e26a3f98-b079-40a7-8878-0df9f4a8dc19	Med en enkel tulipan	https://www.google.com/search?hl=en&q=unknown%20melody
cecc9545-9742-4b79-ba1f-44155f009211	Mors lille Olle	https://www.google.com/search?hl=en&q=unknown%20melody
cedff49d-9091-4946-b66e-7613e34f8cb2	Vi äro små humlor vi...	https://www.google.com/search?hl=en&q=unknown%20melody
f4bbc115-9397-4cac-b26e-920d879e280f	Stympad	https://www.google.com/search?hl=en&q=unknown%20melody
b8197909-74e6-45df-90a9-7cb721b9f9cd	Om jag hade pengar	https://www.google.com/search?hl=en&q=unknown%20melody
d65c0d2f-8987-4607-86fa-159a1b8646f2	Emil I Lönneberga	https://www.google.com/search?hl=en&q=unknown%20melody
d8dc7318-7406-46eb-aaf3-f3763678d2d8	När månen vandrar	https://www.google.com/search?hl=en&q=unknown%20melody
b79918ba-3548-43ed-adf4-bd6028b0ee83	Hej tomtegubbar	https://www.google.com/search?hl=en&q=unknown%20melody
c188ece8-10a0-4114-aae1-63cb912911d9	Vikingen	https://www.google.com/search?hl=en&q=unknown%20melody
66f41b6e-0030-40ab-8fe7-3caff9f25c5c	Här kommer Karl-Alfred boy	https://www.google.com/search?hl=en&q=unknown%20melody
171716ee-1c2a-4c90-a113-7c16e0523704	Ju mer vi är tillsammans	https://www.google.com/search?hl=en&q=unknown%20melody
01afb0a6-58bd-4d4b-a5b0-5e91fac81e9f	Row your boat	https://www.google.com/search?hl=en&q=unknown%20melody
59ec5a1e-e6ff-49c3-ab1d-b52dbefc6fb4	Sankta Lucia	https://www.google.com/search?hl=en&q=unknown%20melody
8d3dedab-e973-4e93-bacf-833b37f1ea9d	Tre pepparkaksgubbar	https://www.google.com/search?hl=en&q=unknown%20melody
debace28-4097-494b-a124-7f4033013f76	Ritsch ratsch	https://www.google.com/search?hl=en&q=unknown%20melody
edda582a-d56d-4f2b-a75a-7b081326451c	Härlig är jorden	https://www.google.com/search?hl=en&q=unknown%20melody
45cd5adb-df51-410d-8d7f-cc21836f1c68	Broder Jacob	https://www.google.com/search?hl=en&q=unknown%20melody
b6c568ef-3e0a-4fe3-b118-5235da1436c4	When you wish upon a star	https://www.google.com/search?hl=en&q=unknown%20melody
e7373e78-9927-4e00-a846-b820901fe0df	Midnatt råder	https://www.google.com/search?hl=en&q=unknown%20melody
ab021877-baa5-4e36-a66d-5dbd075ac2ff	Ding dong Merrily on high	https://www.google.com/search?hl=en&q=unknown%20melody
dd8d6a38-6e68-44db-9229-bbde36309b9b	Marseljäsen	https://www.google.com/search?hl=en&q=unknown%20melody
83badd47-50f2-4645-ba59-85cee58b1eb3	Helan går	https://www.google.com/search?hl=en&q=unknown%20melody
730976f2-b0b7-4591-b5d7-bf6158cbafa4	Katjuscha (rysk folksång)	https://www.google.com/search?hl=en&q=unknown%20melody
ac6de9a1-80a2-482e-9d7b-ac2db613ede7	Bamse	https://www.google.com/search?hl=en&q=unknown%20melody
62dad746-f380-4dfe-9bc3-604849bd3fce	Camptown ladies	https://www.google.com/search?hl=en&q=unknown%20melody
80cd04f5-72c8-416f-8d61-b5235c0dcfb2	Byssan lull	https://www.google.com/search?hl=en&q=unknown%20melody
732f177d-6e73-4907-9082-2b759a715f9c	Väva vadmal	https://www.google.com/search?hl=en&q=unknown%20melody
05682c06-4c8f-4957-87e3-81e25165c417	Man skall ha husvagn	https://www.google.com/search?hl=en&q=unknown%20melody
68a85443-5bb6-4cfa-8ca7-7c48878e9bb1	Daggstänkta berg	https://www.google.com/search?hl=en&q=unknown%20melody
88288165-2a20-4ed9-af2e-41f27ebd08df	Glada Änkan	https://www.google.com/search?hl=en&q=unknown%20melody
e452ff3c-ba2d-4a63-92f1-d8284feb6556	Gôtt å leva - Galenskaparna	https://www.google.com/search?hl=en&q=unknown%20melody
a6518bf6-6639-42b8-83d8-bde2fb027623	Idas sommarvisa	https://www.google.com/search?hl=en&q=unknown%20melody
f6348ce1-d021-4c12-8ea1-cd8583784150	Snickerboa	https://www.google.com/search?hl=en&q=unknown%20melody
7f134aa8-e581-42f1-b014-648433d47929	Med en enkel tulipan	https://www.google.com/search?hl=en&q=unknown%20melody
2e50112b-433e-4776-b401-dcefbfc6b3f1	Lille katt	https://www.google.com/search?hl=en&q=unknown%20melody
5c0dc1b9-7487-44f6-9201-c71aba493f9e	Imse Vimse	https://www.google.com/search?hl=en&q=unknown%20melody
5569dde1-cf8e-40b0-af5a-96e294356600	Bättre och bättre...	https://www.google.com/search?hl=en&q=unknown%20melody
8bbe035b-e42c-4f63-b4d8-e0748f559068	Helan går	https://www.google.com/search?hl=en&q=unknown%20melody
1d1889da-0a8d-42e1-89eb-863f63604c57	Du gamla, du fria	https://www.google.com/search?hl=en&q=unknown%20melody
a0da9d92-eabe-4dc8-8aa2-c570832a1f2f	Var nöjd med...	https://www.google.com/search?hl=en&q=unknown%20melody
993bb8e1-aff8-4681-82bc-d68496703c75	You Can Have Her	https://www.google.com/search?hl=en&q=unknown%20melody
67fd4988-a421-44cc-b402-bf319021668d	Vi skålar för dem vi gillar	https://www.google.com/search?hl=en&q=unknown%20melody
5134cf1c-8a66-45f6-ab0f-9f33f1180fe2	När Lillan kom till jorden	https://www.google.com/search?hl=en&q=unknown%20melody
9d20a89b-37f3-455e-a2a0-553c825077b9	Tänk om jag hade en liten apa...	https://www.google.com/search?hl=en&q=unknown%20melody
7b9b0ae7-aca6-4b79-bcb7-effc2fc79462	Jag fångade en räv idag	https://www.google.com/search?hl=en&q=unknown%20melody
f28bdd92-ab5d-4bd5-b89b-24217e28c5b2	Vintern rasat...	https://www.google.com/search?hl=en&q=unknown%20melody
0a1565da-8a1c-41ac-872f-9d4bda821d83	Ösa sand	https://www.google.com/search?hl=en&q=unknown%20melody
dd4175ab-5dc0-4377-9b54-5e15a990d90a	Längtan till landet	https://www.google.com/search?hl=en&q=unknown%20melody
a14e927a-0610-4cee-bf8b-fbbea9cda86d	Nu är det jul i alla hus...	https://www.google.com/search?hl=en&q=unknown%20melody
ee4f8052-8e5d-4014-ae70-3fdff4b8c0a2	Gamla slott och herresäten	https://www.google.com/search?hl=en&q=unknown%20melody
4b99499a-20d4-4544-9ab4-8ce02b2201e6	Camptown ladies	https://www.google.com/search?hl=en&q=unknown%20melody
e83e6794-6e3d-434e-af9f-e2813af98384	Flottarkärlek	https://www.google.com/search?hl=en&q=unknown%20melody
d9e2c9c0-e8ed-4c8c-8975-10bff2b38f4a	Livet	https://www.google.com/search?hl=en&q=unknown%20melody
0f7c660d-88a0-4679-909d-eb8b844d6fd0	Barndomshemmet	https://www.google.com/search?hl=en&q=unknown%20melody
72996c50-0345-4e44-b615-30345059e3b2	Trampa på gasen	https://www.google.com/search?hl=en&q=unknown%20melody
e436881d-14e2-41c2-9a82-951a9e12c523	Räven raskar	https://www.google.com/search?hl=en&q=unknown%20melody
03fcdc6c-d2a9-4bea-984f-81da519f91ab	Lambeth walk	https://www.google.com/search?hl=en&q=unknown%20melody
e97b806e-04b3-4d1a-a203-78d64ca3d20d	Här kommer lilla Ludde	https://www.google.com/search?hl=en&q=unknown%20melody
e9c4c8e8-ed2b-480d-83b5-ecb86a82e17d	Bamsevisan	https://www.google.com/search?hl=en&q=unknown%20melody
b6b40f9b-0661-49c1-8ae3-5610fbc61c1b	Räven raskar över isen	https://www.google.com/search?hl=en&q=unknown%20melody
3b401eac-fb63-446b-9657-5c9593c4f709	When Johnny comes marching home	https://www.google.com/search?hl=en&q=unknown%20melody
be3b1d53-7310-4dc9-85da-4700e99be42a	Vikingen	https://www.google.com/search?hl=en&q=unknown%20melody
de50a8ff-e9d8-4553-be07-b37006fb2651	Mors lilla Olle	https://www.google.com/search?hl=en&q=unknown%20melody
12b107b9-c970-44d2-a27a-0f475436b6bc	Får jag lämna några blommor	https://www.google.com/search?hl=en&q=unknown%20melody
20227e18-8237-4520-8f35-5ab21e1d72e2	Memory	https://www.google.com/search?hl=en&q=unknown%20melody
d5cf022c-89ce-4069-a2c9-2b6fb4a0c98a	Familjen Flinta	https://www.google.com/search?hl=en&q=unknown%20melody
86fd87bc-d4fb-4cdd-8848-f68933ea8b19	Feta Franssyskor	https://www.google.com/search?hl=en&q=unknown%20melody
\.


--
-- Data for Name: official_song_book; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.official_song_book (song_book_id) FROM stdin;
19df4054-30a9-4b6c-a94e-0ed6a3308939
\.


--
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.owner (id, name) FROM stdin;
842287d4-5e7f-41c8-96d6-5596651998ec	sexit
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
e91ee5dc-fb2b-4cc1-85cb-da3f70767bc5	LIVET	Unknown	livet	e2840ea8-56c9-41ed-851e-b2e851f131b6	53fcad8b-9c6b-492e-9af6-26ecb593720f	||: Livet är härligt!  \nTavaritj, vårt liv är härligt!  \nVi alla våra små bekymmer glömmer  \nnär vi har fått en tår på tanden, SKÅL!\n\nTag dig en vodka!  \nTavaritj, en liten vodka!  \nGlasen i botten vi tillsammans tömmer,  \ndet kommer mera efter hand :||\n\nSKÅL!	f	842287d4-5e7f-41c8-96d6-5596651998ec
5e0d31c7-2f09-40ae-aeb4-a0e6c5f82d29	LÅNGT NER I SMÅLAND	Unknown	långt_ner_i_småland	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Långt ner i Småland där rider själva djävulen med laddade pistoler och\nknallande gevär. Och alla små djävlar de spela på fioler, och själva\nfader Satan han spelar handklaver. Hurra för Svealand, hurra för\nGötaland och hurra för potatisland som ger oss brännevin!	f	842287d4-5e7f-41c8-96d6-5596651998ec
42b0dfa8-afa0-4673-95eb-d9eb666e83ba	DA'N DÄRPÅ	Unknown	da'n_därpå	f0242e6f-9999-437d-ba7b-43d37350932f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Bättre och bättre dag för dag\n\nSämre och sämre da\\'n därpå.\n\nSäg mig, vad gjorde jag igår?\n\nMånga namn för hur man mår se\\'n\n\nbåde bilmek, betongkeps och ågren\n\nTag, en\n\nakvavitamin\n\noch gå på för full maskin.\n\nAj, aj, aj, aj, aj, aj, aj\n\nmen jag mår sämre och sämre da\\'n därpå!	f	842287d4-5e7f-41c8-96d6-5596651998ec
47fded4e-3341-4698-bb85-bd11097185fd	I MEDELHAVET	Unknown	i_medelhavet	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Svenska:*\n\nI Medelhavet sardiner simmar, apu, apu, apu apu\n\nMen i mitt hjärta där simmar du, apu, apu \\....\n\n*Engelska:*\n\nIn Middleocean sardines are swimming, apu\\...\\...\n\nBut in my hart are swimming you, apu\\.....\n\n*Tyska:*\n\nIn Mittelmehre Sardinen schwimmen, apu\\...\n\nAber in mein Herz da schwimmst ja Du, apu\\...\n\n*Ryska:*\n\nI Medelhavski sardinski simmski, apusskiduski, apusskidu\n\nMen i mitt hjärtski där simmski dusski, apuskiduski\\.....\n\n*Norska:*\n\nI Medelhavet små törsker svömme, apu, apu, apu, apu\n\nMen i min blopump där plasker du apu, apu\\...\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
a0571fc4-40e6-4254-9eba-562c8869cdeb	VEM KAN RAGLA	Unknown	vem_kan_ragla	1d7de628-fff1-4b5e-81df-894f1e73c264	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Vem kan segla...\n\nVem kan ragla för utan vin\n\nVem är nykter om våren\n\nVem kan skilja på Bäsk och Gin\n\nUtan att smaka på tåren?\n\nJag kan ragla för utan vin\n\nÅ visst var jag nykter om våren\n\nMen ej skilja på Bäsk och Gin\n\nEfter den elfte tåren!	f	842287d4-5e7f-41c8-96d6-5596651998ec
c6daa05f-142f-43c8-91e8-fe07cb54b124	MORGONDAGENS VISA	Unknown	morgondagens_visa	0fba4229-b88a-44f0-a549-2f4d3e1fadd1	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Sjösala vals\n\nHuvudet vi lyfter med ett stön ur vår säng,\n\ntvättmaskinen i buken, kanoner i huvudet.\n\nTungan som en plyschsoffa och yrseln i sväng,\n\ni ångesten vi svettas kom sjung din refräng:\n\nVarför finns det aldrig nån nykter liten fest?\n\nO, låt oss somna om så vi slipper denna pest -\n\nmen se så många supar vi redan kastat upp i sängen:\n\nRenat och Skåne, Svart Vinbär och fager Bäsk!	f	842287d4-5e7f-41c8-96d6-5596651998ec
323d2bfe-2bec-4199-8470-61c0de18d547	O, JÄVLA NATT	Unknown	o,_jävla_natt	a1f327cc-c2a5-4820-a748-c2162cd3402c	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: O helga natt\n\nO, jävla natt, jag har så ont i pannan\n\nOch både vinet och ölen är slut.\n\nI min spegel ser jag någon annan,\n\nO, stackars människa hur du ser ut.\n\nMitt hår är stripigt, ögonen är röda,\n\nOm någon stör mig lär de nog förblöda.\n\nÅh, vilket mord! Vem bankar på min port?\n\nJo, Livets Ord! Jag spyr på deras skor.\n\nO, jävla natt! Hur kunde jag bli så full?	f	842287d4-5e7f-41c8-96d6-5596651998ec
9cf7064a-d830-4a62-8d5e-2ebae2e1765e	FETA FRANSYSKOR	Unknown	feta_fransyskor	8c8b4bc4-1440-4c7d-be1f-057626834780	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Marsche militaire av Franz Schubert\n\n(Tomtarnas vaktparad)\n\nFeta fransyskor som svettas om fötterna\n\nde trampar druvor som sedan skall jäsas till vin\n\nTranspirationen viktig e' ty den ger fin bouquet\n\nVårtor och svampar följer me', men vad gör väl de'?\n\nFör\\...\n\nVi vill ha vin, vill ha vin, vill ha mera vin\n\näven om följderna blir att vi må lida pin\n\nFlickor: Flaskan och glaset gått i sin\n\nPojkar: Hit med vin, mera vin\n\nFlickor: Tror ni att vi är fyllesvin?\n\nPojkar: JA! (Fast större)	f	842287d4-5e7f-41c8-96d6-5596651998ec
d5fa1ab1-d501-469d-93dd-0db0fbcf420c	NUBBEN WALK	Unknown	nubben_walk	650430c7-d7e0-48e5-95df-70074bb5cc6e	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Lambeth walk\n\nNubbar man för mycket blir livet kort.\n\nNubbar man för lite blir livet torrt.\n\nNej, gör som jag:\n\nNubba lite varje dag!	f	842287d4-5e7f-41c8-96d6-5596651998ec
523ef7d3-e651-408f-ad15-bf84675b312a	EN GÅNG I MÅNA'N	Unknown	en_gång_i_måna'n	c9ba108f-f09c-43df-8a6b-93aba0dd29c5	53fcad8b-9c6b-492e-9af6-26ecb593720f	En gång i måna'n är månen full  \nAldrig jag sett honom ramla omkull  \nStum av beundran hur mycket han tål  \nHöjer jag glaset och utbringar skål!\n\nHöjen nu glasen och dricken ur  \nNu, kära bröder, står kvarten i tur  \nNubben den giver oss ny energi  \nSäkert den minskar vårt livs entropi	f	842287d4-5e7f-41c8-96d6-5596651998ec
073139e2-8682-4e8c-b86f-0e1a84bb1597	GE OSS VIN	Unknown	ge_oss_vin	af5d2c6f-0f69-4289-af33-ba3d85d3d424	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Uti vår hage\n\nVåra små gossar hör flickornas bön:\n\nkom ge oss vin!\n\nDen drycken i glasen gör kvällen så skön.\n\n//: Kom röda och vita viner, kom själarnas vitaminer, kom fluidum\nBacchi, kom ge oss vin! ://	f	842287d4-5e7f-41c8-96d6-5596651998ec
8b73a7b3-1cc1-42da-81b3-c57ef21f73df	OUR FAMILY	Unknown	our_family	e7d2dacc-7ed1-4dc9-a793-8b1efcf41d03	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: My Bonnie*\n\nMy father makes counterfeit money,\\\nMy mother brews synthetic gin.\\\nMy sister sells kisses to sailors,\\\nBy Jove how the money rolls in!.\n\n/: By Jove, By Jove, By Jove how the money \\\n rolls in, rolls in! :/\n\nMy brother is a slum missionary,\\\nsaving young maidens from sin.\\\nHe\\'ll save you a blond for a shilling,\\\nBy Jove how the money rolls in\\' \n\nBy Jove \\...\n\nMy aunt keeps a girl\\'s seminary,\\\nteaching young girls to begin.\\\nShe doesn\\'t say where they\\'re to finish,\\\nBy Jove how the money rolls in! \n\nBy Jove \\...\n\nMy father has spent all his money,\\\nMy mother has drunk all her gin.\\\nMy sister has sold all her kisses.\\\nand no more money rolls in! \\\nBy Jove\\....	f	842287d4-5e7f-41c8-96d6-5596651998ec
254be862-4804-4fe9-bd75-d4b72db4a3df	EN CHALMERIST HAN KAN	Unknown	en_chalmerist_han_kan	ae592868-6fb3-45e3-a977-0e1d4d5a124e	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: refr. Av tre trallande jäntor\n\nEn Chalmerist han kan\n\nTa supen som en man\n\nSå glupen den supen\n\nI strupen försvann\n\nOch mera vill han ha\n\nKan ej för mycket ta\n\nEn Chalmerist blir aldrig full\n\nNej, han blir bara gla'!\n\n*Fritt efter "En värmlandspöjk han kan"*	f	842287d4-5e7f-41c8-96d6-5596651998ec
507a31d2-a300-4eb0-b2be-027eaed5133a	ROSITA	Unknown	rosita	cedefb22-3b0c-4174-a0da-4fa9605f5953	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Fritjof och Carmencita\n\nGin-tonicen, en liten grogg förutan Cola.\\\nDen hittar du intill dig när du önskar skåla.\\\nNästan på kanten på en bricka hos tanten,\\\nsom i baren har blandat och skapat denna dryck.\\\nDit kom jag gående en kväll, mest av en nyck,\\\nför jag ville skoja till det.\n\nTvåtusen-åttahundra spänn\\\nkostade groggarna och sedan gick jag hem.\\\nDär på diskbänken i köket,\\\nden som aldrig gjorts ren,\\\nstod en bedårande flaska med Rosita.\\\nEn som om åtta sekel jämnt\\\nkommer att omnämnas som första klassens skämt.\\\nmen vad brydde jag väl mig,\\\ndär jag stod barskrapad och go\\'\\\nför jag ville skoja till det.	f	842287d4-5e7f-41c8-96d6-5596651998ec
f3faa047-7543-4ab6-86ba-d8414085e1fb	BAKFYLLESÅNG	Unknown	bakfyllesång	7d11c773-75e2-40d9-bc15-5c892fe79683	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Änglamark\n\nHuvudvärk, svettningar, darrningar, diarré.\n\nGe mig en isblåsa och en gul Jaffa.\n\nB-vitaminer, apelsinjuice och lite te.\n\nKan de bakfyllan måhända bortfösa.\n\nFesten var dålig, men nattsexan blev för bra:\n\nJanson\\'s temptation och brännvinsturnering.\n\nBorta var jag då i går kväll men mest i dag.\n\nNo concentration, men mycket vommering.	f	842287d4-5e7f-41c8-96d6-5596651998ec
b19f87eb-643f-4e1d-ba04-59893ec78837	PILSNERDRICKAREN	Unknown	pilsnerdrickaren	dda2d3b0-1ed4-4079-aeb8-8f2ccc23e00d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: En sockerbagare\n\nEn pilsnerdrickare här bor I staden,\n\nHan dricker pilsner mest hela dagen.\n\nHan dricker gröna, han dricker blå,\n\nhan dricker några med renat på.\n\nOch i hans fönster hänga tomma glasen\n\nOch alla burkarna från kalasen.\n\nOch är han nykter, så kan han gå\n\nNer till butiken och fylla på!	f	842287d4-5e7f-41c8-96d6-5596651998ec
698add37-ed2c-4e77-8067-30b319174686	INVERS APTIT	Unknown	invers_aptit	36965f53-2c74-4c42-b96f-d8485b040b20	53fcad8b-9c6b-492e-9af6-26ecb593720f	Nu fyllas många magar små  \nav iskall renad sprit.  \nMen några kastar åter upp,  \nDet är invers aptit.	f	842287d4-5e7f-41c8-96d6-5596651998ec
8ba85833-c284-4d84-ba25-f11c1ca10341	FÖRSTA SNAPSEN	Unknown	första_snapsen	f88aaa46-da41-485e-a38c-208c5d0e5122	53fcad8b-9c6b-492e-9af6-26ecb593720f	Första snapsen heter göken.  \nFörsta snapsen heter göken.  \nFår jag lov, ja får jag lov  \natt byta byxor med fröken?\n\nAndra snapsen den var värre,  \nandra snapsen den var värre.  \nFår jag lov, får jag lov  \natt byta byxor me\\' min herre\n\nMina byxor är himmelsblå  \nmen med dina är det dock si och så.  \nFår jag lov, får jag lov,  \natt byta byxor med göken.	f	842287d4-5e7f-41c8-96d6-5596651998ec
5f52a584-13d6-41ba-ad05-36dc6ee31b77	SVEPSKÄL	Unknown	svepskäl	26ee5e7f-a5db-4bc0-ae81-732f58ce43fb	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Kamomilla stad\n\nAll alkohol är bra för hyn\n\nden främjar ansiktsfärgen\n\noch ger oss skinn som rosentryn,\n\ndet känns rätt in i märgen.\n\nSå det är blott av hälsoskäl,\n\nvi dricker den för ve och väl.\n\nFör annars så dricker vi inte nån sprit,\n\nvarken Skåne, Gauffin eller Akvavit.\n\nEn liten klar är för din kropp,\n\nen kärleksfull behandling.\n\nDå genomgår ditt blodomlopp\n\nen effektiv förvandling.\n\nDin kropp blir kall som härdat stål\n\nmed hjälp av smaksatt etanol.\n\nVi ser det blott som medicinsubstitut\n\nnär vi dricker Svartvinbärs och Absolut.	f	842287d4-5e7f-41c8-96d6-5596651998ec
5caaf164-3f4a-4715-a869-ef6ad92656e9	VINVISA	Unknown	vinvisa	b3332fb7-bb1b-483b-8b42-16ece9b2a0f6	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Vila vid denna källa\n\nMosel, Valpolicella,\n\nMendozo Tinto vi upphälla.\n\nLacrima Christo rosso\n\noch en nyss öppnad Vin Rouge d'Algerie.\n\nMavrud, Clarete Fino\n\noch Bordeaux Blanc, Coq Rouge och Vino\n\nTinto, Ockfener Bockstein,\n\nPetit Chablis, men bara ett par glas.\n\nChateaux Margeaux Pardor!\n\nMouton Rotschild och Carneval Perlerose!\n\nVi blir canon\\...\n\nGossar! Vi vill beställa\n\nen C6tes-du-Rhone för tio och tju'fem.\n\nCorno (con bocca chiusa)\n\nOm lagret räcker än!	f	842287d4-5e7f-41c8-96d6-5596651998ec
dbcc7bcb-8e10-490c-a511-4c59b63f7e7c	LILLE MATS	Unknown	lille_mats	66b4bd76-c249-424f-b80a-a0ca989a1346	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Lille Katt*\n\nLille Mats, lille Mats,\n\ntrivdes ej i sitt palats\n\nhan tog sats, han tog sats\n\noch hoppa' till en annan plats\n\nLille Per, Lille Per,\n\ntrivdes inte heller där\n\nhan tog sats, han tog sats\n\noch hoppa' rakt på lille Mats	f	842287d4-5e7f-41c8-96d6-5596651998ec
f675093b-e284-4e96-a244-8d84ebbd74b7	**BYSSAN LULL**	Unknown	**byssan_lull**	38af3380-6c93-4106-b935-54f6d74087fb	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Byssan lull\n\n//:Byssan lull utav vinet blir man full,\n\noch slipsen man doppar i smöret://\n\nJa, näsan den blir röd,\n\nOch ögonen får glöd,\n\nOch tusan så bra blir humöret.	f	842287d4-5e7f-41c8-96d6-5596651998ec
d5ad0b1f-1756-4df7-a24b-e498c7ad27fb	KALLA KALLSÅNGER	Unknown	kalla_kallsånger	ec2da08f-5cbc-43ff-af89-5d3ccddfd8f7	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Kalle på spången*\n\nVad är det som gör att du fryser där bak?\n\nJo, kalla, kalla, kalla, kalla kallsånger.\n\nVad är det som gör att din snopp hänger slak?\n\nJo, kalla, kalla, kalla, kalla kallsånger.\n\nTrots en excellent, kompetent, attrahent,\n\nman mot kärleksnycker förblir resistent.\n\nVad är det som gör att man blir impotent?\n\nJo, kalla. Hur kalla?\n\nJävligt kalla. Hur kalla?\n\nJo, kalla kalla kalla kalla kallsånger.\n\n*(Sjunges lämpligtvis som ackompanjemang till Quarls snapsvisa)*	f	842287d4-5e7f-41c8-96d6-5596651998ec
f1e81a6d-8b4c-4793-a2e5-66d131c4eaba	OP RIVER	Unknown	op_river	5e9731e1-3115-49e1-b51d-8bbf466c11f2	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Old man river*\n\nOP river, ja OP river,\n\nVar gång jag lenat\n\nMin hals med renat\n\nJag sagt med iver,\n\nAtt OP river,\n\nLångt ner.\n\nMången glädes,\n\nNär han får sädes,\n\nOch fattighjonet,\n\nSyns le mot kronet,\n\nMen faktum bliver,\n\nAtt OP river,\n\nLångt ner.	f	842287d4-5e7f-41c8-96d6-5596651998ec
51ef4985-3a28-4f39-9ba3-7ed3fab41210	BORDEAUX, BORDEAUX	Unknown	bordeaux,_bordeaux	a79d19bc-7985-4308-8779-dbd0f2a930f7	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: I sommarens soliga dagar\n\nJag minns än idag hur min fader,\n\nkom hem ifrån staden så glader.\n\nHan rada' upp flaskor i rader\n\noch sade nöjd som så:\n\nBordeaux, Bordeaux!\n\nHan drack ett glas, kom i extas, och sedan blev det stort kalas.\n\nOch vi små glin, ja vi drack vin, som första klassens fyllesvin\n\noch vi dansade runt där på bordet\n\noch skrek så vi blev blå:\n\nBordeaux, Bordeaux	f	842287d4-5e7f-41c8-96d6-5596651998ec
694d881b-d0db-49b1-9f4f-777638181776	BÄR UT MIG I SNÖN	Unknown	bär_ut_mig_i_snön	b5fddba9-c171-4464-8ac9-0b2ae489008f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Bär ner mig till sjön\n\n/: Bär ut mig i snön, bär ut mig i snön\n\nJag känner att jag måste spy :/\n\nOch när jag kastat upp\n\nså får du torka opp\n\noch när du torkat upp\n\nså kan jag spy igen.	f	842287d4-5e7f-41c8-96d6-5596651998ec
038498ab-5d7b-4d5c-bccd-427635b7501e	LIFE	Unknown	life	0b133575-dec2-4305-be53-2119470bd449	53fcad8b-9c6b-492e-9af6-26ecb593720f	Life is a pleasure!  \nTovarisch, a great big pleasure!  \nAll of our troubles are reduced to zero  \nwhen we have got a drop to wet our gum.\n\nLet\\'s have a vodka!  \nTovarisch, a little vodka!  \nEmpty your goblet like a Viking hero;  \nthere will be many more to come  \n\\-- Hey!	f	842287d4-5e7f-41c8-96d6-5596651998ec
ea60b122-5aa6-4de7-a71a-852bf6caea0f	SUDDA SUDDA	Unknown	sudda_sudda	a61882a9-da03-4d43-baaf-62a5268083d2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Sudda bort din sura min\n\nSudda, sudda,sudda, sudda bort din sura min.\n\nMed fyra jättestora bamseklunkar ädelt vin.\n\nMunnen den skall skratta och va' gla'!\n\nFör att den ska bli som den ska va'\n\nVad häller du då bak det dolda flinet?\n\nJo vinet, som suddar, suddar bort din sura min.	f	842287d4-5e7f-41c8-96d6-5596651998ec
2f412b0a-0436-4d98-b615-58b16921c8ba	PELLEJÖNS	Unknown	pellejöns	07142a23-153d-453a-8d39-91277ede921d	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Jag har en gammal moster*\n\nDet var en gång en daggmask,\\\nsom hette Pellejöns\\\nHan var så rädd för skator,\\\nhan var så rädd för höns.\\\nHan var så rädd för metare och letare med burk.\\\nOch dom som satte mask på krok,\\\ndom kalla\\' han för skurk.\n\nEn dag så tänkte masken\\\nnu borrar jag mig ner,\\\nen meter under marken\\\nså syns jag inte mer.\\\nI trädgår\\'n gick metare och letare och höns\\\ndom hitta massa maskar,\\\nmen inte Pellejöns.	f	842287d4-5e7f-41c8-96d6-5596651998ec
46cd7f85-18a4-4d7c-a875-10bdc4b60972	MUNKAR	Unknown	munkar	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag vill ha munkar munkar munkar med hål i,\\\nstora feta munkar med hål i.\\\nNär jag kommer hem till dej,\\\nså vill jag inte ha nån leverpastej.\n\nJag vill ha nunnor nunnor nunnor med hål i,\\\nstora feta nunnor med hål i.\\\nNär jag kommer hem till dej,\\\nså vill jag faktiskt ha en annan tjej.\n\nJag vill ha kramar kramar kramar med tryck i,\\\nstora mjuka kramar med tryck i.\\\nNär jag kommer hem till dej,\\\nså vill jag inte ha nån leverpastej.\n\nJag vill ha kyssar kyssar kyssar med sug i,\\\nstora blöta kyssar med sug i.\\\nNär jag kommer hem till dej,\\\nså vill jag inte ha nån leverpastej.	f	842287d4-5e7f-41c8-96d6-5596651998ec
a760577d-755a-47f4-9d2c-a45c31a860c5	PUNSCHEN KOMMER VARM	Unknown	punschen_kommer_varm	bf4527d6-f3ca-4524-bb64-7352feebe611	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Glada Änkan\n\nPunschen kommer, punschen kommer,\n\nljuv och varm.\n\nVettet svinner, droppen rinner\n\nner i tarm.\n\nSkål för glada minnen,\n\ndem vi snart ej ha,\n\ndå ett par glas simmig punsch\n\nvi hunnit ta..	f	842287d4-5e7f-41c8-96d6-5596651998ec
30b3267b-6464-49fc-8fb9-15d49d6e0e97	KAFFEVISA	Unknown	kaffevisa	7d6d43dc-ec09-40a9-b06d-bbcb55f646ab	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Du ska få min gamla cykel*\n\nKaffe, kaffe, kaffe,\n\nkonjak och likör,\n\nger åt alla här ett mycket gott humör.\n\nPå det ska ni ge er katten,\n\nvi skall sitta hela natten,\n\ndricka kaffe, kaffe, konjak och likör	f	842287d4-5e7f-41c8-96d6-5596651998ec
442e8541-a81d-4442-af93-d9c411d01937	UTVANDRAREN	Unknown	utvandraren	e636e963-b79e-4034-ae43-3be6bbedb742	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Når månen vandrar...\n\nJag tänker sälja min dromedar.\n\nJag tänker flytta till norden.\n\nVem vill va' bosatt uti ett land\n\ndär man får ligga vid borden?\n\nNu konverterar jag, här på snabben!\n\nJag vill ha akvavit till kebaben!\n\nVar ingen mes.\n\nFyll upp min fez!\n\n*Lundakarnevalen 1998*	f	842287d4-5e7f-41c8-96d6-5596651998ec
321aa5a3-9ae9-4101-8491-24689dcdb1a2	DAMSUPÉVISA	Unknown	damsupévisa	86030790-4b79-4a71-b26b-56a0570b4cbd	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Schottis på Valhall\n\nUpp och hoppa kvinns,\n\nvisa att vi finns.\n\nLåt oss storma sektionen i kväll!\n\nKläm nu alla i\n\nmed stor frenesi,\n\nvi ska kämpa och segern blir säll.\n\nTag en redig sup\n\nut ur bägar'n djup.\n\nEtt-två-tre ned i magen den häll!\n\nAlla ska nu få se\n\natt vi duger nå't te',\n\nVi ska storma sektionen i kväll!	f	842287d4-5e7f-41c8-96d6-5596651998ec
f0274320-f40e-4016-88ed-b03d527c2fe6	JAG SER NI KRÖKAR	Unknown	jag_ser_ni_krökar	3c593ffe-87d1-4b3a-84a0-bc437c585996	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Ja se det snöar\n\nJag ser ni krökar, jag ser ni krökar,\n\ndet var väl trevligt. Hurra!\n\nNu blir ni fulla, nu blir ni fulla,\n\nmen se det blir inte jag.\n\nFör jag har huve't på skaft\n\noch jag dricker blott saft,\n\nför jag vill minnas den tiden\n\njag med er har haft.	f	842287d4-5e7f-41c8-96d6-5596651998ec
158de0da-5d25-4aa1-9382-74c0cbeb0681	VÄDJAN TILL PUNSCHEN	Unknown	vädjan_till_punschen	fd754077-88bd-44f5-bc7c-54f7080ec055	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Sov du lilla videung\n\nKom nu lilla punschen min,\n\nfölj nu efter supen.\n\nSnart så ska du åka in,\n\nner igenom strupen,\n\ntill mitt stora magpalats,\n\ndär det finns så mycket plats.\n\nKom nu lilla punschen,\n\nfölj nu efter supen.	f	842287d4-5e7f-41c8-96d6-5596651998ec
f6535aa6-22ed-4dc1-9587-018f9bf61ee5	NUBBEN GOA	Unknown	nubben_goa	3fefad04-935e-4e33-8846-5d02748a3265	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Gubben Noak\n\nNubben goa, nubben goa\n\när en hederssup.\n\nUti alko-hålet,\n\ntöm den om du tål'et.\n\nNubben goa, nubben goa\n\när en hederssup.	f	842287d4-5e7f-41c8-96d6-5596651998ec
ae572e33-b868-4758-9e95-5a092af65c77	KISSEMISS	Göran Svensson	kissemiss	7f70eb14-75d1-46f8-824b-32e5ca5a1d44	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Du skall få min gamla...*\n\nTänk så trevligt att ni kunde komma hit\n\nLåt oss ta en liten jamare med flit\n\nBlir vi sedan lätt i hatten\n\nJa då kan man ge sig katten\n\nPå att jamaren vi tatt den var av sprit.\n\nSå sjung mjau, mjau kissemisse mjau.\n\nJa, sjung mjau, mjau kissemisse mjau.\n\nOm vi jamar hela natten\n\nDesto gladare blir skratten\n\nEfter slatten får rabatten en visit.\n\n*Sångarstriden i Lund, 1990*\n\n*Text: Göran Svensson*	f	842287d4-5e7f-41c8-96d6-5596651998ec
16635ea5-add3-44c4-8f82-25e1b94e2424	VI ÄR IT	Henrik Jernevad och Tomas Forsman, IT2002	vi_är_it	a8fddde8-5388-4bbb-9aaf-5f522d14e2f8	53fcad8b-9c6b-492e-9af6-26ecb593720f	Vi pluggar hela dan, festar sönder stan  \nröjer loss, gör Göteborg osäkert  \nnär vi laddar upp  \nblir det gasque förstås  \nalla vill va med när IT går loss\n\nVi är, vi är, IT!  \nVi är, vi är, IT!\n\nSenare nått år när vi tjänar fett  \nkommer vi att vara de som gör allt rätt  \noch när allt är trist  \nkommer IT så friskt  \noch över hela världen vi styr med list\n\nVi är, vi är, IT!  \nVi är, vi är, IT!\n\nSom gamlingar vi går med rullator och bår  \nser på allt på det sätt som vi förstår  \nsom noll och ett  \nallting blir lätt  \nvi visar de unga hur man gör nått rätt\n\nVi är, vi är, IT!  \nVi är, vi är, IT!\n\nVi är, vi är, IT!  \nVi är, vi är, IT!	f	842287d4-5e7f-41c8-96d6-5596651998ec
8ca56b7b-8555-423c-b283-15e7ebbdf08a	SIFFERVISAN	Unknown	siffervisan	1c50b4dd-910d-4341-bfaf-0ae4ee19d9a5	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Ritsch, ratsch, filibom\\...*\n\n1, 2, 75, 6, 7, 75, 6, 7, 75, 6, 7\n\n1, 2, 75, 6, 7, 75, 6, 7, 73\n\n107, 103, 102, 101, 627\n\n19, 18, 17, 16, 15, 14, 13, 20\n\n11, 10, 9, 8, ta så supen nu\n\nSCHÅÅÅL!!!	f	842287d4-5e7f-41c8-96d6-5596651998ec
b2bbd1e0-b10e-42c3-be1e-d30410fef90c	PORTOS VISA	Unknown	portos_visa	94696550-e89f-48ff-a398-686b3d8bb4f9	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag vill ut och gasqua,\n\nvar faan är min flaska,\n\nvem i helvete stal min butelj?\n\nSkall törsten mig tvinga,\n\nen TT börja svinga,\n\nnej för fan bara blunda och svälj.\n\nVilken smörja, får jag spörja,\n\nvem för fan tror att jag är en älg.\n\nTill England vi rider\n\noch sedan vad det lider,\n\nträffar vi välan på någon pub.\n\nOch där skall vi festa,\n\nblott dricka av det bästa\n\nutav whisky och portvin,\n\njag tänker gå hårt in\n\nför att prova på rubb och stubb.	f	842287d4-5e7f-41c8-96d6-5596651998ec
e4c49d37-a137-47fc-ba6b-2ff6021fd106	NOLLBRICKS-AVTAGNINGSRAMSA	NollKIT -03	nollbricks-avtagningsramsa	fcb5b7b3-e422-4c81-bce8-8ec06dc4ce42	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Armen i vinkel (ramsa)*\n\n"Handen på brickan\n\noch brickan i skyn\n\nSå var vi klara\n\nAtt ettor få vara\n\nVårt mål har vi nått\n\nBrickan den ska bort!"\n\n*Text: NollKIT -03*	f	842287d4-5e7f-41c8-96d6-5596651998ec
0c294a70-e75e-4823-bdca-b7ce4625d006	IT: s PUB	P.R.I.T. -04	it:_s_pub	113b741a-1a30-476b-bb15-5d875afd29df	53fcad8b-9c6b-492e-9af6-26ecb593720f	Vill du ut och festa  \nOch sen nya saker testa  \nVill du ha det roligt  \nKom till IT: s pub ida'!\n\nJa, till IT ska vi sticka  \nFör där finns mat, musik och dricka  \nHär samlas det bästa folket  \nJa, precis som det ska va'!\n\nKom nu allihopa  \nNu ska vi glada sånger ropa  \nDansa, flirta, sjunga  \nVart annars vill man va'?\n\nJa, till IT ska vi sticka...	f	842287d4-5e7f-41c8-96d6-5596651998ec
3f4efe72-5a01-49a6-81a0-77c9a71b2afc	DAMERNAS SKÅL	Unknown	damernas_skål	824478fe-360b-4152-a78a-e163353f9766	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Marseljäsen\n\nNu ska vi höja våra kalla glas\n\noch dricka skålen för vår dam.\n\nHon är värd att ständigt besjungas,\n\ndyrkas, sättas på piedestal.\n\nHon är medelpunkt i våra liv,\n\nvår främsta källa till glädje.\n\nVi hyllar med sång\n\noch höjer vårt glas\n\noch dricker kvinnans skål!	f	842287d4-5e7f-41c8-96d6-5596651998ec
165778d9-c9da-4bf3-a937-de2b8208cf67	F-ARENS MORGON	Unknown	f-arens_morgon	85a96098-bd67-4165-8d00-f916766fded2	53fcad8b-9c6b-492e-9af6-26ecb593720f	F-aren han vältrar med ett bröl ur sin säng,\n\nhuvudet det dunkar och tungan känns torr och stel.\n\nSen tvärs över golvet fram till skåpet han går,\n\nflaskan kommer fram och han säger gutår.\n\nTurkosa lilla Smurfen ack vore jag som du,\n\nDu bangar aldrig ur och du festar ju för sju,\n\nDu pallar för det mesta,\n\ndet är nåt hemskt vad du kan festa.\n\nAj, vad det gungar, var fan finns det magnecyl?!!\n\n*(Plockad ur F-arnas sånghäfte, nästan utan modifikation)*	f	842287d4-5e7f-41c8-96d6-5596651998ec
af69583b-74a6-46a1-bc7b-d49f6f7e9055	RATATATA	Unknown	ratatata	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Att dricka brännvin är en sed som ingen har oss lärt.\n\nFrån början vi ej kunde, men det var blott temporärt.\n\nSå lärde vi oss själva, och nog var det värt besvär't.\n\nTutilurenbom tutilurenpang, nog var det värt besvär't.\n\n//:Rattatta, så tar vi oss en tuting. Rattatta, med mycket brännvin i.\nRattataa, rattataa, dricka brännvin gillar ja', för jag blir så glad\nida'!://	f	842287d4-5e7f-41c8-96d6-5596651998ec
ea55efc8-653f-45f8-ae0b-df07fe8d2687	MERA BRÄNNVIN	Unknown	mera_brännvin	721b0c12-9336-474d-99b9-0161b591f0c7	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mera brännvin i glasen\n\nmera glas på vårt bord\n\nmera bord på kalasen\n\nmer kalas på vår jord\n\nMera jordar med måne\n\nmera månar i mars\n\nmera marscher till Skåne\n\nmera Skåne, gu-bevars, bevars, bevars	f	842287d4-5e7f-41c8-96d6-5596651998ec
841c37c1-d2e4-4e1a-96a1-40953708c19e	USCH USCH	Unknown	usch_usch	15726ba3-cd80-445d-8971-ecaa3f820eee	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: It's a long way to...\n\nDet är en lång väg, för lilla supen,\n\nja, en lång väg att gå.\n\nDet bränner illa i hela strupen\n\noch det kittlar i var tå.\n\nÅh det susar upp i knoppen,\n\nvarje droppe känns som två.\n\n//:Det säger usch, usch, usch i hela kroppen, men är härligt ändå!://\n\n*Ur Chalmersspexet Nils Dacke, 1977*	f	842287d4-5e7f-41c8-96d6-5596651998ec
2795efc1-2419-4a3e-83de-e5730b6f7681	JAG ÄR EN LITEN UNDULAT	Unknown	jag_är_en_liten_undulat	e26a3f98-b079-40a7-8878-0df9f4a8dc19	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Med en enkel tulipan\n\nJag är en liten undulat,\n\nsom får så dåligt med mat.\n\nFör dom jag bor hos,\n\nja dom jag bor hos,\n\ndom är så snåla.\n\nDom ger mig sill varenda dag,\n\nmen det vill jag inte ha\n\njag vill ha rödvin,\n\njag vill ha rödvin\n\noch gorgonzola .	f	842287d4-5e7f-41c8-96d6-5596651998ec
168b18e3-06a7-4e81-bdd6-ce46feb2b15f	MORS LILLE OLLE	Unknown	mors_lille_olle	cecc9545-9742-4b79-ba1f-44155f009211	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mors lilla Olle,  \npå krogen satt  \nrosor på kinden men  \nblicken var matt  \nLäpparna små,  \nliksom näsan var blå  \nbara jag kunde  \nså skulle jag gå.	f	842287d4-5e7f-41c8-96d6-5596651998ec
6e9beebe-4df9-4f15-8b9f-e9ddaf043012	HÄRJAREVISAN	Unknown	härjarevisan	c84cdaaf-a722-43ea-9401-0917ee6a0f5f	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Gärdebylåten*\n\nLiksom våra fäder vikingarna i Norden\n\ndrar vi riket runt och super oss under borden.\n\nBrännvinet har blivit ett elixir för kropp såväl som själ.\n\nKänner du dig liten och ynklig på jorden\n\nväxer du med supen och blir stor uti orden,\n\nslår dig för ditt håriga bröst och blir en karl från hår till häl.\n\nJa, nu skall vi ut och härja, supa och slåss och svärja,\n\nbränna röda stugor, slå små barn och säga fula ord\n\nMed blod ska vi stäppen färga.\n\nNu änteligen lär jag\n\nkunna dra nån verklig nytta\n\nav min Hermodskurs i mord.\n\nHurra nu ska man äntligen få röra på benen,\n\nhela stammen jublar och det spritter i grenen.\n\nTänk att än en gång få skrida fram på Brunte i galopp.\n\nDin doft o kära Brunte är trots brist i hygienen\n\nför en vild mongol minst lika ljuv som syrenen.\n\nTänk att än en gång få rida runt i stan och spela topp!\n\nJa, nu skall vi ut och härja....\n\nJa, mordbränder är häftiga, ta fram fotogenen\n\noch eftersläckning tillhör ju just de fenomenen\n\ninom brandmansyrket som jag tycker\n\natt det är nån nytta med.\n\nJag målar för mitt inre upp den härliga scenen:\n\nBlodrött mitt i brandgult, ej ens prins Eugen,\n\nEn lika mustig vy kunde måla,\n\nEns om han målade med sked.\n\nJa nu skall vi ut och härja.....	f	842287d4-5e7f-41c8-96d6-5596651998ec
2a164d0f-110c-48ee-bd40-8725b2347d5a	**RÖD VITAMIN**	Unknown	**röd_vitamin**	8d925b9d-6252-40fe-b0df-18b4834822e2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: My Bonnie\n\nHur badar man bäst på en kurort?\\\nJo, om man har fyllt en bassäng,\\\nmed vätskan som snart skall besjungas\\\nnär vi kommit fram till refräng;\n\nRödvin, rödvin.\\\nRödvin är fin hälsokost, kost, kost.\\\nRödvin, rödvin.\\\nRödvin vår bästa flaskpost.\n\nMan får vitaminer fån rödvin.\\\nMan piggnar ju till på en gång,\\\nnär glaset har tömts uti botten\\\nså stämmer vi upp till en sång.\n\nRödvin, rödvin\\...\n\nUr sångboken fån Lundakarnevalen	f	842287d4-5e7f-41c8-96d6-5596651998ec
eb833e21-c62c-4bd1-aa59-b545b565f7c1	MIN PILSNER	Unknown	min_pilsner	ccfc6367-0a92-4ded-b5e7-82506b01b164	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: My Bonnie\n\nMin pilsner ska svalka min tunga\n\nMin pilsner skall duscha min gom\n\nMin pilsner skall få mig att sjunga\n\nOm jag ser att flaskan är tom\n\nPilsner! Pilsner!\n\nHämta en pilsner till mig, till mig!\n\nPilsner! Pilsner!\n\nHämta en pilsner till mig!	f	842287d4-5e7f-41c8-96d6-5596651998ec
e059d636-bee8-4da3-b7a3-1f43f5972f87	FREDMANS EPISTEL NR: 21	Carl Michael Bellman	fredmans_epistel_nr:_21	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Så lunkar vi så småningom\n\nFrån Bacchi buller och tumult\n\nNär döden ropar: Granne kom\n\nDitt timglas är nu fullt!\n\nDu gubbe fäll din krycka ned,\n\nOch du, din yngling, lyd min lag:\n\nDen skönsta nymf som åt dig ler\n\nInunder armen tag!\n\nTycker du att graven är för djup\n\nNå välan så tag dig då en sup\n\nTa dig sen dito en, dito två dito tre,\n\nSå dör du nöjdare.\n\nMen du som med en trumpen min\n\nbland reglar, galler, järn och lås,\n\ndig vilar på ditt penningskrin\n\ninom ditt stängda bås.\n\nOch du som är svartsjuk slår i kras\n\nButeljer, speglar och kopal,\n\nbjud nu god natt, drick ur ditt glas\n\noch hälsa din rival.\n\nTycker du att graven.....\n\nSäg är du nöjd, min granne säg,\n\nSå prisa värden nu till slut.\n\nOm vi ha en och samma väg\n\nSå följsom åt -- drick ut!\n\nMen först med vinet rött och vitt\n\nFör vår värdinna bugom oss\n\nOch halkom sen i graven fritt\n\nVid aftonstjärnans bloss.\n\nTycker du att graven.....	f	842287d4-5e7f-41c8-96d6-5596651998ec
7427998f-556a-462d-890e-21acc9be9a11	LIVETS VÄLBEHAG	P.R.I.T. -04	livets_välbehag	f574319a-99b7-4925-9e26-46b442d20438	53fcad8b-9c6b-492e-9af6-26ecb593720f	En liten sång, vi sjung idag,  \nEn sång om livets välbehag  \nEn sång om öl och Bäsk och Skåne  \nEn sång om livets välbehag!\n\n*Text: P.R.I.T. -04*	f	842287d4-5e7f-41c8-96d6-5596651998ec
e3cb3d72-3590-45da-9848-f77b79aa0d53	**TA ETT GLAS**	Unknown	**ta_ett_glas**	d8d2baa1-18be-4bcb-a47b-ce9db1610801	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Oh, Tannenbaum\n\nOh, ta ett glas,\\\nOh, ta ett glas.\\\nTy vinet för oss samman.\\\nOch den som inget glas vill ha,\\\nhan sjunger och är lika gla\\'.\\\nMen ta ett glas,\\\nja ta ett glas,\\\nför livets fröjd och gamman.	f	842287d4-5e7f-41c8-96d6-5596651998ec
e2f21ec2-4071-451b-9414-91883eecb1bc	**DU GAMLA, DU FINA**	Unknown	**du_gamla,_du_fina**	b01bf346-2844-493c-9257-63a3b64f165b	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Svenska nationalsången\n\nDu gamla, du fina, du årgångna vin,\n\nsom plockats och trampats ibland bergen.\n\nJag dyrkar aromen och smaken så fin,\n\nMen ljuvast utav allt är ändå färgen.\n\nDen drycken den går ända in i märgen.\n\nNu fyller vi glasen och höjer vår arm.\n\nFör lycka och vänskapsband vi skåla.\n\nJa, vinet det har en förunderlig charm.\n\nÄr nästan lika gott som rom och cola,\n\nså låt oss därför med varandra skåla.	f	842287d4-5e7f-41c8-96d6-5596651998ec
5c1e262e-c39d-4e8b-8787-aa6e1b171bf9	EN 'RÄNNVINSKOKARE	Unknown	en_'rännvinskokare	36231403-8759-4f32-b3a7-cd8d227b1ab6	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: En sockerbagare\n\nEn 'rännvinskokare här bor i skogen,\n\nhan säljer 'rännvinet svart på krogen.\n\nOch är du nykter så kan du gå,\n\nmen är du fuller så kan du int'.	f	842287d4-5e7f-41c8-96d6-5596651998ec
fcff1adc-14b5-4815-8069-bbed2c5385d8	BREV FRÅN KOLONIEN	Unknown	brev_från_kolonien	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Hejsan morsan, hejsan stabben.\\\nHär är brev från älsklingsgrabben.\\\nVi har kul på kolonien.\\\nVi bor tjugoåtta gangstergrabbar i en\\...\n\n\\...stor barack med massa sängar.\\\nKan ni skicka mera pengar?\\\nFör det vore en god gärning.\\\nJag har spelat bort vartenda dugg på tärning.\n\nHär är roligt vill jag lova,\\\nfastän lite svårt att sova.\\\nKillen som har sängen över mig,\\\nhan vaknar inte han när han behöver, nej.\n\nJag har tappat två framtänder\\\nför jag skulle gå på händer\\\nnär vi lattjade charader,\\\nså när morsan nu får se mig får hon spader.\n\nUti skogen finns baciller\\\nmen min kompis han har piller\\\nsom han köpt utav en ful typ\\\noch om man äter dom blir man en jättekul typ.\n\nJag är inte rädd för spöken\\\noch min kompis, han har kröken\\\nsom han gjort utav potatis\\\noch den säljer han i baracken nästan gratis.\n\nVåran fröken är försvunnen.\\\nHon har dränkt sig uti brunnen\\\nför en morgon blev hon galen\\\nför vi släppte ut en huggorm i matsalen.\n\nFöreståndar\\'n han har farit.\\\nHan blir aldrig vad han varit\\\nför polisen kom och tog hand\\\nom honom för en vecka när vi lekte skogsbrand.\n\nUti skogen finns det rådjur.\\\nI baracken finns det smådjur\\\noch min bäste kompis Tage\\\nhan har en liten fickkniv inuti sin mage.\n\nHonom ska dom operera.\\\nJa, nu vet jag inget mera.\\\nKram och kyss och hjärtligt tack sen\\\nmen nu ska vi ut och bränna grannbaracken.	f	842287d4-5e7f-41c8-96d6-5596651998ec
60afbfe4-6579-4e50-8756-a9ff4ef40096	LILLA NUBBEN	Unknown	lilla_nubben	643863b3-9a93-42df-a435-770f987fb3a0	53fcad8b-9c6b-492e-9af6-26ecb593720f	//:Tänk om jag hade lilla nubben på ett snöre i halsen://\n\nJag skulle dra, den upp och ner, så att den kändes som många fler.\n\nJa, tänk om jag hade lilla nubben uppå ett snöre i halsen!	f	842287d4-5e7f-41c8-96d6-5596651998ec
aca8be84-efe8-43ff-a3ad-5d515e96b0ea	KOPPARSLAGAREN	Unknown	kopparslagaren	a4791ce3-e94c-4a45-8cdb-57f75c082b14	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: En sockerbagare\n\nEn kopparslagare jag har i knoppen\n\njag har försökt att på den få stopp men\n\ndet hjälper inte med magnecyl\n\nej heller treo eller albyl\n\nOch i mitt barskåp blott tomma burkar\n\ndet blev helt länsat i natt av skurkar\n\nsom lämnat mig här i hemmet torrt\n\nmed värk i huvud jag vill få bort.	f	842287d4-5e7f-41c8-96d6-5596651998ec
52945a42-38ba-4ef1-a915-e20fa57f14ed	VIT VECKA	Unknown	vit_vecka	cc581ecb-59cc-417a-aeb4-79c918e50c12	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: White christmas\n\nJag drömmer om en vit vecka\n\nSju dagar utan alkohol.\n\nTänk att bara skåla\n\ni juice och cola\n\noch sedan minnas allt man gjort.\n\nJag drömmer om en vit vecka,\n\ndet finns en gräns för vad jag tål.\n\nJag vill inte dricka\n\nmera sprit\n\nså låt nästa vecka vara vit.	f	842287d4-5e7f-41c8-96d6-5596651998ec
2dd37434-cbe9-4d39-b715-ba59f2a528d3	ÖHL I GLAS	Unknown	öhl_i_glas	01afb0a6-58bd-4d4b-a5b0-5e91fac81e9f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Row your boat\n\nÖhl, öhl, öhl I glas\n\neller I butelj\n\nSkummande, skummande, skummande skummande\n\nTa en klunk och svälj!	f	842287d4-5e7f-41c8-96d6-5596651998ec
363c5985-ec29-4762-8949-e586c7d759f9	UNDER EN FILT I MADRID	Claes Eriksson	under_en_filt_i_madrid	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Under en filt i Madrid ligger en flicka på glid.\\\nTittar på mannen bredvid. Under en filt i Madrid.\\\nBakom ett berg i Genéve där får en moder ett brev\\\nfrån hennes dotter på glid. Under en filt i Madrid.\n\nFramför en stolpe i Bonn sitter det nu inte nån.\\\nEndast en tom La Garonne. Framför en stolpe i Bonn.\\\nMen där i vindarnas drev fladdrar ett brev fån Genéve.\\\nPostat nån gång i Bretagne. Doftande billig champagne\n\nPå en bordell i Borås smörjer en herre sitt kås.\\\nBakom ett skjul i Tasjkent där står ett fönster på\\\nglänt.\\\nNågon har kastat ett skal genom en jak i Nepal.\\\nIngenting är som det skall. Solen är blott en marschall.\n\nSjälv är jag blott en kostym. Mamma är bara parfym.\\\nPappa förspiller sin tid under en filt i Madrid.\\\nUnder ett lakan i Prag där ligger en kvinna och jag.\\\nSängen är full av resår. Sången jag sjunger är\\\nsvår.\n\nOmöjlig att komma ur. Jag vet då fan inte hur.\\\nOrden får snart inte rum. Jag får väl sjunga mig stum.\\\nTonerna trängs i min gom. Sätt mig på tåget till Rom!\\\nJa, låt mig få sluta min tid under en filt i Madrid!\n\n*Text: Claes Eriksson*\\\n*Ur revyn Cyklar med Galenskaparna och After Shave*	f	842287d4-5e7f-41c8-96d6-5596651998ec
4a452390-670d-47f8-b3c4-0c3d62f10b00	VI ÄRO FRÅN IT	P.R.I.T. -04	vi_äro_från_it	cedff49d-9091-4946-b66e-7613e34f8cb2	53fcad8b-9c6b-492e-9af6-26ecb593720f	//:Vi äro från IT vi://\n\nVi gillar turkost och vi vördar ju Smurfen\n\nVi äro från IT vi.	f	842287d4-5e7f-41c8-96d6-5596651998ec
8ad8feec-43eb-437f-8bdc-26cdd9fb48ab	EFTER GÜCKEL	Unknown	efter_gückel	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Det där det gjorde de fan så bra\n\nEn skål uti botten för \\[**insert name**\\] vi tar\n\nHugg i och dra, HEJ\n\nHugg i och dra, HEJ\n\nEn skål ut i botten för \\[**insert name**\\] vi tar\n\nÅ alla så dricka vi nu \\[**insert name**\\] till.\n\nOch \\[**insert name**\\]  säger?!\n\n\\***Gücklande svarar**\\*\n\nFör det var i vår ungdoms fagraste vår\n\nVi drack varandra till och vi sade, Gutår.\n\nSkål Forrest!	f	842287d4-5e7f-41c8-96d6-5596651998ec
743e4dd2-9536-428f-9006-2cd1154f20cb	MÅSEN (KORT VERSION)	Unknown	måsen_(kort_version)	f4bbc115-9397-4cac-b26e-920d879e280f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Det satt en mås på en klyvarbom\\...\\  \nJag vill ha OP!	f	842287d4-5e7f-41c8-96d6-5596651998ec
fe6a8e1a-f041-48d9-8146-e260f4cec92b	JAG HAR ALDRIG VART PÅ SNUSEN	Unknown	jag_har_aldrig_vart_på_snusen	b8197909-74e6-45df-90a9-7cb721b9f9cd	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag har aldrig vart på snusen,\n\naldrig rökat en cigarr, halleluja!\n\nMina dygder äro tusen,\n\ninga syndiga laster jag har.\n\nJag har aldrig sett nåt naket,\n\ninte ens ett litet nyfött barn.\n\nMina blickar går mot taket,\n\ndärmed undgår jag frestarens garn, halleluja\n\nHalleluja, halleluja\n\nHalleluja, halleluja\n\nHalleluja, halleluja\n\nHalleluja-a-a.\n\nBacchus spelar på gitarren,\n\nSatan spelar på sitt handklaver.\n\nAlla djävlar dansar tango,\n\nsäg vad kan man väl önska sig mer.\n\nJo, att alla bäckar vore brännvin,\n\nGöta Älv var fylld med bayersk öl.\n\nCognac i varenda rännsten och punsch i\n\nvarendaste pöl.\n\nHalleluja, halleluja\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
4983add4-8b2b-4e0a-93a9-98dbbbfe7968	BRÄNNVIN	Unknown	brännvin	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Att sjungas av icke sångkunniga gäster, ty melodi saknas*\n\n*BOM bör markeras med slag i bordet eller stampning*\n\nDet var brännvin i flaskan när vi kom\n\nBOM, BOM\n\nnär vi gick\n\nBOM, BOM\n\nvar flaskan tom	f	842287d4-5e7f-41c8-96d6-5596651998ec
c448237f-82e5-4371-a887-9b28fdbc6920	EMILIAS SNAPSVISA	Unknown	emilias_snapsvisa	d65c0d2f-8987-4607-86fa-159a1b8646f2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Emil I Lönneberga\n\nVårt glas vi lyfter i extas\n\nnär vi är på kalas.\n\nVi mister både vett och sans\n\noch tappar vår balans.\n\nSnapsen gör mig listig och stark\n\njag kryper hem på stadig mark\n\nen sup är gott, hoppfallera,\n\nmen stackars mig, hoppfallerej.\n\nDen lilla återställaren\n\ni morgon får jag ta.\n\nJag aldrig mig min läxa lär,\n\nvar fest det utför bär.\n\nSnapsen gör mig ...	f	842287d4-5e7f-41c8-96d6-5596651998ec
5ad2e3c7-39fd-43f8-b4e9-c807442da774	MÅSEN	Unknown	måsen	d8dc7318-7406-46eb-aaf3-f3763678d2d8	53fcad8b-9c6b-492e-9af6-26ecb593720f	Det satt en mås på en klyvarbom\n\nOch tom i krävan var kräket.\n\nOch tungan lådde vid skepparns gom\n\nDär han satt uti bleket.\n\nJag vill ha sill hördes måsen rope'\n\nOch skepparn svarte: jag vill ha OP\n\nOm blott jag får, om blott jag får.\n\nNu lyfter måsen från klyvarbom\n\nOch vinden spelar i tågen\n\nOP'n svalkat har skepparns gom,\n\nJag önskar blott att jag såg 'en.\n\nSå nöjd och lycklig den arme saten\n\nHan sätter storseglet den krabaten,\n\nTill sjöss han far, och halvan tar!\n\nNär månen vandrar sin tysta ban\n\nOch tittar in i kajutan\n\nDå tänker jag att på ljusan dan\n\nDå kan jag klara mig utan\n\nJa jag kan klara mig utan månen\n\nMen utan OP'n och utan Skåne'n\n\nDet vete fan, det vete fan.	f	842287d4-5e7f-41c8-96d6-5596651998ec
f94c7e41-8507-4afd-a46d-c4a965c7e58e	VART ÄR KYPARN?	Unknown	vart_är_kyparn?	b79918ba-3548-43ed-adf4-bd6028b0ee83	53fcad8b-9c6b-492e-9af6-26ecb593720f	//:Vart fan har kypar'n tagit vägen  \ndet är så tomt uti glasen?://\n\nEtt sån't kalas, med tomma glas  \nDet liknar natta har han fått knas?\n\nVart fan har kypar'n tagit vägen  \ndet är så tomt uti glasen?	f	842287d4-5e7f-41c8-96d6-5596651998ec
0624f5d7-350e-488b-8804-2c453f0f13fd	HALLONSAFT	Unknown	hallonsaft	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	När smurfar ställer till med fest\n\nSå vet vi hur man festar bäst\n\nDom fixar en korv och en god pastej\n\nVi smurfar allt du kan tänka dig\n\nKulörta lyktor och musik\n\nEn tårta som är sagolik\n\nSå ställer dom fram en jättebål\n\nVi fyller våra glas och säger skål\n\nSaft, saft, hallonsaft\n\nBättre saft har ingen haft\n\nSaft, saft, hallonsaft\n\nBättre saft har ingen haft\n\nDet börjar i ett hallonland\n\nSom vi får smurfa av för hand\n\nSen blandas allt och kokas väl\n\nOch alla lägger ner sin själ\n\nTills det doftar gott och lyser rött\n\nOch smakar både starkt och sött\n\nMed lagom barr- och sockerhalt\n\nFör lite och för mycket skämmer allt\n\nSaft, saft, hallonsaft\\...\n\nOch när dom druckit ur ett glas\n\nSom händer på ett smurfkalas\n\nSå går dom strax och fyller på\n\nSå länge det finns mer att få\n\nJu mer dom dricker skrattar dom\n\nEller om det rent av är tvärtom\n\nGår lyckan då i hallonsaft\n\nMen kul får man ha av egen kraft\n\nSaft, saft, hallonsaft\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
a99f2688-7f3d-4fec-a676-ee2c0c8d0f6c	IT: S AFTER SKI SÅNG	Unknown	it:_s_after_ski_sång	c188ece8-10a0-4114-aae1-63cb912911d9	53fcad8b-9c6b-492e-9af6-26ecb593720f	På IT åks det skidor ifrån morrn' till kväll,\n\nsen festas hela natten på ett fjällhotell.\n\nMan vaknar på morgonen och mår skit\n\nDå någon har bjudit för mycket sprit.\n\nMen skål för alla åkare som kom hit!\n\nI lössnö nedför branterna där surfar vi.\n\nEtt gäng som pluggar data svischar vi förbi.\n\nDe verkar ha krockat med något stort,\n\nEtt sökträd och missat någon port,\n\nJa va' kul det är att snowboarda fort!\n\nDe bästa backarna de finns på After Ski,\n\nDet är de fina backarna med öl uti.\n\nNär du är trött på att va' offpist,\n\nPissed off på bar-kön som är så trist,\n\nBlir du glad när du får din öl till sist!	f	842287d4-5e7f-41c8-96d6-5596651998ec
ffb62ecc-9f70-4f9f-b7cd-5943702da10b	HELAN GÅR	Unknown	helan_går	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Helan går, sjung hopp faderallanlallanlej!  \nHelan går, sjung hopp faderallanlallanlej!\n\nOch den som inte helan tar  \nHan heller inte halvan får.  \nHelan går!\n\nSjung hopp faderallanlallanlej!	f	842287d4-5e7f-41c8-96d6-5596651998ec
1125ab7a-4aed-401f-b009-2842bdfb39bd	BRÄNNVIN ÄR JÄVLIGT	Unknown	brännvin_är_jävligt	66f41b6e-0030-40ab-8fe7-3caff9f25c5c	53fcad8b-9c6b-492e-9af6-26ecb593720f	För brännvin är jävligt gott,\n\nsmakar bättre ju mer man fått.\n\nMen går man i golvet\n\nså där mellan tolv och ett,\n\nså slår man sig jävligt hårt.	f	842287d4-5e7f-41c8-96d6-5596651998ec
ba95294e-217a-488a-9534-5247476a7b81	JU MERA ÖL VI DRICKER	Unknown	ju_mera_öl_vi_dricker	171716ee-1c2a-4c90-a113-7c16e0523704	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Ju mer vi är tillsammans\n\nJu mera öl vi dricker, vi dricker, vi dricker. Ju mera öl vi dricker, ju\nrundare vi bli. För rundare är sundare och sundare är rundare. Ju mera\nöl vi dricker, ju rundare vi bli.	f	842287d4-5e7f-41c8-96d6-5596651998ec
cdaa3572-6761-4627-ba0c-4cf31684ca6e	HUVET SLÅR KOPPARSLAG	Unknown	huvet_slår_kopparslag	59ec5a1e-e6ff-49c3-ab1d-b52dbefc6fb4	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Sankta Lucia\n\nHuvet slår kopparslag\n\nögonen svider\n\nmagen i obehag\n\nnatten den lider.\n\nDå genom strupen går\n\nhembränd en liten tår\n\nvördat vare vårat brännvin\n\nvördat vårt brännvin.	f	842287d4-5e7f-41c8-96d6-5596651998ec
129a1477-987e-41db-95fc-04db29c95e44	TECKENVISAN (av NollKIT, 2012)	Unknown	teckenvisan_(av_nollkit,_2012)	8d3dedab-e973-4e93-bacf-833b37f1ea9d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Tre pepparkaksgubbar\n\n. , . , / \\* \\_\n\n" \\# + ^ '\n\n{ { < ½\n\n& - ? ! @	f	842287d4-5e7f-41c8-96d6-5596651998ec
fb12b611-7bd0-4385-bdf5-36012577aecf	ÖHL	Unknown	öhl	debace28-4097-494b-a124-7f4033013f76	53fcad8b-9c6b-492e-9af6-26ecb593720f	//:Öhl, öhl fillibombombom, fillibombombom, fillibombombom://\n\nVi hade ju både Heineken och Nordic Wölf,\n\nTuborg Guld och lilla Preppens blå!\n\nDet blir för trist med sodavatten, sodavatten, sodavatten, det blir för\ntrist med sodavatten, ge mig lite öhl!	f	842287d4-5e7f-41c8-96d6-5596651998ec
865ce938-c715-415c-b845-b0130e0b43aa	HÄRLIG ÄR PUNSCHEN	Unknown	härlig_är_punschen	edda582a-d56d-4f2b-a75a-7b081326451c	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Härlig är jorden\n\nHärlig är punschen,\n\nhärlig är dess konsistens.\n\nSkönt är att taga den än en gång.\n\nGenom att taga punschen av daga\n\ngå vi till paradis med sång.	f	842287d4-5e7f-41c8-96d6-5596651998ec
0a4c1dec-cd90-4c99-ac6b-347ac84faa50	LAPIN KULTA	Unknown	lapin_kulta	45cd5adb-df51-410d-8d7f-cc21836f1c68	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Broder Jacob\n\nLapin Kulta, Lapin Kulta, Karjala, Karjala\n\nAura sekä Olvi, Aura sekä Olvi,\n\nKoff Koff Koff, Koff Koff Koff	f	842287d4-5e7f-41c8-96d6-5596651998ec
f7f25a32-9689-4b97-8b87-1f6706c8cacd	SER DU STJÄRNAN	Unknown	ser_du_stjärnan	b6c568ef-3e0a-4fe3-b118-5235da1436c4	53fcad8b-9c6b-492e-9af6-26ecb593720f	Ser du stjärnan i det blå?  \nTag en sup så ser du två.  \nTar du mera, ser du flera, stjärnor små.  \n\nSer du stjärnan i det blå?  \nTag en sup så ser du två.  \nTar du fler så går du ner på låg nivå.	f	842287d4-5e7f-41c8-96d6-5596651998ec
c602cb3c-4de6-4d71-bec2-60d16e697e96	FESTU: S PUNSCHVISA	Unknown	festu:_s_punschvisa	e7373e78-9927-4e00-a846-b820901fe0df	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Midnatt råder\n\nPunschen, Punschen, rinner genom strupen,\n\nner i djupen.\n\nBlandas, konfronteras där med supen,\n\ndär med supen.\n\nGula droppa stärker våra kroppar,\n\npunsch, punsch, punsch!	f	842287d4-5e7f-41c8-96d6-5596651998ec
9520ed54-a33b-4a60-a565-67671bcb2489	LYFTET	Unknown	lyftet	ab021877-baa5-4e36-a66d-5dbd075ac2ff	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Ding dong Merrily on high\n\nLyft ditt välförsedda glas\n\nDet är en härlig börda\n\nNu har tjejerna kalas\n\nVi segern snart skall skörda\n\n:/:Ding dingedingeding dingedingeding\n\ndingedingeding dong dong\n\nI morgon är det lördag:/:\n\nSätt nu glaset till din mun\n\nSe döden på dig väntar\n\nNu har tjejerna kalas\n\nHör liemannen flämtar\n\n:/: Ding dingedingeding\\...\n\n\\...\n\nBegravningsklockor klämtar:/:	f	842287d4-5e7f-41c8-96d6-5596651998ec
f309d9be-98e5-4c7c-a382-dadb65370920	ÄNGLAHUND	Unknown	änglahund	dd8d6a38-6e68-44db-9229-bbde36309b9b	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Marseljäsen\n\nDet står en hund på fjärde våningen,\n\noch den tänker hoppa ner!\n\nBANZAI! (supen tages)\n\nDet var en japanesisk självmordshund,\n\noch den hoppar aldrig mer!\n\n*Sångarstriden i Lund, 1982*	f	842287d4-5e7f-41c8-96d6-5596651998ec
109df3d6-33b5-4e17-b5d1-5b24aa434fb4	HELL AND GORE	Unknown	hell_and_gore	83badd47-50f2-4645-ba59-85cee58b1eb3	53fcad8b-9c6b-492e-9af6-26ecb593720f	Hell and gore  \nChunk up father allan-lallan-ley  \nHell and gore  \nChunk up father allan-ley\n\nOh handsome in the hell and tar  \nHand hell are in the half and four  \nHell and gore\n\nChunk up father allan-ley	f	842287d4-5e7f-41c8-96d6-5596651998ec
315afa28-3cc9-4741-b46c-37cdf8b0f810	LILLE OLLE	Unknown	lille_olle	730976f2-b0b7-4591-b5d7-bf6158cbafa4	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Sjunges dock på IT med Bamse-melodin*\n\nLille Olle skulle gå på disco, men han hade inte någon sprit.  \nLille Olle skaffa' lite hembränt, lille Olle gick då på en nit.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.\n\nLille Olle skulle börja festa, spriten blandade han ut med Mer.  \nLille Olle drack upp hela bålen, lille Olle ser nu inte mer.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.\n\nLille Olle skaffade en ledhund, den var ful, och även ganska trind.  \nOlles ledhund drack upp femton flaskor, Olles ledhund är nu också blind.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.\n\nLille Olle började med droger, han blandade sin LSD med juice.  \nLille Olles hjärna står i lågor, lille Olle dog av överdos.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.\n\nLille Olle sitter nu i himlen, festa kan man göra även där.  \nLille Olle skaffade en ölback, capsar nu med Gud och Sankte Per.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.	f	842287d4-5e7f-41c8-96d6-5596651998ec
4feada76-ac50-494c-9730-91bd816e51fe	VÅRAN FORD	Unknown	våran_ford	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	För uppå våran gård,\n\ndär står en gammal ford\n\nförutan hjul och utan däck\n\noch motorn den är väck\n\nOch tittar man där bak,\n\nså finns det inget flak\n\noch tittar man där förarn\n\nsatt så finns det ingen ratt\n\nDen går på terpentin,\n\nsmör och margarin.\n\nDen går ju som en månraket\n\ngenom Johanssons staket\n\nOch Johansson kom ut\n\nMed bössan full av krut\n\nOch sköt den gamla Forden ut\n\nOch så var visan slut. Tut tut	f	842287d4-5e7f-41c8-96d6-5596651998ec
e7d1a871-10f4-46d9-bbc8-b1388f903b6d	Bamses phestvisa	Unknown	bamses_phestvisa	ac6de9a1-80a2-482e-9d7b-ac2db613ede7	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag ska festa, ta det lugnt med spriten,  \nha det roligt utan å va' full.  \nInte krypa runt med festeliten,  \nta det varligt för min egen skull.\n\nFörst en öl i torra strupen,  \nefter det så kommer supen,  \ni med vinet, ner med punschen.  \nSist en groggbuffé.\n\nJag är sketfull, däckar först av alla,  \nmissar festen, men vad gör väl de'?  \nBlandar hejdlöst öl och gammal filmjölk,  \nkastar upp på bordsdamen breve'!\n\nFörst en öl\\...\n\nSpyan rinner ner för ylleslipsen.  \nRaviolin torkar i mitt hår.  \nVem har lagt mig under matsalsbordet?  \nVems är gaffeln i mitt högra lår?	f	842287d4-5e7f-41c8-96d6-5596651998ec
e120f94a-f17c-4870-8404-6c70653081fb	SOLEN	Unknown	solen	62dad746-f380-4dfe-9bc3-604849bd3fce	53fcad8b-9c6b-492e-9af6-26ecb593720f	Solen den går upp och ner doda, doda.\n\nJag skall aldrig supa mer, hej doda dej.\n\nHej doda dej, hej doda dej.\n\nJag skall aldrig supa mer, hej doda dej.\n\nMen detta det var inte sant doda, doda.\n\nI morgon gör jag likadant, hej doda dej.\n\nHej doda dej, hej doda dej.\n\nI morgon gör jag likadant, hej doda dej.	f	842287d4-5e7f-41c8-96d6-5596651998ec
caf86b82-f0d9-4af0-ae97-a8d35aaf785c	DEN ANDRA VAR EN BÄSK	E6 1979	den_andra_var_en_bäsk	80cd04f5-72c8-416f-8d61-b5235c0dcfb2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Byssan lull\n\n//:Byssan lull gå på gasque och bliva full, för oss har det blivit en\nvana://\n\nDen första var en Bäsk, den andra var en Bäsk, den tredje var bäst av\ndem alla.\n\nText: E6 1979	f	842287d4-5e7f-41c8-96d6-5596651998ec
fd45a489-6200-49c2-901a-814444589d6f	CYKELVISAN	Unknown	cykelvisan	732f177d-6e73-4907-9082-2b759a715f9c	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Väva vadmal*\n\nMan cyklar för lite\n\nMan röker för mycket\n\nOch man är fasen så liberal\n\nNär det gäller maten och spriten\n\nJag borde slutat för länge sen\n\nMen denna sup är för liten\n\nVad tjänar att hyckla\n\nTids nog får man cykla\n\nMan pluggar för lite\n\nOch festar för mycket\n\nOch man är fasen så liberal\n\nNär det gäller tentor och labbar\n\nJag borde pluggat för länge sen\n\nMen alla gör sina tabbar\n\nVad tjänar att plugga\n\nJag kommer att kugga	f	842287d4-5e7f-41c8-96d6-5596651998ec
02731776-40c5-4595-8b55-1b906dc8e038	TÖRSTEN RASAR	Unknown	törsten_rasar	dd4175ab-5dc0-4377-9b54-5e15a990d90a	53fcad8b-9c6b-492e-9af6-26ecb593720f	Törsten rasar uti våra strupar,\n\ntungan hänger torr och styv och stel.\n\nMen snart vankas stora långa supar,\n\nvar och en får sin beskärda del.\n\nSnapsen kommer, den vi vilja tömma,\n\ndenna nektar likt Olympens saft\n\nkommer oss att våra sorger glömma.\n\nSnapsen skänker hälsa, liv och kraft!	f	842287d4-5e7f-41c8-96d6-5596651998ec
d5656082-e597-407c-9c71-a1fa3a554b66	TOMT I ALLA GLAS	P.R.I.T. -04	tomt_i_alla_glas	a14e927a-0610-4cee-bf8b-fbbea9cda86d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Nu är det tomt i alla glas\n\nekot i dem klinga\n\nDrickan är sen länge slut\n\nkom, mer till oss bringa!\n\nVi vill ha snaps, vi vill ha snaps,\n\nja, vi vill ha snaps!\n\n*(Snaps kan bytas ut mot godtycklig dryck efter eget önskemål)*	f	842287d4-5e7f-41c8-96d6-5596651998ec
9e71ce57-1baf-4302-a00b-47de4157d33a	MATEMATISKT INTRESSERAD	Henrik Jernevad IT2002	matematiskt_intresserad	05682c06-4c8f-4957-87e3-81e25165c417	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag har räknat nästan allt som finns att räkna på\n\nEuler, derivator, polynom och pivot\n\nVarenda liten uppgift har jag fått räkna ut\n\nOch nu så börjar tålamodet långsamt att ta slut\n\nJag går på Chalmers, ja jag har räknat allt som finns\n\nJag går på Chalmers, men inte någonting jag minns\n\nJag går på Chalmers, och jag är nästan alltid här\n\nJag går på Chalmers, och det ger mig blott besvär\n\nFör länge sedan var jag matematiskt intresserad\n\nJag tyckte det var skoj och ville därför lära mera\n\nJag började på Chalmers och allt verkade så bra\n\nMen snart så fick jag mer att göra än jag ville ha\n\nJag går på Chalmers\\...\n\nFem minuter algebra och fem minuter Euler\n\nFem minuter analys och fem minuter Taylor\n\nFem minuter graf och fem minuter integral\n\nFem minuter till så blir jag aldrig mer normal\n\nJag går på Chalmers\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
2d2095a3-62df-46e8-87f0-52a67117bbf3	GÅ EFTER SPRIT	Unknown	gå_efter_sprit	68a85443-5bb6-4cfa-8ca7-7c48878e9bb1	53fcad8b-9c6b-492e-9af6-26ecb593720f	Vi går över ån efter sprit, fallera,\n\nmen efter vatten går vi ej en bit, fallera.\n\nJa, sup kära bröder, så ögonen glöder.\n\nEn gång blir din blick ack-va-vit, fallera.	f	842287d4-5e7f-41c8-96d6-5596651998ec
5511104d-376c-4ebc-9d27-6f6fe58de670	PUNSCHEN KOMMER KALL	Unknown	punschen_kommer_kall	88288165-2a20-4ed9-af2e-41f27ebd08df	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Glada Änkan\n\nPunschen kommer, punschen kommer,\n\nljuv och sval.\n\nGlasen imma, röster stimma i vår sal.\n\nSkål för glada minnen,\n\nskål för varje vår.\n\nInga sorger finnas mer\n\nnär punsch vi får.	f	842287d4-5e7f-41c8-96d6-5596651998ec
58ff750f-85b3-46d9-9f8b-65065e316e2d	PING-PONG	Unknown	ping-pong	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	A boy had a game with\n\na ping-pong ball\n\nA boy had a game with\n\na ping-pong ball\n\nA boy bad a game with\n\na ping-pong ball\n\nA game with a ping-pong ball\n\nA boy had a game with a\n\nPing-pong, ping- pong\n\nPing-pong, ping- pong\n\nPing-pong-ball\n\nA boy had a game with a\n\nPing-pong, ping-pong,\n\nPing-pong, ping-pong ball\n\nPing-pong, ping-pong,\n\nPing-pong, ping-pong ball	f	842287d4-5e7f-41c8-96d6-5596651998ec
9ee81d2d-25b2-476c-a62d-7772b2190156	GÅ PÅ CHALMERS	Henrik Jernevad och Tomas Forsman, IT2002	gå_på_chalmers	e452ff3c-ba2d-4a63-92f1-d8284feb6556	53fcad8b-9c6b-492e-9af6-26ecb593720f	Kvällen är sen, Chalmers är stort.\n\nHär sitter vi och super oss bort.\n\nSjunger nån sång, tar oss en sup\n\nmaten är god, eller vad tycker duuuuu?\n\nJa man ska gå på Chalmers,\n\nskratta och ha roligt.\n\ngå på sittning, inte sitta hemma.\n\nnjut av festen, ta för dig av det mesta.\n\nför mycket av det goda,\n\ndet kommer upp på toa.\n\ndansar du runt på borden,\n\nlär det va glömt glömt glömt\n\nglöööömt\\..... i morron.\n\nVi kunde varit ute på en krog i Göteborg.\n\nEller suttit hemma och flätat på en korg.\n\nOch vi kunde pluggat å räknat på matten\n\nvi sitter hellre här i natten.\n\nJa man ska gå på Chalmers\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
94761b1c-11b7-4f97-84c2-9a7ce7968f3d	SENSOMMARPOESI	Unknown	sensommarpoesi	a6518bf6-6639-42b8-83d8-bde2fb027623	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Idas sommarvisa\n\nDu skall inte tro du blir brötfull\n\nifall inte du sätter fart\n\npå flaskan och tar några snapsar\n\nför då kommer luckorna snart.\n\nSå trevligt att slippa få minnas\n\nallt löjligt och tarvligt du gjort\n\nsom var det blev av dina pengar\n\noch hur dina kläder kom bort.\n\nNån gång kan man väl göra bort sig\n\nså det tycker jag du skall få\n\nså sjung nu och dansa på bordet\n\nskrävla och slåss och stå på.\n\nSen ligger du lördag och söndag\n\noch våndas så grönblek och yr\n\noch sitter på jobbet på måndag\n\noch kurar vid skärmen och spyr.	f	842287d4-5e7f-41c8-96d6-5596651998ec
0f3080a2-9efd-473d-a065-37f875145278	SPRITBOLAGET	Unknown	spritbolaget	f6348ce1-d021-4c12-8ea1-cd8583784150	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel:Snickerboa\n\nTill spritbutiken ränner jag och bankar på dess port.\n\nJag vill ha nå't som bränner bra och gör mig sketfull fort.\n\nExpediten sa se godda',\n\nhur gammal kan min herre va'?\n\nHar du nå't leg, ditt fula drägg?\n\nKom hit igen när du fått skägg!\n\nNej, detta var ju inte bra, jag ska bli full i kväll.\n\nDå plötsligt en idé fick jag, dom har ju sprit på Shell.\n\nMånga flaskor stod där på rad,\n\nnu kan jag bli båd' full och glad.\n\nDen röda drycken åkte ner,\n\nnu kan jag inte se nå't mer!	f	842287d4-5e7f-41c8-96d6-5596651998ec
2ea8e77d-42cf-4158-b32c-24228a279f2d	INTEGRALVISAN	Unknown	integralvisan	7f134aa8-e581-42f1-b014-648433d47929	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Med en enkel tulipan*\n\nEn liten enkel integral\n\nett vektoranalystal\n\nni har besväret,\n\nni har besväret att derivera.\n\nMen tar man Stokes sats däruppå\n\nså blir det så enkelt så\n\natt integralen, att integralen\n\nevaluera.\n\nOch rotationen, den integreras\n\nsen över ytan utav en boll,\n\nkoordinaterna transformeras,\n\nså integranden blir bara noll.\n\nEn liten enkel integral\n\nett vektoranalystal\n\nkan va så djävlig\n\natt man ej hinner med något mera.	f	842287d4-5e7f-41c8-96d6-5596651998ec
9a750d80-ba3e-4178-be6f-55abeee14479	LILLE SUP	Unknown	lille_sup	2e50112b-433e-4776-b401-dcefbfc6b3f1	53fcad8b-9c6b-492e-9af6-26ecb593720f	Lille sup, lille sup,  \nlille söte supen  \nnu ska du, nu ska du,  \nner igenom strupen	f	842287d4-5e7f-41c8-96d6-5596651998ec
ea6fc54e-5858-4018-b411-599b48b6f2be	IMSIG VIMSIG	Unknown	imsig_vimsig	5c0dc1b9-7487-44f6-9201-c71aba493f9e	53fcad8b-9c6b-492e-9af6-26ecb593720f	Imsig vimsig blir man, av ett litet glas  \nPulsen börjar öka, hjärtat går i kras  \nBåda knäna skälver och näsan den blir blå  \nfast det är så läskigt, prövar vi ändå\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
9392a74e-c60f-4795-9272-4aea29bdb963	EN LITEN NUBBE	Unknown	en_liten_nubbe	5569dde1-cf8e-40b0-af5a-96e294356600	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Bättre och bättre...\n\nEn liten nubbe varje dag.\n\nEn liten nubbe varje dag.\n\nGlöm bort tentorna och sorgen,\n\nalla flickorna som givit dig korgen.\n\nVinbär, Skåne eller Pors,\n\nLåt det rinna som en fors.\n\nMen aaaaaaah!\n\nDet är Bäsken, ja, Bäsken som är bäst!	f	842287d4-5e7f-41c8-96d6-5596651998ec
57cf8b63-03f0-4a48-a530-b4802eb45660	DENNA THAFT	Unknown	denna_thaft	8bbe035b-e42c-4f63-b4d8-e0748f559068	53fcad8b-9c6b-492e-9af6-26ecb593720f	Denna thaft\n\när den bäthta thaft thythtemet haft\n\nDenna thaft\n\när den bäthta thaft dom haft\n\nOch den thom inte har nån kraft\n\nhan dricka thkall av denna thaft\n\nDenna thaft\n\ntill landth, till sjöth, till hafth.	f	842287d4-5e7f-41c8-96d6-5596651998ec
719c0461-c31d-4070-93ce-07e938e58fcf	LAMBO	Unknown	lambo	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Alla:*\n\nFör nu glaset till din mun!\n\nTjofaderittan Lambo!\n\nOch drick ur, din fylle fylle hund!\n\nTjofaderittan Lambo!\n\nSe hur dropparna i glaset\n\nrinner ned i fylle aset.\n\nLambo! Hej! Lambo! Hej!\n\nTjofaderittan Lambo!\n\n*Solo:*\n\nJag nu glaset druckit har.\n\n*Alla:*\n\nTjofaderittan Lambo!\n\n*Solo:*\n\nEj en droppe finnes kvar!\n\n*Alla:*\n\nTjofaderittan Lambo!\n\n*Solo:*\n\nSom bevis jag nu vill vända,\n\nglaset på dess rätta ända.\n\n*(Solisten vänder glaset upp-och-ned över huvudet )*\n\n*Alla:*\n\nLambo hej! Lambo hej!\n\nTjofaderittan Lambo!	f	842287d4-5e7f-41c8-96d6-5596651998ec
d0128de8-695e-46ee-9031-0f5143415165	HÄSTKÖTT PÅ VÄGGA	Unknown	hästkött_på_vägga	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Det hängde hästkött på vägga\n\nDet var så färskt så det gnägga\n\nNi skulle hört vicka toner\n\nNär vi käka makaroner\n\nFör stå inte där och snacka skit\n\nGå upp på slakteri\\'t\n\nOch köp en korvabit\n\nDär finns allt vad du vill ha\n\nFrån ost och marmelad till köttfärs\n\nDet hängde hästkött på vägga\n\nDet var så färskt så det gnägga\n\nNi skulle hört vicka toner\n\nNär vi käka makaroner	f	842287d4-5e7f-41c8-96d6-5596651998ec
d6e81367-7013-4a6c-9546-7f4eebd4b24e	TYCKER DU OM MIG?	Unknown	tycker_du_om_mig?	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Svenska:\n\nH. Tycker du om mig?\n\nD. Ja, det gör jag.\n\nH. Är det riktigt säkert?\n\nD. Ja, det är det.\n\nH. Får jag komma till dig?\n\nD. Ja, det får du.\n\nA. Hopp sudderulle rudde rullan lej.\n\nJapanska:\n\nH. Pentax minolta?\n\nD. Honda mamiya.\n\nH. Yen kawasaki?\n\nD. Honda kyushu.\n\nH. Fuisiyama?\n\nD. Yen yokono.\n\nA. Sony akai maliyti yamaha\n\nGotländska:\n\nH. Meun feuna rauka?\n\nD. Ja feur tausan.\n\nH. Aude recktit ricktit?\n\nD. Jau maun bauta.\n\nH. Keun jek gomme in dau?\n\nD. Jau meun bock.\n\nA. Tutta futta Visby tutta bauta mums.\n\nFinska:\n\nH. Hurmi ja pojkka?\n\nD. Koski ja kekko\n\nH. Kalevala penti?\n\nD. Koski ja kyllää.\n\nH. Saarijärvi korva?\n\nD. Koski ja pellää\n\nA. Tunti ja pitti kitti kaiine kaks	f	842287d4-5e7f-41c8-96d6-5596651998ec
5ce47b0a-f5b3-4eb0-bf97-394c2fd4e726	STORSVENSKA SNAPS	Unknown	storsvenska_snaps	1d1889da-0a8d-42e1-89eb-863f63604c57	53fcad8b-9c6b-492e-9af6-26ecb593720f	Du gamla, du fina, du storsvenska snaps,  \nsnart randas ditt glädjedöda öde.  \nNog minns vi med saknad den tid då krånglet slapps,  \nditt låga pris och dina mängders flöde.\n\nJag tronar på guld från en rånad bankir,  \nnär chartrat mitt plan flyr Sveriges torka.  \nJag minns hur det var och jag anar hur det blir.  \n/: Ja, jag vill leva loppan på Mallorca :/	f	842287d4-5e7f-41c8-96d6-5596651998ec
8172173d-e262-4f37-92b2-11cbb3c700eb	DJUNGELPUNSCH	Unknown	djungelpunsch	a0da9d92-eabe-4dc8-8aa2-c570832a1f2f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Var nöjd med...\n\nJag gillar alla tiders punsch\n\nEn punsch till frukost, punsch till lunch\n\nEn punsch till förrätt, varmrätt och dessert\n\nJag gillar punsch för vet du va'\n\nRent kaffe gör ju ingen gla'\n\nSå punsch i fulla muggar vill jag ha!	f	842287d4-5e7f-41c8-96d6-5596651998ec
db8d3609-eef6-43fc-8251-a993937ad3eb	SÅNT ÄR LIVET	Bill Cook	sånt_är_livet	993bb8e1-aff8-4681-82bc-d68496703c75	53fcad8b-9c6b-492e-9af6-26ecb593720f	Sån't är livet, sån't är livet.\n\nSå mycket falskhet bor det här,\n\nden man förlorar vinner en annan\n\nså håll i vännen som du har kär.\n\nHan kom om våren, som en vårvind.\n\nMin kärlek fick han och allt han tog,\n\nmen så kom hösten och all den kärlek\n\nhan svor var evig - bara dog.\n\nSånt är livet\\...\n\nHan fick en annan, jag har sett dem.\n\nHan verkar lycklig och hon är ung.\n\nDet jag har lärt mig det är just detta,\n\nnär hjärtat svider; sjung blott sjung!\n\nSån't är livet\\...\n\nVårt liv är fattigt utan kärlek, jag fick en annan som har mig kär. Hans\ngamla flamma har fått korgen, hon undrar säker vem jag är.\n\nSån't är livet\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
8f799eab-78f6-4660-b9c1-4691f0b3ea0b	KILLARNAS SKÅL	Unknown	killarnas_skål	67fd4988-a421-44cc-b402-bf319021668d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Vi skålar för dem vi gillar\n\nVi skålar för våra killar.\n\nVi skålar för dom vi gillar.\n\nMen dom som vi inte gillar\n\ndom skiter vi i.	f	842287d4-5e7f-41c8-96d6-5596651998ec
dada6cd5-3888-446a-b714-70b693f1c241	NÄR NUBBEN KOM TILL	Unknown	när_nubben_kom_till	5134cf1c-8a66-45f6-ab0f-9f33f1180fe2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Att nubben kom till jorden\n\nDet skötte gubben Noak om\n\nOch snart till kalla norden\n\nDen ädla drycken kom\n\nOch därför säger mamma\n\nSå är jag nästan alltid glad\n\nTy nubben den gör livet\n\nTill ständig solskensdag	f	842287d4-5e7f-41c8-96d6-5596651998ec
0ece64c7-6333-4c16-9a84-daba2e49ab79	KOMPILATORN	P.R.I.T. -04	kompilatorn	9d20a89b-37f3-455e-a2a0-553c825077b9	53fcad8b-9c6b-492e-9af6-26ecb593720f	Tänk om jag vore en liten kompilator  \nOmpa ompa fallerallera\n\nDå skulle alla ha mig i sin dator  \nOmpa ompa fallerallera\n\nTänk om jag vore ett Java run time error  \nOmpa ompa fallerallera\n\nDå skulle alla lida av min terror  \nOmpa ompa fallerallera\n\n*Text: P.R.I.T. -04*	f	842287d4-5e7f-41c8-96d6-5596651998ec
8d7b1632-1d84-4c50-ac5b-202658a7625c	JAG FÅNGADE EN SUP IDAG	Unknown	jag_fångade_en_sup_idag	7b9b0ae7-aca6-4b79-bcb7-effc2fc79462	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Jag fångade en räv idag\n\nJag fångade en sup idag\n\nmen supen gled ur näven.\n\nMen lika glad för det är jag\n\nmen gladast är nog levern.\n\nTralalalalalalalalalalalala\n\nJag fångade en tjej idag\n\nmen tjejen slank ur sängen\n\nmen lika glad är jag för det\n\nvi fortsatte på ängen\n\nTralalalalalalalalalalalala\n\nJag mjölkade en ko idag\n\nmen när jag såg på juvret\n\nså hade jag nog tagit fel\n\nför gladast var nog tjuren\n\nTralalalalalalalalalalalala	f	842287d4-5e7f-41c8-96d6-5596651998ec
7f654d86-2088-4d85-825c-07d60cf72f67	FRITJOF OCH CARMENCITA	Unknown	fritjof_och_carmencita	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Samboronbon, en liten by förutan gata\n\nden ligger inte långt från Rio de la Plata. Nästan vid kanten av den\nblåa Atlanten\n\noch med Pampas bakom sig,\n\nmånga hundra gröna. mil.\n\nDit kom jag ridande en afton i april\n\nför jag ville dansa tango.\n\nDragspel, fiol och mandolin\n\nhördes från krogen och i salen steg jag in. Där på bänken i mantilj\n\noch med en ros vid sin barm\n\nsatt den bedårande lilla Carmencita.\n\nMamman, värdinnan satt i vrån.\n\nHon tog mitt ridspö, min pistol och min manton.\n\nJag bjöd upp och Carmencita sa: - Si, gracias señor vámos á bailar este\ntango!\n\n\\- Carmencita lilla vän,\n\nhåller du utav mig än?\n\nFår jag tala med din pappa och din mamma, jag vill gifta mig med dig,\nCarmencita!\n\n\\- Nej, don Fritjof Andersson,\n\nkom ej till Samboronbon,\n\nom ni hyser andra planer när det gäller mig än att dansa tango.\n\n\\- Ack, Carmencita, gör mig inte så besviken! Jag tänkte skaffa mig ett\njobb här i butiken, sköta mig noga, bara spara och knoga,\n\ninte spela och dricka men bara älska dig. Säg, Carmencita, det är ändå\nblott med mig, säg, som du vill dansa tango.\n\n\\- Nej, Fritjof, ni förstår musik,\n\nmen jag tror inte ni kan stå i en butik\n\noch förresten sa min pappa just idag att han visste\n\nvem som snart skulle fria till hans dotter.\n\nEn som har tjugotusen kor\n\noch en estancia som är förfärligt stor.\n\nHan har prisbelönta tjurar,\n\nhan har oxar, får och svin\n\noch han dansar underbar tango!\n\n\\- Carmencita, lilla vän,\n\nakta dig för rika män!\n\nLyckan den bor ej i oxar eller kor\n\noch den kan heller inte köpas för pengar. Men min kärlek gör dig rik,\n\nskaffa mig ett jobb i er butik!\n\nOch när vi blir gifta söta ungar ska vi få\n\nsom kan dansa tango!	f	842287d4-5e7f-41c8-96d6-5596651998ec
5f9d9496-719e-4788-b09f-2fe131336b99	TREO	Unknown	treo	f28bdd92-ab5d-4bd5-b89b-24217e28c5b2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Vintern rasat...\n\nMorgonstund med smak av döda bävrar,\n\nfrukostmorgonen är över oss.\n\nHur vi stretar, hur vi alla vägrar,\n\nså går solen lik förbannat opp.\n\nSnart är dagen här med hemska plågor,\n\nhuvudvärk och ångest, elände, men\n\ndet finns faktiskt ett glas som kan dig rädda:\n\nTreo-comp, vår frälsare och vän.	f	842287d4-5e7f-41c8-96d6-5596651998ec
50b87379-a2f0-4ed2-beb0-c78f8f0fda26	OASEN	Unknown	oasen	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Som ökensand känns strupen ibland,\n\nOch man orkar inte bära hand\n\nFy farao ej rast eller ro,\n\nman blir nykter som en helig ko.\n\n//:När till och med en mumie\n\nfår ryckningar i sarkofagen.\n\nDet spritter i kistan\n\nNär örat hör listan\n\nPå supar som bjudes på vår gasque!://\n\nHej skål!	f	842287d4-5e7f-41c8-96d6-5596651998ec
851e3c8d-8d9f-4b82-b3ea-03b3d9edbee0	STUDIEMEDELSRONDO	Unknown	studiemedelsrondo	0a1565da-8a1c-41ac-872f-9d4bda821d83	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Ösa sand\n\n//: Vi dricker punsch\n\ntill lunch,\n\nnär vi har fått avin.\n\nVi lunchar hela dagen\n\nTills kassan gått i sin.://\n\nRepris in absurdum	f	842287d4-5e7f-41c8-96d6-5596651998ec
5a2f2a4f-c607-45bb-81d6-8c30ece80431	FÖDD I NORGE	Unknown	född_i_norge	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel. Oh, my darling Clementine*\\\n\\\nFödd i Norge, bor i Sverige,\\\nDanmark är mitt fosterland,\\\ntalar spanska som en jude,\\\nfast en engelsman jag är.\\\n\\\nFull idag och full imorgon,\\\nså ser livet ut för mig.\\\nKärlekslågan, den har slocknat,\\\njag skall aldrig gifta mig.\\\n\\\nPå min gravsten ska det ristas,\\\ndet ska präntas på latin.\\\nHärinunder vilar liket\\\nav ett riktigt fyllesvin.	f	842287d4-5e7f-41c8-96d6-5596651998ec
27763691-701f-4d7f-bcf7-9a9221c3504c	LOVSÅNG TILL SMURFEN	P.R.I.T. -04	lovsång_till_smurfen	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Smurfen, Smurfen, vackrare än\n\nAnkan och Kvasthilda!\n\nHur vi än tänker så är han ju bäst\n\nVi älskar ju alla den Smurfen, Smurfen,\n\nvackrare än Hacke och Fantomen!\n\nHur vi än tänker så är han ju bäst\n\nVi älskar ju alla den Smurfen, Smurfen,\n\nvackrare än Droopy och Lucky Luke!\n\nHur vi än tänker så är han ju bäst\n\nVi älskar ju alla den Smurfen, Smurfen,\n\nvackrare än Marsipulami!\n\nHur vi än tänker så är han ju bäst\n\nVi älskar ju alla den Smurfen, Smurfen,\n\nvackrare än Pippi och Snobben!\n\nHur vi än tänker så är han ju bäst\n\nVi älskar ju alla den Smurfen, Smurfen,\n\nvackrare än James Bond!\n\nHur vi än tänker så är han ju bäst\n\nVi älskar ju alla den Smurfen, Smurfen,\n\nvackrare än Asterix och Gaston!\n\nHur vi än tänker så är han ju bäst\n\nVi älskar ju alla den Smurfen, Smurfen....	f	842287d4-5e7f-41c8-96d6-5596651998ec
0d0cc66e-680a-4c1c-b915-e9ed1c6cc191	HABEGÄR	Unknown	habegär	ee4f8052-8e5d-4014-ae70-3fdff4b8c0a2	53fcad8b-9c6b-492e-9af6-26ecb593720f	När helan man tagit och halvan ska dricka\n\nDet känns som att kyssa en nymålad flicka\n\nJu mera man får, desto mer vill man ha\n\nEn ensammer jävel gör alls ingen gla'	f	842287d4-5e7f-41c8-96d6-5596651998ec
10f26b86-7e31-465f-94c0-0e0bc9a16540	KORTA SOLEN	Unknown	korta_solen	4b99499a-20d4-4544-9ab4-8ce02b2201e6	53fcad8b-9c6b-492e-9af6-26ecb593720f	Solen den går upp och ner,\n\nSnapsen den går ner!	f	842287d4-5e7f-41c8-96d6-5596651998ec
cd8756cc-6e97-43fd-802d-7c8cc40e604d	JAG VAR FULL EN GÅNG	Unknown	jag_var_full_en_gång	e83e6794-6e3d-434e-af9f-e2813af98384	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag var full en gång för länge sen,\n\npå knäna kröp jag hem,\n\noch på vägen träffa jag en elefant, elefant.\n\nElefanten börja pinka och jag trodde det var öhl,\n\nSedan dess har jag bli'tt kallad jävla knöl,\n\nmera öhl!	f	842287d4-5e7f-41c8-96d6-5596651998ec
e96724b7-4b14-4ba0-baf4-1c9724dcaf5b	HOW ABOUT A KISS	Unknown	how_about_a_kiss	d9e2c9c0-e8ed-4c8c-8975-10bff2b38f4a	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Livet*\n\nSkjortan är härlig.\n\nMen även ibland besvärlig.\n\nNär inte sömnen vill slå till på natten,\n\nOch man istället måste kasta va ..(tten).\n\nNär man sen kissar,\n\nKan det hända att man missar.\n\nAtt fälla bort den stora nattasärken,\n\nOch sådan kemtvätt kostar skjortan!\n\nHEJA HEJA FRISKT HUMÖR, SKJORTAN HÄNGER UTANFÖR!	f	842287d4-5e7f-41c8-96d6-5596651998ec
36fa5696-46e2-4587-b143-83756af68063	ÄN EN GÅNG DÄRAN	Unknown	än_en_gång_däran	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Än en gång däran, bröder,\n\nän en gång däran!\n\nFöljom den urgamla seden.\n\nIn till sista man, bröder,\n\nin till sista man,\n\ntrotsar vi hatet och vreden.\n\nBlankare vapen sågs aldrig i en här\n\nän dessa glasen, kamrater, i gevär!\n\nÄn en gång däran, bröder,\n\nän en gång däran.\n\nSvenska hjärtans djup - här är din sup!\n\nLivet är så kort, bröder, livet är så kort.\n\nLek det ej bort, nej var redo!\n\nKämpa mot allt torrt, bröder,\n\nkämpa mot allt torrt!\n\nTänk på de gamla som stredo\n\nfram utan tvekan i floder av champagne,\n\nstyrkta från början av brännvin från vårt land!\n\nKämpa mot allt torrt, bröder,\n\nkämpa mot allt torrt!\n\nSvenska hjärtans djup - här är din sup!	f	842287d4-5e7f-41c8-96d6-5596651998ec
154a352f-ef78-48c2-94e1-96418393483a	FANS HÄMND	Unknown	fans_hämnd	0f7c660d-88a0-4679-909d-eb8b844d6fd0	53fcad8b-9c6b-492e-9af6-26ecb593720f	När som sädesfälten böja sig för vinden\n\nStår nån djävel där och böjer dem tillbaks.	f	842287d4-5e7f-41c8-96d6-5596651998ec
4f514bf1-41b9-4811-abbd-6bb170a8259b	ODE TILL ÖHLET	Unknown	ode_till_öhlet	72996c50-0345-4e44-b615-30345059e3b2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Trampa på gasen\n\nTu tu tu Tuborg\n\noch ca ca ca Carlsberg,\n\ndet är den bästa\n\npilsnern som jag vet.\n\nTu tu tu Carlsberg\n\noch ca ca ca Tuborg\n\när det bästa\n\nölet som jag vet.\n\nTu tu tu Ölberg\n\noch ca ca ca Pilsborg\n\ndet är den bästa\n\nbiran som jag vet.	f	842287d4-5e7f-41c8-96d6-5596651998ec
8b0bf764-9d4a-4f33-9bad-6e35ca59835e	EN TAGGATRÅ	Unknown	en_taggatrå	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	En taggatrå, en taggatrå\n\nDet är en trå med taggar på.\n\nOch är det inga taggar på,\n\nså är det ingen taggatrå.\n\nEn taggatrå, en taggatrå,\n\nDet är en trå med taggar på\n\nEn prickekorv, en prickekorv\n\ndet är en korv med prickar på.\n\nOch är det inga prickar på,\n\nså är det nog en falukorv.\n\nEn prickekorv, en prickekorv\n\ndet är en korv med prickar på.\n\nEn busschaufför --- man med glatt humör\n\nEtt pensionat --- pang med dålig mat\n\nEn ingenjör --- man som inget gör\n\nEn taxibil --- bil med taxar i\n\nEn raggarbil --- bil med brudar i	f	842287d4-5e7f-41c8-96d6-5596651998ec
10d78618-bc1b-4d91-a46f-c7c1845add9d	SOMLIGA STRAFFAR GUD MED DETSAMMA	Unknown	somliga_straffar_gud_med_detsamma	e436881d-14e2-41c2-9a82-951a9e12c523	53fcad8b-9c6b-492e-9af6-26ecb593720f	Vojan, vojan han har skoj han.  \nKastar av sig enda dojan,\n\nDen andra med, lite på sned,  \nOch klättrar snabbt in i kojan'.\n\nDen har han byggt av ett rutigt tyg,  \nSom han har stulit nånstans i smyg,\n\nMen då precis, kom en polis,  \nOch han blev fast i handbojan.	f	842287d4-5e7f-41c8-96d6-5596651998ec
b8b5b072-4e3a-41a4-8845-957ee1efa27c	CHALMERS UTBILDNING	Unknown	chalmers_utbildning	03fcdc6c-d2a9-4bea-984f-81da519f91ab	53fcad8b-9c6b-492e-9af6-26ecb593720f	Chalmers utbildning är fin\n\nDricka öhl och brännevin\n\nSen blir man ingenjör\n\nDet är det som susen gör, HEJ!	f	842287d4-5e7f-41c8-96d6-5596651998ec
f9890dc4-fcc7-491d-8e05-d9c7ddd81be0	SVEA SKIVGARDES NUBBEVISA	Unknown	svea_skivgardes_nubbevisa	e97b806e-04b3-4d1a-a203-78d64ca3d20d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Här kommer lilla Ludde\n\nHär kommer lilla nubben, håhå, jaja.\n\nDen river som nubb den, håhå, jaja.\n\nHär kommer nubbens mamma, håhå, jaja-\n\nÅåh... hon tar jag meddetsamma, håhå, jaja.	f	842287d4-5e7f-41c8-96d6-5596651998ec
017790b0-6ecc-41da-8303-fb25cfabb9bd	EI SAA PEITÄÄ	Unknown	ei_saa_peitää	e9c4c8e8-ed2b-480d-83b5-ecb86a82e17d	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Bamsevisan*\n\nEi saa peittää, Koskenkorva, Finland.\n\nYx, kax, kolme, mumintrollet nu.\n\nSauna, kalja, perkele ja viina.\n\nYx, kax, kolme, mumintrollet nu.\n\nKoskenkorva (sjunges 6 gånger),\n\nKoskenkorva nu!\n\nEi saa peittää, Koskenkorva, Finland.\n\nYx, kax, kolme, mumintrollet nu.	f	842287d4-5e7f-41c8-96d6-5596651998ec
3f0d57d0-8b2a-4f65-8284-63b1bf52cb16	TEMPERATUREN	Unknown	temperaturen	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Temperaturen är hög uti kroppen,  \nNärmare 40 än 37 komma fem!  \nSå ska det vara när ångan är uppe  \nOch så är fallet i just detta nu!\n\n//: Vi rullar, vi rullar, vi rullar, vi rullar,  \nrullar, vi rullar, vi rullar, å hej://\n\nTemperaturen...\n\n//:Framåt och bakåt och framåt och bakåt  \nframåt och bakåt och framåt och bakåt://\n\nTemperaturen...\n\n//:Kålle och Ada och Kålle och Ada,\n\nKålle och Ada och Kålle och Ada://	f	842287d4-5e7f-41c8-96d6-5596651998ec
e6fe1176-c0f3-4415-8334-582c41186843	TUNGVRICKARE	Unknown	tungvrickare	b6b40f9b-0661-49c1-8ae3-5610fbc61c1b	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Räven raskar över isen\n\nRäven raska röva riset\n\nriset raska rena räven.\n\nÅ röva ris, å räven rös,\n\nå riva räven i röven.\n\nFinnen finna femton flaskor\n\nflickan finna finnen fyller.\n\nÅ finnen fes, å flickan flås,\n\nå fira flickan å flaskan.\n\nLudvig lära leva loppan\n\nLisa längtar Ludvig lära.\n\nÅ Ludvig låg, å läxan lär,\n\nå leva loppan i ladan.	f	842287d4-5e7f-41c8-96d6-5596651998ec
9c963d90-edeb-48ce-9b32-aeebd0503c69	VIKINGEN	Unknown	vikingen	3b401eac-fb63-446b-9657-5c9593c4f709	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: When Johnny comes marching home\n\nEn viking älskar livets vann  \nHurra, hurra!  \nDen hastigt i hanssvalg försvann  \nHurra, hurra!\n\nTill kalv, till oxe, till sill och till fläsk,  \nnär kärringar bara dricker läsk.  \nJa, då vill alla vikingar ha en bäsk.\n\nNär bäsken småningom är slut  \nTragik, tragik  \nDå bäres varje viking ut  \nsom lik, sig lik\n\nOch se'n, om vi vaknar, vi sjunger en bit,  \nse'n korkar vi upp Skånes Aquavit  \nSkål för alla vikingar som kom hit!	f	842287d4-5e7f-41c8-96d6-5596651998ec
23d118bf-4f5c-4d07-bfd1-f19bb600c40a	DRUNKEN SAILOR	Unknown	drunken_sailor	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	What shall we do with the drunken sailor,\\\nwhat shall we do with the drunken sailor,\\\nwhat shall we do with the drunken sailor,\\\nearly in the morning?\\\nHooray, up she rises,\\\nhooray, up she rises,\\\nhooray, up she rises, early in the morning.\n\nPut him in the longboat till he\\'s sober.\n\nPull out the plug and wet him all over.\n\nPut him in the bilge and let him drink it.\n\nPut him in a leaky boat and make him bale it.\n\nPut him in the scuppers with the hosepipe on him.\n\nShave his belly with a rusty razor.\n\nKeelhaul him until he\\'s sober.\n\nPut him in a bed with the captains daughter	f	842287d4-5e7f-41c8-96d6-5596651998ec
904649f8-80d3-4cd8-b688-96b877864af3	KALMAREVISAN	Unknown	kalmarevisan	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Hej dick\\\nHej dack\\\nJag slog i\\\noch vi drack\\\nHej dickom dickom dack\\\nhej dickom dickom dack.\\\nFör uti Kalmare stad\\\nja där finns det ingen kvast\\\nförrän lördagen.\\\n\\\n/: När som bonden kommer hem\\\nkommer bondekvinnan ut :/\\\noch är stor i sin trut\\\nHej dick . . .\n\n/: Var är pengarna du fått ?\\\nJo, dom har jag supit opp ! :/\\\nUppå Kalmare slott.\\\nHej dick . . .\n\n/: Jag skall mäla dig an\\\nför vår kronbefallningsman :/\\\nOch du skall få skam\\\nHej dick . . .\n\n/: Kronbefallningsmannen vår\\\nsatt på krogen i går :/\\\nOch var full som ett får.\\\nHej dick . . .	f	842287d4-5e7f-41c8-96d6-5596651998ec
6f414c66-4c5f-4771-a38f-f1a7d486e0cf	SKÅL FÖR IT	P.R.I.T. -04	skål_för_it	be3b1d53-7310-4dc9-85da-4700e99be42a	53fcad8b-9c6b-492e-9af6-26ecb593720f	När IT har kalas det blir en väldig fart,\n\nAtt vi har det kul ihop är underbart\n\nför turkost och smurfar vi lyfter vår kopp,\n\nför då är stämningen högst på topp,\n\n//:Skål för alla IT som kom hit!://\n\n*Text: P.R.I.T. -04*	f	842287d4-5e7f-41c8-96d6-5596651998ec
75431394-2fe6-4c3c-acf1-bcc9e2e8b657	MANNEN OCH KVINNAN	Unknown	mannen_och_kvinnan	de50a8ff-e9d8-4553-be07-b37006fb2651	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Mors lilla Olle\n\nHerrar\n\nKvinnan är både på ont och på gott,\n\nHur komplicerad har ingen förstått\n\nSnar till att kyssas, men slug som en varg,\n\nkvinnan kan göra dig lycklig och arg.\n\nDamer\n\nMannen han tror han är listig och klok,\n\nfast han är lättläst som en sagobok.\n\nSkryter om allting som han känner till,\n\nhuvet kan vridas precis vart vi vill.\n\nHerrar\n\nKvinnan, som flyr för en vit liten mus,\n\ntämjer en make så stor som ett hus\n\nSlog dig i skallen med skyffeln i går,\n\nnu är hon systern som vårdar ditt sår.\n\nDamer\n\nHan kan va' rektor, polis och major,\n\nmen han är gossen som aldrig blir stor.\n\nDagtid han ägnar åt stora förlopp,\n\nkvällen han lindas kring min fingertopp.\n\nHerrar\n\nGrym som en bofink och snäll som en katt,\n\nbakar sitt dagliga bröd för en hatt.\n\nFörst är det ja och på kvällen är det nej,\n\njämt när du tror att hon vill, vill hon ej.\n\nDamer\n\nMannen är modig och tåler en törn,\n\nensam i skogen han skjuter en björn\n\nVet hur han fångar den svåraste fisk\n\nbleknar så fort han ska torka en disk.\n\nAlla\n\nMannen och Kvinnan varann ej förstår\n\nhar sina fel, han och hon, men ändå.\n\nSant som att himlen för evigt är blå,\n\nskall allting klaffa - behövs båda två.	f	842287d4-5e7f-41c8-96d6-5596651998ec
420b708f-5a66-4edb-b868-ca8b008a8ce7	JAG ÄTER INTE KLOCKOR	Unknown	jag_äter_inte_klockor	12b107b9-c970-44d2-a27a-0f475436b6bc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Får jag lämna några blommor*\n\nJag äter inte klockor,\n\nmen jag dricker gärna ur.	f	842287d4-5e7f-41c8-96d6-5596651998ec
33be6bb7-2dc2-454c-9221-71b924d87ab5	MINNE	Unknown	minne	20227e18-8237-4520-8f35-5ab21e1d72e2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Minne, jag har tappat mitt minne.\n\nÄr jag svensk eller finne?\n\nKommer inte ihåg.\n\nInne, är jag ut' eller inne?\n\nJag har luckor i minne'\n\nSån' där små alkohol\n\nMen besinn' er\n\nMan tätar med brännvin man får\n\nFastän minne' och helan går	f	842287d4-5e7f-41c8-96d6-5596651998ec
fb289cac-f289-47e0-8e56-e5fe2b417784	GLÄDJETÅREN	Unknown	glädjetåren	d5cf022c-89ce-4069-a2c9-2b6fb4a0c98a	53fcad8b-9c6b-492e-9af6-26ecb593720f	Helan, sköna helan!  \nLjuva droppar i en glädjetår.  \nHelan, fegt att dela'n!  \nDen ger styrka och du bättre mår.\n\nMen spriten, dödar långsamt har man spått!  \nTur det, för vi har ju knappast brått.\n\nLivet, det är givet.  \nDet ska levas fyllt av glädje  \nNi måste medge:  \nBäst är en glädjetår!  \nBäst är en glädjetår!\n\n*Ur Chalmersspexet Viktoria, 1986*	f	842287d4-5e7f-41c8-96d6-5596651998ec
424aeb03-c6dc-4505-97bd-93ac73ea83df	MY BONNIE	Unknown	my_bonnie	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	My Bonnie lies over the ocean,\n\nMy Bonnie lies over the sea,\n\nMy Bonnie lies over the ocean\n\nOh bring back my Bonnie to me.\n\nBring back, Bring back,\n\nBring back my Bonnie to me, to me,\n\nBring back, Bring back,\n\nOh bring back my Bonnie to me.	f	842287d4-5e7f-41c8-96d6-5596651998ec
16c9e256-6de7-4654-afd9-90e858e52eb3	MERA MÄN	Unknown	mera_män	86fd87bc-d4fb-4cdd-8848-f68933ea8b19	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Feta Franssyskor\n\nVi vill ha mera män, vi vill ha flera män!\n\nVi vill ha stora, starka, muskulösa män!\n\nDe ska ha hår på bröst\n\noch djup och sexig röst,\n\nså att de orkar med oss tills i morgon kväll\\...\n\nDå kommer nya män, då kommer krya män.\n\nDå kommer unga fräscha, oförstörda män!\n\nVi skall förföra dem,\n\nvi skall förgöra dem,\n\nså att de kryper hem från oss på morgonen\\...\n\nSå kommer morgonen, i hand med morkkisen.\n\nDet är nog dags att ta en iskall öl igen.\n\nVi drar till första bar\n\noch dricker allt de har\n\noch sen så raggar vi en solbränd sexig karl\\...\n\nSe vilken modig man och tänk på allt han kan!\n\nHan är ju sexig, stark, dessutom har han charm!\n\nHan vill ha med oss hem,\n\natt prova ut hans säng,\n\nmen vi skall göra honom till vår lilla dräng\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
\.


--
-- Data for Name: song_book; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.song_book (id, name, unique_name, author, deleted, owned_by) FROM stdin;
19df4054-30a9-4b6c-a94e-0ed6a3308939	Official songbook	official_songbook		f	842287d4-5e7f-41c8-96d6-5596651998ec
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
19df4054-30a9-4b6c-a94e-0ed6a3308939	e91ee5dc-fb2b-4cc1-85cb-da3f70767bc5	15
19df4054-30a9-4b6c-a94e-0ed6a3308939	5e0d31c7-2f09-40ae-aeb4-a0e6c5f82d29	42
19df4054-30a9-4b6c-a94e-0ed6a3308939	42b0dfa8-afa0-4673-95eb-d9eb666e83ba	105
19df4054-30a9-4b6c-a94e-0ed6a3308939	47fded4e-3341-4698-bb85-bd11097185fd	120
19df4054-30a9-4b6c-a94e-0ed6a3308939	a0571fc4-40e6-4254-9eba-562c8869cdeb	88
19df4054-30a9-4b6c-a94e-0ed6a3308939	c6daa05f-142f-43c8-91e8-fe07cb54b124	108
19df4054-30a9-4b6c-a94e-0ed6a3308939	323d2bfe-2bec-4199-8470-61c0de18d547	101
19df4054-30a9-4b6c-a94e-0ed6a3308939	9cf7064a-d830-4a62-8d5e-2ebae2e1765e	80
19df4054-30a9-4b6c-a94e-0ed6a3308939	d5fa1ab1-d501-469d-93dd-0db0fbcf420c	67
19df4054-30a9-4b6c-a94e-0ed6a3308939	523ef7d3-e651-408f-ad15-bf84675b312a	40
19df4054-30a9-4b6c-a94e-0ed6a3308939	073139e2-8682-4e8c-b86f-0e1a84bb1597	83
19df4054-30a9-4b6c-a94e-0ed6a3308939	8b73a7b3-1cc1-42da-81b3-c57ef21f73df	58
19df4054-30a9-4b6c-a94e-0ed6a3308939	254be862-4804-4fe9-bd75-d4b72db4a3df	65
19df4054-30a9-4b6c-a94e-0ed6a3308939	507a31d2-a300-4eb0-b2be-027eaed5133a	51
19df4054-30a9-4b6c-a94e-0ed6a3308939	f3faa047-7543-4ab6-86ba-d8414085e1fb	103
19df4054-30a9-4b6c-a94e-0ed6a3308939	b19f87eb-643f-4e1d-ba04-59893ec78837	77
19df4054-30a9-4b6c-a94e-0ed6a3308939	698add37-ed2c-4e77-8067-30b319174686	46
19df4054-30a9-4b6c-a94e-0ed6a3308939	8ba85833-c284-4d84-ba25-f11c1ca10341	17
19df4054-30a9-4b6c-a94e-0ed6a3308939	5f52a584-13d6-41ba-ad05-36dc6ee31b77	52
19df4054-30a9-4b6c-a94e-0ed6a3308939	5caaf164-3f4a-4715-a869-ef6ad92656e9	84
19df4054-30a9-4b6c-a94e-0ed6a3308939	dbcc7bcb-8e10-490c-a511-4c59b63f7e7c	135
19df4054-30a9-4b6c-a94e-0ed6a3308939	f675093b-e284-4e96-a244-8d84ebbd74b7	86
19df4054-30a9-4b6c-a94e-0ed6a3308939	d5ad0b1f-1756-4df7-a24b-e498c7ad27fb	54
19df4054-30a9-4b6c-a94e-0ed6a3308939	f1e81a6d-8b4c-4793-a2e5-66d131c4eaba	53
19df4054-30a9-4b6c-a94e-0ed6a3308939	51ef4985-3a28-4f39-9ba3-7ed3fab41210	81
19df4054-30a9-4b6c-a94e-0ed6a3308939	694d881b-d0db-49b1-9f4f-777638181776	104
19df4054-30a9-4b6c-a94e-0ed6a3308939	038498ab-5d7b-4d5c-bccd-427635b7501e	16
19df4054-30a9-4b6c-a94e-0ed6a3308939	ea60b122-5aa6-4de7-a71a-852bf6caea0f	89
19df4054-30a9-4b6c-a94e-0ed6a3308939	2f412b0a-0436-4d98-b615-58b16921c8ba	132
19df4054-30a9-4b6c-a94e-0ed6a3308939	46cd7f85-18a4-4d7c-a875-10bdc4b60972	131
19df4054-30a9-4b6c-a94e-0ed6a3308939	a760577d-755a-47f4-9d2c-a45c31a860c5	94
19df4054-30a9-4b6c-a94e-0ed6a3308939	30b3267b-6464-49fc-8fb9-15d49d6e0e97	121
19df4054-30a9-4b6c-a94e-0ed6a3308939	442e8541-a81d-4442-af93-d9c411d01937	61
19df4054-30a9-4b6c-a94e-0ed6a3308939	321aa5a3-9ae9-4101-8491-24689dcdb1a2	112
19df4054-30a9-4b6c-a94e-0ed6a3308939	f0274320-f40e-4016-88ed-b03d527c2fe6	69
19df4054-30a9-4b6c-a94e-0ed6a3308939	158de0da-5d25-4aa1-9382-74c0cbeb0681	97
19df4054-30a9-4b6c-a94e-0ed6a3308939	f6535aa6-22ed-4dc1-9587-018f9bf61ee5	66
19df4054-30a9-4b6c-a94e-0ed6a3308939	ae572e33-b868-4758-9e95-5a092af65c77	56
19df4054-30a9-4b6c-a94e-0ed6a3308939	16635ea5-add3-44c4-8f82-25e1b94e2424	14
19df4054-30a9-4b6c-a94e-0ed6a3308939	8ca56b7b-8555-423c-b283-15e7ebbdf08a	123
19df4054-30a9-4b6c-a94e-0ed6a3308939	b2bbd1e0-b10e-42c3-be1e-d30410fef90c	28
19df4054-30a9-4b6c-a94e-0ed6a3308939	e4c49d37-a137-47fc-ba6b-2ff6021fd106	118
19df4054-30a9-4b6c-a94e-0ed6a3308939	0c294a70-e75e-4823-bdca-b7ce4625d006	8
19df4054-30a9-4b6c-a94e-0ed6a3308939	3f4efe72-5a01-49a6-81a0-77c9a71b2afc	110
19df4054-30a9-4b6c-a94e-0ed6a3308939	165778d9-c9da-4bf3-a937-de2b8208cf67	12
19df4054-30a9-4b6c-a94e-0ed6a3308939	af69583b-74a6-46a1-bc7b-d49f6f7e9055	47
19df4054-30a9-4b6c-a94e-0ed6a3308939	ea55efc8-653f-45f8-ae0b-df07fe8d2687	31
19df4054-30a9-4b6c-a94e-0ed6a3308939	841c37c1-d2e4-4e1a-96a1-40953708c19e	60
19df4054-30a9-4b6c-a94e-0ed6a3308939	6e9beebe-4df9-4f15-8b9f-e9ddaf043012	125
19df4054-30a9-4b6c-a94e-0ed6a3308939	2a164d0f-110c-48ee-bd40-8725b2347d5a	82
19df4054-30a9-4b6c-a94e-0ed6a3308939	eb833e21-c62c-4bd1-aa59-b545b565f7c1	73
19df4054-30a9-4b6c-a94e-0ed6a3308939	e059d636-bee8-4da3-b7a3-1f43f5972f87	148
19df4054-30a9-4b6c-a94e-0ed6a3308939	7427998f-556a-462d-890e-21acc9be9a11	11
19df4054-30a9-4b6c-a94e-0ed6a3308939	e3cb3d72-3590-45da-9848-f77b79aa0d53	79
19df4054-30a9-4b6c-a94e-0ed6a3308939	e2f21ec2-4071-451b-9414-91883eecb1bc	87
19df4054-30a9-4b6c-a94e-0ed6a3308939	5c1e262e-c39d-4e8b-8787-aa6e1b171bf9	70
19df4054-30a9-4b6c-a94e-0ed6a3308939	fcff1adc-14b5-4815-8069-bbed2c5385d8	129
19df4054-30a9-4b6c-a94e-0ed6a3308939	60afbfe4-6579-4e50-8756-a9ff4ef40096	30
19df4054-30a9-4b6c-a94e-0ed6a3308939	aca8be84-efe8-43ff-a3ad-5d515e96b0ea	107
19df4054-30a9-4b6c-a94e-0ed6a3308939	52945a42-38ba-4ef1-a915-e20fa57f14ed	100
19df4054-30a9-4b6c-a94e-0ed6a3308939	2795efc1-2419-4a3e-83de-e5730b6f7681	85
19df4054-30a9-4b6c-a94e-0ed6a3308939	168b18e3-06a7-4e81-bdd6-ce46feb2b15f	23
19df4054-30a9-4b6c-a94e-0ed6a3308939	363c5985-ec29-4762-8949-e586c7d759f9	130
19df4054-30a9-4b6c-a94e-0ed6a3308939	4a452390-670d-47f8-b3c4-0c3d62f10b00	7
19df4054-30a9-4b6c-a94e-0ed6a3308939	8ad8feec-43eb-437f-8bdc-26cdd9fb48ab	117
19df4054-30a9-4b6c-a94e-0ed6a3308939	743e4dd2-9536-428f-9006-2cd1154f20cb	33
19df4054-30a9-4b6c-a94e-0ed6a3308939	fe6a8e1a-f041-48d9-8146-e260f4cec92b	138
19df4054-30a9-4b6c-a94e-0ed6a3308939	4983add4-8b2b-4e0a-93a9-98dbbbfe7968	57
19df4054-30a9-4b6c-a94e-0ed6a3308939	c448237f-82e5-4371-a887-9b28fdbc6920	64
19df4054-30a9-4b6c-a94e-0ed6a3308939	5ad2e3c7-39fd-43f8-b4e9-c807442da774	32
19df4054-30a9-4b6c-a94e-0ed6a3308939	f94c7e41-8507-4afd-a46d-c4a965c7e58e	43
19df4054-30a9-4b6c-a94e-0ed6a3308939	0624f5d7-350e-488b-8804-2c453f0f13fd	2
19df4054-30a9-4b6c-a94e-0ed6a3308939	a99f2688-7f3d-4fec-a676-ee2c0c8d0f6c	4
19df4054-30a9-4b6c-a94e-0ed6a3308939	ffb62ecc-9f70-4f9f-b7cd-5943702da10b	37
19df4054-30a9-4b6c-a94e-0ed6a3308939	1125ab7a-4aed-401f-b009-2842bdfb39bd	38
19df4054-30a9-4b6c-a94e-0ed6a3308939	ba95294e-217a-488a-9534-5247476a7b81	78
19df4054-30a9-4b6c-a94e-0ed6a3308939	2dd37434-cbe9-4d39-b715-ba59f2a528d3	75
19df4054-30a9-4b6c-a94e-0ed6a3308939	cdaa3572-6761-4627-ba0c-4cf31684ca6e	106
19df4054-30a9-4b6c-a94e-0ed6a3308939	129a1477-987e-41db-95fc-04db29c95e44	124
19df4054-30a9-4b6c-a94e-0ed6a3308939	fb12b611-7bd0-4385-bdf5-36012577aecf	72
19df4054-30a9-4b6c-a94e-0ed6a3308939	865ce938-c715-415c-b845-b0130e0b43aa	98
19df4054-30a9-4b6c-a94e-0ed6a3308939	0a4c1dec-cd90-4c99-ac6b-347ac84faa50	74
19df4054-30a9-4b6c-a94e-0ed6a3308939	f7f25a32-9689-4b97-8b87-1f6706c8cacd	29
19df4054-30a9-4b6c-a94e-0ed6a3308939	c602cb3c-4de6-4d71-bec2-60d16e697e96	99
19df4054-30a9-4b6c-a94e-0ed6a3308939	9520ed54-a33b-4a60-a565-67671bcb2489	115
19df4054-30a9-4b6c-a94e-0ed6a3308939	f309d9be-98e5-4c7c-a382-dadb65370920	59
19df4054-30a9-4b6c-a94e-0ed6a3308939	109df3d6-33b5-4e17-b5d1-5b24aa434fb4	50
19df4054-30a9-4b6c-a94e-0ed6a3308939	315afa28-3cc9-4741-b46c-37cdf8b0f810	49
19df4054-30a9-4b6c-a94e-0ed6a3308939	4feada76-ac50-494c-9730-91bd816e51fe	146
19df4054-30a9-4b6c-a94e-0ed6a3308939	e7d1a871-10f4-46d9-bbc8-b1388f903b6d	22
19df4054-30a9-4b6c-a94e-0ed6a3308939	e120f94a-f17c-4870-8404-6c70653081fb	20
19df4054-30a9-4b6c-a94e-0ed6a3308939	caf86b82-f0d9-4af0-ae97-a8d35aaf785c	90
19df4054-30a9-4b6c-a94e-0ed6a3308939	fd45a489-6200-49c2-901a-814444589d6f	134
19df4054-30a9-4b6c-a94e-0ed6a3308939	9e71ce57-1baf-4302-a00b-47de4157d33a	10
19df4054-30a9-4b6c-a94e-0ed6a3308939	2d2095a3-62df-46e8-87f0-52a67117bbf3	44
19df4054-30a9-4b6c-a94e-0ed6a3308939	5511104d-376c-4ebc-9d27-6f6fe58de670	93
19df4054-30a9-4b6c-a94e-0ed6a3308939	58ff750f-85b3-46d9-9f8b-65065e316e2d	144
19df4054-30a9-4b6c-a94e-0ed6a3308939	9ee81d2d-25b2-476c-a62d-7772b2190156	3
19df4054-30a9-4b6c-a94e-0ed6a3308939	94761b1c-11b7-4f97-84c2-9a7ce7968f3d	109
19df4054-30a9-4b6c-a94e-0ed6a3308939	0f3080a2-9efd-473d-a065-37f875145278	71
19df4054-30a9-4b6c-a94e-0ed6a3308939	2ea8e77d-42cf-4158-b32c-24228a279f2d	126
19df4054-30a9-4b6c-a94e-0ed6a3308939	9a750d80-ba3e-4178-be6f-55abeee14479	34
19df4054-30a9-4b6c-a94e-0ed6a3308939	ea6fc54e-5858-4018-b411-599b48b6f2be	24
19df4054-30a9-4b6c-a94e-0ed6a3308939	9392a74e-c60f-4795-9272-4aea29bdb963	91
19df4054-30a9-4b6c-a94e-0ed6a3308939	57cf8b63-03f0-4a48-a530-b4802eb45660	39
19df4054-30a9-4b6c-a94e-0ed6a3308939	719c0461-c31d-4070-93ce-07e938e58fcf	137
19df4054-30a9-4b6c-a94e-0ed6a3308939	d0128de8-695e-46ee-9031-0f5143415165	147
19df4054-30a9-4b6c-a94e-0ed6a3308939	d6e81367-7013-4a6c-9546-7f4eebd4b24e	116
19df4054-30a9-4b6c-a94e-0ed6a3308939	5ce47b0a-f5b3-4eb0-bf97-394c2fd4e726	25
19df4054-30a9-4b6c-a94e-0ed6a3308939	8172173d-e262-4f37-92b2-11cbb3c700eb	96
19df4054-30a9-4b6c-a94e-0ed6a3308939	db8d3609-eef6-43fc-8251-a993937ad3eb	140
19df4054-30a9-4b6c-a94e-0ed6a3308939	8f799eab-78f6-4660-b9c1-4691f0b3ea0b	111
19df4054-30a9-4b6c-a94e-0ed6a3308939	dada6cd5-3888-446a-b714-70b693f1c241	35
19df4054-30a9-4b6c-a94e-0ed6a3308939	0ece64c7-6333-4c16-9a84-daba2e49ab79	6
19df4054-30a9-4b6c-a94e-0ed6a3308939	8d7b1632-1d84-4c50-ac5b-202658a7625c	68
19df4054-30a9-4b6c-a94e-0ed6a3308939	7f654d86-2088-4d85-825c-07d60cf72f67	143
19df4054-30a9-4b6c-a94e-0ed6a3308939	5f9d9496-719e-4788-b09f-2fe131336b99	102
19df4054-30a9-4b6c-a94e-0ed6a3308939	50b87379-a2f0-4ed2-beb0-c78f8f0fda26	26
19df4054-30a9-4b6c-a94e-0ed6a3308939	851e3c8d-8d9f-4b82-b3ea-03b3d9edbee0	95
19df4054-30a9-4b6c-a94e-0ed6a3308939	5a2f2a4f-c607-45bb-81d6-8c30ece80431	119
19df4054-30a9-4b6c-a94e-0ed6a3308939	02731776-40c5-4595-8b55-1b906dc8e038	48
19df4054-30a9-4b6c-a94e-0ed6a3308939	d5656082-e597-407c-9c71-a1fa3a554b66	9
19df4054-30a9-4b6c-a94e-0ed6a3308939	27763691-701f-4d7f-bcf7-9a9221c3504c	13
19df4054-30a9-4b6c-a94e-0ed6a3308939	0d0cc66e-680a-4c1c-b915-e9ed1c6cc191	18
19df4054-30a9-4b6c-a94e-0ed6a3308939	10f26b86-7e31-465f-94c0-0e0bc9a16540	21
19df4054-30a9-4b6c-a94e-0ed6a3308939	cd8756cc-6e97-43fd-802d-7c8cc40e604d	41
19df4054-30a9-4b6c-a94e-0ed6a3308939	e96724b7-4b14-4ba0-baf4-1c9724dcaf5b	133
19df4054-30a9-4b6c-a94e-0ed6a3308939	36fa5696-46e2-4587-b143-83756af68063	45
19df4054-30a9-4b6c-a94e-0ed6a3308939	154a352f-ef78-48c2-94e1-96418393483a	142
19df4054-30a9-4b6c-a94e-0ed6a3308939	4f514bf1-41b9-4811-abbd-6bb170a8259b	76
19df4054-30a9-4b6c-a94e-0ed6a3308939	8b0bf764-9d4a-4f33-9bad-6e35ca59835e	145
19df4054-30a9-4b6c-a94e-0ed6a3308939	10d78618-bc1b-4d91-a46f-c7c1845add9d	5
19df4054-30a9-4b6c-a94e-0ed6a3308939	b8b5b072-4e3a-41a4-8845-957ee1efa27c	19
19df4054-30a9-4b6c-a94e-0ed6a3308939	f9890dc4-fcc7-491d-8e05-d9c7ddd81be0	63
19df4054-30a9-4b6c-a94e-0ed6a3308939	017790b0-6ecc-41da-8303-fb25cfabb9bd	139
19df4054-30a9-4b6c-a94e-0ed6a3308939	3f0d57d0-8b2a-4f65-8284-63b1bf52cb16	141
19df4054-30a9-4b6c-a94e-0ed6a3308939	e6fe1176-c0f3-4415-8334-582c41186843	62
19df4054-30a9-4b6c-a94e-0ed6a3308939	9c963d90-edeb-48ce-9b32-aeebd0503c69	92
19df4054-30a9-4b6c-a94e-0ed6a3308939	23d118bf-4f5c-4d07-bfd1-f19bb600c40a	128
19df4054-30a9-4b6c-a94e-0ed6a3308939	904649f8-80d3-4cd8-b688-96b877864af3	127
19df4054-30a9-4b6c-a94e-0ed6a3308939	6f414c66-4c5f-4771-a38f-f1a7d486e0cf	1
19df4054-30a9-4b6c-a94e-0ed6a3308939	75431394-2fe6-4c3c-acf1-bcc9e2e8b657	114
19df4054-30a9-4b6c-a94e-0ed6a3308939	420b708f-5a66-4edb-b868-ca8b008a8ce7	55
19df4054-30a9-4b6c-a94e-0ed6a3308939	33be6bb7-2dc2-454c-9221-71b924d87ab5	36
19df4054-30a9-4b6c-a94e-0ed6a3308939	fb289cac-f289-47e0-8e56-e5fe2b417784	27
19df4054-30a9-4b6c-a94e-0ed6a3308939	424aeb03-c6dc-4505-97bd-93ac73ea83df	122
19df4054-30a9-4b6c-a94e-0ed6a3308939	16c9e256-6de7-4654-afd9-90e858e52eb3	113
\.


--
-- Data for Name: song_tag; Type: TABLE DATA; Schema: public; Owner: songbook
--

COPY public.song_tag (song_id, tag_id) FROM stdin;
e91ee5dc-fb2b-4cc1-85cb-da3f70767bc5	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
e91ee5dc-fb2b-4cc1-85cb-da3f70767bc5	9c64850c-f778-41a0-9fb1-0903304a47de
5e0d31c7-2f09-40ae-aeb4-a0e6c5f82d29	9c64850c-f778-41a0-9fb1-0903304a47de
42b0dfa8-afa0-4673-95eb-d9eb666e83ba	52b724cf-44bf-4d26-87d9-71ea6605d4e1
47fded4e-3341-4698-bb85-bd11097185fd	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
a0571fc4-40e6-4254-9eba-562c8869cdeb	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
c6daa05f-142f-43c8-91e8-fe07cb54b124	52b724cf-44bf-4d26-87d9-71ea6605d4e1
323d2bfe-2bec-4199-8470-61c0de18d547	52b724cf-44bf-4d26-87d9-71ea6605d4e1
9cf7064a-d830-4a62-8d5e-2ebae2e1765e	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
d5fa1ab1-d501-469d-93dd-0db0fbcf420c	9c64850c-f778-41a0-9fb1-0903304a47de
523ef7d3-e651-408f-ad15-bf84675b312a	9c64850c-f778-41a0-9fb1-0903304a47de
073139e2-8682-4e8c-b86f-0e1a84bb1597	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
8b73a7b3-1cc1-42da-81b3-c57ef21f73df	9c64850c-f778-41a0-9fb1-0903304a47de
254be862-4804-4fe9-bd75-d4b72db4a3df	9c64850c-f778-41a0-9fb1-0903304a47de
507a31d2-a300-4eb0-b2be-027eaed5133a	9c64850c-f778-41a0-9fb1-0903304a47de
f3faa047-7543-4ab6-86ba-d8414085e1fb	52b724cf-44bf-4d26-87d9-71ea6605d4e1
b19f87eb-643f-4e1d-ba04-59893ec78837	fc792348-2aa0-486f-8f30-825679f909ef
698add37-ed2c-4e77-8067-30b319174686	9c64850c-f778-41a0-9fb1-0903304a47de
8ba85833-c284-4d84-ba25-f11c1ca10341	9c64850c-f778-41a0-9fb1-0903304a47de
5f52a584-13d6-41ba-ad05-36dc6ee31b77	9c64850c-f778-41a0-9fb1-0903304a47de
5caaf164-3f4a-4715-a869-ef6ad92656e9	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
dbcc7bcb-8e10-490c-a511-4c59b63f7e7c	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
f675093b-e284-4e96-a244-8d84ebbd74b7	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
d5ad0b1f-1756-4df7-a24b-e498c7ad27fb	9c64850c-f778-41a0-9fb1-0903304a47de
f1e81a6d-8b4c-4793-a2e5-66d131c4eaba	9c64850c-f778-41a0-9fb1-0903304a47de
51ef4985-3a28-4f39-9ba3-7ed3fab41210	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
694d881b-d0db-49b1-9f4f-777638181776	52b724cf-44bf-4d26-87d9-71ea6605d4e1
038498ab-5d7b-4d5c-bccd-427635b7501e	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
038498ab-5d7b-4d5c-bccd-427635b7501e	9c64850c-f778-41a0-9fb1-0903304a47de
ea60b122-5aa6-4de7-a71a-852bf6caea0f	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
2f412b0a-0436-4d98-b615-58b16921c8ba	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
46cd7f85-18a4-4d7c-a875-10bdc4b60972	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
a760577d-755a-47f4-9d2c-a45c31a860c5	2d785c12-b721-4ad8-b4a3-e980e5f6806b
30b3267b-6464-49fc-8fb9-15d49d6e0e97	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
442e8541-a81d-4442-af93-d9c411d01937	9c64850c-f778-41a0-9fb1-0903304a47de
321aa5a3-9ae9-4101-8491-24689dcdb1a2	425c86b6-282f-400a-a062-6e58751f12f3
f0274320-f40e-4016-88ed-b03d527c2fe6	9c64850c-f778-41a0-9fb1-0903304a47de
158de0da-5d25-4aa1-9382-74c0cbeb0681	2d785c12-b721-4ad8-b4a3-e980e5f6806b
f6535aa6-22ed-4dc1-9587-018f9bf61ee5	9c64850c-f778-41a0-9fb1-0903304a47de
ae572e33-b868-4758-9e95-5a092af65c77	9c64850c-f778-41a0-9fb1-0903304a47de
16635ea5-add3-44c4-8f82-25e1b94e2424	f0406f80-b960-415b-a5fb-55b05524ac64
8ca56b7b-8555-423c-b283-15e7ebbdf08a	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
b2bbd1e0-b10e-42c3-be1e-d30410fef90c	9c64850c-f778-41a0-9fb1-0903304a47de
e4c49d37-a137-47fc-ba6b-2ff6021fd106	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
0c294a70-e75e-4823-bdca-b7ce4625d006	f0406f80-b960-415b-a5fb-55b05524ac64
3f4efe72-5a01-49a6-81a0-77c9a71b2afc	425c86b6-282f-400a-a062-6e58751f12f3
165778d9-c9da-4bf3-a937-de2b8208cf67	f0406f80-b960-415b-a5fb-55b05524ac64
af69583b-74a6-46a1-bc7b-d49f6f7e9055	9c64850c-f778-41a0-9fb1-0903304a47de
ea55efc8-653f-45f8-ae0b-df07fe8d2687	9c64850c-f778-41a0-9fb1-0903304a47de
841c37c1-d2e4-4e1a-96a1-40953708c19e	9c64850c-f778-41a0-9fb1-0903304a47de
6e9beebe-4df9-4f15-8b9f-e9ddaf043012	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
2a164d0f-110c-48ee-bd40-8725b2347d5a	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
eb833e21-c62c-4bd1-aa59-b545b565f7c1	fc792348-2aa0-486f-8f30-825679f909ef
e059d636-bee8-4da3-b7a3-1f43f5972f87	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
7427998f-556a-462d-890e-21acc9be9a11	9c64850c-f778-41a0-9fb1-0903304a47de
7427998f-556a-462d-890e-21acc9be9a11	fc792348-2aa0-486f-8f30-825679f909ef
7427998f-556a-462d-890e-21acc9be9a11	f409dc39-d61b-44a7-9542-7d7f7460349f
7427998f-556a-462d-890e-21acc9be9a11	f0406f80-b960-415b-a5fb-55b05524ac64
e3cb3d72-3590-45da-9848-f77b79aa0d53	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
e2f21ec2-4071-451b-9414-91883eecb1bc	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
5c1e262e-c39d-4e8b-8787-aa6e1b171bf9	9c64850c-f778-41a0-9fb1-0903304a47de
fcff1adc-14b5-4815-8069-bbed2c5385d8	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
60afbfe4-6579-4e50-8756-a9ff4ef40096	9c64850c-f778-41a0-9fb1-0903304a47de
aca8be84-efe8-43ff-a3ad-5d515e96b0ea	52b724cf-44bf-4d26-87d9-71ea6605d4e1
52945a42-38ba-4ef1-a915-e20fa57f14ed	52b724cf-44bf-4d26-87d9-71ea6605d4e1
2795efc1-2419-4a3e-83de-e5730b6f7681	4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5
168b18e3-06a7-4e81-bdd6-ce46feb2b15f	9c64850c-f778-41a0-9fb1-0903304a47de
363c5985-ec29-4762-8949-e586c7d759f9	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
4a452390-670d-47f8-b3c4-0c3d62f10b00	f0406f80-b960-415b-a5fb-55b05524ac64
8ad8feec-43eb-437f-8bdc-26cdd9fb48ab	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
743e4dd2-9536-428f-9006-2cd1154f20cb	9c64850c-f778-41a0-9fb1-0903304a47de
fe6a8e1a-f041-48d9-8146-e260f4cec92b	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
4983add4-8b2b-4e0a-93a9-98dbbbfe7968	9c64850c-f778-41a0-9fb1-0903304a47de
c448237f-82e5-4371-a887-9b28fdbc6920	9c64850c-f778-41a0-9fb1-0903304a47de
5ad2e3c7-39fd-43f8-b4e9-c807442da774	9c64850c-f778-41a0-9fb1-0903304a47de
f94c7e41-8507-4afd-a46d-c4a965c7e58e	9c64850c-f778-41a0-9fb1-0903304a47de
0624f5d7-350e-488b-8804-2c453f0f13fd	f0406f80-b960-415b-a5fb-55b05524ac64
a99f2688-7f3d-4fec-a676-ee2c0c8d0f6c	f0406f80-b960-415b-a5fb-55b05524ac64
ffb62ecc-9f70-4f9f-b7cd-5943702da10b	9c64850c-f778-41a0-9fb1-0903304a47de
1125ab7a-4aed-401f-b009-2842bdfb39bd	9c64850c-f778-41a0-9fb1-0903304a47de
ba95294e-217a-488a-9534-5247476a7b81	fc792348-2aa0-486f-8f30-825679f909ef
2dd37434-cbe9-4d39-b715-ba59f2a528d3	fc792348-2aa0-486f-8f30-825679f909ef
cdaa3572-6761-4627-ba0c-4cf31684ca6e	52b724cf-44bf-4d26-87d9-71ea6605d4e1
129a1477-987e-41db-95fc-04db29c95e44	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
fb12b611-7bd0-4385-bdf5-36012577aecf	fc792348-2aa0-486f-8f30-825679f909ef
865ce938-c715-415c-b845-b0130e0b43aa	2d785c12-b721-4ad8-b4a3-e980e5f6806b
0a4c1dec-cd90-4c99-ac6b-347ac84faa50	fc792348-2aa0-486f-8f30-825679f909ef
f7f25a32-9689-4b97-8b87-1f6706c8cacd	9c64850c-f778-41a0-9fb1-0903304a47de
c602cb3c-4de6-4d71-bec2-60d16e697e96	2d785c12-b721-4ad8-b4a3-e980e5f6806b
9520ed54-a33b-4a60-a565-67671bcb2489	425c86b6-282f-400a-a062-6e58751f12f3
f309d9be-98e5-4c7c-a382-dadb65370920	9c64850c-f778-41a0-9fb1-0903304a47de
109df3d6-33b5-4e17-b5d1-5b24aa434fb4	9c64850c-f778-41a0-9fb1-0903304a47de
315afa28-3cc9-4741-b46c-37cdf8b0f810	f0406f80-b960-415b-a5fb-55b05524ac64
315afa28-3cc9-4741-b46c-37cdf8b0f810	9c64850c-f778-41a0-9fb1-0903304a47de
4feada76-ac50-494c-9730-91bd816e51fe	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
e7d1a871-10f4-46d9-bbc8-b1388f903b6d	9c64850c-f778-41a0-9fb1-0903304a47de
e120f94a-f17c-4870-8404-6c70653081fb	9c64850c-f778-41a0-9fb1-0903304a47de
caf86b82-f0d9-4af0-ae97-a8d35aaf785c	f409dc39-d61b-44a7-9542-7d7f7460349f
fd45a489-6200-49c2-901a-814444589d6f	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
9e71ce57-1baf-4302-a00b-47de4157d33a	f0406f80-b960-415b-a5fb-55b05524ac64
2d2095a3-62df-46e8-87f0-52a67117bbf3	9c64850c-f778-41a0-9fb1-0903304a47de
5511104d-376c-4ebc-9d27-6f6fe58de670	2d785c12-b721-4ad8-b4a3-e980e5f6806b
58ff750f-85b3-46d9-9f8b-65065e316e2d	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
9ee81d2d-25b2-476c-a62d-7772b2190156	f0406f80-b960-415b-a5fb-55b05524ac64
94761b1c-11b7-4f97-84c2-9a7ce7968f3d	52b724cf-44bf-4d26-87d9-71ea6605d4e1
0f3080a2-9efd-473d-a065-37f875145278	9c64850c-f778-41a0-9fb1-0903304a47de
2ea8e77d-42cf-4158-b32c-24228a279f2d	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
9a750d80-ba3e-4178-be6f-55abeee14479	9c64850c-f778-41a0-9fb1-0903304a47de
ea6fc54e-5858-4018-b411-599b48b6f2be	9c64850c-f778-41a0-9fb1-0903304a47de
9392a74e-c60f-4795-9272-4aea29bdb963	f409dc39-d61b-44a7-9542-7d7f7460349f
57cf8b63-03f0-4a48-a530-b4802eb45660	9c64850c-f778-41a0-9fb1-0903304a47de
719c0461-c31d-4070-93ce-07e938e58fcf	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
d0128de8-695e-46ee-9031-0f5143415165	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
d6e81367-7013-4a6c-9546-7f4eebd4b24e	425c86b6-282f-400a-a062-6e58751f12f3
5ce47b0a-f5b3-4eb0-bf97-394c2fd4e726	9c64850c-f778-41a0-9fb1-0903304a47de
8172173d-e262-4f37-92b2-11cbb3c700eb	2d785c12-b721-4ad8-b4a3-e980e5f6806b
db8d3609-eef6-43fc-8251-a993937ad3eb	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
8f799eab-78f6-4660-b9c1-4691f0b3ea0b	425c86b6-282f-400a-a062-6e58751f12f3
dada6cd5-3888-446a-b714-70b693f1c241	9c64850c-f778-41a0-9fb1-0903304a47de
0ece64c7-6333-4c16-9a84-daba2e49ab79	f0406f80-b960-415b-a5fb-55b05524ac64
8d7b1632-1d84-4c50-ac5b-202658a7625c	9c64850c-f778-41a0-9fb1-0903304a47de
7f654d86-2088-4d85-825c-07d60cf72f67	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
5f9d9496-719e-4788-b09f-2fe131336b99	52b724cf-44bf-4d26-87d9-71ea6605d4e1
50b87379-a2f0-4ed2-beb0-c78f8f0fda26	9c64850c-f778-41a0-9fb1-0903304a47de
851e3c8d-8d9f-4b82-b3ea-03b3d9edbee0	2d785c12-b721-4ad8-b4a3-e980e5f6806b
5a2f2a4f-c607-45bb-81d6-8c30ece80431	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
02731776-40c5-4595-8b55-1b906dc8e038	9c64850c-f778-41a0-9fb1-0903304a47de
d5656082-e597-407c-9c71-a1fa3a554b66	f0406f80-b960-415b-a5fb-55b05524ac64
d5656082-e597-407c-9c71-a1fa3a554b66	9c64850c-f778-41a0-9fb1-0903304a47de
27763691-701f-4d7f-bcf7-9a9221c3504c	f0406f80-b960-415b-a5fb-55b05524ac64
0d0cc66e-680a-4c1c-b915-e9ed1c6cc191	9c64850c-f778-41a0-9fb1-0903304a47de
10f26b86-7e31-465f-94c0-0e0bc9a16540	9c64850c-f778-41a0-9fb1-0903304a47de
cd8756cc-6e97-43fd-802d-7c8cc40e604d	9c64850c-f778-41a0-9fb1-0903304a47de
e96724b7-4b14-4ba0-baf4-1c9724dcaf5b	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
36fa5696-46e2-4587-b143-83756af68063	9c64850c-f778-41a0-9fb1-0903304a47de
154a352f-ef78-48c2-94e1-96418393483a	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
4f514bf1-41b9-4811-abbd-6bb170a8259b	fc792348-2aa0-486f-8f30-825679f909ef
8b0bf764-9d4a-4f33-9bad-6e35ca59835e	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
10d78618-bc1b-4d91-a46f-c7c1845add9d	f0406f80-b960-415b-a5fb-55b05524ac64
b8b5b072-4e3a-41a4-8845-957ee1efa27c	9c64850c-f778-41a0-9fb1-0903304a47de
f9890dc4-fcc7-491d-8e05-d9c7ddd81be0	9c64850c-f778-41a0-9fb1-0903304a47de
017790b0-6ecc-41da-8303-fb25cfabb9bd	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
3f0d57d0-8b2a-4f65-8284-63b1bf52cb16	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
e6fe1176-c0f3-4415-8334-582c41186843	9c64850c-f778-41a0-9fb1-0903304a47de
9c963d90-edeb-48ce-9b32-aeebd0503c69	f409dc39-d61b-44a7-9542-7d7f7460349f
23d118bf-4f5c-4d07-bfd1-f19bb600c40a	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
904649f8-80d3-4cd8-b688-96b877864af3	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
6f414c66-4c5f-4771-a38f-f1a7d486e0cf	f0406f80-b960-415b-a5fb-55b05524ac64
75431394-2fe6-4c3c-acf1-bcc9e2e8b657	425c86b6-282f-400a-a062-6e58751f12f3
420b708f-5a66-4edb-b868-ca8b008a8ce7	9c64850c-f778-41a0-9fb1-0903304a47de
33be6bb7-2dc2-454c-9221-71b924d87ab5	9c64850c-f778-41a0-9fb1-0903304a47de
fb289cac-f289-47e0-8e56-e5fe2b417784	9c64850c-f778-41a0-9fb1-0903304a47de
424aeb03-c6dc-4505-97bd-93ac73ea83df	bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7
16c9e256-6de7-4654-afd9-90e858e52eb3	425c86b6-282f-400a-a062-6e58751f12f3
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
2d785c12-b721-4ad8-b4a3-e980e5f6806b	Punsch		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
4dfce2ef-503b-4eb0-880f-b7ddaf3d1db5	Vin		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
f409dc39-d61b-44a7-9542-7d7f7460349f	Bäsk		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7	Allmänt		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
52b724cf-44bf-4d26-87d9-71ea6605d4e1	Dagen efter...		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
fc792348-2aa0-486f-8f30-825679f909ef	Öhl		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
9c64850c-f778-41a0-9fb1-0903304a47de	Snaps		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
f0406f80-b960-415b-a5fb-55b05524ac64	IT		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
425c86b6-282f-400a-a062-6e58751f12f3	Mannen och kvinnan		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
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

