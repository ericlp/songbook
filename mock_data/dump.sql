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
e2840ea8-56c9-41ed-851e-b2e851f131b6	R??da kavalleriet	https://www.google.com/search?hl=en&q=unknown%20melody
f0242e6f-9999-437d-ba7b-43d37350932f	B??ttre och b??ttre dag f??r dag	https://www.google.com/search?hl=en&q=unknown%20melody
1d7de628-fff1-4b5e-81df-894f1e73c264	Vem kan segla...	https://www.google.com/search?hl=en&q=unknown%20melody
0fba4229-b88a-44f0-a549-2f4d3e1fadd1	Sj??sala vals	https://www.google.com/search?hl=en&q=unknown%20melody
a1f327cc-c2a5-4820-a748-c2162cd3402c	O helga natt	https://www.google.com/search?hl=en&q=unknown%20melody
8c8b4bc4-1440-4c7d-be1f-057626834780	Marsche militaire av Franz Schubert	https://www.google.com/search?hl=en&q=unknown%20melody
650430c7-d7e0-48e5-95df-70074bb5cc6e	Lambeth walk	https://www.google.com/search?hl=en&q=unknown%20melody
c9ba108f-f09c-43df-8a6b-93aba0dd29c5	Mors lille Olle	https://www.google.com/search?hl=en&q=unknown%20melody
af5d2c6f-0f69-4289-af33-ba3d85d3d424	Uti v??r hage	https://www.google.com/search?hl=en&q=unknown%20melody
e7d2dacc-7ed1-4dc9-a793-8b1efcf41d03	My Bonnie	https://www.google.com/search?hl=en&q=unknown%20melody
ae592868-6fb3-45e3-a977-0e1d4d5a124e	refr. Av tre trallande j??ntor	https://www.google.com/search?hl=en&q=unknown%20melody
cedefb22-3b0c-4174-a0da-4fa9605f5953	Fritjof och Carmencita	https://www.google.com/search?hl=en&q=unknown%20melody
7d11c773-75e2-40d9-bc15-5c892fe79683	??nglamark	https://www.google.com/search?hl=en&q=unknown%20melody
dda2d3b0-1ed4-4079-aeb8-8f2ccc23e00d	En sockerbagare	https://www.google.com/search?hl=en&q=unknown%20melody
36965f53-2c74-4c42-b96f-d8485b040b20	Nu t??ndas tusen juleljus	https://www.google.com/search?hl=en&q=unknown%20melody
f88aaa46-da41-485e-a38c-208c5d0e5122	R??ven raskar ??ver isen.	https://www.google.com/search?hl=en&q=unknown%20melody
26ee5e7f-a5db-4bc0-ae81-732f58ce43fb	Kamomilla stad	https://www.google.com/search?hl=en&q=unknown%20melody
b3332fb7-bb1b-483b-8b42-16ece9b2a0f6	Vila vid denna k??lla	https://www.google.com/search?hl=en&q=unknown%20melody
66b4bd76-c249-424f-b80a-a0ca989a1346	Lille Katt	https://www.google.com/search?hl=en&q=unknown%20melody
38af3380-6c93-4106-b935-54f6d74087fb	Byssan lull	https://www.google.com/search?hl=en&q=unknown%20melody
ec2da08f-5cbc-43ff-af89-5d3ccddfd8f7	Kalle p?? sp??ngen	https://www.google.com/search?hl=en&q=unknown%20melody
5e9731e1-3115-49e1-b51d-8bbf466c11f2	Old man river	https://www.google.com/search?hl=en&q=unknown%20melody
a79d19bc-7985-4308-8779-dbd0f2a930f7	I sommarens soliga dagar	https://www.google.com/search?hl=en&q=unknown%20melody
b5fddba9-c171-4464-8ac9-0b2ae489008f	B??r ner mig till sj??n	https://www.google.com/search?hl=en&q=unknown%20melody
0b133575-dec2-4305-be53-2119470bd449	R??da kavalleriet	https://www.google.com/search?hl=en&q=unknown%20melody
a61882a9-da03-4d43-baaf-62a5268083d2	Sudda bort din sura min	https://www.google.com/search?hl=en&q=unknown%20melody
07142a23-153d-453a-8d39-91277ede921d	Jag har en gammal moster	https://www.google.com/search?hl=en&q=unknown%20melody
bf4527d6-f3ca-4524-bb64-7352feebe611	Glada ??nkan	https://www.google.com/search?hl=en&q=unknown%20melody
7d6d43dc-ec09-40a9-b06d-bbcb55f646ab	Du ska f?? min gamla cykel	https://www.google.com/search?hl=en&q=unknown%20melody
e636e963-b79e-4034-ae43-3be6bbedb742	N??r m??nen vandrar...	https://www.google.com/search?hl=en&q=unknown%20melody
86030790-4b79-4a71-b26b-56a0570b4cbd	Schottis p?? Valhall	https://www.google.com/search?hl=en&q=unknown%20melody
3c593ffe-87d1-4b3a-84a0-bc437c585996	Ja se det sn??ar	https://www.google.com/search?hl=en&q=unknown%20melody
fd754077-88bd-44f5-bc7c-54f7080ec055	Sov du lilla videung	https://www.google.com/search?hl=en&q=unknown%20melody
3fefad04-935e-4e33-8846-5d02748a3265	Gubben Noak	https://www.google.com/search?hl=en&q=unknown%20melody
7f70eb14-75d1-46f8-824b-32e5ca5a1d44	Du skall f?? min gamla...	https://www.google.com/search?hl=en&q=unknown%20melody
a8fddde8-5388-4bbb-9aaf-5f522d14e2f8	We will rock you - Queen	https://www.google.com/search?hl=en&q=unknown%20melody
1c50b4dd-910d-4341-bfaf-0ae4ee19d9a5	Ritsch, ratsch, filibom\\...	https://www.google.com/search?hl=en&q=unknown%20melody
94696550-e89f-48ff-a398-686b3d8bb4f9	Annie get your gun	https://www.google.com/search?hl=en&q=unknown%20melody
fcb5b7b3-e422-4c81-bce8-8ec06dc4ce42	Armen i vinkel (ramsa)	https://www.google.com/search?hl=en&q=unknown%20melody
113b741a-1a30-476b-bb15-5d875afd29df	Pippi L??ngstrump	https://www.google.com/search?hl=en&q=unknown%20melody
824478fe-360b-4152-a78a-e163353f9766	Marselj??sen	https://www.google.com/search?hl=en&q=unknown%20melody
85a96098-bd67-4165-8d00-f916766fded2	Sj??sala vals	https://www.google.com/search?hl=en&q=unknown%20melody
721b0c12-9336-474d-99b9-0161b591f0c7	Internationalen	https://www.google.com/search?hl=en&q=unknown%20melody
15726ba3-cd80-445d-8971-ecaa3f820eee	It's a long way to...	https://www.google.com/search?hl=en&q=unknown%20melody
c84cdaaf-a722-43ea-9401-0917ee6a0f5f	G??rdebyl??ten	https://www.google.com/search?hl=en&q=unknown%20melody
8d925b9d-6252-40fe-b0df-18b4834822e2	My Bonnie	https://www.google.com/search?hl=en&q=unknown%20melody
ccfc6367-0a92-4ded-b5e7-82506b01b164	My Bonnie	https://www.google.com/search?hl=en&q=unknown%20melody
f574319a-99b7-4925-9e26-46b442d20438	Oh when the saints	https://www.google.com/search?hl=en&q=unknown%20melody
d8d2baa1-18be-4bcb-a47b-ce9db1610801	Oh, Tannenbaum	https://www.google.com/search?hl=en&q=unknown%20melody
b01bf346-2844-493c-9257-63a3b64f165b	Svenska nationals??ngen	https://www.google.com/search?hl=en&q=unknown%20melody
36231403-8759-4f32-b3a7-cd8d227b1ab6	En sockerbagare	https://www.google.com/search?hl=en&q=unknown%20melody
643863b3-9a93-42df-a435-770f987fb3a0	Hej tomtegubbar	https://www.google.com/search?hl=en&q=unknown%20melody
a4791ce3-e94c-4a45-8cdb-57f75c082b14	En sockerbagare	https://www.google.com/search?hl=en&q=unknown%20melody
cc581ecb-59cc-417a-aeb4-79c918e50c12	White christmas	https://www.google.com/search?hl=en&q=unknown%20melody
e26a3f98-b079-40a7-8878-0df9f4a8dc19	Med en enkel tulipan	https://www.google.com/search?hl=en&q=unknown%20melody
cecc9545-9742-4b79-ba1f-44155f009211	Mors lille Olle	https://www.google.com/search?hl=en&q=unknown%20melody
cedff49d-9091-4946-b66e-7613e34f8cb2	Vi ??ro sm?? humlor vi...	https://www.google.com/search?hl=en&q=unknown%20melody
f4bbc115-9397-4cac-b26e-920d879e280f	Stympad	https://www.google.com/search?hl=en&q=unknown%20melody
b8197909-74e6-45df-90a9-7cb721b9f9cd	Om jag hade pengar	https://www.google.com/search?hl=en&q=unknown%20melody
d65c0d2f-8987-4607-86fa-159a1b8646f2	Emil I L??nneberga	https://www.google.com/search?hl=en&q=unknown%20melody
d8dc7318-7406-46eb-aaf3-f3763678d2d8	N??r m??nen vandrar	https://www.google.com/search?hl=en&q=unknown%20melody
b79918ba-3548-43ed-adf4-bd6028b0ee83	Hej tomtegubbar	https://www.google.com/search?hl=en&q=unknown%20melody
c188ece8-10a0-4114-aae1-63cb912911d9	Vikingen	https://www.google.com/search?hl=en&q=unknown%20melody
66f41b6e-0030-40ab-8fe7-3caff9f25c5c	H??r kommer Karl-Alfred boy	https://www.google.com/search?hl=en&q=unknown%20melody
171716ee-1c2a-4c90-a113-7c16e0523704	Ju mer vi ??r tillsammans	https://www.google.com/search?hl=en&q=unknown%20melody
01afb0a6-58bd-4d4b-a5b0-5e91fac81e9f	Row your boat	https://www.google.com/search?hl=en&q=unknown%20melody
59ec5a1e-e6ff-49c3-ab1d-b52dbefc6fb4	Sankta Lucia	https://www.google.com/search?hl=en&q=unknown%20melody
8d3dedab-e973-4e93-bacf-833b37f1ea9d	Tre pepparkaksgubbar	https://www.google.com/search?hl=en&q=unknown%20melody
debace28-4097-494b-a124-7f4033013f76	Ritsch ratsch	https://www.google.com/search?hl=en&q=unknown%20melody
edda582a-d56d-4f2b-a75a-7b081326451c	H??rlig ??r jorden	https://www.google.com/search?hl=en&q=unknown%20melody
45cd5adb-df51-410d-8d7f-cc21836f1c68	Broder Jacob	https://www.google.com/search?hl=en&q=unknown%20melody
b6c568ef-3e0a-4fe3-b118-5235da1436c4	When you wish upon a star	https://www.google.com/search?hl=en&q=unknown%20melody
e7373e78-9927-4e00-a846-b820901fe0df	Midnatt r??der	https://www.google.com/search?hl=en&q=unknown%20melody
ab021877-baa5-4e36-a66d-5dbd075ac2ff	Ding dong Merrily on high	https://www.google.com/search?hl=en&q=unknown%20melody
dd8d6a38-6e68-44db-9229-bbde36309b9b	Marselj??sen	https://www.google.com/search?hl=en&q=unknown%20melody
83badd47-50f2-4645-ba59-85cee58b1eb3	Helan g??r	https://www.google.com/search?hl=en&q=unknown%20melody
730976f2-b0b7-4591-b5d7-bf6158cbafa4	Katjuscha (rysk folks??ng)	https://www.google.com/search?hl=en&q=unknown%20melody
ac6de9a1-80a2-482e-9d7b-ac2db613ede7	Bamse	https://www.google.com/search?hl=en&q=unknown%20melody
62dad746-f380-4dfe-9bc3-604849bd3fce	Camptown ladies	https://www.google.com/search?hl=en&q=unknown%20melody
80cd04f5-72c8-416f-8d61-b5235c0dcfb2	Byssan lull	https://www.google.com/search?hl=en&q=unknown%20melody
732f177d-6e73-4907-9082-2b759a715f9c	V??va vadmal	https://www.google.com/search?hl=en&q=unknown%20melody
05682c06-4c8f-4957-87e3-81e25165c417	Man skall ha husvagn	https://www.google.com/search?hl=en&q=unknown%20melody
68a85443-5bb6-4cfa-8ca7-7c48878e9bb1	Daggst??nkta berg	https://www.google.com/search?hl=en&q=unknown%20melody
88288165-2a20-4ed9-af2e-41f27ebd08df	Glada ??nkan	https://www.google.com/search?hl=en&q=unknown%20melody
e452ff3c-ba2d-4a63-92f1-d8284feb6556	G??tt ?? leva - Galenskaparna	https://www.google.com/search?hl=en&q=unknown%20melody
a6518bf6-6639-42b8-83d8-bde2fb027623	Idas sommarvisa	https://www.google.com/search?hl=en&q=unknown%20melody
f6348ce1-d021-4c12-8ea1-cd8583784150	Snickerboa	https://www.google.com/search?hl=en&q=unknown%20melody
7f134aa8-e581-42f1-b014-648433d47929	Med en enkel tulipan	https://www.google.com/search?hl=en&q=unknown%20melody
2e50112b-433e-4776-b401-dcefbfc6b3f1	Lille katt	https://www.google.com/search?hl=en&q=unknown%20melody
5c0dc1b9-7487-44f6-9201-c71aba493f9e	Imse Vimse	https://www.google.com/search?hl=en&q=unknown%20melody
5569dde1-cf8e-40b0-af5a-96e294356600	B??ttre och b??ttre...	https://www.google.com/search?hl=en&q=unknown%20melody
8bbe035b-e42c-4f63-b4d8-e0748f559068	Helan g??r	https://www.google.com/search?hl=en&q=unknown%20melody
1d1889da-0a8d-42e1-89eb-863f63604c57	Du gamla, du fria	https://www.google.com/search?hl=en&q=unknown%20melody
a0da9d92-eabe-4dc8-8aa2-c570832a1f2f	Var n??jd med...	https://www.google.com/search?hl=en&q=unknown%20melody
993bb8e1-aff8-4681-82bc-d68496703c75	You Can Have Her	https://www.google.com/search?hl=en&q=unknown%20melody
67fd4988-a421-44cc-b402-bf319021668d	Vi sk??lar f??r dem vi gillar	https://www.google.com/search?hl=en&q=unknown%20melody
5134cf1c-8a66-45f6-ab0f-9f33f1180fe2	N??r Lillan kom till jorden	https://www.google.com/search?hl=en&q=unknown%20melody
9d20a89b-37f3-455e-a2a0-553c825077b9	T??nk om jag hade en liten apa...	https://www.google.com/search?hl=en&q=unknown%20melody
7b9b0ae7-aca6-4b79-bcb7-effc2fc79462	Jag f??ngade en r??v idag	https://www.google.com/search?hl=en&q=unknown%20melody
f28bdd92-ab5d-4bd5-b89b-24217e28c5b2	Vintern rasat...	https://www.google.com/search?hl=en&q=unknown%20melody
0a1565da-8a1c-41ac-872f-9d4bda821d83	??sa sand	https://www.google.com/search?hl=en&q=unknown%20melody
dd4175ab-5dc0-4377-9b54-5e15a990d90a	L??ngtan till landet	https://www.google.com/search?hl=en&q=unknown%20melody
a14e927a-0610-4cee-bf8b-fbbea9cda86d	Nu ??r det jul i alla hus...	https://www.google.com/search?hl=en&q=unknown%20melody
ee4f8052-8e5d-4014-ae70-3fdff4b8c0a2	Gamla slott och herres??ten	https://www.google.com/search?hl=en&q=unknown%20melody
4b99499a-20d4-4544-9ab4-8ce02b2201e6	Camptown ladies	https://www.google.com/search?hl=en&q=unknown%20melody
e83e6794-6e3d-434e-af9f-e2813af98384	Flottark??rlek	https://www.google.com/search?hl=en&q=unknown%20melody
d9e2c9c0-e8ed-4c8c-8975-10bff2b38f4a	Livet	https://www.google.com/search?hl=en&q=unknown%20melody
0f7c660d-88a0-4679-909d-eb8b844d6fd0	Barndomshemmet	https://www.google.com/search?hl=en&q=unknown%20melody
72996c50-0345-4e44-b615-30345059e3b2	Trampa p?? gasen	https://www.google.com/search?hl=en&q=unknown%20melody
e436881d-14e2-41c2-9a82-951a9e12c523	R??ven raskar	https://www.google.com/search?hl=en&q=unknown%20melody
03fcdc6c-d2a9-4bea-984f-81da519f91ab	Lambeth walk	https://www.google.com/search?hl=en&q=unknown%20melody
e97b806e-04b3-4d1a-a203-78d64ca3d20d	H??r kommer lilla Ludde	https://www.google.com/search?hl=en&q=unknown%20melody
e9c4c8e8-ed2b-480d-83b5-ecb86a82e17d	Bamsevisan	https://www.google.com/search?hl=en&q=unknown%20melody
b6b40f9b-0661-49c1-8ae3-5610fbc61c1b	R??ven raskar ??ver isen	https://www.google.com/search?hl=en&q=unknown%20melody
3b401eac-fb63-446b-9657-5c9593c4f709	When Johnny comes marching home	https://www.google.com/search?hl=en&q=unknown%20melody
be3b1d53-7310-4dc9-85da-4700e99be42a	Vikingen	https://www.google.com/search?hl=en&q=unknown%20melody
de50a8ff-e9d8-4553-be07-b37006fb2651	Mors lilla Olle	https://www.google.com/search?hl=en&q=unknown%20melody
12b107b9-c970-44d2-a27a-0f475436b6bc	F??r jag l??mna n??gra blommor	https://www.google.com/search?hl=en&q=unknown%20melody
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
e91ee5dc-fb2b-4cc1-85cb-da3f70767bc5	LIVET	Unknown	livet	e2840ea8-56c9-41ed-851e-b2e851f131b6	53fcad8b-9c6b-492e-9af6-26ecb593720f	||: Livet ??r h??rligt!  \nTavaritj, v??rt liv ??r h??rligt!  \nVi alla v??ra sm?? bekymmer gl??mmer  \nn??r vi har f??tt en t??r p?? tanden, SK??L!\n\nTag dig en vodka!  \nTavaritj, en liten vodka!  \nGlasen i botten vi tillsammans t??mmer,  \ndet kommer mera efter hand :||\n\nSK??L!	f	842287d4-5e7f-41c8-96d6-5596651998ec
5e0d31c7-2f09-40ae-aeb4-a0e6c5f82d29	L??NGT NER I SM??LAND	Unknown	l??ngt_ner_i_sm??land	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	L??ngt ner i Sm??land d??r rider sj??lva dj??vulen med laddade pistoler och\nknallande gev??r. Och alla sm?? dj??vlar de spela p?? fioler, och sj??lva\nfader Satan han spelar handklaver. Hurra f??r Svealand, hurra f??r\nG??taland och hurra f??r potatisland som ger oss br??nnevin!	f	842287d4-5e7f-41c8-96d6-5596651998ec
42b0dfa8-afa0-4673-95eb-d9eb666e83ba	DA'N D??RP??	Unknown	da'n_d??rp??	f0242e6f-9999-437d-ba7b-43d37350932f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: B??ttre och b??ttre dag f??r dag\n\nS??mre och s??mre da\\'n d??rp??.\n\nS??g mig, vad gjorde jag ig??r?\n\nM??nga namn f??r hur man m??r se\\'n\n\nb??de bilmek, betongkeps och ??gren\n\nTag, en\n\nakvavitamin\n\noch g?? p?? f??r full maskin.\n\nAj, aj, aj, aj, aj, aj, aj\n\nmen jag m??r s??mre och s??mre da\\'n d??rp??!	f	842287d4-5e7f-41c8-96d6-5596651998ec
47fded4e-3341-4698-bb85-bd11097185fd	I MEDELHAVET	Unknown	i_medelhavet	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Svenska:*\n\nI Medelhavet sardiner simmar, apu, apu, apu apu\n\nMen i mitt hj??rta d??r simmar du, apu, apu \\....\n\n*Engelska:*\n\nIn Middleocean sardines are swimming, apu\\...\\...\n\nBut in my hart are swimming you, apu\\.....\n\n*Tyska:*\n\nIn Mittelmehre Sardinen schwimmen, apu\\...\n\nAber in mein Herz da schwimmst ja Du, apu\\...\n\n*Ryska:*\n\nI Medelhavski sardinski simmski, apusskiduski, apusskidu\n\nMen i mitt hj??rtski d??r simmski dusski, apuskiduski\\.....\n\n*Norska:*\n\nI Medelhavet sm?? t??rsker sv??mme, apu, apu, apu, apu\n\nMen i min blopump d??r plasker du apu, apu\\...\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
a0571fc4-40e6-4254-9eba-562c8869cdeb	VEM KAN RAGLA	Unknown	vem_kan_ragla	1d7de628-fff1-4b5e-81df-894f1e73c264	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Vem kan segla...\n\nVem kan ragla f??r utan vin\n\nVem ??r nykter om v??ren\n\nVem kan skilja p?? B??sk och Gin\n\nUtan att smaka p?? t??ren?\n\nJag kan ragla f??r utan vin\n\n?? visst var jag nykter om v??ren\n\nMen ej skilja p?? B??sk och Gin\n\nEfter den elfte t??ren!	f	842287d4-5e7f-41c8-96d6-5596651998ec
c6daa05f-142f-43c8-91e8-fe07cb54b124	MORGONDAGENS VISA	Unknown	morgondagens_visa	0fba4229-b88a-44f0-a549-2f4d3e1fadd1	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Sj??sala vals\n\nHuvudet vi lyfter med ett st??n ur v??r s??ng,\n\ntv??ttmaskinen i buken, kanoner i huvudet.\n\nTungan som en plyschsoffa och yrseln i sv??ng,\n\ni ??ngesten vi svettas kom sjung din refr??ng:\n\nVarf??r finns det aldrig n??n nykter liten fest?\n\nO, l??t oss somna om s?? vi slipper denna pest -\n\nmen se s?? m??nga supar vi redan kastat upp i s??ngen:\n\nRenat och Sk??ne, Svart Vinb??r och fager B??sk!	f	842287d4-5e7f-41c8-96d6-5596651998ec
323d2bfe-2bec-4199-8470-61c0de18d547	O, J??VLA NATT	Unknown	o,_j??vla_natt	a1f327cc-c2a5-4820-a748-c2162cd3402c	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: O helga natt\n\nO, j??vla natt, jag har s?? ont i pannan\n\nOch b??de vinet och ??len ??r slut.\n\nI min spegel ser jag n??gon annan,\n\nO, stackars m??nniska hur du ser ut.\n\nMitt h??r ??r stripigt, ??gonen ??r r??da,\n\nOm n??gon st??r mig l??r de nog f??rbl??da.\n\n??h, vilket mord! Vem bankar p?? min port?\n\nJo, Livets Ord! Jag spyr p?? deras skor.\n\nO, j??vla natt! Hur kunde jag bli s?? full?	f	842287d4-5e7f-41c8-96d6-5596651998ec
9cf7064a-d830-4a62-8d5e-2ebae2e1765e	FETA FRANSYSKOR	Unknown	feta_fransyskor	8c8b4bc4-1440-4c7d-be1f-057626834780	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Marsche militaire av Franz Schubert\n\n(Tomtarnas vaktparad)\n\nFeta fransyskor som svettas om f??tterna\n\nde trampar druvor som sedan skall j??sas till vin\n\nTranspirationen viktig e' ty den ger fin bouquet\n\nV??rtor och svampar f??ljer me', men vad g??r v??l de'?\n\nF??r\\...\n\nVi vill ha vin, vill ha vin, vill ha mera vin\n\n??ven om f??ljderna blir att vi m?? lida pin\n\nFlickor: Flaskan och glaset g??tt i sin\n\nPojkar: Hit med vin, mera vin\n\nFlickor: Tror ni att vi ??r fyllesvin?\n\nPojkar: JA! (Fast st??rre)	f	842287d4-5e7f-41c8-96d6-5596651998ec
d5fa1ab1-d501-469d-93dd-0db0fbcf420c	NUBBEN WALK	Unknown	nubben_walk	650430c7-d7e0-48e5-95df-70074bb5cc6e	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Lambeth walk\n\nNubbar man f??r mycket blir livet kort.\n\nNubbar man f??r lite blir livet torrt.\n\nNej, g??r som jag:\n\nNubba lite varje dag!	f	842287d4-5e7f-41c8-96d6-5596651998ec
523ef7d3-e651-408f-ad15-bf84675b312a	EN G??NG I M??NA'N	Unknown	en_g??ng_i_m??na'n	c9ba108f-f09c-43df-8a6b-93aba0dd29c5	53fcad8b-9c6b-492e-9af6-26ecb593720f	En g??ng i m??na'n ??r m??nen full  \nAldrig jag sett honom ramla omkull  \nStum av beundran hur mycket han t??l  \nH??jer jag glaset och utbringar sk??l!\n\nH??jen nu glasen och dricken ur  \nNu, k??ra br??der, st??r kvarten i tur  \nNubben den giver oss ny energi  \nS??kert den minskar v??rt livs entropi	f	842287d4-5e7f-41c8-96d6-5596651998ec
073139e2-8682-4e8c-b86f-0e1a84bb1597	GE OSS VIN	Unknown	ge_oss_vin	af5d2c6f-0f69-4289-af33-ba3d85d3d424	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Uti v??r hage\n\nV??ra sm?? gossar h??r flickornas b??n:\n\nkom ge oss vin!\n\nDen drycken i glasen g??r kv??llen s?? sk??n.\n\n//: Kom r??da och vita viner, kom sj??larnas vitaminer, kom fluidum\nBacchi, kom ge oss vin! ://	f	842287d4-5e7f-41c8-96d6-5596651998ec
8b73a7b3-1cc1-42da-81b3-c57ef21f73df	OUR FAMILY	Unknown	our_family	e7d2dacc-7ed1-4dc9-a793-8b1efcf41d03	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: My Bonnie*\n\nMy father makes counterfeit money,\\\nMy mother brews synthetic gin.\\\nMy sister sells kisses to sailors,\\\nBy Jove how the money rolls in!.\n\n/: By Jove, By Jove, By Jove how the money??\\\n??rolls in, rolls in! :/\n\nMy brother is a slum missionary,\\\nsaving young maidens from sin.\\\nHe\\'ll save you a blond for a shilling,\\\nBy Jove how the money rolls in\\'??\n\nBy Jove \\...\n\nMy aunt keeps a girl\\'s seminary,\\\nteaching young girls to begin.\\\nShe doesn\\'t say where they\\'re to finish,\\\nBy Jove how the money rolls in!??\n\nBy Jove \\...\n\nMy father has spent all his money,\\\nMy mother has drunk all her gin.\\\nMy sister has sold all her kisses.\\\nand no more money rolls in!??\\\nBy Jove\\....	f	842287d4-5e7f-41c8-96d6-5596651998ec
254be862-4804-4fe9-bd75-d4b72db4a3df	EN CHALMERIST HAN KAN	Unknown	en_chalmerist_han_kan	ae592868-6fb3-45e3-a977-0e1d4d5a124e	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: refr. Av tre trallande j??ntor\n\nEn Chalmerist han kan\n\nTa supen som en man\n\nS?? glupen den supen\n\nI strupen f??rsvann\n\nOch mera vill han ha\n\nKan ej f??r mycket ta\n\nEn Chalmerist blir aldrig full\n\nNej, han blir bara gla'!\n\n*Fritt efter "En v??rmlandsp??jk han kan"*	f	842287d4-5e7f-41c8-96d6-5596651998ec
507a31d2-a300-4eb0-b2be-027eaed5133a	ROSITA	Unknown	rosita	cedefb22-3b0c-4174-a0da-4fa9605f5953	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Fritjof och Carmencita\n\nGin-tonicen, en liten grogg f??rutan Cola.\\\nDen hittar du intill dig n??r du ??nskar sk??la.\\\nN??stan p?? kanten p?? en bricka hos tanten,\\\nsom i baren har blandat och skapat denna dryck.\\\nDit kom jag g??ende en kv??ll, mest av en nyck,\\\nf??r jag ville skoja till det.\n\nTv??tusen-??ttahundra sp??nn\\\nkostade groggarna och sedan gick jag hem.\\\nD??r p?? diskb??nken i k??ket,\\\nden som aldrig gjorts ren,\\\nstod en bed??rande flaska med Rosita.\\\nEn som om ??tta sekel j??mnt\\\nkommer att omn??mnas som f??rsta klassens sk??mt.\\\nmen vad brydde jag v??l mig,\\\nd??r jag stod barskrapad och go\\'\\\nf??r jag ville skoja till det.	f	842287d4-5e7f-41c8-96d6-5596651998ec
f3faa047-7543-4ab6-86ba-d8414085e1fb	BAKFYLLES??NG	Unknown	bakfylles??ng	7d11c773-75e2-40d9-bc15-5c892fe79683	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: ??nglamark\n\nHuvudv??rk, svettningar, darrningar, diarr??.\n\nGe mig en isbl??sa och en gul Jaffa.\n\nB-vitaminer, apelsinjuice och lite te.\n\nKan de bakfyllan m??h??nda bortf??sa.\n\nFesten var d??lig, men nattsexan blev f??r bra:\n\nJanson\\'s temptation och br??nnvinsturnering.\n\nBorta var jag d?? i g??r kv??ll men mest i dag.\n\nNo concentration, men mycket vommering.	f	842287d4-5e7f-41c8-96d6-5596651998ec
b19f87eb-643f-4e1d-ba04-59893ec78837	PILSNERDRICKAREN	Unknown	pilsnerdrickaren	dda2d3b0-1ed4-4079-aeb8-8f2ccc23e00d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: En sockerbagare\n\nEn pilsnerdrickare h??r bor I staden,\n\nHan dricker pilsner mest hela dagen.\n\nHan dricker gr??na, han dricker bl??,\n\nhan dricker n??gra med renat p??.\n\nOch i hans f??nster h??nga tomma glasen\n\nOch alla burkarna fr??n kalasen.\n\nOch ??r han nykter, s?? kan han g??\n\nNer till butiken och fylla p??!	f	842287d4-5e7f-41c8-96d6-5596651998ec
698add37-ed2c-4e77-8067-30b319174686	INVERS APTIT	Unknown	invers_aptit	36965f53-2c74-4c42-b96f-d8485b040b20	53fcad8b-9c6b-492e-9af6-26ecb593720f	Nu fyllas m??nga magar sm??  \nav iskall renad sprit.  \nMen n??gra kastar ??ter upp,  \nDet ??r invers aptit.	f	842287d4-5e7f-41c8-96d6-5596651998ec
8ba85833-c284-4d84-ba25-f11c1ca10341	F??RSTA SNAPSEN	Unknown	f??rsta_snapsen	f88aaa46-da41-485e-a38c-208c5d0e5122	53fcad8b-9c6b-492e-9af6-26ecb593720f	F??rsta snapsen heter g??ken.  \nF??rsta snapsen heter g??ken.  \nF??r jag lov, ja f??r jag lov  \natt byta byxor med fr??ken?\n\nAndra snapsen den var v??rre,  \nandra snapsen den var v??rre.  \nF??r jag lov, f??r jag lov  \natt byta byxor me\\' min herre\n\nMina byxor ??r himmelsbl??  \nmen med dina ??r det dock si och s??.  \nF??r jag lov, f??r jag lov,  \natt byta byxor med g??ken.	f	842287d4-5e7f-41c8-96d6-5596651998ec
5f52a584-13d6-41ba-ad05-36dc6ee31b77	SVEPSK??L	Unknown	svepsk??l	26ee5e7f-a5db-4bc0-ae81-732f58ce43fb	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Kamomilla stad\n\nAll alkohol ??r bra f??r hyn\n\nden fr??mjar ansiktsf??rgen\n\noch ger oss skinn som rosentryn,\n\ndet k??nns r??tt in i m??rgen.\n\nS?? det ??r blott av h??lsosk??l,\n\nvi dricker den f??r ve och v??l.\n\nF??r annars s?? dricker vi inte n??n sprit,\n\nvarken Sk??ne, Gauffin eller Akvavit.\n\nEn liten klar ??r f??r din kropp,\n\nen k??rleksfull behandling.\n\nD?? genomg??r ditt blodomlopp\n\nen effektiv f??rvandling.\n\nDin kropp blir kall som h??rdat st??l\n\nmed hj??lp av smaksatt etanol.\n\nVi ser det blott som medicinsubstitut\n\nn??r vi dricker Svartvinb??rs och Absolut.	f	842287d4-5e7f-41c8-96d6-5596651998ec
5caaf164-3f4a-4715-a869-ef6ad92656e9	VINVISA	Unknown	vinvisa	b3332fb7-bb1b-483b-8b42-16ece9b2a0f6	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Vila vid denna k??lla\n\nMosel, Valpolicella,\n\nMendozo Tinto vi upph??lla.\n\nLacrima Christo rosso\n\noch en nyss ??ppnad Vin Rouge d'Algerie.\n\nMavrud, Clarete Fino\n\noch Bordeaux Blanc, Coq Rouge och Vino\n\nTinto, Ockfener Bockstein,\n\nPetit Chablis, men bara ett par glas.\n\nChateaux Margeaux Pardor!\n\nMouton Rotschild och Carneval Perlerose!\n\nVi blir canon\\...\n\nGossar! Vi vill best??lla\n\nen C6tes-du-Rhone f??r tio och tju'fem.\n\nCorno (con bocca chiusa)\n\nOm lagret r??cker ??n!	f	842287d4-5e7f-41c8-96d6-5596651998ec
dbcc7bcb-8e10-490c-a511-4c59b63f7e7c	LILLE MATS	Unknown	lille_mats	66b4bd76-c249-424f-b80a-a0ca989a1346	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Lille Katt*\n\nLille Mats, lille Mats,\n\ntrivdes ej i sitt palats\n\nhan tog sats, han tog sats\n\noch hoppa' till en annan plats\n\nLille Per, Lille Per,\n\ntrivdes inte heller d??r\n\nhan tog sats, han tog sats\n\noch hoppa' rakt p?? lille Mats	f	842287d4-5e7f-41c8-96d6-5596651998ec
f675093b-e284-4e96-a244-8d84ebbd74b7	**BYSSAN LULL**	Unknown	**byssan_lull**	38af3380-6c93-4106-b935-54f6d74087fb	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Byssan lull\n\n//:Byssan lull utav vinet blir man full,\n\noch slipsen man doppar i sm??ret://\n\nJa, n??san den blir r??d,\n\nOch ??gonen f??r gl??d,\n\nOch tusan s?? bra blir hum??ret.	f	842287d4-5e7f-41c8-96d6-5596651998ec
d5ad0b1f-1756-4df7-a24b-e498c7ad27fb	KALLA KALLS??NGER	Unknown	kalla_kalls??nger	ec2da08f-5cbc-43ff-af89-5d3ccddfd8f7	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Kalle p?? sp??ngen*\n\nVad ??r det som g??r att du fryser d??r bak?\n\nJo, kalla, kalla, kalla, kalla kalls??nger.\n\nVad ??r det som g??r att din snopp h??nger slak?\n\nJo, kalla, kalla, kalla, kalla kalls??nger.\n\nTrots en excellent, kompetent, attrahent,\n\nman mot k??rleksnycker f??rblir resistent.\n\nVad ??r det som g??r att man blir impotent?\n\nJo, kalla. Hur kalla?\n\nJ??vligt kalla. Hur kalla?\n\nJo, kalla kalla kalla kalla kalls??nger.\n\n*(Sjunges l??mpligtvis som ackompanjemang till Quarls snapsvisa)*	f	842287d4-5e7f-41c8-96d6-5596651998ec
f1e81a6d-8b4c-4793-a2e5-66d131c4eaba	OP RIVER	Unknown	op_river	5e9731e1-3115-49e1-b51d-8bbf466c11f2	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Old man river*\n\nOP river, ja OP river,\n\nVar g??ng jag lenat\n\nMin hals med renat\n\nJag sagt med iver,\n\nAtt OP river,\n\nL??ngt ner.\n\nM??ngen gl??des,\n\nN??r han f??r s??des,\n\nOch fattighjonet,\n\nSyns le mot kronet,\n\nMen faktum bliver,\n\nAtt OP river,\n\nL??ngt ner.	f	842287d4-5e7f-41c8-96d6-5596651998ec
51ef4985-3a28-4f39-9ba3-7ed3fab41210	BORDEAUX, BORDEAUX	Unknown	bordeaux,_bordeaux	a79d19bc-7985-4308-8779-dbd0f2a930f7	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: I sommarens soliga dagar\n\nJag minns ??n idag hur min fader,\n\nkom hem ifr??n staden s?? glader.\n\nHan rada' upp flaskor i rader\n\noch sade n??jd som s??:\n\nBordeaux, Bordeaux!\n\nHan drack ett glas, kom i extas, och sedan blev det stort kalas.\n\nOch vi sm?? glin, ja vi drack vin, som f??rsta klassens fyllesvin\n\noch vi dansade runt d??r p?? bordet\n\noch skrek s?? vi blev bl??:\n\nBordeaux, Bordeaux	f	842287d4-5e7f-41c8-96d6-5596651998ec
694d881b-d0db-49b1-9f4f-777638181776	B??R UT MIG I SN??N	Unknown	b??r_ut_mig_i_sn??n	b5fddba9-c171-4464-8ac9-0b2ae489008f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: B??r ner mig till sj??n\n\n/: B??r ut mig i sn??n, b??r ut mig i sn??n\n\nJag k??nner att jag m??ste spy :/\n\nOch n??r jag kastat upp\n\ns?? f??r du torka opp\n\noch n??r du torkat upp\n\ns?? kan jag spy igen.	f	842287d4-5e7f-41c8-96d6-5596651998ec
038498ab-5d7b-4d5c-bccd-427635b7501e	LIFE	Unknown	life	0b133575-dec2-4305-be53-2119470bd449	53fcad8b-9c6b-492e-9af6-26ecb593720f	Life is a pleasure!  \nTovarisch, a great big pleasure!  \nAll of our troubles are reduced to zero  \nwhen we have got a drop to wet our gum.\n\nLet\\'s have a vodka!  \nTovarisch, a little vodka!  \nEmpty your goblet like a Viking hero;  \nthere will be many more to come  \n\\-- Hey!	f	842287d4-5e7f-41c8-96d6-5596651998ec
ea60b122-5aa6-4de7-a71a-852bf6caea0f	SUDDA SUDDA	Unknown	sudda_sudda	a61882a9-da03-4d43-baaf-62a5268083d2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Sudda bort din sura min\n\nSudda, sudda,sudda, sudda bort din sura min.\n\nMed fyra j??ttestora bamseklunkar ??delt vin.\n\nMunnen den skall skratta och va' gla'!\n\nF??r att den ska bli som den ska va'\n\nVad h??ller du d?? bak det dolda flinet?\n\nJo vinet, som suddar, suddar bort din sura min.	f	842287d4-5e7f-41c8-96d6-5596651998ec
2f412b0a-0436-4d98-b615-58b16921c8ba	PELLEJ??NS	Unknown	pellej??ns	07142a23-153d-453a-8d39-91277ede921d	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Jag har en gammal moster*\n\nDet var en g??ng en daggmask,\\\nsom hette Pellej??ns\\\nHan var s?? r??dd f??r skator,\\\nhan var s?? r??dd f??r h??ns.\\\nHan var s?? r??dd f??r metare och letare med burk.\\\nOch dom som satte mask p?? krok,\\\ndom kalla\\' han f??r skurk.\n\nEn dag s?? t??nkte masken\\\nnu borrar jag mig ner,\\\nen meter under marken\\\ns?? syns jag inte mer.\\\nI tr??dg??r\\'n gick metare och letare och h??ns\\\ndom hitta massa maskar,\\\nmen inte Pellej??ns.	f	842287d4-5e7f-41c8-96d6-5596651998ec
46cd7f85-18a4-4d7c-a875-10bdc4b60972	MUNKAR	Unknown	munkar	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag vill ha munkar munkar munkar med h??l i,\\\nstora feta munkar med h??l i.\\\nN??r jag kommer hem till dej,\\\ns?? vill jag inte ha n??n leverpastej.\n\nJag vill ha nunnor nunnor nunnor med h??l i,\\\nstora feta nunnor med h??l i.\\\nN??r jag kommer hem till dej,\\\ns?? vill jag faktiskt ha en annan tjej.\n\nJag vill ha kramar kramar kramar med tryck i,\\\nstora mjuka kramar med tryck i.\\\nN??r jag kommer hem till dej,\\\ns?? vill jag inte ha n??n leverpastej.\n\nJag vill ha kyssar kyssar kyssar med sug i,\\\nstora bl??ta kyssar med sug i.\\\nN??r jag kommer hem till dej,\\\ns?? vill jag inte ha n??n leverpastej.	f	842287d4-5e7f-41c8-96d6-5596651998ec
a760577d-755a-47f4-9d2c-a45c31a860c5	PUNSCHEN KOMMER VARM	Unknown	punschen_kommer_varm	bf4527d6-f3ca-4524-bb64-7352feebe611	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Glada ??nkan\n\nPunschen kommer, punschen kommer,\n\nljuv och varm.\n\nVettet svinner, droppen rinner\n\nner i tarm.\n\nSk??l f??r glada minnen,\n\ndem vi snart ej ha,\n\nd?? ett par glas simmig punsch\n\nvi hunnit ta..	f	842287d4-5e7f-41c8-96d6-5596651998ec
30b3267b-6464-49fc-8fb9-15d49d6e0e97	KAFFEVISA	Unknown	kaffevisa	7d6d43dc-ec09-40a9-b06d-bbcb55f646ab	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Du ska f?? min gamla cykel*\n\nKaffe, kaffe, kaffe,\n\nkonjak och lik??r,\n\nger ??t alla h??r ett mycket gott hum??r.\n\nP?? det ska ni ge er katten,\n\nvi skall sitta hela natten,\n\ndricka kaffe, kaffe, konjak och lik??r	f	842287d4-5e7f-41c8-96d6-5596651998ec
442e8541-a81d-4442-af93-d9c411d01937	UTVANDRAREN	Unknown	utvandraren	e636e963-b79e-4034-ae43-3be6bbedb742	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: N??r m??nen vandrar...\n\nJag t??nker s??lja min dromedar.\n\nJag t??nker flytta till norden.\n\nVem vill va' bosatt uti ett land\n\nd??r man f??r ligga vid borden?\n\nNu konverterar jag, h??r p?? snabben!\n\nJag vill ha akvavit till kebaben!\n\nVar ingen mes.\n\nFyll upp min fez!\n\n*Lundakarnevalen 1998*	f	842287d4-5e7f-41c8-96d6-5596651998ec
321aa5a3-9ae9-4101-8491-24689dcdb1a2	DAMSUP??VISA	Unknown	damsup??visa	86030790-4b79-4a71-b26b-56a0570b4cbd	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Schottis p?? Valhall\n\nUpp och hoppa kvinns,\n\nvisa att vi finns.\n\nL??t oss storma sektionen i kv??ll!\n\nKl??m nu alla i\n\nmed stor frenesi,\n\nvi ska k??mpa och segern blir s??ll.\n\nTag en redig sup\n\nut ur b??gar'n djup.\n\nEtt-tv??-tre ned i magen den h??ll!\n\nAlla ska nu f?? se\n\natt vi duger n??'t te',\n\nVi ska storma sektionen i kv??ll!	f	842287d4-5e7f-41c8-96d6-5596651998ec
f0274320-f40e-4016-88ed-b03d527c2fe6	JAG SER NI KR??KAR	Unknown	jag_ser_ni_kr??kar	3c593ffe-87d1-4b3a-84a0-bc437c585996	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Ja se det sn??ar\n\nJag ser ni kr??kar, jag ser ni kr??kar,\n\ndet var v??l trevligt. Hurra!\n\nNu blir ni fulla, nu blir ni fulla,\n\nmen se det blir inte jag.\n\nF??r jag har huve't p?? skaft\n\noch jag dricker blott saft,\n\nf??r jag vill minnas den tiden\n\njag med er har haft.	f	842287d4-5e7f-41c8-96d6-5596651998ec
158de0da-5d25-4aa1-9382-74c0cbeb0681	V??DJAN TILL PUNSCHEN	Unknown	v??djan_till_punschen	fd754077-88bd-44f5-bc7c-54f7080ec055	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Sov du lilla videung\n\nKom nu lilla punschen min,\n\nf??lj nu efter supen.\n\nSnart s?? ska du ??ka in,\n\nner igenom strupen,\n\ntill mitt stora magpalats,\n\nd??r det finns s?? mycket plats.\n\nKom nu lilla punschen,\n\nf??lj nu efter supen.	f	842287d4-5e7f-41c8-96d6-5596651998ec
f6535aa6-22ed-4dc1-9587-018f9bf61ee5	NUBBEN GOA	Unknown	nubben_goa	3fefad04-935e-4e33-8846-5d02748a3265	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Gubben Noak\n\nNubben goa, nubben goa\n\n??r en hederssup.\n\nUti alko-h??let,\n\nt??m den om du t??l'et.\n\nNubben goa, nubben goa\n\n??r en hederssup.	f	842287d4-5e7f-41c8-96d6-5596651998ec
ae572e33-b868-4758-9e95-5a092af65c77	KISSEMISS	G??ran Svensson	kissemiss	7f70eb14-75d1-46f8-824b-32e5ca5a1d44	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Du skall f?? min gamla...*\n\nT??nk s?? trevligt att ni kunde komma hit\n\nL??t oss ta en liten jamare med flit\n\nBlir vi sedan l??tt i hatten\n\nJa d?? kan man ge sig katten\n\nP?? att jamaren vi tatt den var av sprit.\n\nS?? sjung mjau, mjau kissemisse mjau.\n\nJa, sjung mjau, mjau kissemisse mjau.\n\nOm vi jamar hela natten\n\nDesto gladare blir skratten\n\nEfter slatten f??r rabatten en visit.\n\n*S??ngarstriden i Lund, 1990*\n\n*Text: G??ran Svensson*	f	842287d4-5e7f-41c8-96d6-5596651998ec
16635ea5-add3-44c4-8f82-25e1b94e2424	VI ??R IT	Henrik Jernevad och Tomas Forsman, IT2002	vi_??r_it	a8fddde8-5388-4bbb-9aaf-5f522d14e2f8	53fcad8b-9c6b-492e-9af6-26ecb593720f	Vi pluggar hela dan, festar s??nder stan  \nr??jer loss, g??r G??teborg os??kert  \nn??r vi laddar upp  \nblir det gasque f??rst??s  \nalla vill va med n??r IT g??r loss\n\nVi ??r, vi ??r, IT!  \nVi ??r, vi ??r, IT!\n\nSenare n??tt ??r n??r vi tj??nar fett  \nkommer vi att vara de som g??r allt r??tt  \noch n??r allt ??r trist  \nkommer IT s?? friskt  \noch ??ver hela v??rlden vi styr med list\n\nVi ??r, vi ??r, IT!  \nVi ??r, vi ??r, IT!\n\nSom gamlingar vi g??r med rullator och b??r  \nser p?? allt p?? det s??tt som vi f??rst??r  \nsom noll och ett  \nallting blir l??tt  \nvi visar de unga hur man g??r n??tt r??tt\n\nVi ??r, vi ??r, IT!  \nVi ??r, vi ??r, IT!\n\nVi ??r, vi ??r, IT!  \nVi ??r, vi ??r, IT!	f	842287d4-5e7f-41c8-96d6-5596651998ec
8ca56b7b-8555-423c-b283-15e7ebbdf08a	SIFFERVISAN	Unknown	siffervisan	1c50b4dd-910d-4341-bfaf-0ae4ee19d9a5	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Ritsch, ratsch, filibom\\...*\n\n1, 2, 75, 6, 7, 75, 6, 7, 75, 6, 7\n\n1, 2, 75, 6, 7, 75, 6, 7, 73\n\n107, 103, 102, 101, 627\n\n19, 18, 17, 16, 15, 14, 13, 20\n\n11, 10, 9, 8, ta s?? supen nu\n\nSCH??????L!!!	f	842287d4-5e7f-41c8-96d6-5596651998ec
b2bbd1e0-b10e-42c3-be1e-d30410fef90c	PORTOS VISA	Unknown	portos_visa	94696550-e89f-48ff-a398-686b3d8bb4f9	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag vill ut och gasqua,\n\nvar faan ??r min flaska,\n\nvem i helvete stal min butelj?\n\nSkall t??rsten mig tvinga,\n\nen TT b??rja svinga,\n\nnej f??r fan bara blunda och sv??lj.\n\nVilken sm??rja, f??r jag sp??rja,\n\nvem f??r fan tror att jag ??r en ??lg.\n\nTill England vi rider\n\noch sedan vad det lider,\n\ntr??ffar vi v??lan p?? n??gon pub.\n\nOch d??r skall vi festa,\n\nblott dricka av det b??sta\n\nutav whisky och portvin,\n\njag t??nker g?? h??rt in\n\nf??r att prova p?? rubb och stubb.	f	842287d4-5e7f-41c8-96d6-5596651998ec
e4c49d37-a137-47fc-ba6b-2ff6021fd106	NOLLBRICKS-AVTAGNINGSRAMSA	NollKIT -03	nollbricks-avtagningsramsa	fcb5b7b3-e422-4c81-bce8-8ec06dc4ce42	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Armen i vinkel (ramsa)*\n\n"Handen p?? brickan\n\noch brickan i skyn\n\nS?? var vi klara\n\nAtt ettor f?? vara\n\nV??rt m??l har vi n??tt\n\nBrickan den ska bort!"\n\n*Text: NollKIT -03*	f	842287d4-5e7f-41c8-96d6-5596651998ec
0c294a70-e75e-4823-bdca-b7ce4625d006	IT: s PUB	P.R.I.T. -04	it:_s_pub	113b741a-1a30-476b-bb15-5d875afd29df	53fcad8b-9c6b-492e-9af6-26ecb593720f	Vill du ut och festa  \nOch sen nya saker testa  \nVill du ha det roligt  \nKom till IT: s pub ida'!\n\nJa, till IT ska vi sticka  \nF??r d??r finns mat, musik och dricka  \nH??r samlas det b??sta folket  \nJa, precis som det ska va'!\n\nKom nu allihopa  \nNu ska vi glada s??nger ropa  \nDansa, flirta, sjunga  \nVart annars vill man va'?\n\nJa, till IT ska vi sticka...	f	842287d4-5e7f-41c8-96d6-5596651998ec
3f4efe72-5a01-49a6-81a0-77c9a71b2afc	DAMERNAS SK??L	Unknown	damernas_sk??l	824478fe-360b-4152-a78a-e163353f9766	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Marselj??sen\n\nNu ska vi h??ja v??ra kalla glas\n\noch dricka sk??len f??r v??r dam.\n\nHon ??r v??rd att st??ndigt besjungas,\n\ndyrkas, s??ttas p?? piedestal.\n\nHon ??r medelpunkt i v??ra liv,\n\nv??r fr??msta k??lla till gl??dje.\n\nVi hyllar med s??ng\n\noch h??jer v??rt glas\n\noch dricker kvinnans sk??l!	f	842287d4-5e7f-41c8-96d6-5596651998ec
165778d9-c9da-4bf3-a937-de2b8208cf67	F-ARENS MORGON	Unknown	f-arens_morgon	85a96098-bd67-4165-8d00-f916766fded2	53fcad8b-9c6b-492e-9af6-26ecb593720f	F-aren han v??ltrar med ett br??l ur sin s??ng,\n\nhuvudet det dunkar och tungan k??nns torr och stel.\n\nSen tv??rs ??ver golvet fram till sk??pet han g??r,\n\nflaskan kommer fram och han s??ger gut??r.\n\nTurkosa lilla Smurfen ack vore jag som du,\n\nDu bangar aldrig ur och du festar ju f??r sju,\n\nDu pallar f??r det mesta,\n\ndet ??r n??t hemskt vad du kan festa.\n\nAj, vad det gungar, var fan finns det magnecyl?!!\n\n*(Plockad ur F-arnas s??ngh??fte, n??stan utan modifikation)*	f	842287d4-5e7f-41c8-96d6-5596651998ec
af69583b-74a6-46a1-bc7b-d49f6f7e9055	RATATATA	Unknown	ratatata	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Att dricka br??nnvin ??r en sed som ingen har oss l??rt.\n\nFr??n b??rjan vi ej kunde, men det var blott tempor??rt.\n\nS?? l??rde vi oss sj??lva, och nog var det v??rt besv??r't.\n\nTutilurenbom tutilurenpang, nog var det v??rt besv??r't.\n\n//:Rattatta, s?? tar vi oss en tuting. Rattatta, med mycket br??nnvin i.\nRattataa, rattataa, dricka br??nnvin gillar ja', f??r jag blir s?? glad\nida'!://	f	842287d4-5e7f-41c8-96d6-5596651998ec
ea55efc8-653f-45f8-ae0b-df07fe8d2687	MERA BR??NNVIN	Unknown	mera_br??nnvin	721b0c12-9336-474d-99b9-0161b591f0c7	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mera br??nnvin i glasen\n\nmera glas p?? v??rt bord\n\nmera bord p?? kalasen\n\nmer kalas p?? v??r jord\n\nMera jordar med m??ne\n\nmera m??nar i mars\n\nmera marscher till Sk??ne\n\nmera Sk??ne, gu-bevars, bevars, bevars	f	842287d4-5e7f-41c8-96d6-5596651998ec
841c37c1-d2e4-4e1a-96a1-40953708c19e	USCH USCH	Unknown	usch_usch	15726ba3-cd80-445d-8971-ecaa3f820eee	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: It's a long way to...\n\nDet ??r en l??ng v??g, f??r lilla supen,\n\nja, en l??ng v??g att g??.\n\nDet br??nner illa i hela strupen\n\noch det kittlar i var t??.\n\n??h det susar upp i knoppen,\n\nvarje droppe k??nns som tv??.\n\n//:Det s??ger usch, usch, usch i hela kroppen, men ??r h??rligt ??nd??!://\n\n*Ur Chalmersspexet Nils Dacke, 1977*	f	842287d4-5e7f-41c8-96d6-5596651998ec
2795efc1-2419-4a3e-83de-e5730b6f7681	JAG ??R EN LITEN UNDULAT	Unknown	jag_??r_en_liten_undulat	e26a3f98-b079-40a7-8878-0df9f4a8dc19	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Med en enkel tulipan\n\nJag ??r en liten undulat,\n\nsom f??r s?? d??ligt med mat.\n\nF??r dom jag bor hos,\n\nja dom jag bor hos,\n\ndom ??r s?? sn??la.\n\nDom ger mig sill varenda dag,\n\nmen det vill jag inte ha\n\njag vill ha r??dvin,\n\njag vill ha r??dvin\n\noch gorgonzola .	f	842287d4-5e7f-41c8-96d6-5596651998ec
168b18e3-06a7-4e81-bdd6-ce46feb2b15f	MORS LILLE OLLE	Unknown	mors_lille_olle	cecc9545-9742-4b79-ba1f-44155f009211	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mors lilla Olle,  \np?? krogen satt  \nrosor p?? kinden men  \nblicken var matt  \nL??pparna sm??,  \nliksom n??san var bl??  \nbara jag kunde  \ns?? skulle jag g??.	f	842287d4-5e7f-41c8-96d6-5596651998ec
6e9beebe-4df9-4f15-8b9f-e9ddaf043012	H??RJAREVISAN	Unknown	h??rjarevisan	c84cdaaf-a722-43ea-9401-0917ee6a0f5f	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: G??rdebyl??ten*\n\nLiksom v??ra f??der vikingarna i Norden\n\ndrar vi riket runt och super oss under borden.\n\nBr??nnvinet har blivit ett elixir f??r kropp s??v??l som sj??l.\n\nK??nner du dig liten och ynklig p?? jorden\n\nv??xer du med supen och blir stor uti orden,\n\nsl??r dig f??r ditt h??riga br??st och blir en karl fr??n h??r till h??l.\n\nJa, nu skall vi ut och h??rja, supa och sl??ss och sv??rja,\n\nbr??nna r??da stugor, sl?? sm?? barn och s??ga fula ord\n\nMed blod ska vi st??ppen f??rga.\n\nNu ??nteligen l??r jag\n\nkunna dra n??n verklig nytta\n\nav min Hermodskurs i mord.\n\nHurra nu ska man ??ntligen f?? r??ra p?? benen,\n\nhela stammen jublar och det spritter i grenen.\n\nT??nk att ??n en g??ng f?? skrida fram p?? Brunte i galopp.\n\nDin doft o k??ra Brunte ??r trots brist i hygienen\n\nf??r en vild mongol minst lika ljuv som syrenen.\n\nT??nk att ??n en g??ng f?? rida runt i stan och spela topp!\n\nJa, nu skall vi ut och h??rja....\n\nJa, mordbr??nder ??r h??ftiga, ta fram fotogenen\n\noch eftersl??ckning tillh??r ju just de fenomenen\n\ninom brandmansyrket som jag tycker\n\natt det ??r n??n nytta med.\n\nJag m??lar f??r mitt inre upp den h??rliga scenen:\n\nBlodr??tt mitt i brandgult, ej ens prins Eugen,\n\nEn lika mustig vy kunde m??la,\n\nEns om han m??lade med sked.\n\nJa nu skall vi ut och h??rja.....	f	842287d4-5e7f-41c8-96d6-5596651998ec
2a164d0f-110c-48ee-bd40-8725b2347d5a	**R??D VITAMIN**	Unknown	**r??d_vitamin**	8d925b9d-6252-40fe-b0df-18b4834822e2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: My Bonnie\n\nHur badar man b??st p?? en kurort?\\\nJo, om man har fyllt en bass??ng,\\\nmed v??tskan som snart skall besjungas\\\nn??r vi kommit fram till refr??ng;\n\nR??dvin, r??dvin.\\\nR??dvin ??r fin h??lsokost, kost, kost.\\\nR??dvin, r??dvin.\\\nR??dvin v??r b??sta flaskpost.\n\nMan f??r vitaminer f??n r??dvin.\\\nMan piggnar ju till p?? en g??ng,\\\nn??r glaset har t??mts uti botten\\\ns?? st??mmer vi upp till en s??ng.\n\nR??dvin, r??dvin\\...\n\nUr s??ngboken f??n Lundakarnevalen	f	842287d4-5e7f-41c8-96d6-5596651998ec
eb833e21-c62c-4bd1-aa59-b545b565f7c1	MIN PILSNER	Unknown	min_pilsner	ccfc6367-0a92-4ded-b5e7-82506b01b164	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: My Bonnie\n\nMin pilsner ska svalka min tunga\n\nMin pilsner skall duscha min gom\n\nMin pilsner skall f?? mig att sjunga\n\nOm jag ser att flaskan ??r tom\n\nPilsner! Pilsner!\n\nH??mta en pilsner till mig, till mig!\n\nPilsner! Pilsner!\n\nH??mta en pilsner till mig!	f	842287d4-5e7f-41c8-96d6-5596651998ec
e059d636-bee8-4da3-b7a3-1f43f5972f87	FREDMANS EPISTEL NR: 21	Carl Michael Bellman	fredmans_epistel_nr:_21	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	S?? lunkar vi s?? sm??ningom\n\nFr??n Bacchi buller och tumult\n\nN??r d??den ropar: Granne kom\n\nDitt timglas ??r nu fullt!\n\nDu gubbe f??ll din krycka ned,\n\nOch du, din yngling, lyd min lag:\n\nDen sk??nsta nymf som ??t dig ler\n\nInunder armen tag!\n\nTycker du att graven ??r f??r djup\n\nN?? v??lan s?? tag dig d?? en sup\n\nTa dig sen dito en, dito tv?? dito tre,\n\nS?? d??r du n??jdare.\n\nMen du som med en trumpen min\n\nbland reglar, galler, j??rn och l??s,\n\ndig vilar p?? ditt penningskrin\n\ninom ditt st??ngda b??s.\n\nOch du som ??r svartsjuk sl??r i kras\n\nButeljer, speglar och kopal,\n\nbjud nu god natt, drick ur ditt glas\n\noch h??lsa din rival.\n\nTycker du att graven.....\n\nS??g ??r du n??jd, min granne s??g,\n\nS?? prisa v??rden nu till slut.\n\nOm vi ha en och samma v??g\n\nS?? f??ljsom ??t -- drick ut!\n\nMen f??rst med vinet r??tt och vitt\n\nF??r v??r v??rdinna bugom oss\n\nOch halkom sen i graven fritt\n\nVid aftonstj??rnans bloss.\n\nTycker du att graven.....	f	842287d4-5e7f-41c8-96d6-5596651998ec
7427998f-556a-462d-890e-21acc9be9a11	LIVETS V??LBEHAG	P.R.I.T. -04	livets_v??lbehag	f574319a-99b7-4925-9e26-46b442d20438	53fcad8b-9c6b-492e-9af6-26ecb593720f	En liten s??ng, vi sjung idag,  \nEn s??ng om livets v??lbehag  \nEn s??ng om ??l och B??sk och Sk??ne  \nEn s??ng om livets v??lbehag!\n\n*Text: P.R.I.T. -04*	f	842287d4-5e7f-41c8-96d6-5596651998ec
e3cb3d72-3590-45da-9848-f77b79aa0d53	**TA ETT GLAS**	Unknown	**ta_ett_glas**	d8d2baa1-18be-4bcb-a47b-ce9db1610801	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Oh, Tannenbaum\n\nOh, ta ett glas,\\\nOh, ta ett glas.\\\nTy vinet f??r oss samman.\\\nOch den som inget glas vill ha,\\\nhan sjunger och ??r lika gla\\'.\\\nMen ta ett glas,\\\nja ta ett glas,\\\nf??r livets fr??jd och gamman.	f	842287d4-5e7f-41c8-96d6-5596651998ec
e2f21ec2-4071-451b-9414-91883eecb1bc	**DU GAMLA, DU FINA**	Unknown	**du_gamla,_du_fina**	b01bf346-2844-493c-9257-63a3b64f165b	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Svenska nationals??ngen\n\nDu gamla, du fina, du ??rg??ngna vin,\n\nsom plockats och trampats ibland bergen.\n\nJag dyrkar aromen och smaken s?? fin,\n\nMen ljuvast utav allt ??r ??nd?? f??rgen.\n\nDen drycken den g??r ??nda in i m??rgen.\n\nNu fyller vi glasen och h??jer v??r arm.\n\nF??r lycka och v??nskapsband vi sk??la.\n\nJa, vinet det har en f??runderlig charm.\n\n??r n??stan lika gott som rom och cola,\n\ns?? l??t oss d??rf??r med varandra sk??la.	f	842287d4-5e7f-41c8-96d6-5596651998ec
5c1e262e-c39d-4e8b-8787-aa6e1b171bf9	EN 'R??NNVINSKOKARE	Unknown	en_'r??nnvinskokare	36231403-8759-4f32-b3a7-cd8d227b1ab6	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: En sockerbagare\n\nEn 'r??nnvinskokare h??r bor i skogen,\n\nhan s??ljer 'r??nnvinet svart p?? krogen.\n\nOch ??r du nykter s?? kan du g??,\n\nmen ??r du fuller s?? kan du int'.	f	842287d4-5e7f-41c8-96d6-5596651998ec
fcff1adc-14b5-4815-8069-bbed2c5385d8	BREV FR??N KOLONIEN	Unknown	brev_fr??n_kolonien	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Hejsan morsan, hejsan stabben.\\\nH??r ??r brev fr??n ??lsklingsgrabben.\\\nVi har kul p?? kolonien.\\\nVi bor tjugo??tta gangstergrabbar i en\\...\n\n\\...stor barack med massa s??ngar.\\\nKan ni skicka mera pengar?\\\nF??r det vore en god g??rning.\\\nJag har spelat bort vartenda dugg p?? t??rning.\n\nH??r ??r roligt vill jag lova,\\\nfast??n lite sv??rt att sova.\\\nKillen som har s??ngen ??ver mig,\\\nhan vaknar inte han n??r han beh??ver, nej.\n\nJag har tappat tv?? framt??nder\\\nf??r jag skulle g?? p?? h??nder\\\nn??r vi lattjade charader,\\\ns?? n??r morsan nu f??r se mig f??r hon spader.\n\nUti skogen finns baciller\\\nmen min kompis han har piller\\\nsom han k??pt utav en ful typ\\\noch om man ??ter dom blir man en j??ttekul typ.\n\nJag ??r inte r??dd f??r sp??ken\\\noch min kompis, han har kr??ken\\\nsom han gjort utav potatis\\\noch den s??ljer han i baracken n??stan gratis.\n\nV??ran fr??ken ??r f??rsvunnen.\\\nHon har dr??nkt sig uti brunnen\\\nf??r en morgon blev hon galen\\\nf??r vi sl??ppte ut en huggorm i matsalen.\n\nF??rest??ndar\\'n han har farit.\\\nHan blir aldrig vad han varit\\\nf??r polisen kom och tog hand\\\nom honom f??r en vecka n??r vi lekte skogsbrand.\n\nUti skogen finns det r??djur.\\\nI baracken finns det sm??djur\\\noch min b??ste kompis Tage\\\nhan har en liten fickkniv inuti sin mage.\n\nHonom ska dom operera.\\\nJa, nu vet jag inget mera.\\\nKram och kyss och hj??rtligt tack sen\\\nmen nu ska vi ut och br??nna grannbaracken.	f	842287d4-5e7f-41c8-96d6-5596651998ec
60afbfe4-6579-4e50-8756-a9ff4ef40096	LILLA NUBBEN	Unknown	lilla_nubben	643863b3-9a93-42df-a435-770f987fb3a0	53fcad8b-9c6b-492e-9af6-26ecb593720f	//:T??nk om jag hade lilla nubben p?? ett sn??re i halsen://\n\nJag skulle dra, den upp och ner, s?? att den k??ndes som m??nga fler.\n\nJa, t??nk om jag hade lilla nubben upp?? ett sn??re i halsen!	f	842287d4-5e7f-41c8-96d6-5596651998ec
aca8be84-efe8-43ff-a3ad-5d515e96b0ea	KOPPARSLAGAREN	Unknown	kopparslagaren	a4791ce3-e94c-4a45-8cdb-57f75c082b14	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: En sockerbagare\n\nEn kopparslagare jag har i knoppen\n\njag har f??rs??kt att p?? den f?? stopp men\n\ndet hj??lper inte med magnecyl\n\nej heller treo eller albyl\n\nOch i mitt barsk??p blott tomma burkar\n\ndet blev helt l??nsat i natt av skurkar\n\nsom l??mnat mig h??r i hemmet torrt\n\nmed v??rk i huvud jag vill f?? bort.	f	842287d4-5e7f-41c8-96d6-5596651998ec
52945a42-38ba-4ef1-a915-e20fa57f14ed	VIT VECKA	Unknown	vit_vecka	cc581ecb-59cc-417a-aeb4-79c918e50c12	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: White christmas\n\nJag dr??mmer om en vit vecka\n\nSju dagar utan alkohol.\n\nT??nk att bara sk??la\n\ni juice och cola\n\noch sedan minnas allt man gjort.\n\nJag dr??mmer om en vit vecka,\n\ndet finns en gr??ns f??r vad jag t??l.\n\nJag vill inte dricka\n\nmera sprit\n\ns?? l??t n??sta vecka vara vit.	f	842287d4-5e7f-41c8-96d6-5596651998ec
2dd37434-cbe9-4d39-b715-ba59f2a528d3	??HL I GLAS	Unknown	??hl_i_glas	01afb0a6-58bd-4d4b-a5b0-5e91fac81e9f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Row your boat\n\n??hl, ??hl, ??hl I glas\n\neller I butelj\n\nSkummande, skummande, skummande skummande\n\nTa en klunk och sv??lj!	f	842287d4-5e7f-41c8-96d6-5596651998ec
363c5985-ec29-4762-8949-e586c7d759f9	UNDER EN FILT I MADRID	Claes Eriksson	under_en_filt_i_madrid	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Under en filt i Madrid ligger en flicka p?? glid.\\\nTittar p?? mannen bredvid. Under en filt i Madrid.\\\nBakom ett berg i Gen??ve d??r f??r en moder ett brev\\\nfr??n hennes dotter p?? glid. Under en filt i Madrid.\n\nFramf??r en stolpe i Bonn sitter det nu inte n??n.\\\nEndast en tom La Garonne. Framf??r en stolpe i Bonn.\\\nMen d??r i vindarnas drev fladdrar ett brev f??n Gen??ve.\\\nPostat n??n g??ng i Bretagne. Doftande billig champagne\n\nP?? en bordell i Bor??s sm??rjer en herre sitt k??s.\\\nBakom ett skjul i Tasjkent d??r st??r ett f??nster p??\\\ngl??nt.\\\nN??gon har kastat ett skal genom en jak i Nepal.\\\nIngenting ??r som det skall. Solen ??r blott en marschall.\n\nSj??lv ??r jag blott en kostym. Mamma ??r bara parfym.\\\nPappa f??rspiller sin tid under en filt i Madrid.\\\nUnder ett lakan i Prag d??r ligger en kvinna och jag.\\\nS??ngen ??r full av res??r. S??ngen jag sjunger ??r\\\nsv??r.\n\nOm??jlig att komma ur. Jag vet d?? fan inte hur.\\\nOrden f??r snart inte rum. Jag f??r v??l sjunga mig stum.\\\nTonerna tr??ngs i min gom. S??tt mig p?? t??get till Rom!\\\nJa, l??t mig f?? sluta min tid under en filt i Madrid!\n\n*Text: Claes Eriksson*\\\n*Ur revyn Cyklar med Galenskaparna och After Shave*	f	842287d4-5e7f-41c8-96d6-5596651998ec
4a452390-670d-47f8-b3c4-0c3d62f10b00	VI ??RO FR??N IT	P.R.I.T. -04	vi_??ro_fr??n_it	cedff49d-9091-4946-b66e-7613e34f8cb2	53fcad8b-9c6b-492e-9af6-26ecb593720f	//:Vi ??ro fr??n IT vi://\n\nVi gillar turkost och vi v??rdar ju Smurfen\n\nVi ??ro fr??n IT vi.	f	842287d4-5e7f-41c8-96d6-5596651998ec
8ad8feec-43eb-437f-8bdc-26cdd9fb48ab	EFTER G??CKEL	Unknown	efter_g??ckel	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Det d??r det gjorde de fan s?? bra\n\nEn sk??l uti botten f??r \\[**insert name**\\] vi tar\n\nHugg i och dra, HEJ\n\nHugg i och dra, HEJ\n\nEn sk??l ut i botten f??r \\[**insert name**\\] vi tar\n\n?? alla s?? dricka vi nu \\[**insert name**\\] till.\n\nOch \\[**insert name**\\]  s??ger?!\n\n\\***G??cklande svarar**\\*\n\nF??r det var i v??r ungdoms fagraste v??r\n\nVi drack varandra till och vi sade, Gut??r.\n\nSk??l Forrest!	f	842287d4-5e7f-41c8-96d6-5596651998ec
743e4dd2-9536-428f-9006-2cd1154f20cb	M??SEN (KORT VERSION)	Unknown	m??sen_(kort_version)	f4bbc115-9397-4cac-b26e-920d879e280f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Det satt en m??s p?? en klyvarbom\\...\\  \nJag vill ha OP!	f	842287d4-5e7f-41c8-96d6-5596651998ec
fe6a8e1a-f041-48d9-8146-e260f4cec92b	JAG HAR ALDRIG VART P?? SNUSEN	Unknown	jag_har_aldrig_vart_p??_snusen	b8197909-74e6-45df-90a9-7cb721b9f9cd	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag har aldrig vart p?? snusen,\n\naldrig r??kat en cigarr, halleluja!\n\nMina dygder ??ro tusen,\n\ninga syndiga laster jag har.\n\nJag har aldrig sett n??t naket,\n\ninte ens ett litet nyf??tt barn.\n\nMina blickar g??r mot taket,\n\nd??rmed undg??r jag frestarens garn, halleluja\n\nHalleluja, halleluja\n\nHalleluja, halleluja\n\nHalleluja, halleluja\n\nHalleluja-a-a.\n\nBacchus spelar p?? gitarren,\n\nSatan spelar p?? sitt handklaver.\n\nAlla dj??vlar dansar tango,\n\ns??g vad kan man v??l ??nska sig mer.\n\nJo, att alla b??ckar vore br??nnvin,\n\nG??ta ??lv var fylld med bayersk ??l.\n\nCognac i varenda r??nnsten och punsch i\n\nvarendaste p??l.\n\nHalleluja, halleluja\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
4983add4-8b2b-4e0a-93a9-98dbbbfe7968	BR??NNVIN	Unknown	br??nnvin	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Att sjungas av icke s??ngkunniga g??ster, ty melodi saknas*\n\n*BOM b??r markeras med slag i bordet eller stampning*\n\nDet var br??nnvin i flaskan n??r vi kom\n\nBOM, BOM\n\nn??r vi gick\n\nBOM, BOM\n\nvar flaskan tom	f	842287d4-5e7f-41c8-96d6-5596651998ec
c448237f-82e5-4371-a887-9b28fdbc6920	EMILIAS SNAPSVISA	Unknown	emilias_snapsvisa	d65c0d2f-8987-4607-86fa-159a1b8646f2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Emil I L??nneberga\n\nV??rt glas vi lyfter i extas\n\nn??r vi ??r p?? kalas.\n\nVi mister b??de vett och sans\n\noch tappar v??r balans.\n\nSnapsen g??r mig listig och stark\n\njag kryper hem p?? stadig mark\n\nen sup ??r gott, hoppfallera,\n\nmen stackars mig, hoppfallerej.\n\nDen lilla ??terst??llaren\n\ni morgon f??r jag ta.\n\nJag aldrig mig min l??xa l??r,\n\nvar fest det utf??r b??r.\n\nSnapsen g??r mig ...	f	842287d4-5e7f-41c8-96d6-5596651998ec
5ad2e3c7-39fd-43f8-b4e9-c807442da774	M??SEN	Unknown	m??sen	d8dc7318-7406-46eb-aaf3-f3763678d2d8	53fcad8b-9c6b-492e-9af6-26ecb593720f	Det satt en m??s p?? en klyvarbom\n\nOch tom i kr??van var kr??ket.\n\nOch tungan l??dde vid skepparns gom\n\nD??r han satt uti bleket.\n\nJag vill ha sill h??rdes m??sen rope'\n\nOch skepparn svarte: jag vill ha OP\n\nOm blott jag f??r, om blott jag f??r.\n\nNu lyfter m??sen fr??n klyvarbom\n\nOch vinden spelar i t??gen\n\nOP'n svalkat har skepparns gom,\n\nJag ??nskar blott att jag s??g 'en.\n\nS?? n??jd och lycklig den arme saten\n\nHan s??tter storseglet den krabaten,\n\nTill sj??ss han far, och halvan tar!\n\nN??r m??nen vandrar sin tysta ban\n\nOch tittar in i kajutan\n\nD?? t??nker jag att p?? ljusan dan\n\nD?? kan jag klara mig utan\n\nJa jag kan klara mig utan m??nen\n\nMen utan OP'n och utan Sk??ne'n\n\nDet vete fan, det vete fan.	f	842287d4-5e7f-41c8-96d6-5596651998ec
f94c7e41-8507-4afd-a46d-c4a965c7e58e	VART ??R KYPARN?	Unknown	vart_??r_kyparn?	b79918ba-3548-43ed-adf4-bd6028b0ee83	53fcad8b-9c6b-492e-9af6-26ecb593720f	//:Vart fan har kypar'n tagit v??gen  \ndet ??r s?? tomt uti glasen?://\n\nEtt s??n't kalas, med tomma glas  \nDet liknar natta har han f??tt knas?\n\nVart fan har kypar'n tagit v??gen  \ndet ??r s?? tomt uti glasen?	f	842287d4-5e7f-41c8-96d6-5596651998ec
0624f5d7-350e-488b-8804-2c453f0f13fd	HALLONSAFT	Unknown	hallonsaft	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	N??r smurfar st??ller till med fest\n\nS?? vet vi hur man festar b??st\n\nDom fixar en korv och en god pastej\n\nVi smurfar allt du kan t??nka dig\n\nKul??rta lyktor och musik\n\nEn t??rta som ??r sagolik\n\nS?? st??ller dom fram en j??tteb??l\n\nVi fyller v??ra glas och s??ger sk??l\n\nSaft, saft, hallonsaft\n\nB??ttre saft har ingen haft\n\nSaft, saft, hallonsaft\n\nB??ttre saft har ingen haft\n\nDet b??rjar i ett hallonland\n\nSom vi f??r smurfa av f??r hand\n\nSen blandas allt och kokas v??l\n\nOch alla l??gger ner sin sj??l\n\nTills det doftar gott och lyser r??tt\n\nOch smakar b??de starkt och s??tt\n\nMed lagom barr- och sockerhalt\n\nF??r lite och f??r mycket sk??mmer allt\n\nSaft, saft, hallonsaft\\...\n\nOch n??r dom druckit ur ett glas\n\nSom h??nder p?? ett smurfkalas\n\nS?? g??r dom strax och fyller p??\n\nS?? l??nge det finns mer att f??\n\nJu mer dom dricker skrattar dom\n\nEller om det rent av ??r tv??rtom\n\nG??r lyckan d?? i hallonsaft\n\nMen kul f??r man ha av egen kraft\n\nSaft, saft, hallonsaft\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
a99f2688-7f3d-4fec-a676-ee2c0c8d0f6c	IT: S AFTER SKI S??NG	Unknown	it:_s_after_ski_s??ng	c188ece8-10a0-4114-aae1-63cb912911d9	53fcad8b-9c6b-492e-9af6-26ecb593720f	P?? IT ??ks det skidor ifr??n morrn' till kv??ll,\n\nsen festas hela natten p?? ett fj??llhotell.\n\nMan vaknar p?? morgonen och m??r skit\n\nD?? n??gon har bjudit f??r mycket sprit.\n\nMen sk??l f??r alla ??kare som kom hit!\n\nI l??ssn?? nedf??r branterna d??r surfar vi.\n\nEtt g??ng som pluggar data svischar vi f??rbi.\n\nDe verkar ha krockat med n??got stort,\n\nEtt s??ktr??d och missat n??gon port,\n\nJa va' kul det ??r att snowboarda fort!\n\nDe b??sta backarna de finns p?? After Ski,\n\nDet ??r de fina backarna med ??l uti.\n\nN??r du ??r tr??tt p?? att va' offpist,\n\nPissed off p?? bar-k??n som ??r s?? trist,\n\nBlir du glad n??r du f??r din ??l till sist!	f	842287d4-5e7f-41c8-96d6-5596651998ec
ffb62ecc-9f70-4f9f-b7cd-5943702da10b	HELAN G??R	Unknown	helan_g??r	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Helan g??r, sjung hopp faderallanlallanlej!  \nHelan g??r, sjung hopp faderallanlallanlej!\n\nOch den som inte helan tar  \nHan heller inte halvan f??r.  \nHelan g??r!\n\nSjung hopp faderallanlallanlej!	f	842287d4-5e7f-41c8-96d6-5596651998ec
1125ab7a-4aed-401f-b009-2842bdfb39bd	BR??NNVIN ??R J??VLIGT	Unknown	br??nnvin_??r_j??vligt	66f41b6e-0030-40ab-8fe7-3caff9f25c5c	53fcad8b-9c6b-492e-9af6-26ecb593720f	F??r br??nnvin ??r j??vligt gott,\n\nsmakar b??ttre ju mer man f??tt.\n\nMen g??r man i golvet\n\ns?? d??r mellan tolv och ett,\n\ns?? sl??r man sig j??vligt h??rt.	f	842287d4-5e7f-41c8-96d6-5596651998ec
ba95294e-217a-488a-9534-5247476a7b81	JU MERA ??L VI DRICKER	Unknown	ju_mera_??l_vi_dricker	171716ee-1c2a-4c90-a113-7c16e0523704	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Ju mer vi ??r tillsammans\n\nJu mera ??l vi dricker, vi dricker, vi dricker. Ju mera ??l vi dricker, ju\nrundare vi bli. F??r rundare ??r sundare och sundare ??r rundare. Ju mera\n??l vi dricker, ju rundare vi bli.	f	842287d4-5e7f-41c8-96d6-5596651998ec
cdaa3572-6761-4627-ba0c-4cf31684ca6e	HUVET SL??R KOPPARSLAG	Unknown	huvet_sl??r_kopparslag	59ec5a1e-e6ff-49c3-ab1d-b52dbefc6fb4	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Sankta Lucia\n\nHuvet sl??r kopparslag\n\n??gonen svider\n\nmagen i obehag\n\nnatten den lider.\n\nD?? genom strupen g??r\n\nhembr??nd en liten t??r\n\nv??rdat vare v??rat br??nnvin\n\nv??rdat v??rt br??nnvin.	f	842287d4-5e7f-41c8-96d6-5596651998ec
129a1477-987e-41db-95fc-04db29c95e44	TECKENVISAN (av NollKIT, 2012)	Unknown	teckenvisan_(av_nollkit,_2012)	8d3dedab-e973-4e93-bacf-833b37f1ea9d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Tre pepparkaksgubbar\n\n. , . , / \\* \\_\n\n" \\# + ^ '\n\n{ { < ??\n\n& - ? ! @	f	842287d4-5e7f-41c8-96d6-5596651998ec
fb12b611-7bd0-4385-bdf5-36012577aecf	??HL	Unknown	??hl	debace28-4097-494b-a124-7f4033013f76	53fcad8b-9c6b-492e-9af6-26ecb593720f	//:??hl, ??hl fillibombombom, fillibombombom, fillibombombom://\n\nVi hade ju b??de Heineken och Nordic W??lf,\n\nTuborg Guld och lilla Preppens bl??!\n\nDet blir f??r trist med sodavatten, sodavatten, sodavatten, det blir f??r\ntrist med sodavatten, ge mig lite ??hl!	f	842287d4-5e7f-41c8-96d6-5596651998ec
865ce938-c715-415c-b845-b0130e0b43aa	H??RLIG ??R PUNSCHEN	Unknown	h??rlig_??r_punschen	edda582a-d56d-4f2b-a75a-7b081326451c	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: H??rlig ??r jorden\n\nH??rlig ??r punschen,\n\nh??rlig ??r dess konsistens.\n\nSk??nt ??r att taga den ??n en g??ng.\n\nGenom att taga punschen av daga\n\ng?? vi till paradis med s??ng.	f	842287d4-5e7f-41c8-96d6-5596651998ec
0a4c1dec-cd90-4c99-ac6b-347ac84faa50	LAPIN KULTA	Unknown	lapin_kulta	45cd5adb-df51-410d-8d7f-cc21836f1c68	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Broder Jacob\n\nLapin Kulta, Lapin Kulta, Karjala, Karjala\n\nAura sek?? Olvi, Aura sek?? Olvi,\n\nKoff Koff Koff, Koff Koff Koff	f	842287d4-5e7f-41c8-96d6-5596651998ec
f7f25a32-9689-4b97-8b87-1f6706c8cacd	SER DU STJ??RNAN	Unknown	ser_du_stj??rnan	b6c568ef-3e0a-4fe3-b118-5235da1436c4	53fcad8b-9c6b-492e-9af6-26ecb593720f	Ser du stj??rnan i det bl???  \nTag en sup s?? ser du tv??.  \nTar du mera, ser du flera, stj??rnor sm??.  \n\nSer du stj??rnan i det bl???  \nTag en sup s?? ser du tv??.  \nTar du fler s?? g??r du ner p?? l??g niv??.	f	842287d4-5e7f-41c8-96d6-5596651998ec
c602cb3c-4de6-4d71-bec2-60d16e697e96	FESTU: S PUNSCHVISA	Unknown	festu:_s_punschvisa	e7373e78-9927-4e00-a846-b820901fe0df	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Midnatt r??der\n\nPunschen, Punschen, rinner genom strupen,\n\nner i djupen.\n\nBlandas, konfronteras d??r med supen,\n\nd??r med supen.\n\nGula droppa st??rker v??ra kroppar,\n\npunsch, punsch, punsch!	f	842287d4-5e7f-41c8-96d6-5596651998ec
9520ed54-a33b-4a60-a565-67671bcb2489	LYFTET	Unknown	lyftet	ab021877-baa5-4e36-a66d-5dbd075ac2ff	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Ding dong Merrily on high\n\nLyft ditt v??lf??rsedda glas\n\nDet ??r en h??rlig b??rda\n\nNu har tjejerna kalas\n\nVi segern snart skall sk??rda\n\n:/:Ding dingedingeding dingedingeding\n\ndingedingeding dong dong\n\nI morgon ??r det l??rdag:/:\n\nS??tt nu glaset till din mun\n\nSe d??den p?? dig v??ntar\n\nNu har tjejerna kalas\n\nH??r liemannen fl??mtar\n\n:/: Ding dingedingeding\\...\n\n\\...\n\nBegravningsklockor kl??mtar:/:	f	842287d4-5e7f-41c8-96d6-5596651998ec
f309d9be-98e5-4c7c-a382-dadb65370920	??NGLAHUND	Unknown	??nglahund	dd8d6a38-6e68-44db-9229-bbde36309b9b	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Marselj??sen\n\nDet st??r en hund p?? fj??rde v??ningen,\n\noch den t??nker hoppa ner!\n\nBANZAI! (supen tages)\n\nDet var en japanesisk sj??lvmordshund,\n\noch den hoppar aldrig mer!\n\n*S??ngarstriden i Lund, 1982*	f	842287d4-5e7f-41c8-96d6-5596651998ec
109df3d6-33b5-4e17-b5d1-5b24aa434fb4	HELL AND GORE	Unknown	hell_and_gore	83badd47-50f2-4645-ba59-85cee58b1eb3	53fcad8b-9c6b-492e-9af6-26ecb593720f	Hell and gore  \nChunk up father allan-lallan-ley  \nHell and gore  \nChunk up father allan-ley\n\nOh handsome in the hell and tar  \nHand hell are in the half and four  \nHell and gore\n\nChunk up father allan-ley	f	842287d4-5e7f-41c8-96d6-5596651998ec
315afa28-3cc9-4741-b46c-37cdf8b0f810	LILLE OLLE	Unknown	lille_olle	730976f2-b0b7-4591-b5d7-bf6158cbafa4	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Sjunges dock p?? IT med Bamse-melodin*\n\nLille Olle skulle g?? p?? disco, men han hade inte n??gon sprit.  \nLille Olle skaffa' lite hembr??nt, lille Olle gick d?? p?? en nit.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.\n\nLille Olle skulle b??rja festa, spriten blandade han ut med Mer.  \nLille Olle drack upp hela b??len, lille Olle ser nu inte mer.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.\n\nLille Olle skaffade en ledhund, den var ful, och ??ven ganska trind.  \nOlles ledhund drack upp femton flaskor, Olles ledhund ??r nu ocks?? blind.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.\n\nLille Olle b??rjade med droger, han blandade sin LSD med juice.  \nLille Olles hj??rna st??r i l??gor, lille Olle dog av ??verdos.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.\n\nLille Olle sitter nu i himlen, festa kan man g??ra ??ven d??r.  \nLille Olle skaffade en ??lback, capsar nu med Gud och Sankte Per.\n\nLa lalla la la la lala! la la la la la la la la la la la la la la.	f	842287d4-5e7f-41c8-96d6-5596651998ec
4feada76-ac50-494c-9730-91bd816e51fe	V??RAN FORD	Unknown	v??ran_ford	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	F??r upp?? v??ran g??rd,\n\nd??r st??r en gammal ford\n\nf??rutan hjul och utan d??ck\n\noch motorn den ??r v??ck\n\nOch tittar man d??r bak,\n\ns?? finns det inget flak\n\noch tittar man d??r f??rarn\n\nsatt s?? finns det ingen ratt\n\nDen g??r p?? terpentin,\n\nsm??r och margarin.\n\nDen g??r ju som en m??nraket\n\ngenom Johanssons staket\n\nOch Johansson kom ut\n\nMed b??ssan full av krut\n\nOch sk??t den gamla Forden ut\n\nOch s?? var visan slut. Tut tut	f	842287d4-5e7f-41c8-96d6-5596651998ec
e7d1a871-10f4-46d9-bbc8-b1388f903b6d	Bamses phestvisa	Unknown	bamses_phestvisa	ac6de9a1-80a2-482e-9d7b-ac2db613ede7	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag ska festa, ta det lugnt med spriten,  \nha det roligt utan ?? va' full.  \nInte krypa runt med festeliten,  \nta det varligt f??r min egen skull.\n\nF??rst en ??l i torra strupen,  \nefter det s?? kommer supen,  \ni med vinet, ner med punschen.  \nSist en groggbuff??.\n\nJag ??r sketfull, d??ckar f??rst av alla,  \nmissar festen, men vad g??r v??l de'?  \nBlandar hejdl??st ??l och gammal filmj??lk,  \nkastar upp p?? bordsdamen breve'!\n\nF??rst en ??l\\...\n\nSpyan rinner ner f??r ylleslipsen.  \nRaviolin torkar i mitt h??r.  \nVem har lagt mig under matsalsbordet?  \nVems ??r gaffeln i mitt h??gra l??r?	f	842287d4-5e7f-41c8-96d6-5596651998ec
e120f94a-f17c-4870-8404-6c70653081fb	SOLEN	Unknown	solen	62dad746-f380-4dfe-9bc3-604849bd3fce	53fcad8b-9c6b-492e-9af6-26ecb593720f	Solen den g??r upp och ner doda, doda.\n\nJag skall aldrig supa mer, hej doda dej.\n\nHej doda dej, hej doda dej.\n\nJag skall aldrig supa mer, hej doda dej.\n\nMen detta det var inte sant doda, doda.\n\nI morgon g??r jag likadant, hej doda dej.\n\nHej doda dej, hej doda dej.\n\nI morgon g??r jag likadant, hej doda dej.	f	842287d4-5e7f-41c8-96d6-5596651998ec
caf86b82-f0d9-4af0-ae97-a8d35aaf785c	DEN ANDRA VAR EN B??SK	E6 1979	den_andra_var_en_b??sk	80cd04f5-72c8-416f-8d61-b5235c0dcfb2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Byssan lull\n\n//:Byssan lull g?? p?? gasque och bliva full, f??r oss har det blivit en\nvana://\n\nDen f??rsta var en B??sk, den andra var en B??sk, den tredje var b??st av\ndem alla.\n\nText: E6 1979	f	842287d4-5e7f-41c8-96d6-5596651998ec
fd45a489-6200-49c2-901a-814444589d6f	CYKELVISAN	Unknown	cykelvisan	732f177d-6e73-4907-9082-2b759a715f9c	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: V??va vadmal*\n\nMan cyklar f??r lite\n\nMan r??ker f??r mycket\n\nOch man ??r fasen s?? liberal\n\nN??r det g??ller maten och spriten\n\nJag borde slutat f??r l??nge sen\n\nMen denna sup ??r f??r liten\n\nVad tj??nar att hyckla\n\nTids nog f??r man cykla\n\nMan pluggar f??r lite\n\nOch festar f??r mycket\n\nOch man ??r fasen s?? liberal\n\nN??r det g??ller tentor och labbar\n\nJag borde pluggat f??r l??nge sen\n\nMen alla g??r sina tabbar\n\nVad tj??nar att plugga\n\nJag kommer att kugga	f	842287d4-5e7f-41c8-96d6-5596651998ec
02731776-40c5-4595-8b55-1b906dc8e038	T??RSTEN RASAR	Unknown	t??rsten_rasar	dd4175ab-5dc0-4377-9b54-5e15a990d90a	53fcad8b-9c6b-492e-9af6-26ecb593720f	T??rsten rasar uti v??ra strupar,\n\ntungan h??nger torr och styv och stel.\n\nMen snart vankas stora l??nga supar,\n\nvar och en f??r sin besk??rda del.\n\nSnapsen kommer, den vi vilja t??mma,\n\ndenna nektar likt Olympens saft\n\nkommer oss att v??ra sorger gl??mma.\n\nSnapsen sk??nker h??lsa, liv och kraft!	f	842287d4-5e7f-41c8-96d6-5596651998ec
d5656082-e597-407c-9c71-a1fa3a554b66	TOMT I ALLA GLAS	P.R.I.T. -04	tomt_i_alla_glas	a14e927a-0610-4cee-bf8b-fbbea9cda86d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Nu ??r det tomt i alla glas\n\nekot i dem klinga\n\nDrickan ??r sen l??nge slut\n\nkom, mer till oss bringa!\n\nVi vill ha snaps, vi vill ha snaps,\n\nja, vi vill ha snaps!\n\n*(Snaps kan bytas ut mot godtycklig dryck efter eget ??nskem??l)*	f	842287d4-5e7f-41c8-96d6-5596651998ec
9e71ce57-1baf-4302-a00b-47de4157d33a	MATEMATISKT INTRESSERAD	Henrik Jernevad IT2002	matematiskt_intresserad	05682c06-4c8f-4957-87e3-81e25165c417	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag har r??knat n??stan allt som finns att r??kna p??\n\nEuler, derivator, polynom och pivot\n\nVarenda liten uppgift har jag f??tt r??kna ut\n\nOch nu s?? b??rjar t??lamodet l??ngsamt att ta slut\n\nJag g??r p?? Chalmers, ja jag har r??knat allt som finns\n\nJag g??r p?? Chalmers, men inte n??gonting jag minns\n\nJag g??r p?? Chalmers, och jag ??r n??stan alltid h??r\n\nJag g??r p?? Chalmers, och det ger mig blott besv??r\n\nF??r l??nge sedan var jag matematiskt intresserad\n\nJag tyckte det var skoj och ville d??rf??r l??ra mera\n\nJag b??rjade p?? Chalmers och allt verkade s?? bra\n\nMen snart s?? fick jag mer att g??ra ??n jag ville ha\n\nJag g??r p?? Chalmers\\...\n\nFem minuter algebra och fem minuter Euler\n\nFem minuter analys och fem minuter Taylor\n\nFem minuter graf och fem minuter integral\n\nFem minuter till s?? blir jag aldrig mer normal\n\nJag g??r p?? Chalmers\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
2d2095a3-62df-46e8-87f0-52a67117bbf3	G?? EFTER SPRIT	Unknown	g??_efter_sprit	68a85443-5bb6-4cfa-8ca7-7c48878e9bb1	53fcad8b-9c6b-492e-9af6-26ecb593720f	Vi g??r ??ver ??n efter sprit, fallera,\n\nmen efter vatten g??r vi ej en bit, fallera.\n\nJa, sup k??ra br??der, s?? ??gonen gl??der.\n\nEn g??ng blir din blick ack-va-vit, fallera.	f	842287d4-5e7f-41c8-96d6-5596651998ec
5511104d-376c-4ebc-9d27-6f6fe58de670	PUNSCHEN KOMMER KALL	Unknown	punschen_kommer_kall	88288165-2a20-4ed9-af2e-41f27ebd08df	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Glada ??nkan\n\nPunschen kommer, punschen kommer,\n\nljuv och sval.\n\nGlasen imma, r??ster stimma i v??r sal.\n\nSk??l f??r glada minnen,\n\nsk??l f??r varje v??r.\n\nInga sorger finnas mer\n\nn??r punsch vi f??r.	f	842287d4-5e7f-41c8-96d6-5596651998ec
58ff750f-85b3-46d9-9f8b-65065e316e2d	PING-PONG	Unknown	ping-pong	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	A boy had a game with\n\na ping-pong ball\n\nA boy had a game with\n\na ping-pong ball\n\nA boy bad a game with\n\na ping-pong ball\n\nA game with a ping-pong ball\n\nA boy had a game with a\n\nPing-pong, ping- pong\n\nPing-pong, ping- pong\n\nPing-pong-ball\n\nA boy had a game with a\n\nPing-pong, ping-pong,\n\nPing-pong, ping-pong ball\n\nPing-pong, ping-pong,\n\nPing-pong, ping-pong ball	f	842287d4-5e7f-41c8-96d6-5596651998ec
9ee81d2d-25b2-476c-a62d-7772b2190156	G?? P?? CHALMERS	Henrik Jernevad och Tomas Forsman, IT2002	g??_p??_chalmers	e452ff3c-ba2d-4a63-92f1-d8284feb6556	53fcad8b-9c6b-492e-9af6-26ecb593720f	Kv??llen ??r sen, Chalmers ??r stort.\n\nH??r sitter vi och super oss bort.\n\nSjunger n??n s??ng, tar oss en sup\n\nmaten ??r god, eller vad tycker duuuuu?\n\nJa man ska g?? p?? Chalmers,\n\nskratta och ha roligt.\n\ng?? p?? sittning, inte sitta hemma.\n\nnjut av festen, ta f??r dig av det mesta.\n\nf??r mycket av det goda,\n\ndet kommer upp p?? toa.\n\ndansar du runt p?? borden,\n\nl??r det va gl??mt gl??mt gl??mt\n\ngl????????mt\\..... i morron.\n\nVi kunde varit ute p?? en krog i G??teborg.\n\nEller suttit hemma och fl??tat p?? en korg.\n\nOch vi kunde pluggat ?? r??knat p?? matten\n\nvi sitter hellre h??r i natten.\n\nJa man ska g?? p?? Chalmers\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
94761b1c-11b7-4f97-84c2-9a7ce7968f3d	SENSOMMARPOESI	Unknown	sensommarpoesi	a6518bf6-6639-42b8-83d8-bde2fb027623	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Idas sommarvisa\n\nDu skall inte tro du blir br??tfull\n\nifall inte du s??tter fart\n\np?? flaskan och tar n??gra snapsar\n\nf??r d?? kommer luckorna snart.\n\nS?? trevligt att slippa f?? minnas\n\nallt l??jligt och tarvligt du gjort\n\nsom var det blev av dina pengar\n\noch hur dina kl??der kom bort.\n\nN??n g??ng kan man v??l g??ra bort sig\n\ns?? det tycker jag du skall f??\n\ns?? sjung nu och dansa p?? bordet\n\nskr??vla och sl??ss och st?? p??.\n\nSen ligger du l??rdag och s??ndag\n\noch v??ndas s?? gr??nblek och yr\n\noch sitter p?? jobbet p?? m??ndag\n\noch kurar vid sk??rmen och spyr.	f	842287d4-5e7f-41c8-96d6-5596651998ec
0f3080a2-9efd-473d-a065-37f875145278	SPRITBOLAGET	Unknown	spritbolaget	f6348ce1-d021-4c12-8ea1-cd8583784150	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel:Snickerboa\n\nTill spritbutiken r??nner jag och bankar p?? dess port.\n\nJag vill ha n??'t som br??nner bra och g??r mig sketfull fort.\n\nExpediten sa se godda',\n\nhur gammal kan min herre va'?\n\nHar du n??'t leg, ditt fula dr??gg?\n\nKom hit igen n??r du f??tt sk??gg!\n\nNej, detta var ju inte bra, jag ska bli full i kv??ll.\n\nD?? pl??tsligt en id?? fick jag, dom har ju sprit p?? Shell.\n\nM??nga flaskor stod d??r p?? rad,\n\nnu kan jag bli b??d' full och glad.\n\nDen r??da drycken ??kte ner,\n\nnu kan jag inte se n??'t mer!	f	842287d4-5e7f-41c8-96d6-5596651998ec
2ea8e77d-42cf-4158-b32c-24228a279f2d	INTEGRALVISAN	Unknown	integralvisan	7f134aa8-e581-42f1-b014-648433d47929	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Med en enkel tulipan*\n\nEn liten enkel integral\n\nett vektoranalystal\n\nni har besv??ret,\n\nni har besv??ret att derivera.\n\nMen tar man Stokes sats d??rupp??\n\ns?? blir det s?? enkelt s??\n\natt integralen, att integralen\n\nevaluera.\n\nOch rotationen, den integreras\n\nsen ??ver ytan utav en boll,\n\nkoordinaterna transformeras,\n\ns?? integranden blir bara noll.\n\nEn liten enkel integral\n\nett vektoranalystal\n\nkan va s?? dj??vlig\n\natt man ej hinner med n??got mera.	f	842287d4-5e7f-41c8-96d6-5596651998ec
9a750d80-ba3e-4178-be6f-55abeee14479	LILLE SUP	Unknown	lille_sup	2e50112b-433e-4776-b401-dcefbfc6b3f1	53fcad8b-9c6b-492e-9af6-26ecb593720f	Lille sup, lille sup,  \nlille s??te supen  \nnu ska du, nu ska du,  \nner igenom strupen	f	842287d4-5e7f-41c8-96d6-5596651998ec
ea6fc54e-5858-4018-b411-599b48b6f2be	IMSIG VIMSIG	Unknown	imsig_vimsig	5c0dc1b9-7487-44f6-9201-c71aba493f9e	53fcad8b-9c6b-492e-9af6-26ecb593720f	Imsig vimsig blir man, av ett litet glas  \nPulsen b??rjar ??ka, hj??rtat g??r i kras  \nB??da kn??na sk??lver och n??san den blir bl??  \nfast det ??r s?? l??skigt, pr??var vi ??nd??\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
9392a74e-c60f-4795-9272-4aea29bdb963	EN LITEN NUBBE	Unknown	en_liten_nubbe	5569dde1-cf8e-40b0-af5a-96e294356600	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: B??ttre och b??ttre...\n\nEn liten nubbe varje dag.\n\nEn liten nubbe varje dag.\n\nGl??m bort tentorna och sorgen,\n\nalla flickorna som givit dig korgen.\n\nVinb??r, Sk??ne eller Pors,\n\nL??t det rinna som en fors.\n\nMen aaaaaaah!\n\nDet ??r B??sken, ja, B??sken som ??r b??st!	f	842287d4-5e7f-41c8-96d6-5596651998ec
57cf8b63-03f0-4a48-a530-b4802eb45660	DENNA THAFT	Unknown	denna_thaft	8bbe035b-e42c-4f63-b4d8-e0748f559068	53fcad8b-9c6b-492e-9af6-26ecb593720f	Denna thaft\n\n??r den b??thta thaft thythtemet haft\n\nDenna thaft\n\n??r den b??thta thaft dom haft\n\nOch den thom inte har n??n kraft\n\nhan dricka thkall av denna thaft\n\nDenna thaft\n\ntill landth, till sj??th, till hafth.	f	842287d4-5e7f-41c8-96d6-5596651998ec
719c0461-c31d-4070-93ce-07e938e58fcf	LAMBO	Unknown	lambo	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Alla:*\n\nF??r nu glaset till din mun!\n\nTjofaderittan Lambo!\n\nOch drick ur, din fylle fylle hund!\n\nTjofaderittan Lambo!\n\nSe hur dropparna i glaset\n\nrinner ned i fylle aset.\n\nLambo! Hej! Lambo! Hej!\n\nTjofaderittan Lambo!\n\n*Solo:*\n\nJag nu glaset druckit har.\n\n*Alla:*\n\nTjofaderittan Lambo!\n\n*Solo:*\n\nEj en droppe finnes kvar!\n\n*Alla:*\n\nTjofaderittan Lambo!\n\n*Solo:*\n\nSom bevis jag nu vill v??nda,\n\nglaset p?? dess r??tta ??nda.\n\n*(Solisten v??nder glaset upp-och-ned ??ver huvudet )*\n\n*Alla:*\n\nLambo hej! Lambo hej!\n\nTjofaderittan Lambo!	f	842287d4-5e7f-41c8-96d6-5596651998ec
d0128de8-695e-46ee-9031-0f5143415165	H??STK??TT P?? V??GGA	Unknown	h??stk??tt_p??_v??gga	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Det h??ngde h??stk??tt p?? v??gga\n\nDet var s?? f??rskt s?? det gn??gga\n\nNi skulle h??rt vicka toner\n\nN??r vi k??ka makaroner\n\nF??r st?? inte d??r och snacka skit\n\nG?? upp p?? slakteri\\'t\n\nOch k??p en korvabit\n\nD??r finns allt vad du vill ha\n\nFr??n ost och marmelad till k??ttf??rs\n\nDet h??ngde h??stk??tt p?? v??gga\n\nDet var s?? f??rskt s?? det gn??gga\n\nNi skulle h??rt vicka toner\n\nN??r vi k??ka makaroner	f	842287d4-5e7f-41c8-96d6-5596651998ec
d6e81367-7013-4a6c-9546-7f4eebd4b24e	TYCKER DU OM MIG?	Unknown	tycker_du_om_mig?	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Svenska:\n\nH. Tycker du om mig?\n\nD. Ja, det g??r jag.\n\nH. ??r det riktigt s??kert?\n\nD. Ja, det ??r det.\n\nH. F??r jag komma till dig?\n\nD. Ja, det f??r du.\n\nA. Hopp sudderulle rudde rullan lej.\n\nJapanska:\n\nH. Pentax minolta?\n\nD. Honda mamiya.\n\nH. Yen kawasaki?\n\nD. Honda kyushu.\n\nH. Fuisiyama?\n\nD. Yen yokono.\n\nA. Sony akai maliyti yamaha\n\nGotl??ndska:\n\nH. Meun feuna rauka?\n\nD. Ja feur tausan.\n\nH. Aude recktit ricktit?\n\nD. Jau maun bauta.\n\nH. Keun jek gomme in dau?\n\nD. Jau meun bock.\n\nA. Tutta futta Visby tutta bauta mums.\n\nFinska:\n\nH. Hurmi ja pojkka?\n\nD. Koski ja kekko\n\nH. Kalevala penti?\n\nD. Koski ja kyll????.\n\nH. Saarij??rvi korva?\n\nD. Koski ja pell????\n\nA. Tunti ja pitti kitti kaiine kaks	f	842287d4-5e7f-41c8-96d6-5596651998ec
5ce47b0a-f5b3-4eb0-bf97-394c2fd4e726	STORSVENSKA SNAPS	Unknown	storsvenska_snaps	1d1889da-0a8d-42e1-89eb-863f63604c57	53fcad8b-9c6b-492e-9af6-26ecb593720f	Du gamla, du fina, du storsvenska snaps,  \nsnart randas ditt gl??djed??da ??de.  \nNog minns vi med saknad den tid d?? kr??nglet slapps,  \nditt l??ga pris och dina m??ngders fl??de.\n\nJag tronar p?? guld fr??n en r??nad bankir,  \nn??r chartrat mitt plan flyr Sveriges torka.  \nJag minns hur det var och jag anar hur det blir.  \n/: Ja, jag vill leva loppan p?? Mallorca :/	f	842287d4-5e7f-41c8-96d6-5596651998ec
8172173d-e262-4f37-92b2-11cbb3c700eb	DJUNGELPUNSCH	Unknown	djungelpunsch	a0da9d92-eabe-4dc8-8aa2-c570832a1f2f	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Var n??jd med...\n\nJag gillar alla tiders punsch\n\nEn punsch till frukost, punsch till lunch\n\nEn punsch till f??rr??tt, varmr??tt och dessert\n\nJag gillar punsch f??r vet du va'\n\nRent kaffe g??r ju ingen gla'\n\nS?? punsch i fulla muggar vill jag ha!	f	842287d4-5e7f-41c8-96d6-5596651998ec
db8d3609-eef6-43fc-8251-a993937ad3eb	S??NT ??R LIVET	Bill Cook	s??nt_??r_livet	993bb8e1-aff8-4681-82bc-d68496703c75	53fcad8b-9c6b-492e-9af6-26ecb593720f	S??n't ??r livet, s??n't ??r livet.\n\nS?? mycket falskhet bor det h??r,\n\nden man f??rlorar vinner en annan\n\ns?? h??ll i v??nnen som du har k??r.\n\nHan kom om v??ren, som en v??rvind.\n\nMin k??rlek fick han och allt han tog,\n\nmen s?? kom h??sten och all den k??rlek\n\nhan svor var evig - bara dog.\n\nS??nt ??r livet\\...\n\nHan fick en annan, jag har sett dem.\n\nHan verkar lycklig och hon ??r ung.\n\nDet jag har l??rt mig det ??r just detta,\n\nn??r hj??rtat svider; sjung blott sjung!\n\nS??n't ??r livet\\...\n\nV??rt liv ??r fattigt utan k??rlek, jag fick en annan som har mig k??r. Hans\ngamla flamma har f??tt korgen, hon undrar s??ker vem jag ??r.\n\nS??n't ??r livet\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
8f799eab-78f6-4660-b9c1-4691f0b3ea0b	KILLARNAS SK??L	Unknown	killarnas_sk??l	67fd4988-a421-44cc-b402-bf319021668d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Vi sk??lar f??r dem vi gillar\n\nVi sk??lar f??r v??ra killar.\n\nVi sk??lar f??r dom vi gillar.\n\nMen dom som vi inte gillar\n\ndom skiter vi i.	f	842287d4-5e7f-41c8-96d6-5596651998ec
dada6cd5-3888-446a-b714-70b693f1c241	N??R NUBBEN KOM TILL	Unknown	n??r_nubben_kom_till	5134cf1c-8a66-45f6-ab0f-9f33f1180fe2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Att nubben kom till jorden\n\nDet sk??tte gubben Noak om\n\nOch snart till kalla norden\n\nDen ??dla drycken kom\n\nOch d??rf??r s??ger mamma\n\nS?? ??r jag n??stan alltid glad\n\nTy nubben den g??r livet\n\nTill st??ndig solskensdag	f	842287d4-5e7f-41c8-96d6-5596651998ec
0ece64c7-6333-4c16-9a84-daba2e49ab79	KOMPILATORN	P.R.I.T. -04	kompilatorn	9d20a89b-37f3-455e-a2a0-553c825077b9	53fcad8b-9c6b-492e-9af6-26ecb593720f	T??nk om jag vore en liten kompilator  \nOmpa ompa fallerallera\n\nD?? skulle alla ha mig i sin dator  \nOmpa ompa fallerallera\n\nT??nk om jag vore ett Java run time error  \nOmpa ompa fallerallera\n\nD?? skulle alla lida av min terror  \nOmpa ompa fallerallera\n\n*Text: P.R.I.T. -04*	f	842287d4-5e7f-41c8-96d6-5596651998ec
8d7b1632-1d84-4c50-ac5b-202658a7625c	JAG F??NGADE EN SUP IDAG	Unknown	jag_f??ngade_en_sup_idag	7b9b0ae7-aca6-4b79-bcb7-effc2fc79462	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Jag f??ngade en r??v idag\n\nJag f??ngade en sup idag\n\nmen supen gled ur n??ven.\n\nMen lika glad f??r det ??r jag\n\nmen gladast ??r nog levern.\n\nTralalalalalalalalalalalala\n\nJag f??ngade en tjej idag\n\nmen tjejen slank ur s??ngen\n\nmen lika glad ??r jag f??r det\n\nvi fortsatte p?? ??ngen\n\nTralalalalalalalalalalalala\n\nJag mj??lkade en ko idag\n\nmen n??r jag s??g p?? juvret\n\ns?? hade jag nog tagit fel\n\nf??r gladast var nog tjuren\n\nTralalalalalalalalalalalala	f	842287d4-5e7f-41c8-96d6-5596651998ec
7f654d86-2088-4d85-825c-07d60cf72f67	FRITJOF OCH CARMENCITA	Unknown	fritjof_och_carmencita	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Samboronbon, en liten by f??rutan gata\n\nden ligger inte l??ngt fr??n Rio de la Plata. N??stan vid kanten av den\nbl??a Atlanten\n\noch med Pampas bakom sig,\n\nm??nga hundra gr??na. mil.\n\nDit kom jag ridande en afton i april\n\nf??r jag ville dansa tango.\n\nDragspel, fiol och mandolin\n\nh??rdes fr??n krogen och i salen steg jag in. D??r p?? b??nken i mantilj\n\noch med en ros vid sin barm\n\nsatt den bed??rande lilla Carmencita.\n\nMamman, v??rdinnan satt i vr??n.\n\nHon tog mitt ridsp??, min pistol och min manton.\n\nJag bj??d upp och Carmencita sa: - Si, gracias se??or v??mos ?? bailar este\ntango!\n\n\\- Carmencita lilla v??n,\n\nh??ller du utav mig ??n?\n\nF??r jag tala med din pappa och din mamma, jag vill gifta mig med dig,\nCarmencita!\n\n\\- Nej, don Fritjof Andersson,\n\nkom ej till Samboronbon,\n\nom ni hyser andra planer n??r det g??ller mig ??n att dansa tango.\n\n\\- Ack, Carmencita, g??r mig inte s?? besviken! Jag t??nkte skaffa mig ett\njobb h??r i butiken, sk??ta mig noga, bara spara och knoga,\n\ninte spela och dricka men bara ??lska dig. S??g, Carmencita, det ??r ??nd??\nblott med mig, s??g, som du vill dansa tango.\n\n\\- Nej, Fritjof, ni f??rst??r musik,\n\nmen jag tror inte ni kan st?? i en butik\n\noch f??rresten sa min pappa just idag att han visste\n\nvem som snart skulle fria till hans dotter.\n\nEn som har tjugotusen kor\n\noch en estancia som ??r f??rf??rligt stor.\n\nHan har prisbel??nta tjurar,\n\nhan har oxar, f??r och svin\n\noch han dansar underbar tango!\n\n\\- Carmencita, lilla v??n,\n\nakta dig f??r rika m??n!\n\nLyckan den bor ej i oxar eller kor\n\noch den kan heller inte k??pas f??r pengar. Men min k??rlek g??r dig rik,\n\nskaffa mig ett jobb i er butik!\n\nOch n??r vi blir gifta s??ta ungar ska vi f??\n\nsom kan dansa tango!	f	842287d4-5e7f-41c8-96d6-5596651998ec
5f9d9496-719e-4788-b09f-2fe131336b99	TREO	Unknown	treo	f28bdd92-ab5d-4bd5-b89b-24217e28c5b2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Vintern rasat...\n\nMorgonstund med smak av d??da b??vrar,\n\nfrukostmorgonen ??r ??ver oss.\n\nHur vi stretar, hur vi alla v??grar,\n\ns?? g??r solen lik f??rbannat opp.\n\nSnart ??r dagen h??r med hemska pl??gor,\n\nhuvudv??rk och ??ngest, el??nde, men\n\ndet finns faktiskt ett glas som kan dig r??dda:\n\nTreo-comp, v??r fr??lsare och v??n.	f	842287d4-5e7f-41c8-96d6-5596651998ec
50b87379-a2f0-4ed2-beb0-c78f8f0fda26	OASEN	Unknown	oasen	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Som ??kensand k??nns strupen ibland,\n\nOch man orkar inte b??ra hand\n\nFy farao ej rast eller ro,\n\nman blir nykter som en helig ko.\n\n//:N??r till och med en mumie\n\nf??r ryckningar i sarkofagen.\n\nDet spritter i kistan\n\nN??r ??rat h??r listan\n\nP?? supar som bjudes p?? v??r gasque!://\n\nHej sk??l!	f	842287d4-5e7f-41c8-96d6-5596651998ec
851e3c8d-8d9f-4b82-b3ea-03b3d9edbee0	STUDIEMEDELSRONDO	Unknown	studiemedelsrondo	0a1565da-8a1c-41ac-872f-9d4bda821d83	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: ??sa sand\n\n//: Vi dricker punsch\n\ntill lunch,\n\nn??r vi har f??tt avin.\n\nVi lunchar hela dagen\n\nTills kassan g??tt i sin.://\n\nRepris in absurdum	f	842287d4-5e7f-41c8-96d6-5596651998ec
5a2f2a4f-c607-45bb-81d6-8c30ece80431	F??DD I NORGE	Unknown	f??dd_i_norge	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel. Oh, my darling Clementine*\\\n\\\nF??dd i Norge, bor i Sverige,\\\nDanmark ??r mitt fosterland,\\\ntalar spanska som en jude,\\\nfast en engelsman jag ??r.\\\n\\\nFull idag och full imorgon,\\\ns?? ser livet ut f??r mig.\\\nK??rleksl??gan, den har slocknat,\\\njag skall aldrig gifta mig.\\\n\\\nP?? min gravsten ska det ristas,\\\ndet ska pr??ntas p?? latin.\\\nH??rinunder vilar liket\\\nav ett riktigt fyllesvin.	f	842287d4-5e7f-41c8-96d6-5596651998ec
27763691-701f-4d7f-bcf7-9a9221c3504c	LOVS??NG TILL SMURFEN	P.R.I.T. -04	lovs??ng_till_smurfen	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Smurfen, Smurfen, vackrare ??n\n\nAnkan och Kvasthilda!\n\nHur vi ??n t??nker s?? ??r han ju b??st\n\nVi ??lskar ju alla den Smurfen, Smurfen,\n\nvackrare ??n Hacke och Fantomen!\n\nHur vi ??n t??nker s?? ??r han ju b??st\n\nVi ??lskar ju alla den Smurfen, Smurfen,\n\nvackrare ??n Droopy och Lucky Luke!\n\nHur vi ??n t??nker s?? ??r han ju b??st\n\nVi ??lskar ju alla den Smurfen, Smurfen,\n\nvackrare ??n Marsipulami!\n\nHur vi ??n t??nker s?? ??r han ju b??st\n\nVi ??lskar ju alla den Smurfen, Smurfen,\n\nvackrare ??n Pippi och Snobben!\n\nHur vi ??n t??nker s?? ??r han ju b??st\n\nVi ??lskar ju alla den Smurfen, Smurfen,\n\nvackrare ??n James Bond!\n\nHur vi ??n t??nker s?? ??r han ju b??st\n\nVi ??lskar ju alla den Smurfen, Smurfen,\n\nvackrare ??n Asterix och Gaston!\n\nHur vi ??n t??nker s?? ??r han ju b??st\n\nVi ??lskar ju alla den Smurfen, Smurfen....	f	842287d4-5e7f-41c8-96d6-5596651998ec
0d0cc66e-680a-4c1c-b915-e9ed1c6cc191	HABEG??R	Unknown	habeg??r	ee4f8052-8e5d-4014-ae70-3fdff4b8c0a2	53fcad8b-9c6b-492e-9af6-26ecb593720f	N??r helan man tagit och halvan ska dricka\n\nDet k??nns som att kyssa en nym??lad flicka\n\nJu mera man f??r, desto mer vill man ha\n\nEn ensammer j??vel g??r alls ingen gla'	f	842287d4-5e7f-41c8-96d6-5596651998ec
10f26b86-7e31-465f-94c0-0e0bc9a16540	KORTA SOLEN	Unknown	korta_solen	4b99499a-20d4-4544-9ab4-8ce02b2201e6	53fcad8b-9c6b-492e-9af6-26ecb593720f	Solen den g??r upp och ner,\n\nSnapsen den g??r ner!	f	842287d4-5e7f-41c8-96d6-5596651998ec
cd8756cc-6e97-43fd-802d-7c8cc40e604d	JAG VAR FULL EN G??NG	Unknown	jag_var_full_en_g??ng	e83e6794-6e3d-434e-af9f-e2813af98384	53fcad8b-9c6b-492e-9af6-26ecb593720f	Jag var full en g??ng f??r l??nge sen,\n\np?? kn??na kr??p jag hem,\n\noch p?? v??gen tr??ffa jag en elefant, elefant.\n\nElefanten b??rja pinka och jag trodde det var ??hl,\n\nSedan dess har jag bli'tt kallad j??vla kn??l,\n\nmera ??hl!	f	842287d4-5e7f-41c8-96d6-5596651998ec
e96724b7-4b14-4ba0-baf4-1c9724dcaf5b	HOW ABOUT A KISS	Unknown	how_about_a_kiss	d9e2c9c0-e8ed-4c8c-8975-10bff2b38f4a	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Livet*\n\nSkjortan ??r h??rlig.\n\nMen ??ven ibland besv??rlig.\n\nN??r inte s??mnen vill sl?? till p?? natten,\n\nOch man ist??llet m??ste kasta va ..(tten).\n\nN??r man sen kissar,\n\nKan det h??nda att man missar.\n\nAtt f??lla bort den stora nattas??rken,\n\nOch s??dan kemtv??tt kostar skjortan!\n\nHEJA HEJA FRISKT HUM??R, SKJORTAN H??NGER UTANF??R!	f	842287d4-5e7f-41c8-96d6-5596651998ec
36fa5696-46e2-4587-b143-83756af68063	??N EN G??NG D??RAN	Unknown	??n_en_g??ng_d??ran	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	??n en g??ng d??ran, br??der,\n\n??n en g??ng d??ran!\n\nF??ljom den urgamla seden.\n\nIn till sista man, br??der,\n\nin till sista man,\n\ntrotsar vi hatet och vreden.\n\nBlankare vapen s??gs aldrig i en h??r\n\n??n dessa glasen, kamrater, i gev??r!\n\n??n en g??ng d??ran, br??der,\n\n??n en g??ng d??ran.\n\nSvenska hj??rtans djup - h??r ??r din sup!\n\nLivet ??r s?? kort, br??der, livet ??r s?? kort.\n\nLek det ej bort, nej var redo!\n\nK??mpa mot allt torrt, br??der,\n\nk??mpa mot allt torrt!\n\nT??nk p?? de gamla som stredo\n\nfram utan tvekan i floder av champagne,\n\nstyrkta fr??n b??rjan av br??nnvin fr??n v??rt land!\n\nK??mpa mot allt torrt, br??der,\n\nk??mpa mot allt torrt!\n\nSvenska hj??rtans djup - h??r ??r din sup!	f	842287d4-5e7f-41c8-96d6-5596651998ec
154a352f-ef78-48c2-94e1-96418393483a	FANS H??MND	Unknown	fans_h??mnd	0f7c660d-88a0-4679-909d-eb8b844d6fd0	53fcad8b-9c6b-492e-9af6-26ecb593720f	N??r som s??desf??lten b??ja sig f??r vinden\n\nSt??r n??n dj??vel d??r och b??jer dem tillbaks.	f	842287d4-5e7f-41c8-96d6-5596651998ec
4f514bf1-41b9-4811-abbd-6bb170a8259b	ODE TILL ??HLET	Unknown	ode_till_??hlet	72996c50-0345-4e44-b615-30345059e3b2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Trampa p?? gasen\n\nTu tu tu Tuborg\n\noch ca ca ca Carlsberg,\n\ndet ??r den b??sta\n\npilsnern som jag vet.\n\nTu tu tu Carlsberg\n\noch ca ca ca Tuborg\n\n??r det b??sta\n\n??let som jag vet.\n\nTu tu tu ??lberg\n\noch ca ca ca Pilsborg\n\ndet ??r den b??sta\n\nbiran som jag vet.	f	842287d4-5e7f-41c8-96d6-5596651998ec
8b0bf764-9d4a-4f33-9bad-6e35ca59835e	EN TAGGATR??	Unknown	en_taggatr??	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	En taggatr??, en taggatr??\n\nDet ??r en tr?? med taggar p??.\n\nOch ??r det inga taggar p??,\n\ns?? ??r det ingen taggatr??.\n\nEn taggatr??, en taggatr??,\n\nDet ??r en tr?? med taggar p??\n\nEn prickekorv, en prickekorv\n\ndet ??r en korv med prickar p??.\n\nOch ??r det inga prickar p??,\n\ns?? ??r det nog en falukorv.\n\nEn prickekorv, en prickekorv\n\ndet ??r en korv med prickar p??.\n\nEn busschauff??r --- man med glatt hum??r\n\nEtt pensionat --- pang med d??lig mat\n\nEn ingenj??r --- man som inget g??r\n\nEn taxibil --- bil med taxar i\n\nEn raggarbil --- bil med brudar i	f	842287d4-5e7f-41c8-96d6-5596651998ec
10d78618-bc1b-4d91-a46f-c7c1845add9d	SOMLIGA STRAFFAR GUD MED DETSAMMA	Unknown	somliga_straffar_gud_med_detsamma	e436881d-14e2-41c2-9a82-951a9e12c523	53fcad8b-9c6b-492e-9af6-26ecb593720f	Vojan, vojan han har skoj han.  \nKastar av sig enda dojan,\n\nDen andra med, lite p?? sned,  \nOch kl??ttrar snabbt in i kojan'.\n\nDen har han byggt av ett rutigt tyg,  \nSom han har stulit n??nstans i smyg,\n\nMen d?? precis, kom en polis,  \nOch han blev fast i handbojan.	f	842287d4-5e7f-41c8-96d6-5596651998ec
b8b5b072-4e3a-41a4-8845-957ee1efa27c	CHALMERS UTBILDNING	Unknown	chalmers_utbildning	03fcdc6c-d2a9-4bea-984f-81da519f91ab	53fcad8b-9c6b-492e-9af6-26ecb593720f	Chalmers utbildning ??r fin\n\nDricka ??hl och br??nnevin\n\nSen blir man ingenj??r\n\nDet ??r det som susen g??r, HEJ!	f	842287d4-5e7f-41c8-96d6-5596651998ec
f9890dc4-fcc7-491d-8e05-d9c7ddd81be0	SVEA SKIVGARDES NUBBEVISA	Unknown	svea_skivgardes_nubbevisa	e97b806e-04b3-4d1a-a203-78d64ca3d20d	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: H??r kommer lilla Ludde\n\nH??r kommer lilla nubben, h??h??, jaja.\n\nDen river som nubb den, h??h??, jaja.\n\nH??r kommer nubbens mamma, h??h??, jaja-\n\n????h... hon tar jag meddetsamma, h??h??, jaja.	f	842287d4-5e7f-41c8-96d6-5596651998ec
017790b0-6ecc-41da-8303-fb25cfabb9bd	EI SAA PEIT????	Unknown	ei_saa_peit????	e9c4c8e8-ed2b-480d-83b5-ecb86a82e17d	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: Bamsevisan*\n\nEi saa peitt????, Koskenkorva, Finland.\n\nYx, kax, kolme, mumintrollet nu.\n\nSauna, kalja, perkele ja viina.\n\nYx, kax, kolme, mumintrollet nu.\n\nKoskenkorva (sjunges 6 g??nger),\n\nKoskenkorva nu!\n\nEi saa peitt????, Koskenkorva, Finland.\n\nYx, kax, kolme, mumintrollet nu.	f	842287d4-5e7f-41c8-96d6-5596651998ec
3f0d57d0-8b2a-4f65-8284-63b1bf52cb16	TEMPERATUREN	Unknown	temperaturen	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Temperaturen ??r h??g uti kroppen,  \nN??rmare 40 ??n 37 komma fem!  \nS?? ska det vara n??r ??ngan ??r uppe  \nOch s?? ??r fallet i just detta nu!\n\n//: Vi rullar, vi rullar, vi rullar, vi rullar,  \nrullar, vi rullar, vi rullar, ?? hej://\n\nTemperaturen...\n\n//:Fram??t och bak??t och fram??t och bak??t  \nfram??t och bak??t och fram??t och bak??t://\n\nTemperaturen...\n\n//:K??lle och Ada och K??lle och Ada,\n\nK??lle och Ada och K??lle och Ada://	f	842287d4-5e7f-41c8-96d6-5596651998ec
e6fe1176-c0f3-4415-8334-582c41186843	TUNGVRICKARE	Unknown	tungvrickare	b6b40f9b-0661-49c1-8ae3-5610fbc61c1b	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: R??ven raskar ??ver isen\n\nR??ven raska r??va riset\n\nriset raska rena r??ven.\n\n?? r??va ris, ?? r??ven r??s,\n\n?? riva r??ven i r??ven.\n\nFinnen finna femton flaskor\n\nflickan finna finnen fyller.\n\n?? finnen fes, ?? flickan fl??s,\n\n?? fira flickan ?? flaskan.\n\nLudvig l??ra leva loppan\n\nLisa l??ngtar Ludvig l??ra.\n\n?? Ludvig l??g, ?? l??xan l??r,\n\n?? leva loppan i ladan.	f	842287d4-5e7f-41c8-96d6-5596651998ec
9c963d90-edeb-48ce-9b32-aeebd0503c69	VIKINGEN	Unknown	vikingen	3b401eac-fb63-446b-9657-5c9593c4f709	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: When Johnny comes marching home\n\nEn viking ??lskar livets vann  \nHurra, hurra!  \nDen hastigt i hanssvalg f??rsvann  \nHurra, hurra!\n\nTill kalv, till oxe, till sill och till fl??sk,  \nn??r k??rringar bara dricker l??sk.  \nJa, d?? vill alla vikingar ha en b??sk.\n\nN??r b??sken sm??ningom ??r slut  \nTragik, tragik  \nD?? b??res varje viking ut  \nsom lik, sig lik\n\nOch se'n, om vi vaknar, vi sjunger en bit,  \nse'n korkar vi upp Sk??nes Aquavit  \nSk??l f??r alla vikingar som kom hit!	f	842287d4-5e7f-41c8-96d6-5596651998ec
23d118bf-4f5c-4d07-bfd1-f19bb600c40a	DRUNKEN SAILOR	Unknown	drunken_sailor	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	What shall we do with the drunken sailor,\\\nwhat shall we do with the drunken sailor,\\\nwhat shall we do with the drunken sailor,\\\nearly in the morning?\\\nHooray, up she rises,\\\nhooray, up she rises,\\\nhooray, up she rises, early in the morning.\n\nPut him in the longboat till he\\'s sober.\n\nPull out the plug and wet him all over.\n\nPut him in the bilge and let him drink it.\n\nPut him in a leaky boat and make him bale it.\n\nPut him in the scuppers with the hosepipe on him.\n\nShave his belly with a rusty razor.\n\nKeelhaul him until he\\'s sober.\n\nPut him in a bed with the captains daughter	f	842287d4-5e7f-41c8-96d6-5596651998ec
904649f8-80d3-4cd8-b688-96b877864af3	KALMAREVISAN	Unknown	kalmarevisan	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	Hej dick\\\nHej dack\\\nJag slog i\\\noch vi drack\\\nHej dickom dickom dack\\\nhej dickom dickom dack.\\\nF??r uti Kalmare stad\\\nja d??r finns det ingen kvast\\\nf??rr??n l??rdagen.\\\n\\\n/: N??r som bonden kommer hem\\\nkommer bondekvinnan ut :/\\\noch ??r stor i sin trut\\\nHej dick . . .\n\n/: Var ??r pengarna du f??tt ?\\\nJo, dom har jag supit opp ! :/\\\nUpp?? Kalmare slott.\\\nHej dick . . .\n\n/: Jag skall m??la dig an\\\nf??r v??r kronbefallningsman :/\\\nOch du skall f?? skam\\\nHej dick . . .\n\n/: Kronbefallningsmannen v??r\\\nsatt p?? krogen i g??r :/\\\nOch var full som ett f??r.\\\nHej dick . . .	f	842287d4-5e7f-41c8-96d6-5596651998ec
6f414c66-4c5f-4771-a38f-f1a7d486e0cf	SK??L F??R IT	P.R.I.T. -04	sk??l_f??r_it	be3b1d53-7310-4dc9-85da-4700e99be42a	53fcad8b-9c6b-492e-9af6-26ecb593720f	N??r IT har kalas det blir en v??ldig fart,\n\nAtt vi har det kul ihop ??r underbart\n\nf??r turkost och smurfar vi lyfter v??r kopp,\n\nf??r d?? ??r st??mningen h??gst p?? topp,\n\n//:Sk??l f??r alla IT som kom hit!://\n\n*Text: P.R.I.T. -04*	f	842287d4-5e7f-41c8-96d6-5596651998ec
75431394-2fe6-4c3c-acf1-bcc9e2e8b657	MANNEN OCH KVINNAN	Unknown	mannen_och_kvinnan	de50a8ff-e9d8-4553-be07-b37006fb2651	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Mors lilla Olle\n\nHerrar\n\nKvinnan ??r b??de p?? ont och p?? gott,\n\nHur komplicerad har ingen f??rst??tt\n\nSnar till att kyssas, men slug som en varg,\n\nkvinnan kan g??ra dig lycklig och arg.\n\nDamer\n\nMannen han tror han ??r listig och klok,\n\nfast han ??r l??ttl??st som en sagobok.\n\nSkryter om allting som han k??nner till,\n\nhuvet kan vridas precis vart vi vill.\n\nHerrar\n\nKvinnan, som flyr f??r en vit liten mus,\n\nt??mjer en make s?? stor som ett hus\n\nSlog dig i skallen med skyffeln i g??r,\n\nnu ??r hon systern som v??rdar ditt s??r.\n\nDamer\n\nHan kan va' rektor, polis och major,\n\nmen han ??r gossen som aldrig blir stor.\n\nDagtid han ??gnar ??t stora f??rlopp,\n\nkv??llen han lindas kring min fingertopp.\n\nHerrar\n\nGrym som en bofink och sn??ll som en katt,\n\nbakar sitt dagliga br??d f??r en hatt.\n\nF??rst ??r det ja och p?? kv??llen ??r det nej,\n\nj??mt n??r du tror att hon vill, vill hon ej.\n\nDamer\n\nMannen ??r modig och t??ler en t??rn,\n\nensam i skogen han skjuter en bj??rn\n\nVet hur han f??ngar den sv??raste fisk\n\nbleknar s?? fort han ska torka en disk.\n\nAlla\n\nMannen och Kvinnan varann ej f??rst??r\n\nhar sina fel, han och hon, men ??nd??.\n\nSant som att himlen f??r evigt ??r bl??,\n\nskall allting klaffa - beh??vs b??da tv??.	f	842287d4-5e7f-41c8-96d6-5596651998ec
420b708f-5a66-4edb-b868-ca8b008a8ce7	JAG ??TER INTE KLOCKOR	Unknown	jag_??ter_inte_klockor	12b107b9-c970-44d2-a27a-0f475436b6bc	53fcad8b-9c6b-492e-9af6-26ecb593720f	*Mel: F??r jag l??mna n??gra blommor*\n\nJag ??ter inte klockor,\n\nmen jag dricker g??rna ur.	f	842287d4-5e7f-41c8-96d6-5596651998ec
33be6bb7-2dc2-454c-9221-71b924d87ab5	MINNE	Unknown	minne	20227e18-8237-4520-8f35-5ab21e1d72e2	53fcad8b-9c6b-492e-9af6-26ecb593720f	Minne, jag har tappat mitt minne.\n\n??r jag svensk eller finne?\n\nKommer inte ih??g.\n\nInne, ??r jag ut' eller inne?\n\nJag har luckor i minne'\n\nS??n' d??r sm?? alkohol\n\nMen besinn' er\n\nMan t??tar med br??nnvin man f??r\n\nFast??n minne' och helan g??r	f	842287d4-5e7f-41c8-96d6-5596651998ec
fb289cac-f289-47e0-8e56-e5fe2b417784	GL??DJET??REN	Unknown	gl??djet??ren	d5cf022c-89ce-4069-a2c9-2b6fb4a0c98a	53fcad8b-9c6b-492e-9af6-26ecb593720f	Helan, sk??na helan!  \nLjuva droppar i en gl??djet??r.  \nHelan, fegt att dela'n!  \nDen ger styrka och du b??ttre m??r.\n\nMen spriten, d??dar l??ngsamt har man sp??tt!  \nTur det, f??r vi har ju knappast br??tt.\n\nLivet, det ??r givet.  \nDet ska levas fyllt av gl??dje  \nNi m??ste medge:  \nB??st ??r en gl??djet??r!  \nB??st ??r en gl??djet??r!\n\n*Ur Chalmersspexet Viktoria, 1986*	f	842287d4-5e7f-41c8-96d6-5596651998ec
424aeb03-c6dc-4505-97bd-93ac73ea83df	MY BONNIE	Unknown	my_bonnie	bf5a9104-552f-402d-9c94-48e2008acfdc	53fcad8b-9c6b-492e-9af6-26ecb593720f	My Bonnie lies over the ocean,\n\nMy Bonnie lies over the sea,\n\nMy Bonnie lies over the ocean\n\nOh bring back my Bonnie to me.\n\nBring back, Bring back,\n\nBring back my Bonnie to me, to me,\n\nBring back, Bring back,\n\nOh bring back my Bonnie to me.	f	842287d4-5e7f-41c8-96d6-5596651998ec
16c9e256-6de7-4654-afd9-90e858e52eb3	MERA M??N	Unknown	mera_m??n	86fd87bc-d4fb-4cdd-8848-f68933ea8b19	53fcad8b-9c6b-492e-9af6-26ecb593720f	Mel: Feta Franssyskor\n\nVi vill ha mera m??n, vi vill ha flera m??n!\n\nVi vill ha stora, starka, muskul??sa m??n!\n\nDe ska ha h??r p?? br??st\n\noch djup och sexig r??st,\n\ns?? att de orkar med oss tills i morgon kv??ll\\...\n\nD?? kommer nya m??n, d?? kommer krya m??n.\n\nD?? kommer unga fr??scha, of??rst??rda m??n!\n\nVi skall f??rf??ra dem,\n\nvi skall f??rg??ra dem,\n\ns?? att de kryper hem fr??n oss p?? morgonen\\...\n\nS?? kommer morgonen, i hand med morkkisen.\n\nDet ??r nog dags att ta en iskall ??l igen.\n\nVi drar till f??rsta bar\n\noch dricker allt de har\n\noch sen s?? raggar vi en solbr??nd sexig karl\\...\n\nSe vilken modig man och t??nk p?? allt han kan!\n\nHan ??r ju sexig, stark, dessutom har han charm!\n\nHan vill ha med oss hem,\n\natt prova ut hans s??ng,\n\nmen vi skall g??ra honom till v??r lilla dr??ng\\...	f	842287d4-5e7f-41c8-96d6-5596651998ec
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
f409dc39-d61b-44a7-9542-7d7f7460349f	B??sk		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
bf36727f-7f2d-4508-a9c4-59d5ae0fe4d7	Allm??nt		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
52b724cf-44bf-4d26-87d9-71ea6605d4e1	Dagen efter...		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
fc792348-2aa0-486f-8f30-825679f909ef	??hl		0	0	0	842287d4-5e7f-41c8-96d6-5596651998ec
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

