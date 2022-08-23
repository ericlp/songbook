-- Adminer 4.8.1 PostgreSQL 14.5 (Debian 14.5-1.pgdg110+1) dump

DROP TABLE IF EXISTS "image";
CREATE TABLE "public"."image" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "name" text NOT NULL,
    CONSTRAINT "image_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "melody";
CREATE TABLE "public"."melody" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "melody" text NOT NULL,
    "link" text NOT NULL,
    CONSTRAINT "melody_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "melody" ("id", "melody", "link") VALUES
('563aa916-4e9c-4745-846b-7c451e5b372e',	'UNKNOWN',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('035b8fd3-0b1f-4696-8394-e72dac75311f',	'Old man river',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('a946d10a-75f4-47ed-b178-b74c609deb24',	'Mors lille Olle',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('83ac3731-4cc2-4644-a3e2-3eadaed7da4b',	'Röda kavalleriet',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('de7c3600-b5f3-4460-b688-46b8be46f26d',	'Här kommer Karl-Alfred boy',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('95fad300-cf74-4327-bb7b-db3f99c14b14',	'Gubben Noak',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('bb306f30-9787-4f09-87d0-b25dd5d946b8',	'My Bonnie',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('04614a20-bac8-441f-9f0c-518fe7800300',	'Hej tomtegubbar',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('41179bf4-1efa-4c96-9677-9a752eddf04f',	'En sockerbagare',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('1437da89-619a-4c23-80e5-b4ee7bd2943f',	'Byssan lull',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('cf00b122-2474-4655-9009-89b5e4b9c152',	'Du gamla, du fria',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('0f0096b7-8a40-4611-a807-e511f8a86014',	'Hej tomtegubbar',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('fd7120de-2963-4b5c-96e7-bb9feaf62fe8',	'Vikingen',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('691c5d39-d925-44f2-b41c-0561d9b970f5',	'O helga natt',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('5c9893b4-e88a-4a6f-be29-a613a70eb47a',	'Du ska få min gamla cykel',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('f354ba4f-1805-488c-9e54-943e42cd4eb6',	'Räven raskar över isen.',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('99d055d6-8a06-4a8c-a890-0e460f682038',	'Fritjof och Carmencita',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('34df3b63-51c3-4eaf-b196-8187a1125302',	'Räven raskar över isen',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('d84a236a-80c7-46ac-8c76-b325cd7a11b0',	'Kalle på spången',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('0e0a94d5-743d-49f4-bf66-bb0f64be81c1',	'Glada Änkan',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('03f4b512-2cd3-486a-81aa-646d912883ed',	'Når månen vandrar...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('847cf9dd-c2a7-4632-bc82-0dc9b4912e94',	'När Lillan kom till jorden',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('4d15d003-a19d-465b-88eb-acd4e746c439',	'Marseljäsen',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('fb1fa75a-2add-4938-a522-9e90cc85c101',	'Väva vadmal',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('a0e3725f-364c-4f5f-8a80-79411e274573',	'Bättre och bättre...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('7c20091f-e128-4c7a-97a9-5728d94a1b1f',	'Lille Katt',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('b73d6844-3629-4498-ae1b-2863b533ac21',	'Nu är det jul i alla hus...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('fb57c145-0b96-446a-9af4-a20b6a653483',	'Lambeth walk',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('342c5c55-3f55-4958-8909-6642fe933505',	'Stympad',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('c65a1b0a-9b18-4a1d-97f9-ebda346c4799',	'Med en enkel tulipan',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('41488dba-fd7b-4af1-a6d7-cac51b39c0d0',	'Daggstänkta berg',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('990ef835-2c69-4154-90ff-94801bb61a71',	'Oh when the saints',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('2e8c6152-5b5f-4685-84d9-0fa3c65fb5e0',	'Här kommer lilla Ludde',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('618f47ec-19f3-4864-aa10-33c6d937560a',	'Helan går',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('56b107bd-bb22-4393-a48e-6c5b1adc5f3a',	'Helan går',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('24d3b4c1-80f8-4f3a-8dd5-0c73ec70a575',	'Byssan lull',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('fc33635f-a61b-42fe-8c5f-e043a3e03f63',	'Sov du lilla videung',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('b72b803d-be8f-43ca-b3a2-12c68d53a9e5',	'Snickerboa',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('540f9adc-ac3a-4d12-8c2f-edee329c672a',	'Vikingen',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('7bad0fc3-c2f3-439e-8494-81f246914662',	'refr. Av tre trallande jäntor',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('98a72712-6fcc-405c-a034-be9605913109',	'Broder Jacob',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('e9f4536d-64dd-45fd-a07a-456ee98dbba5',	'Internationalen',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('ee86ab2c-7280-4878-851f-c78f0cb2ec01',	'När månen vandrar',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('0a492b87-dfd6-4c2b-a73e-92f86f9c9a96',	'Bamse',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('39e9f1ac-f00a-427d-b745-9d34262e94bb',	'Gôtt å leva - Galenskaparna',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('f4c8443d-3bcc-410b-9ccf-88f8cc6f7a95',	'Livet',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('bb2ae271-b0c1-40d9-a4e4-4a12ffeb102b',	'Jag fångade en räv idag',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('a6cbd332-8796-4296-83a4-f4e365a93d31',	'Räven raskar',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('3ae07c7e-c7fb-4f61-b859-c94f0815ef4f',	'Armen i vinkel (ramsa)',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('08f313dd-72bc-4571-852a-da87d67ae63a',	'En sockerbagare',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('5c69c1fa-925e-4429-b16b-c189e44ee67b',	'Camptown ladies',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('facdef61-af7d-4350-9513-905b56e717e4',	'You Can Have Her',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('5255cad7-66ef-4845-93a8-9a5873a35fcc',	'Bamsevisan',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('1ad340d9-4208-456e-bb19-331219d98c6d',	'Svenska nationalsången',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('0ea6a41b-72ca-4874-92df-64f55bb6c1d5',	'Härlig är jorden',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('6016d2e7-540d-4719-be92-d75b42376a67',	'Camptown ladies',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('06fcba5d-7e82-4342-8958-d53a9c741b0e',	'Ritsch ratsch',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('b8f9914c-b534-4026-aaeb-337a67401479',	'Familjen Flinta',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('4c4018e5-fc28-4b89-a8a3-6f5a8e023e06',	'Vi äro små humlor vi...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('07fbb2a6-aa0e-4654-8757-a4faabbdd387',	'Om jag hade pengar',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('acda1076-4d52-4c1b-a415-dc84ccb2d7fa',	'Emil I Lönneberga',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('404c24cd-7dea-4e4c-9ab3-9e4725631c99',	'My Bonnie',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('965c9b48-b8ab-4e91-9604-fd7dde4e8b0a',	'Vila vid denna källa',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('73628a6b-3378-4a1a-a20b-7aef531baff3',	'Jag har en gammal moster',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('cdfb3b35-5442-4de4-8963-6ff430dfe238',	'Ja se det snöar',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('e1a84d52-a8f9-4e66-9727-7d615f445de0',	'Oh, Tannenbaum',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('cf449815-4a34-4434-9ad8-9bfb41df0a99',	'Mors lilla Olle',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('aa205e86-25d5-4ba3-a594-49bf569c4d3d',	'It''s a long way to...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('eaff0671-758d-40c1-8ea9-2fe46a2b75ea',	'I sommarens soliga dagar',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('10654b5b-c2fe-4965-8af8-47e843961da0',	'Med en enkel tulipan',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('8444e63e-416d-422a-9fe2-f84c63c429a4',	'Längtan till landet',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('704ad9b0-3754-4d6a-afe5-e827531f5986',	'Tre pepparkaksgubbar',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('ea01e40f-dbb8-44d3-acff-92c9d782aa0c',	'Sankta Lucia',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('ecb38572-f0af-4e9c-83f3-c6f1e3796ecb',	'Får jag lämna några blommor',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('2e8a020a-f698-4bf4-b4b7-555453a1974c',	'Uti vår hage',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('c93120fc-7f2b-412a-aa13-c15564a3bfaf',	'My Bonnie',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('b83a4110-6069-4f1c-bc9b-fa58409fa26a',	'Man skall ha husvagn',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('ec25f120-c8d8-4060-af77-f68ecf77fe02',	'Gamla slott och herresäten',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('62ee6a8e-af3b-4e0a-b38e-377575884416',	'When Johnny comes marching home',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('b4af7a64-674e-4529-94b9-7eda52064357',	'Feta Franssyskor',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('328a1ccc-464b-4713-8e33-941933d0ba1f',	'Ju mer vi är tillsammans',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('b4956bbf-c833-4395-96a3-10066af75f5b',	'En sockerbagare',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('c705d8a4-f966-4d3b-abdf-0fffb96b0ef4',	'White christmas',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('ae0e14a4-5520-4aaa-854b-2472cf43e6e5',	'Katjuscha (rysk folksång)',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('f0010763-0aa0-41be-a1ca-ff71c7a74eb4',	'Ritsch, ratsch, filibom\...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('c4b58d11-6cb2-4ff9-b749-877b6d570193',	'Annie get your gun',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('be5a2d6b-e773-4e28-86b0-05fb9e8bd0bd',	'Var nöjd med...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('e7bc8e2f-b084-442f-8745-bcb435433f29',	'Ösa sand',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('709f61cf-be93-48cf-85db-ee7375f3bed9',	'Ding dong Merrily on high',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('afce6c7e-f2cd-4463-860e-3b104032db72',	'Trampa på gasen',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('4981d6de-4098-45e1-95b0-41a2f0ffa201',	'Mors lille Olle',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('a68e33e6-0eb8-406d-8240-3c40bb380113',	'Memory',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('3d179d26-5192-45a6-909d-35874a6b6bc0',	'Sjösala vals',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('c1a47088-425a-48f2-abb8-cfa541f95f67',	'Vi skålar för dem vi gillar',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('fdf5a80b-864d-48fc-8346-e34264ebff46',	'Nu tändas tusen juleljus',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('c7b8f3f1-d42b-4f18-8057-98b36bca0c23',	'Pippi Långstrump',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('6a28cc67-f568-4b70-8e74-ea0cf3f2e478',	'Marsche militaire av Franz Schubert',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('58cbdb78-dcc9-4605-b74c-b3cf708f7ff6',	'Gärdebylåten',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('62afd946-1269-4d68-a0d4-ed5d92539f46',	'Tänk om jag hade en liten apa...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('707a1e9a-a95e-4337-92af-4b27cc2afd72',	'Röda kavalleriet',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('801a7885-de62-4ccc-a6ad-80abbfcd91c5',	'Lambeth walk',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('0a36a8ee-b618-4d44-94df-61c16390432e',	'Vem kan segla...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('5fb8c97a-de42-415b-a635-4041ddd305ad',	'Sjösala vals',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('fd3f00e5-9534-4d8c-955c-585b65fc555b',	'Schottis på Valhall',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('ccfb13ed-31ab-419f-8e5b-8794b5d48705',	'Änglamark',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('a77eb650-87f7-4eb4-8991-d95034ae25a3',	'Imse Vimse',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('61ff28fe-b718-48fe-aeda-ad66252ba70d',	'Bär ner mig till sjön',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('02307557-1618-4315-9e4d-4d92be108d8c',	'Vintern rasat...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('6f5402ba-21f6-45ac-b32a-b9cedf732cc5',	'Sudda bort din sura min',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('df558eb1-0bcd-4062-ac4d-f720d60d45cd',	'Bättre och bättre dag för dag',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('71c92a56-9fbc-4509-b367-cee622bd96c6',	'Lille katt',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('2d0f9a3a-ea44-47f7-bc1b-355beed50dfe',	'Glada Änkan',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('aa73145d-9394-403a-8aa8-c8c3cf78d35f',	'Kamomilla stad',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('d4256d39-7b96-45e8-b250-6a16fc8e3d6e',	'Flottarkärlek',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('1705e242-95f2-42af-87c1-137c5cac58b1',	'Marseljäsen',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('5581cd58-9719-45d4-9020-465aeeb809df',	'Idas sommarvisa',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('be541d14-0bf9-426d-891a-e9cc7596e3db',	'Du skall få min gamla...',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('6dffa3f5-6029-4f04-bd97-45aeb1b8eb53',	'We will rock you - Queen',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('886f0075-dac1-4492-8d5e-c982f37ae956',	'When you wish upon a star',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('18e67e5e-4dd3-49a6-a0ca-3e55727e9506',	'Midnatt råder',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('96a8132c-e6ec-4459-9b83-5fe939eb496f',	'Barndomshemmet',	'https://www.google.com/search?hl=en&q=unknown%20melody'),
('91f18bd2-fd56-4cbe-aef6-1ebc2fa221c4',	'Row your boat',	'https://www.google.com/search?hl=en&q=unknown%20melody');

DROP TABLE IF EXISTS "official_song_book";
CREATE TABLE "public"."official_song_book" (
    "song_book_id" uuid NOT NULL
) WITH (oids = false);

INSERT INTO "official_song_book" ("song_book_id") VALUES
('4ab4c691-d76b-4a91-bee9-fb732517a1c2');

DROP TABLE IF EXISTS "owner";
CREATE TABLE "public"."owner" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "name" text NOT NULL,
    CONSTRAINT "owner_name_key" UNIQUE ("name"),
    CONSTRAINT "owner_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "owner" ("id", "name") VALUES
('af064f1c-0bac-4fd5-ac3d-7d29c107051f',	'sexit');

DROP TABLE IF EXISTS "schema_migrations";
CREATE TABLE "public"."schema_migrations" (
    "version" bigint NOT NULL,
    "dirty" boolean NOT NULL,
    CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version")
) WITH (oids = false);

INSERT INTO "schema_migrations" ("version", "dirty") VALUES
(20220819221951,	'0');

DROP TABLE IF EXISTS "song";
CREATE TABLE "public"."song" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "title" text NOT NULL,
    "author" text NOT NULL,
    "unique_name" text NOT NULL,
    "primary_melody" uuid NOT NULL,
    "secondary_melody" uuid,
    "text" text NOT NULL,
    "deleted" boolean NOT NULL,
    "owned_by" uuid NOT NULL,
    CONSTRAINT "song_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "song_title_key" UNIQUE ("title"),
    CONSTRAINT "song_unique_name_key" UNIQUE ("unique_name")
) WITH (oids = false);

INSERT INTO "song" ("id", "title", "author", "unique_name", "primary_melody", "secondary_melody", "text", "deleted", "owned_by") VALUES
('8092f5b0-5ff3-484c-9f6e-226b3b56c403',	'FÖDD I NORGE',	'Unknown',	'nqlf',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'*Mel. Oh, my darling Clementine*\
\
Född i Norge, bor i Sverige,\
Danmark är mitt fosterland,\
talar spanska som en jude,\
fast en engelsman jag är.\
\
Full idag och full imorgon,\
så ser livet ut för mig.\
Kärlekslågan, den har slocknat,\
jag skall aldrig gifta mig.\
\
På min gravsten ska det ristas,\
det ska präntas på latin.\
Härinunder vilar liket\
av ett riktigt fyllesvin.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('bf4b0a30-1542-478a-bfbb-25a5383f6ae7',	'RATATATA',	'Unknown',	'vnox',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Att dricka brännvin är en sed som ingen har oss lärt.

Från början vi ej kunde, men det var blott temporärt.

Så lärde vi oss själva, och nog var det värt besvär''t.

Tutilurenbom tutilurenpang, nog var det värt besvär''t.

//:Rattatta, så tar vi oss en tuting. Rattatta, med mycket brännvin i.
Rattataa, rattataa, dricka brännvin gillar ja'', för jag blir så glad
ida''!://',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('5d94e1cd-10ac-49df-b2f9-af2a651801ff',	'OP RIVER',	'Unknown',	'syyu',	'035b8fd3-0b1f-4696-8394-e72dac75311f',	NULL,	'*Mel: Old man river*

OP river, ja OP river,

Var gång jag lenat

Min hals med renat

Jag sagt med iver,

Att OP river,

Långt ner.

Mången glädes,

När han får sädes,

Och fattighjonet,

Syns le mot kronet,

Men faktum bliver,

Att OP river,

Långt ner.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('555fc247-e8c1-40d3-8187-fcfd82c3bd9f',	'MORS LILLE OLLE',	'Unknown',	'tfkg',	'a946d10a-75f4-47ed-b178-b74c609deb24',	NULL,	'Mors lilla Olle,
på krogen satt
rosor på kinden men
blicken var matt
Läpparna små,
liksom näsan var blå
bara jag kunde
så skulle jag gå.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('dd765cca-80ff-4bfd-8096-1b94037c8e10',	'LIFE',	'Unknown',	'nwqw',	'83ac3731-4cc2-4644-a3e2-3eadaed7da4b',	NULL,	'Life is a pleasure!
Tovarisch, a great big pleasure!
All of our troubles are reduced to zero
when we have got a drop to wet our gum.

Let\''s have a vodka!
Tovarisch, a little vodka!
Empty your goblet like a Viking hero;
there will be many more to come
\-- Hey!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('79c44c8c-b9f4-4681-8bc6-61ba7696455b',	'BRÄNNVIN ÄR JÄVLIGT',	'Unknown',	'yblk',	'de7c3600-b5f3-4460-b688-46b8be46f26d',	NULL,	'För brännvin är jävligt gott,

smakar bättre ju mer man fått.

Men går man i golvet

så där mellan tolv och ett,

så slår man sig jävligt hårt.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('d28de812-d308-4dc1-a2e8-dfc55e8545ed',	'NUBBEN GOA',	'Unknown',	'znge',	'95fad300-cf74-4327-bb7b-db3f99c14b14',	NULL,	'Mel: Gubben Noak

Nubben goa, nubben goa

är en hederssup.

Uti alko-hålet,

töm den om du tål''et.

Nubben goa, nubben goa

är en hederssup.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('e26028da-6163-46a8-ab26-26aa615ea3ef',	'OUR FAMILY',	'Unknown',	'ahdo',	'bb306f30-9787-4f09-87d0-b25dd5d946b8',	NULL,	'*Mel: My Bonnie*

My father makes counterfeit money,\
My mother brews synthetic gin.\
My sister sells kisses to sailors,\
By Jove how the money rolls in!.

/: By Jove, By Jove, By Jove how the money \
 rolls in, rolls in! :/

My brother is a slum missionary,\
saving young maidens from sin.\
He\''ll save you a blond for a shilling,\
By Jove how the money rolls in\''

By Jove \...

My aunt keeps a girl\''s seminary,\
teaching young girls to begin.\
She doesn\''t say where they\''re to finish,\
By Jove how the money rolls in!

By Jove \...

My father has spent all his money,\
My mother has drunk all her gin.\
My sister has sold all her kisses.\
and no more money rolls in! \
By Jove\....',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('5e738b9e-5296-41bf-b0bb-3c0241a41575',	'OASEN',	'Unknown',	'hbyx',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Som ökensand känns strupen ibland,

Och man orkar inte bära hand

Fy farao ej rast eller ro,

man blir nykter som en helig ko.

//:När till och med en mumie

får ryckningar i sarkofagen.

Det spritter i kistan

När örat hör listan

På supar som bjudes på vår gasque!://

Hej skål!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('fbf4872e-09cb-4745-8855-d8b32c709aa9',	'LILLA NUBBEN',	'Unknown',	'stwm',	'04614a20-bac8-441f-9f0c-518fe7800300',	NULL,	'//:Tänk om jag hade lilla nubben på ett snöre i halsen://

Jag skulle dra, den upp och ner, så att den kändes som många fler.

Ja, tänk om jag hade lilla nubben uppå ett snöre i halsen!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('66edf33d-f48b-4cc9-af78-c258cb0fe923',	'KOPPARSLAGAREN',	'Unknown',	'qrga',	'41179bf4-1efa-4c96-9677-9a752eddf04f',	NULL,	'Mel: En sockerbagare

En kopparslagare jag har i knoppen

jag har försökt att på den få stopp men

det hjälper inte med magnecyl

ej heller treo eller albyl

Och i mitt barskåp blott tomma burkar

det blev helt länsat i natt av skurkar

som lämnat mig här i hemmet torrt

med värk i huvud jag vill få bort.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('958455cd-fa6a-4d39-bd91-fbffe33b9982',	'**BYSSAN LULL**',	'Unknown',	'snwh',	'1437da89-619a-4c23-80e5-b4ee7bd2943f',	NULL,	'Mel: Byssan lull

//:Byssan lull utav vinet blir man full,

och slipsen man doppar i smöret://

Ja, näsan den blir röd,

Och ögonen får glöd,

Och tusan så bra blir humöret.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('9ec0f28b-4c19-4995-8216-d8c613b9351f',	'STORSVENSKA SNAPS',	'Unknown',	'tpjj',	'cf00b122-2474-4655-9009-89b5e4b9c152',	NULL,	'Du gamla, du fina, du storsvenska snaps,
snart randas ditt glädjedöda öde.
Nog minns vi med saknad den tid då krånglet slapps,
ditt låga pris och dina mängders flöde.

Jag tronar på guld från en rånad bankir,
när chartrat mitt plan flyr Sveriges torka.
Jag minns hur det var och jag anar hur det blir.
/: Ja, jag vill leva loppan på Mallorca :/',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('b258b06e-485a-4816-a9db-f2b35c00ec53',	'VART ÄR KYPARN?',	'Unknown',	'xeht',	'0f0096b7-8a40-4611-a807-e511f8a86014',	NULL,	'//:Vart fan har kypar''n tagit vägen
det är så tomt uti glasen?://

Ett sån''t kalas, med tomma glas
Det liknar natta har han fått knas?

Vart fan har kypar''n tagit vägen
det är så tomt uti glasen?',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('2a12c659-39c4-4584-a671-298759ba8d16',	'IT: S AFTER SKI SÅNG',	'Unknown',	'smbq',	'fd7120de-2963-4b5c-96e7-bb9feaf62fe8',	NULL,	'På IT åks det skidor ifrån morrn'' till kväll,

sen festas hela natten på ett fjällhotell.

Man vaknar på morgonen och mår skit

Då någon har bjudit för mycket sprit.

Men skål för alla åkare som kom hit!

I lössnö nedför branterna där surfar vi.

Ett gäng som pluggar data svischar vi förbi.

De verkar ha krockat med något stort,

Ett sökträd och missat någon port,

Ja va'' kul det är att snowboarda fort!

De bästa backarna de finns på After Ski,

Det är de fina backarna med öl uti.

När du är trött på att va'' offpist,

Pissed off på bar-kön som är så trist,

Blir du glad när du får din öl till sist!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('74ffd986-9e9f-4353-8d1b-b3d2587d9813',	'O, JÄVLA NATT',	'Unknown',	'nucq',	'691c5d39-d925-44f2-b41c-0561d9b970f5',	NULL,	'Mel: O helga natt

O, jävla natt, jag har så ont i pannan

Och både vinet och ölen är slut.

I min spegel ser jag någon annan,

O, stackars människa hur du ser ut.

Mitt hår är stripigt, ögonen är röda,

Om någon stör mig lär de nog förblöda.

Åh, vilket mord! Vem bankar på min port?

Jo, Livets Ord! Jag spyr på deras skor.

O, jävla natt! Hur kunde jag bli så full?',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('a692e24a-8d03-4378-9225-165bbf78ccf3',	'KAFFEVISA',	'Unknown',	'fint',	'5c9893b4-e88a-4a6f-be29-a613a70eb47a',	NULL,	'*Mel: Du ska få min gamla cykel*

Kaffe, kaffe, kaffe,

konjak och likör,

ger åt alla här ett mycket gott humör.

På det ska ni ge er katten,

vi skall sitta hela natten,

dricka kaffe, kaffe, konjak och likör',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('8735b563-6b5a-48eb-90a3-090366f4442a',	'EN LITEN NUBBE',	'Unknown',	'xlyf',	'a0e3725f-364c-4f5f-8a80-79411e274573',	NULL,	'Mel: Bättre och bättre...

En liten nubbe varje dag.

En liten nubbe varje dag.

Glöm bort tentorna och sorgen,

alla flickorna som givit dig korgen.

Vinbär, Skåne eller Pors,

Låt det rinna som en fors.

Men aaaaaaah!

Det är Bäsken, ja, Bäsken som är bäst!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('0ca541d2-081c-4edb-aa6a-0c319b26a188',	'LILLE MATS',	'Unknown',	'ouzd',	'7c20091f-e128-4c7a-97a9-5728d94a1b1f',	NULL,	'*Mel: Lille Katt*

Lille Mats, lille Mats,

trivdes ej i sitt palats

han tog sats, han tog sats

och hoppa'' till en annan plats

Lille Per, Lille Per,

trivdes inte heller där

han tog sats, han tog sats

och hoppa'' rakt på lille Mats',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('924bc506-8e20-42bb-b34b-f1c58d0f933c',	'BREV FRÅN KOLONIEN',	'Unknown',	'remc',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Hejsan morsan, hejsan stabben.\
Här är brev från älsklingsgrabben.\
Vi har kul på kolonien.\
Vi bor tjugoåtta gangstergrabbar i en\...

\...stor barack med massa sängar.\
Kan ni skicka mera pengar?\
För det vore en god gärning.\
Jag har spelat bort vartenda dugg på tärning.

Här är roligt vill jag lova,\
fastän lite svårt att sova.\
Killen som har sängen över mig,\
han vaknar inte han när han behöver, nej.

Jag har tappat två framtänder\
för jag skulle gå på händer\
när vi lattjade charader,\
så när morsan nu får se mig får hon spader.

Uti skogen finns baciller\
men min kompis han har piller\
som han köpt utav en ful typ\
och om man äter dom blir man en jättekul typ.

Jag är inte rädd för spöken\
och min kompis, han har kröken\
som han gjort utav potatis\
och den säljer han i baracken nästan gratis.

Våran fröken är försvunnen.\
Hon har dränkt sig uti brunnen\
för en morgon blev hon galen\
för vi släppte ut en huggorm i matsalen.

Föreståndar\''n han har farit.\
Han blir aldrig vad han varit\
för polisen kom och tog hand\
om honom för en vecka när vi lekte skogsbrand.

Uti skogen finns det rådjur.\
I baracken finns det smådjur\
och min bäste kompis Tage\
han har en liten fickkniv inuti sin mage.

Honom ska dom operera.\
Ja, nu vet jag inget mera.\
Kram och kyss och hjärtligt tack sen\
men nu ska vi ut och bränna grannbaracken.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('700c86b2-6067-4e8b-bb6b-77ce27891f51',	'FÖRSTA SNAPSEN',	'Unknown',	'geru',	'f354ba4f-1805-488c-9e54-943e42cd4eb6',	NULL,	'Första snapsen heter göken.
Första snapsen heter göken.
Får jag lov, ja får jag lov
att byta byxor med fröken?

Andra snapsen den var värre,
andra snapsen den var värre.
Får jag lov, får jag lov
att byta byxor me\'' min herre

Mina byxor är himmelsblå
men med dina är det dock si och så.
Får jag lov, får jag lov,
att byta byxor med göken.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('2dac6228-d7f2-41d4-a817-8644d249d298',	'UNDER EN FILT I MADRID',	'Claes Eriksson',	'aodz',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Under en filt i Madrid ligger en flicka på glid.\
Tittar på mannen bredvid. Under en filt i Madrid.\
Bakom ett berg i Genéve där får en moder ett brev\
från hennes dotter på glid. Under en filt i Madrid.

Framför en stolpe i Bonn sitter det nu inte nån.\
Endast en tom La Garonne. Framför en stolpe i Bonn.\
Men där i vindarnas drev fladdrar ett brev fån Genéve.\
Postat nån gång i Bretagne. Doftande billig champagne

På en bordell i Borås smörjer en herre sitt kås.\
Bakom ett skjul i Tasjkent där står ett fönster på\
glänt.\
Någon har kastat ett skal genom en jak i Nepal.\
Ingenting är som det skall. Solen är blott en marschall.

Själv är jag blott en kostym. Mamma är bara parfym.\
Pappa förspiller sin tid under en filt i Madrid.\
Under ett lakan i Prag där ligger en kvinna och jag.\
Sängen är full av resår. Sången jag sjunger är\
svår.

Omöjlig att komma ur. Jag vet då fan inte hur.\
Orden får snart inte rum. Jag får väl sjunga mig stum.\
Tonerna trängs i min gom. Sätt mig på tåget till Rom!\
Ja, låt mig få sluta min tid under en filt i Madrid!

*Text: Claes Eriksson*\
*Ur revyn Cyklar med Galenskaparna och After Shave*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('ffee6513-a734-437e-89e6-9b004d106c20',	'ROSITA',	'Unknown',	'sqzi',	'99d055d6-8a06-4a8c-a890-0e460f682038',	NULL,	'Mel: Fritjof och Carmencita

Gin-tonicen, en liten grogg förutan Cola.\
Den hittar du intill dig när du önskar skåla.\
Nästan på kanten på en bricka hos tanten,\
som i baren har blandat och skapat denna dryck.\
Dit kom jag gående en kväll, mest av en nyck,\
för jag ville skoja till det.

Tvåtusen-åttahundra spänn\
kostade groggarna och sedan gick jag hem.\
Där på diskbänken i köket,\
den som aldrig gjorts ren,\
stod en bedårande flaska med Rosita.\
En som om åtta sekel jämnt\
kommer att omnämnas som första klassens skämt.\
men vad brydde jag väl mig,\
där jag stod barskrapad och go\''\
för jag ville skoja till det.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('632073eb-ce85-4c4f-83e9-7f17d30d19d1',	'TUNGVRICKARE',	'Unknown',	'zikz',	'34df3b63-51c3-4eaf-b196-8187a1125302',	NULL,	'Mel: Räven raskar över isen

Räven raska röva riset

riset raska rena räven.

Å röva ris, å räven rös,

å riva räven i röven.

Finnen finna femton flaskor

flickan finna finnen fyller.

Å finnen fes, å flickan flås,

å fira flickan å flaskan.

Ludvig lära leva loppan

Lisa längtar Ludvig lära.

Å Ludvig låg, å läxan lär,

å leva loppan i ladan.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('1fd55659-6761-46e3-8a00-94f055e34a52',	'KALLA KALLSÅNGER',	'Unknown',	'lmnu',	'd84a236a-80c7-46ac-8c76-b325cd7a11b0',	NULL,	'*Mel: Kalle på spången*

Vad är det som gör att du fryser där bak?

Jo, kalla, kalla, kalla, kalla kallsånger.

Vad är det som gör att din snopp hänger slak?

Jo, kalla, kalla, kalla, kalla kallsånger.

Trots en excellent, kompetent, attrahent,

man mot kärleksnycker förblir resistent.

Vad är det som gör att man blir impotent?

Jo, kalla. Hur kalla?

Jävligt kalla. Hur kalla?

Jo, kalla kalla kalla kalla kallsånger.

*(Sjunges lämpligtvis som ackompanjemang till Quarls snapsvisa)*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('c6032372-f86c-4701-a48a-86e10180fa7e',	'DRUNKEN SAILOR',	'Unknown',	'ndkj',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'What shall we do with the drunken sailor,\
what shall we do with the drunken sailor,\
what shall we do with the drunken sailor,\
early in the morning?\
Hooray, up she rises,\
hooray, up she rises,\
hooray, up she rises, early in the morning.

Put him in the longboat till he\''s sober.

Pull out the plug and wet him all over.

Put him in the bilge and let him drink it.

Put him in a leaky boat and make him bale it.

Put him in the scuppers with the hosepipe on him.

Shave his belly with a rusty razor.

Keelhaul him until he\''s sober.

Put him in a bed with the captains daughter',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('3f2b8731-1f4e-47be-a7ce-a00298c4ac20',	'PUNSCHEN KOMMER VARM',	'Unknown',	'ckvl',	'0e0a94d5-743d-49f4-bf66-bb0f64be81c1',	NULL,	'Mel: Glada Änkan

Punschen kommer, punschen kommer,

ljuv och varm.

Vettet svinner, droppen rinner

ner i tarm.

Skål för glada minnen,

dem vi snart ej ha,

då ett par glas simmig punsch

vi hunnit ta..',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('e9537fcd-f3fd-4c28-9bfc-4e40283f1108',	'UTVANDRAREN',	'Unknown',	'cyxe',	'03f4b512-2cd3-486a-81aa-646d912883ed',	NULL,	'Mel: Når månen vandrar...

Jag tänker sälja min dromedar.

Jag tänker flytta till norden.

Vem vill va'' bosatt uti ett land

där man får ligga vid borden?

Nu konverterar jag, här på snabben!

Jag vill ha akvavit till kebaben!

Var ingen mes.

Fyll upp min fez!

*Lundakarnevalen 1998*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('41d104a1-04af-4363-89e6-04069cc666b0',	'NÄR NUBBEN KOM TILL',	'Unknown',	'czru',	'847cf9dd-c2a7-4632-bc82-0dc9b4912e94',	NULL,	'Att nubben kom till jorden

Det skötte gubben Noak om

Och snart till kalla norden

Den ädla drycken kom

Och därför säger mamma

Så är jag nästan alltid glad

Ty nubben den gör livet

Till ständig solskensdag',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('2f91a726-4aad-49dc-b4b3-fee61bac7d5b',	'DAMERNAS SKÅL',	'Unknown',	'ezvu',	'4d15d003-a19d-465b-88eb-acd4e746c439',	NULL,	'Mel: Marseljäsen

Nu ska vi höja våra kalla glas

och dricka skålen för vår dam.

Hon är värd att ständigt besjungas,

dyrkas, sättas på piedestal.

Hon är medelpunkt i våra liv,

vår främsta källa till glädje.

Vi hyllar med sång

och höjer vårt glas

och dricker kvinnans skål!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('9530e97f-51a7-48c1-b042-12b4a7080953',	'CYKELVISAN',	'Unknown',	'dqfj',	'fb1fa75a-2add-4938-a522-9e90cc85c101',	NULL,	'*Mel: Väva vadmal*

Man cyklar för lite

Man röker för mycket

Och man är fasen så liberal

När det gäller maten och spriten

Jag borde slutat för länge sen

Men denna sup är för liten

Vad tjänar att hyckla

Tids nog får man cykla

Man pluggar för lite

Och festar för mycket

Och man är fasen så liberal

När det gäller tentor och labbar

Jag borde pluggat för länge sen

Men alla gör sina tabbar

Vad tjänar att plugga

Jag kommer att kugga',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('a16da06b-dab6-4f38-9cbe-f082a8f8f31f',	'TOMT I ALLA GLAS',	'P.R.I.T. -04',	'nbvl',	'b73d6844-3629-4498-ae1b-2863b533ac21',	NULL,	'Nu är det tomt i alla glas

ekot i dem klinga

Drickan är sen länge slut

kom, mer till oss bringa!

Vi vill ha snaps, vi vill ha snaps,

ja, vi vill ha snaps!

*(Snaps kan bytas ut mot godtycklig dryck efter eget önskemål)*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('397ef6ae-6b7d-4b51-98e6-00586fdc8a6b',	'NUBBEN WALK',	'Unknown',	'lnbk',	'fb57c145-0b96-446a-9af4-a20b6a653483',	NULL,	'Mel: Lambeth walk

Nubbar man för mycket blir livet kort.

Nubbar man för lite blir livet torrt.

Nej, gör som jag:

Nubba lite varje dag!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('da68b697-350a-4f4a-a47e-e740d0783ab2',	'FREDMANS EPISTEL NR: 21',	'Carl Michael Bellman',	'glsi',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Så lunkar vi så småningom

Från Bacchi buller och tumult

När döden ropar: Granne kom

Ditt timglas är nu fullt!

Du gubbe fäll din krycka ned,

Och du, din yngling, lyd min lag:

Den skönsta nymf som åt dig ler

Inunder armen tag!

Tycker du att graven är för djup

Nå välan så tag dig då en sup

Ta dig sen dito en, dito två dito tre,

Så dör du nöjdare.

Men du som med en trumpen min

bland reglar, galler, järn och lås,

dig vilar på ditt penningskrin

inom ditt stängda bås.

Och du som är svartsjuk slår i kras

Buteljer, speglar och kopal,

bjud nu god natt, drick ur ditt glas

och hälsa din rival.

Tycker du att graven.....

Säg är du nöjd, min granne säg,

Så prisa värden nu till slut.

Om vi ha en och samma väg

Så följsom åt -- drick ut!

Men först med vinet rött och vitt

För vår värdinna bugom oss

Och halkom sen i graven fritt

Vid aftonstjärnans bloss.

Tycker du att graven.....',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('4bbcc1ac-278d-475f-bdff-f21fb27d5481',	'MÅSEN (KORT VERSION)',	'Unknown',	'qblz',	'342c5c55-3f55-4958-8909-6642fe933505',	NULL,	'Det satt en mås på en klyvarbom\...\
Jag vill ha OP!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('67126478-346c-4055-9640-e7ced22df8a6',	'INTEGRALVISAN',	'Unknown',	'ymdo',	'c65a1b0a-9b18-4a1d-97f9-ebda346c4799',	NULL,	'*Mel: Med en enkel tulipan*

En liten enkel integral

ett vektoranalystal

ni har besväret,

ni har besväret att derivera.

Men tar man Stokes sats däruppå

så blir det så enkelt så

att integralen, att integralen

evaluera.

Och rotationen, den integreras

sen över ytan utav en boll,

koordinaterna transformeras,

så integranden blir bara noll.

En liten enkel integral

ett vektoranalystal

kan va så djävlig

att man ej hinner med något mera.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('56b05e39-4deb-43c5-b987-7f391f70ab55',	'GÅ EFTER SPRIT',	'Unknown',	'rans',	'41488dba-fd7b-4af1-a6d7-cac51b39c0d0',	NULL,	'Vi går över ån efter sprit, fallera,

men efter vatten går vi ej en bit, fallera.

Ja, sup kära bröder, så ögonen glöder.

En gång blir din blick ack-va-vit, fallera.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('93be1f87-d263-46e4-92d5-f62ae868bb58',	'LIVETS VÄLBEHAG',	'P.R.I.T. -04',	'btes',	'990ef835-2c69-4154-90ff-94801bb61a71',	NULL,	'En liten sång, vi sjung idag,
En sång om livets välbehag
En sång om öl och Bäsk och Skåne
En sång om livets välbehag!

*Text: P.R.I.T. -04*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('4726fb13-8982-45a2-9689-c147a111e2d4',	'SVEA SKIVGARDES NUBBEVISA',	'Unknown',	'fgfw',	'2e8c6152-5b5f-4685-84d9-0fa3c65fb5e0',	NULL,	'Mel: Här kommer lilla Ludde

Här kommer lilla nubben, håhå, jaja.

Den river som nubb den, håhå, jaja.

Här kommer nubbens mamma, håhå, jaja-

Ååh... hon tar jag meddetsamma, håhå, jaja.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('32c19a1a-962e-4eb0-9e4d-4edd4ba6c7b1',	'DENNA THAFT',	'Unknown',	'uecs',	'618f47ec-19f3-4864-aa10-33c6d937560a',	NULL,	'Denna thaft

är den bäthta thaft thythtemet haft

Denna thaft

är den bäthta thaft dom haft

Och den thom inte har nån kraft

han dricka thkall av denna thaft

Denna thaft

till landth, till sjöth, till hafth.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('7f3c55c1-1a5c-4928-9b79-9d872fffc438',	'HELL AND GORE',	'Unknown',	'etpx',	'56b107bd-bb22-4393-a48e-6c5b1adc5f3a',	NULL,	'Hell and gore
Chunk up father allan-lallan-ley
Hell and gore
Chunk up father allan-ley

Oh handsome in the hell and tar
Hand hell are in the half and four
Hell and gore

Chunk up father allan-ley',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('b9836a0c-4a8c-4f8a-8ff3-1b88579707fd',	'DEN ANDRA VAR EN BÄSK',	'E6 1979',	'xoxn',	'24d3b4c1-80f8-4f3a-8dd5-0c73ec70a575',	NULL,	'Mel: Byssan lull

//:Byssan lull gå på gasque och bliva full, för oss har det blivit en
vana://

Den första var en Bäsk, den andra var en Bäsk, den tredje var bäst av
dem alla.

Text: E6 1979',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('af2fa488-eeee-4794-999a-74806ae7afee',	'HALLONSAFT',	'Unknown',	'fonj',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'När smurfar ställer till med fest

Så vet vi hur man festar bäst

Dom fixar en korv och en god pastej

Vi smurfar allt du kan tänka dig

Kulörta lyktor och musik

En tårta som är sagolik

Så ställer dom fram en jättebål

Vi fyller våra glas och säger skål

Saft, saft, hallonsaft

Bättre saft har ingen haft

Saft, saft, hallonsaft

Bättre saft har ingen haft

Det börjar i ett hallonland

Som vi får smurfa av för hand

Sen blandas allt och kokas väl

Och alla lägger ner sin själ

Tills det doftar gott och lyser rött

Och smakar både starkt och sött

Med lagom barr- och sockerhalt

För lite och för mycket skämmer allt

Saft, saft, hallonsaft\...

Och när dom druckit ur ett glas

Som händer på ett smurfkalas

Så går dom strax och fyller på

Så länge det finns mer att få

Ju mer dom dricker skrattar dom

Eller om det rent av är tvärtom

Går lyckan då i hallonsaft

Men kul får man ha av egen kraft

Saft, saft, hallonsaft\...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('78e83a55-a4d1-424c-a532-957290635ba2',	'VÄDJAN TILL PUNSCHEN',	'Unknown',	'emay',	'fc33635f-a61b-42fe-8c5f-e043a3e03f63',	NULL,	'Mel: Sov du lilla videung

Kom nu lilla punschen min,

följ nu efter supen.

Snart så ska du åka in,

ner igenom strupen,

till mitt stora magpalats,

där det finns så mycket plats.

Kom nu lilla punschen,

följ nu efter supen.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('7acc0180-6ac5-4bb9-bc23-7244bf56ec7f',	'SPRITBOLAGET',	'Unknown',	'xxpf',	'b72b803d-be8f-43ca-b3a2-12c68d53a9e5',	NULL,	'Mel:Snickerboa

Till spritbutiken ränner jag och bankar på dess port.

Jag vill ha nå''t som bränner bra och gör mig sketfull fort.

Expediten sa se godda'',

hur gammal kan min herre va''?

Har du nå''t leg, ditt fula drägg?

Kom hit igen när du fått skägg!

Nej, detta var ju inte bra, jag ska bli full i kväll.

Då plötsligt en idé fick jag, dom har ju sprit på Shell.

Många flaskor stod där på rad,

nu kan jag bli båd'' full och glad.

Den röda drycken åkte ner,

nu kan jag inte se nå''t mer!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('bd544859-7535-4eca-bb26-6fc1e69a1500',	'MY BONNIE',	'Unknown',	'dcgx',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'My Bonnie lies over the ocean,

My Bonnie lies over the sea,

My Bonnie lies over the ocean

Oh bring back my Bonnie to me.

Bring back, Bring back,

Bring back my Bonnie to me, to me,

Bring back, Bring back,

Oh bring back my Bonnie to me.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('0697213b-a5ba-46f7-aa4f-3ea8a0ca31f2',	'PING-PONG',	'Unknown',	'zrnw',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'A boy had a game with

a ping-pong ball

A boy had a game with

a ping-pong ball

A boy bad a game with

a ping-pong ball

A game with a ping-pong ball

A boy had a game with a

Ping-pong, ping- pong

Ping-pong, ping- pong

Ping-pong-ball

A boy had a game with a

Ping-pong, ping-pong,

Ping-pong, ping-pong ball

Ping-pong, ping-pong,

Ping-pong, ping-pong ball',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('8cad5901-a444-4001-b222-0e1405889459',	'SKÅL FÖR IT',	'P.R.I.T. -04',	'acxc',	'540f9adc-ac3a-4d12-8c2f-edee329c672a',	NULL,	'När IT har kalas det blir en väldig fart,

Att vi har det kul ihop är underbart

för turkost och smurfar vi lyfter vår kopp,

för då är stämningen högst på topp,

//:Skål för alla IT som kom hit!://

*Text: P.R.I.T. -04*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('b1213be6-42fb-4a3b-a205-2016902a3bfa',	'EN CHALMERIST HAN KAN',	'Unknown',	'vbdj',	'7bad0fc3-c2f3-439e-8494-81f246914662',	NULL,	'Mel: refr. Av tre trallande jäntor

En Chalmerist han kan

Ta supen som en man

Så glupen den supen

I strupen försvann

Och mera vill han ha

Kan ej för mycket ta

En Chalmerist blir aldrig full

Nej, han blir bara gla''!

*Fritt efter "En värmlandspöjk han kan"*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('794d89f1-5b04-4e7e-8c97-e7bc6e173778',	'LAPIN KULTA',	'Unknown',	'wetn',	'98a72712-6fcc-405c-a034-be9605913109',	NULL,	'Mel: Broder Jacob

Lapin Kulta, Lapin Kulta, Karjala, Karjala

Aura sekä Olvi, Aura sekä Olvi,

Koff Koff Koff, Koff Koff Koff',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('83705d4a-1a0e-48ff-9547-27cde995a4be',	'MERA BRÄNNVIN',	'Unknown',	'nlcs',	'e9f4536d-64dd-45fd-a07a-456ee98dbba5',	NULL,	'Mera brännvin i glasen

mera glas på vårt bord

mera bord på kalasen

mer kalas på vår jord

Mera jordar med måne

mera månar i mars

mera marscher till Skåne

mera Skåne, gu-bevars, bevars, bevars',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('6f801d29-15e7-4be3-bd41-345fc5710193',	'MÅSEN',	'Unknown',	'ydfz',	'ee86ab2c-7280-4878-851f-c78f0cb2ec01',	NULL,	'Det satt en mås på en klyvarbom

Och tom i krävan var kräket.

Och tungan lådde vid skepparns gom

Där han satt uti bleket.

Jag vill ha sill hördes måsen rope''

Och skepparn svarte: jag vill ha OP

Om blott jag får, om blott jag får.

Nu lyfter måsen från klyvarbom

Och vinden spelar i tågen

OP''n svalkat har skepparns gom,

Jag önskar blott att jag såg ''en.

Så nöjd och lycklig den arme saten

Han sätter storseglet den krabaten,

Till sjöss han far, och halvan tar!

När månen vandrar sin tysta ban

Och tittar in i kajutan

Då tänker jag att på ljusan dan

Då kan jag klara mig utan

Ja jag kan klara mig utan månen

Men utan OP''n och utan Skåne''n

Det vete fan, det vete fan.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('d4fcd078-0e1f-4600-a4fd-8fc0bb869ac5',	'Bamses phestvisa',	'Unknown',	'vxjb',	'0a492b87-dfd6-4c2b-a73e-92f86f9c9a96',	NULL,	'Jag ska festa, ta det lugnt med spriten,
ha det roligt utan å va'' full.
Inte krypa runt med festeliten,
ta det varligt för min egen skull.

Först en öl i torra strupen,
efter det så kommer supen,
i med vinet, ner med punschen.
Sist en groggbuffé.

Jag är sketfull, däckar först av alla,
missar festen, men vad gör väl de''?
Blandar hejdlöst öl och gammal filmjölk,
kastar upp på bordsdamen breve''!

Först en öl\...

Spyan rinner ner för ylleslipsen.
Raviolin torkar i mitt hår.
Vem har lagt mig under matsalsbordet?
Vems är gaffeln i mitt högra lår?',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('25899195-c2b2-4b94-bb65-37b26d0cfbf7',	'KALMAREVISAN',	'Unknown',	'czwy',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Hej dick\
Hej dack\
Jag slog i\
och vi drack\
Hej dickom dickom dack\
hej dickom dickom dack.\
För uti Kalmare stad\
ja där finns det ingen kvast\
förrän lördagen.\
\
/: När som bonden kommer hem\
kommer bondekvinnan ut :/\
och är stor i sin trut\
Hej dick . . .

/: Var är pengarna du fått ?\
Jo, dom har jag supit opp ! :/\
Uppå Kalmare slott.\
Hej dick . . .

/: Jag skall mäla dig an\
för vår kronbefallningsman :/\
Och du skall få skam\
Hej dick . . .

/: Kronbefallningsmannen vår\
satt på krogen i går :/\
Och var full som ett får.\
Hej dick . . .',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('c0d350e0-099d-4057-9916-f3189de66e6f',	'LOVSÅNG TILL SMURFEN',	'P.R.I.T. -04',	'xfqi',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Smurfen, Smurfen, vackrare än

Ankan och Kvasthilda!

Hur vi än tänker så är han ju bäst

Vi älskar ju alla den Smurfen, Smurfen,

vackrare än Hacke och Fantomen!

Hur vi än tänker så är han ju bäst

Vi älskar ju alla den Smurfen, Smurfen,

vackrare än Droopy och Lucky Luke!

Hur vi än tänker så är han ju bäst

Vi älskar ju alla den Smurfen, Smurfen,

vackrare än Marsipulami!

Hur vi än tänker så är han ju bäst

Vi älskar ju alla den Smurfen, Smurfen,

vackrare än Pippi och Snobben!

Hur vi än tänker så är han ju bäst

Vi älskar ju alla den Smurfen, Smurfen,

vackrare än James Bond!

Hur vi än tänker så är han ju bäst

Vi älskar ju alla den Smurfen, Smurfen,

vackrare än Asterix och Gaston!

Hur vi än tänker så är han ju bäst

Vi älskar ju alla den Smurfen, Smurfen....',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('a2c99e98-fd83-48fd-b650-d99095f5e49c',	'GÅ PÅ CHALMERS',	'Henrik Jernevad och Tomas Forsman, IT2002',	'dttu',	'39e9f1ac-f00a-427d-b745-9d34262e94bb',	NULL,	'Kvällen är sen, Chalmers är stort.

Här sitter vi och super oss bort.

Sjunger nån sång, tar oss en sup

maten är god, eller vad tycker duuuuu?

Ja man ska gå på Chalmers,

skratta och ha roligt.

gå på sittning, inte sitta hemma.

njut av festen, ta för dig av det mesta.

för mycket av det goda,

det kommer upp på toa.

dansar du runt på borden,

lär det va glömt glömt glömt

glöööömt\..... i morron.

Vi kunde varit ute på en krog i Göteborg.

Eller suttit hemma och flätat på en korg.

Och vi kunde pluggat å räknat på matten

vi sitter hellre här i natten.

Ja man ska gå på Chalmers\...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('7643b4d1-361d-4096-85aa-213e7179f63b',	'HOW ABOUT A KISS',	'Unknown',	'cixe',	'f4c8443d-3bcc-410b-9ccf-88f8cc6f7a95',	NULL,	'*Mel: Livet*

Skjortan är härlig.

Men även ibland besvärlig.

När inte sömnen vill slå till på natten,

Och man istället måste kasta va ..(tten).

När man sen kissar,

Kan det hända att man missar.

Att fälla bort den stora nattasärken,

Och sådan kemtvätt kostar skjortan!

HEJA HEJA FRISKT HUMÖR, SKJORTAN HÄNGER UTANFÖR!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('66bc99cf-bc87-4e99-9b2e-272b3c27ee04',	'JAG FÅNGADE EN SUP IDAG',	'Unknown',	'tnse',	'bb2ae271-b0c1-40d9-a4e4-4a12ffeb102b',	NULL,	'Mel: Jag fångade en räv idag

Jag fångade en sup idag

men supen gled ur näven.

Men lika glad för det är jag

men gladast är nog levern.

Tralalalalalalalalalalalala

Jag fångade en tjej idag

men tjejen slank ur sängen

men lika glad är jag för det

vi fortsatte på ängen

Tralalalalalalalalalalalala

Jag mjölkade en ko idag

men när jag såg på juvret

så hade jag nog tagit fel

för gladast var nog tjuren

Tralalalalalalalalalalalala',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('dbd85ed6-499b-4705-858b-c9fb08609c1d',	'HELAN GÅR',	'Unknown',	'misc',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Helan går, sjung hopp faderallanlallanlej!
Helan går, sjung hopp faderallanlallanlej!

Och den som inte helan tar
Han heller inte halvan får.
Helan går!

Sjung hopp faderallanlallanlej!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('c5263484-ff7f-4870-b128-26cd040c48f3',	'SOMLIGA STRAFFAR GUD MED DETSAMMA',	'Unknown',	'ebiy',	'a6cbd332-8796-4296-83a4-f4e365a93d31',	NULL,	'Vojan, vojan han har skoj han.
Kastar av sig enda dojan,

Den andra med, lite på sned,
Och klättrar snabbt in i kojan''.

Den har han byggt av ett rutigt tyg,
Som han har stulit nånstans i smyg,

Men då precis, kom en polis,
Och han blev fast i handbojan.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('14104edd-eeae-472b-81b7-e6e2ef644041',	'LAMBO',	'Unknown',	'tsca',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'*Alla:*

För nu glaset till din mun!

Tjofaderittan Lambo!

Och drick ur, din fylle fylle hund!

Tjofaderittan Lambo!

Se hur dropparna i glaset

rinner ned i fylle aset.

Lambo! Hej! Lambo! Hej!

Tjofaderittan Lambo!

*Solo:*

Jag nu glaset druckit har.

*Alla:*

Tjofaderittan Lambo!

*Solo:*

Ej en droppe finnes kvar!

*Alla:*

Tjofaderittan Lambo!

*Solo:*

Som bevis jag nu vill vända,

glaset på dess rätta ända.

*(Solisten vänder glaset upp-och-ned över huvudet )*

*Alla:*

Lambo hej! Lambo hej!

Tjofaderittan Lambo!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('f1811b0c-5088-49a1-85c5-0c02fd9e92b2',	'NOLLBRICKS-AVTAGNINGSRAMSA',	'NollKIT -03',	'wqgi',	'3ae07c7e-c7fb-4f61-b859-c94f0815ef4f',	NULL,	'*Mel: Armen i vinkel (ramsa)*

"Handen på brickan

och brickan i skyn

Så var vi klara

Att ettor få vara

Vårt mål har vi nått

Brickan den ska bort!"

*Text: NollKIT -03*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('db03b4ea-564f-4cd9-8011-a355b3ef9dab',	'EN ''RÄNNVINSKOKARE',	'Unknown',	'mwwg',	'08f313dd-72bc-4571-852a-da87d67ae63a',	NULL,	'Mel: En sockerbagare

En ''rännvinskokare här bor i skogen,

han säljer ''rännvinet svart på krogen.

Och är du nykter så kan du gå,

men är du fuller så kan du int''.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('b4758827-7ea5-41b3-8883-2c7120a5b248',	'SOLEN',	'Unknown',	'akfv',	'5c69c1fa-925e-4429-b16b-c189e44ee67b',	NULL,	'Solen den går upp och ner doda, doda.

Jag skall aldrig supa mer, hej doda dej.

Hej doda dej, hej doda dej.

Jag skall aldrig supa mer, hej doda dej.

Men detta det var inte sant doda, doda.

I morgon gör jag likadant, hej doda dej.

Hej doda dej, hej doda dej.

I morgon gör jag likadant, hej doda dej.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('c55f6a79-eb0e-4eee-8a75-b237c0a22b31',	'SÅNT ÄR LIVET',	'Bill Cook',	'jwbe',	'facdef61-af7d-4350-9513-905b56e717e4',	NULL,	'Sån''t är livet, sån''t är livet.

Så mycket falskhet bor det här,

den man förlorar vinner en annan

så håll i vännen som du har kär.

Han kom om våren, som en vårvind.

Min kärlek fick han och allt han tog,

men så kom hösten och all den kärlek

han svor var evig - bara dog.

Sånt är livet\...

Han fick en annan, jag har sett dem.

Han verkar lycklig och hon är ung.

Det jag har lärt mig det är just detta,

när hjärtat svider; sjung blott sjung!

Sån''t är livet\...

Vårt liv är fattigt utan kärlek, jag fick en annan som har mig kär. Hans
gamla flamma har fått korgen, hon undrar säker vem jag är.

Sån''t är livet\...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('c98fed28-299a-440a-8eca-a4f756206fa8',	'EI SAA PEITÄÄ',	'Unknown',	'urqw',	'5255cad7-66ef-4845-93a8-9a5873a35fcc',	NULL,	'*Mel: Bamsevisan*

Ei saa peittää, Koskenkorva, Finland.

Yx, kax, kolme, mumintrollet nu.

Sauna, kalja, perkele ja viina.

Yx, kax, kolme, mumintrollet nu.

Koskenkorva (sjunges 6 gånger),

Koskenkorva nu!

Ei saa peittää, Koskenkorva, Finland.

Yx, kax, kolme, mumintrollet nu.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('43db42d4-1bbb-488c-bd33-857ca323b0e1',	'EN TAGGATRÅ',	'Unknown',	'wahu',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'En taggatrå, en taggatrå

Det är en trå med taggar på.

Och är det inga taggar på,

så är det ingen taggatrå.

En taggatrå, en taggatrå,

Det är en trå med taggar på

En prickekorv, en prickekorv

det är en korv med prickar på.

Och är det inga prickar på,

så är det nog en falukorv.

En prickekorv, en prickekorv

det är en korv med prickar på.

En busschaufför --- man med glatt humör

Ett pensionat --- pang med dålig mat

En ingenjör --- man som inget gör

En taxibil --- bil med taxar i

En raggarbil --- bil med brudar i',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('24fa8fa6-ec8d-4fa6-a341-eea481ae60eb',	'**DU GAMLA, DU FINA**',	'Unknown',	'wjvz',	'1ad340d9-4208-456e-bb19-331219d98c6d',	NULL,	'Mel: Svenska nationalsången

Du gamla, du fina, du årgångna vin,

som plockats och trampats ibland bergen.

Jag dyrkar aromen och smaken så fin,

Men ljuvast utav allt är ändå färgen.

Den drycken den går ända in i märgen.

Nu fyller vi glasen och höjer vår arm.

För lycka och vänskapsband vi skåla.

Ja, vinet det har en förunderlig charm.

Är nästan lika gott som rom och cola,

så låt oss därför med varandra skåla.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('e810f9c3-5530-443c-9367-ce8c422c84dc',	'HÄRLIG ÄR PUNSCHEN',	'Unknown',	'lhvp',	'0ea6a41b-72ca-4874-92df-64f55bb6c1d5',	NULL,	'Mel: Härlig är jorden

Härlig är punschen,

härlig är dess konsistens.

Skönt är att taga den än en gång.

Genom att taga punschen av daga

gå vi till paradis med sång.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('7c204095-cdb9-46a4-938d-b95fbcbe2a96',	'KORTA SOLEN',	'Unknown',	'leff',	'6016d2e7-540d-4719-be92-d75b42376a67',	NULL,	'Solen den går upp och ner,

Snapsen den går ner!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('7654ce0e-c7ac-4cda-9733-46a0dd8e4c2a',	'ÖHL',	'Unknown',	'ggwy',	'06fcba5d-7e82-4342-8958-d53a9c741b0e',	NULL,	'//:Öhl, öhl fillibombombom, fillibombombom, fillibombombom://

Vi hade ju både Heineken och Nordic Wölf,

Tuborg Guld och lilla Preppens blå!

Det blir för trist med sodavatten, sodavatten, sodavatten, det blir för
trist med sodavatten, ge mig lite öhl!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('b7337aa1-6147-44f8-8e2e-208efd084913',	'GLÄDJETÅREN',	'Unknown',	'bvul',	'b8f9914c-b534-4026-aaeb-337a67401479',	NULL,	'Helan, sköna helan!
Ljuva droppar i en glädjetår.
Helan, fegt att dela''n!
Den ger styrka och du bättre mår.

Men spriten, dödar långsamt har man spått!
Tur det, för vi har ju knappast brått.

Livet, det är givet.
Det ska levas fyllt av glädje
Ni måste medge:
Bäst är en glädjetår!
Bäst är en glädjetår!

*Ur Chalmersspexet Viktoria, 1986*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('0d5e161f-dd53-4aba-9d54-d615fe1be443',	'VI ÄRO FRÅN IT',	'P.R.I.T. -04',	'yxym',	'4c4018e5-fc28-4b89-a8a3-6f5a8e023e06',	NULL,	'//:Vi äro från IT vi://

Vi gillar turkost och vi vördar ju Smurfen

Vi äro från IT vi.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('e1f84506-1f9a-48f4-bd8c-e0bcb93d1f0f',	'JAG HAR ALDRIG VART PÅ SNUSEN',	'Unknown',	'botm',	'07fbb2a6-aa0e-4654-8757-a4faabbdd387',	NULL,	'Jag har aldrig vart på snusen,

aldrig rökat en cigarr, halleluja!

Mina dygder äro tusen,

inga syndiga laster jag har.

Jag har aldrig sett nåt naket,

inte ens ett litet nyfött barn.

Mina blickar går mot taket,

därmed undgår jag frestarens garn, halleluja

Halleluja, halleluja

Halleluja, halleluja

Halleluja, halleluja

Halleluja-a-a.

Bacchus spelar på gitarren,

Satan spelar på sitt handklaver.

Alla djävlar dansar tango,

säg vad kan man väl önska sig mer.

Jo, att alla bäckar vore brännvin,

Göta Älv var fylld med bayersk öl.

Cognac i varenda rännsten och punsch i

varendaste pöl.

Halleluja, halleluja\...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('e78751be-38e7-4c2c-812f-c4e5ab8ad313',	'HÄSTKÖTT PÅ VÄGGA',	'Unknown',	'fczk',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Det hängde hästkött på vägga

Det var så färskt så det gnägga

Ni skulle hört vicka toner

När vi käka makaroner

För stå inte där och snacka skit

Gå upp på slakteri\''t

Och köp en korvabit

Där finns allt vad du vill ha

Från ost och marmelad till köttfärs

Det hängde hästkött på vägga

Det var så färskt så det gnägga

Ni skulle hört vicka toner

När vi käka makaroner',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('9315f10d-2abf-4455-a37e-60a6cb94b833',	'EMILIAS SNAPSVISA',	'Unknown',	'qwiz',	'acda1076-4d52-4c1b-a415-dc84ccb2d7fa',	NULL,	'Mel: Emil I Lönneberga

Vårt glas vi lyfter i extas

när vi är på kalas.

Vi mister både vett och sans

och tappar vår balans.

Snapsen gör mig listig och stark

jag kryper hem på stadig mark

en sup är gott, hoppfallera,

men stackars mig, hoppfallerej.

Den lilla återställaren

i morgon får jag ta.

Jag aldrig mig min läxa lär,

var fest det utför bär.

Snapsen gör mig ...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('5dff797b-993c-4be3-8510-4b20b6705b15',	'MIN PILSNER',	'Unknown',	'askn',	'404c24cd-7dea-4e4c-9ab3-9e4725631c99',	NULL,	'Mel: My Bonnie

Min pilsner ska svalka min tunga

Min pilsner skall duscha min gom

Min pilsner skall få mig att sjunga

Om jag ser att flaskan är tom

Pilsner! Pilsner!

Hämta en pilsner till mig, till mig!

Pilsner! Pilsner!

Hämta en pilsner till mig!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('81a7b2e3-87b7-4bee-9b01-54f74ca5036a',	'VINVISA',	'Unknown',	'kvkj',	'965c9b48-b8ab-4e91-9604-fd7dde4e8b0a',	NULL,	'Mel: Vila vid denna källa

Mosel, Valpolicella,

Mendozo Tinto vi upphälla.

Lacrima Christo rosso

och en nyss öppnad Vin Rouge d''Algerie.

Mavrud, Clarete Fino

och Bordeaux Blanc, Coq Rouge och Vino

Tinto, Ockfener Bockstein,

Petit Chablis, men bara ett par glas.

Chateaux Margeaux Pardor!

Mouton Rotschild och Carneval Perlerose!

Vi blir canon\...

Gossar! Vi vill beställa

en C6tes-du-Rhone för tio och tju''fem.

Corno (con bocca chiusa)

Om lagret räcker än!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('8ed4b477-2df7-4c60-9355-314263d4e00e',	'PELLEJÖNS',	'Unknown',	'viku',	'73628a6b-3378-4a1a-a20b-7aef531baff3',	NULL,	'*Mel: Jag har en gammal moster*

Det var en gång en daggmask,\
som hette Pellejöns\
Han var så rädd för skator,\
han var så rädd för höns.\
Han var så rädd för metare och letare med burk.\
Och dom som satte mask på krok,\
dom kalla\'' han för skurk.

En dag så tänkte masken\
nu borrar jag mig ner,\
en meter under marken\
så syns jag inte mer.\
I trädgår\''n gick metare och letare och höns\
dom hitta massa maskar,\
men inte Pellejöns.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('23628efd-0f9e-4126-a840-933e76788ae9',	'VIKINGEN',	'Unknown',	'xwme',	'62ee6a8e-af3b-4e0a-b38e-377575884416',	NULL,	'Mel: When Johnny comes marching home

En viking älskar livets vann
Hurra, hurra!
Den hastigt i hanssvalg försvann
Hurra, hurra!

Till kalv, till oxe, till sill och till fläsk,
när kärringar bara dricker läsk.
Ja, då vill alla vikingar ha en bäsk.

När bäsken småningom är slut
Tragik, tragik
Då bäres varje viking ut
som lik, sig lik

Och se''n, om vi vaknar, vi sjunger en bit,
se''n korkar vi upp Skånes Aquavit
Skål för alla vikingar som kom hit!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('3dc094db-e1c3-4941-b55d-325c91068713',	'TYCKER DU OM MIG?',	'Unknown',	'lnxw',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Svenska:

H. Tycker du om mig?

D. Ja, det gör jag.

H. Är det riktigt säkert?

D. Ja, det är det.

H. Får jag komma till dig?

D. Ja, det får du.

A. Hopp sudderulle rudde rullan lej.

Japanska:

H. Pentax minolta?

D. Honda mamiya.

H. Yen kawasaki?

D. Honda kyushu.

H. Fuisiyama?

D. Yen yokono.

A. Sony akai maliyti yamaha

Gotländska:

H. Meun feuna rauka?

D. Ja feur tausan.

H. Aude recktit ricktit?

D. Jau maun bauta.

H. Keun jek gomme in dau?

D. Jau meun bock.

A. Tutta futta Visby tutta bauta mums.

Finska:

H. Hurmi ja pojkka?

D. Koski ja kekko

H. Kalevala penti?

D. Koski ja kyllää.

H. Saarijärvi korva?

D. Koski ja pellää

A. Tunti ja pitti kitti kaiine kaks',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('96f48933-9847-460b-bddb-cee33f875f4d',	'JAG SER NI KRÖKAR',	'Unknown',	'wfhz',	'cdfb3b35-5442-4de4-8963-6ff430dfe238',	NULL,	'Mel: Ja se det snöar

Jag ser ni krökar, jag ser ni krökar,

det var väl trevligt. Hurra!

Nu blir ni fulla, nu blir ni fulla,

men se det blir inte jag.

För jag har huve''t på skaft

och jag dricker blott saft,

för jag vill minnas den tiden

jag med er har haft.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('57ddee82-05b5-4876-8319-0a1d75187cc3',	'**TA ETT GLAS**',	'Unknown',	'wyzz',	'e1a84d52-a8f9-4e66-9727-7d615f445de0',	NULL,	'Mel: Oh, Tannenbaum

Oh, ta ett glas,\
Oh, ta ett glas.\
Ty vinet för oss samman.\
Och den som inget glas vill ha,\
han sjunger och är lika gla\''.\
Men ta ett glas,\
ja ta ett glas,\
för livets fröjd och gamman.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('45ef5297-a8c1-4db8-9013-15371f0e4b60',	'MANNEN OCH KVINNAN',	'Unknown',	'dcob',	'cf449815-4a34-4434-9ad8-9bfb41df0a99',	NULL,	'Mel: Mors lilla Olle

Herrar

Kvinnan är både på ont och på gott,

Hur komplicerad har ingen förstått

Snar till att kyssas, men slug som en varg,

kvinnan kan göra dig lycklig och arg.

Damer

Mannen han tror han är listig och klok,

fast han är lättläst som en sagobok.

Skryter om allting som han känner till,

huvet kan vridas precis vart vi vill.

Herrar

Kvinnan, som flyr för en vit liten mus,

tämjer en make så stor som ett hus

Slog dig i skallen med skyffeln i går,

nu är hon systern som vårdar ditt sår.

Damer

Han kan va'' rektor, polis och major,

men han är gossen som aldrig blir stor.

Dagtid han ägnar åt stora förlopp,

kvällen han lindas kring min fingertopp.

Herrar

Grym som en bofink och snäll som en katt,

bakar sitt dagliga bröd för en hatt.

Först är det ja och på kvällen är det nej,

jämt när du tror att hon vill, vill hon ej.

Damer

Mannen är modig och tåler en törn,

ensam i skogen han skjuter en björn

Vet hur han fångar den svåraste fisk

bleknar så fort han ska torka en disk.

Alla

Mannen och Kvinnan varann ej förstår

har sina fel, han och hon, men ändå.

Sant som att himlen för evigt är blå,

skall allting klaffa - behövs båda två.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('b08c0d21-af35-402d-a4a3-0a760dcd2c51',	'USCH USCH',	'Unknown',	'ophs',	'aa205e86-25d5-4ba3-a594-49bf569c4d3d',	NULL,	'Mel: It''s a long way to...

Det är en lång väg, för lilla supen,

ja, en lång väg att gå.

Det bränner illa i hela strupen

och det kittlar i var tå.

Åh det susar upp i knoppen,

varje droppe känns som två.

//:Det säger usch, usch, usch i hela kroppen, men är härligt ändå!://

*Ur Chalmersspexet Nils Dacke, 1977*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('0f6c37e7-b6c4-4405-8fa3-9390092a10bc',	'BORDEAUX, BORDEAUX',	'Unknown',	'sjle',	'eaff0671-758d-40c1-8ea9-2fe46a2b75ea',	NULL,	'Mel: I sommarens soliga dagar

Jag minns än idag hur min fader,

kom hem ifrån staden så glader.

Han rada'' upp flaskor i rader

och sade nöjd som så:

Bordeaux, Bordeaux!

Han drack ett glas, kom i extas, och sedan blev det stort kalas.

Och vi små glin, ja vi drack vin, som första klassens fyllesvin

och vi dansade runt där på bordet

och skrek så vi blev blå:

Bordeaux, Bordeaux',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('7307d602-d052-4edb-95db-586ccab817b0',	'JAG ÄR EN LITEN UNDULAT',	'Unknown',	'ycxo',	'10654b5b-c2fe-4965-8af8-47e843961da0',	NULL,	'Mel: Med en enkel tulipan

Jag är en liten undulat,

som får så dåligt med mat.

För dom jag bor hos,

ja dom jag bor hos,

dom är så snåla.

Dom ger mig sill varenda dag,

men det vill jag inte ha

jag vill ha rödvin,

jag vill ha rödvin

och gorgonzola .',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('95065903-c00b-43bc-a469-8cf37d6b68e3',	'TÖRSTEN RASAR',	'Unknown',	'gsxt',	'8444e63e-416d-422a-9fe2-f84c63c429a4',	NULL,	'Törsten rasar uti våra strupar,

tungan hänger torr och styv och stel.

Men snart vankas stora långa supar,

var och en får sin beskärda del.

Snapsen kommer, den vi vilja tömma,

denna nektar likt Olympens saft

kommer oss att våra sorger glömma.

Snapsen skänker hälsa, liv och kraft!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('7c084724-0327-48bb-b6ec-932b0eaa70aa',	'TECKENVISAN (av NollKIT, 2012)',	'Unknown',	'shtr',	'704ad9b0-3754-4d6a-afe5-e827531f5986',	NULL,	'Mel: Tre pepparkaksgubbar

. , . , / \* \_

" \# + ^ ''

{ { < ½

& - ? ! @',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('c3a06ab4-3c76-45c1-9ea2-418cecef373c',	'HUVET SLÅR KOPPARSLAG',	'Unknown',	'iwqe',	'ea01e40f-dbb8-44d3-acff-92c9d782aa0c',	NULL,	'Mel: Sankta Lucia

Huvet slår kopparslag

ögonen svider

magen i obehag

natten den lider.

Då genom strupen går

hembränd en liten tår

vördat vare vårat brännvin

vördat vårt brännvin.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('a04f17a6-e16b-4dda-8586-fced50472531',	'JAG ÄTER INTE KLOCKOR',	'Unknown',	'heyn',	'ecb38572-f0af-4e9c-83f3-c6f1e3796ecb',	NULL,	'*Mel: Får jag lämna några blommor*

Jag äter inte klockor,

men jag dricker gärna ur.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('a58caebd-f654-40d2-a97f-4cac4e4bface',	'GE OSS VIN',	'Unknown',	'aaic',	'2e8a020a-f698-4bf4-b4b7-555453a1974c',	NULL,	'Mel: Uti vår hage

Våra små gossar hör flickornas bön:

kom ge oss vin!

Den drycken i glasen gör kvällen så skön.

//: Kom röda och vita viner, kom själarnas vitaminer, kom fluidum
Bacchi, kom ge oss vin! ://',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('6a55fa1a-aad9-489b-9152-350eb8c76e32',	'LÅNGT NER I SMÅLAND',	'Unknown',	'ubsq',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Långt ner i Småland där rider själva djävulen med laddade pistoler och
knallande gevär. Och alla små djävlar de spela på fioler, och själva
fader Satan han spelar handklaver. Hurra för Svealand, hurra för
Götaland och hurra för potatisland som ger oss brännevin!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('33c386e6-2dea-4763-8174-66283e0da942',	'**RÖD VITAMIN**',	'Unknown',	'savq',	'c93120fc-7f2b-412a-aa13-c15564a3bfaf',	NULL,	'Mel: My Bonnie

Hur badar man bäst på en kurort?\
Jo, om man har fyllt en bassäng,\
med vätskan som snart skall besjungas\
när vi kommit fram till refräng;

Rödvin, rödvin.\
Rödvin är fin hälsokost, kost, kost.\
Rödvin, rödvin.\
Rödvin vår bästa flaskpost.

Man får vitaminer fån rödvin.\
Man piggnar ju till på en gång,\
när glaset har tömts uti botten\
så stämmer vi upp till en sång.

Rödvin, rödvin\...

Ur sångboken fån Lundakarnevalen',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('0b0ca22e-8173-40ac-8021-46e83bb55f34',	'MATEMATISKT INTRESSERAD',	'Henrik Jernevad IT2002',	'jums',	'b83a4110-6069-4f1c-bc9b-fa58409fa26a',	NULL,	'Jag har räknat nästan allt som finns att räkna på

Euler, derivator, polynom och pivot

Varenda liten uppgift har jag fått räkna ut

Och nu så börjar tålamodet långsamt att ta slut

Jag går på Chalmers, ja jag har räknat allt som finns

Jag går på Chalmers, men inte någonting jag minns

Jag går på Chalmers, och jag är nästan alltid här

Jag går på Chalmers, och det ger mig blott besvär

För länge sedan var jag matematiskt intresserad

Jag tyckte det var skoj och ville därför lära mera

Jag började på Chalmers och allt verkade så bra

Men snart så fick jag mer att göra än jag ville ha

Jag går på Chalmers\...

Fem minuter algebra och fem minuter Euler

Fem minuter analys och fem minuter Taylor

Fem minuter graf och fem minuter integral

Fem minuter till så blir jag aldrig mer normal

Jag går på Chalmers\...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('e200a4fa-cd9e-46f3-b20a-da77e8955b67',	'HABEGÄR',	'Unknown',	'lluu',	'ec25f120-c8d8-4060-af77-f68ecf77fe02',	NULL,	'När helan man tagit och halvan ska dricka

Det känns som att kyssa en nymålad flicka

Ju mera man får, desto mer vill man ha

En ensammer jävel gör alls ingen gla''',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('3f825a38-b957-4949-ba97-9af3635022d3',	'MERA MÄN',	'Unknown',	'xwki',	'b4af7a64-674e-4529-94b9-7eda52064357',	NULL,	'Mel: Feta Franssyskor

Vi vill ha mera män, vi vill ha flera män!

Vi vill ha stora, starka, muskulösa män!

De ska ha hår på bröst

och djup och sexig röst,

så att de orkar med oss tills i morgon kväll\...

Då kommer nya män, då kommer krya män.

Då kommer unga fräscha, oförstörda män!

Vi skall förföra dem,

vi skall förgöra dem,

så att de kryper hem från oss på morgonen\...

Så kommer morgonen, i hand med morkkisen.

Det är nog dags att ta en iskall öl igen.

Vi drar till första bar

och dricker allt de har

och sen så raggar vi en solbränd sexig karl\...

Se vilken modig man och tänk på allt han kan!

Han är ju sexig, stark, dessutom har han charm!

Han vill ha med oss hem,

att prova ut hans säng,

men vi skall göra honom till vår lilla dräng\...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('dfb09787-908d-4df6-9f81-cad706969e37',	'JU MERA ÖL VI DRICKER',	'Unknown',	'jhqk',	'328a1ccc-464b-4713-8e33-941933d0ba1f',	NULL,	'Mel: Ju mer vi är tillsammans

Ju mera öl vi dricker, vi dricker, vi dricker. Ju mera öl vi dricker, ju
rundare vi bli. För rundare är sundare och sundare är rundare. Ju mera
öl vi dricker, ju rundare vi bli.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('1b57773c-0800-4e70-a7cd-9e6690f604fa',	'PILSNERDRICKAREN',	'Unknown',	'rypl',	'b4956bbf-c833-4395-96a3-10066af75f5b',	NULL,	'Mel: En sockerbagare

En pilsnerdrickare här bor I staden,

Han dricker pilsner mest hela dagen.

Han dricker gröna, han dricker blå,

han dricker några med renat på.

Och i hans fönster hänga tomma glasen

Och alla burkarna från kalasen.

Och är han nykter, så kan han gå

Ner till butiken och fylla på!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('53c9c957-4a08-463d-8b5a-4d6f890ffe5c',	'VIT VECKA',	'Unknown',	'gyxs',	'c705d8a4-f966-4d3b-abdf-0fffb96b0ef4',	NULL,	'Mel: White christmas

Jag drömmer om en vit vecka

Sju dagar utan alkohol.

Tänk att bara skåla

i juice och cola

och sedan minnas allt man gjort.

Jag drömmer om en vit vecka,

det finns en gräns för vad jag tål.

Jag vill inte dricka

mera sprit

så låt nästa vecka vara vit.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('5afb0b01-3adb-4d56-9ed0-1dead5f7a957',	'LILLE OLLE',	'Unknown',	'xvun',	'ae0e14a4-5520-4aaa-854b-2472cf43e6e5',	NULL,	'*Sjunges dock på IT med Bamse-melodin*

Lille Olle skulle gå på disco, men han hade inte någon sprit.
Lille Olle skaffa'' lite hembränt, lille Olle gick då på en nit.

La lalla la la la lala! la la la la la la la la la la la la la la.

Lille Olle skulle börja festa, spriten blandade han ut med Mer.
Lille Olle drack upp hela bålen, lille Olle ser nu inte mer.

La lalla la la la lala! la la la la la la la la la la la la la la.

Lille Olle skaffade en ledhund, den var ful, och även ganska trind.
Olles ledhund drack upp femton flaskor, Olles ledhund är nu också blind.

La lalla la la la lala! la la la la la la la la la la la la la la.

Lille Olle började med droger, han blandade sin LSD med juice.
Lille Olles hjärna står i lågor, lille Olle dog av överdos.

La lalla la la la lala! la la la la la la la la la la la la la la.

Lille Olle sitter nu i himlen, festa kan man göra även där.
Lille Olle skaffade en ölback, capsar nu med Gud och Sankte Per.

La lalla la la la lala! la la la la la la la la la la la la la la.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('aa004d66-9e59-4ee2-b401-0222909c91aa',	'SIFFERVISAN',	'Unknown',	'bccy',	'f0010763-0aa0-41be-a1ca-ff71c7a74eb4',	NULL,	'*Mel: Ritsch, ratsch, filibom\...*

1, 2, 75, 6, 7, 75, 6, 7, 75, 6, 7

1, 2, 75, 6, 7, 75, 6, 7, 73

107, 103, 102, 101, 627

19, 18, 17, 16, 15, 14, 13, 20

11, 10, 9, 8, ta så supen nu

SCHÅÅÅL!!!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('1a002719-64b9-48b6-9f4d-54163a5ebae3',	'PORTOS VISA',	'Unknown',	'slwj',	'c4b58d11-6cb2-4ff9-b749-877b6d570193',	NULL,	'Jag vill ut och gasqua,

var faan är min flaska,

vem i helvete stal min butelj?

Skall törsten mig tvinga,

en TT börja svinga,

nej för fan bara blunda och svälj.

Vilken smörja, får jag spörja,

vem för fan tror att jag är en älg.

Till England vi rider

och sedan vad det lider,

träffar vi välan på någon pub.

Och där skall vi festa,

blott dricka av det bästa

utav whisky och portvin,

jag tänker gå hårt in

för att prova på rubb och stubb.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('49a22637-bdc6-4e23-b677-acf237ce6258',	'DJUNGELPUNSCH',	'Unknown',	'rpdn',	'be5a2d6b-e773-4e28-86b0-05fb9e8bd0bd',	NULL,	'Mel: Var nöjd med...

Jag gillar alla tiders punsch

En punsch till frukost, punsch till lunch

En punsch till förrätt, varmrätt och dessert

Jag gillar punsch för vet du va''

Rent kaffe gör ju ingen gla''

Så punsch i fulla muggar vill jag ha!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('31183fca-e21f-424e-a95c-80eeaa4d6b40',	'STUDIEMEDELSRONDO',	'Unknown',	'tbjz',	'e7bc8e2f-b084-442f-8745-bcb435433f29',	NULL,	'Mel: Ösa sand

//: Vi dricker punsch

till lunch,

när vi har fått avin.

Vi lunchar hela dagen

Tills kassan gått i sin.://

Repris in absurdum',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('0224e374-7c75-4281-8560-0d7c969e6c98',	'LYFTET',	'Unknown',	'yywe',	'709f61cf-be93-48cf-85db-ee7375f3bed9',	NULL,	'Mel: Ding dong Merrily on high

Lyft ditt välförsedda glas

Det är en härlig börda

Nu har tjejerna kalas

Vi segern snart skall skörda

:/:Ding dingedingeding dingedingeding

dingedingeding dong dong

I morgon är det lördag:/:

Sätt nu glaset till din mun

Se döden på dig väntar

Nu har tjejerna kalas

Hör liemannen flämtar

:/: Ding dingedingeding\...

\...

Begravningsklockor klämtar:/:',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('a883f8eb-e8a6-42f2-a052-5057b875723a',	'ODE TILL ÖHLET',	'Unknown',	'btwh',	'afce6c7e-f2cd-4463-860e-3b104032db72',	NULL,	'Mel: Trampa på gasen

Tu tu tu Tuborg

och ca ca ca Carlsberg,

det är den bästa

pilsnern som jag vet.

Tu tu tu Carlsberg

och ca ca ca Tuborg

är det bästa

ölet som jag vet.

Tu tu tu Ölberg

och ca ca ca Pilsborg

det är den bästa

biran som jag vet.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('be86286e-5a6a-478f-9260-5dc7686086c8',	'EN GÅNG I MÅNA''N',	'Unknown',	'uphv',	'4981d6de-4098-45e1-95b0-41a2f0ffa201',	NULL,	'En gång i måna''n är månen full
Aldrig jag sett honom ramla omkull
Stum av beundran hur mycket han tål
Höjer jag glaset och utbringar skål!

Höjen nu glasen och dricken ur
Nu, kära bröder, står kvarten i tur
Nubben den giver oss ny energi
Säkert den minskar vårt livs entropi',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('32d84bd0-e44f-4d9e-a95e-9cb737a20f79',	'TEMPERATUREN',	'Unknown',	'gxmq',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Temperaturen är hög uti kroppen,
Närmare 40 än 37 komma fem!
Så ska det vara när ångan är uppe
Och så är fallet i just detta nu!

//: Vi rullar, vi rullar, vi rullar, vi rullar,
rullar, vi rullar, vi rullar, å hej://

Temperaturen...

//:Framåt och bakåt och framåt och bakåt
framåt och bakåt och framåt och bakåt://

Temperaturen...

//:Kålle och Ada och Kålle och Ada,

Kålle och Ada och Kålle och Ada://',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('dd5391b3-48d4-4e07-a740-5f0c6b72177b',	'MINNE',	'Unknown',	'fqer',	'a68e33e6-0eb8-406d-8240-3c40bb380113',	NULL,	'Minne, jag har tappat mitt minne.

Är jag svensk eller finne?

Kommer inte ihåg.

Inne, är jag ut'' eller inne?

Jag har luckor i minne''

Sån'' där små alkohol

Men besinn'' er

Man tätar med brännvin man får

Fastän minne'' och helan går',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('b602abd3-560c-416b-9bf1-076f9b9aefaf',	'MORGONDAGENS VISA',	'Unknown',	'quau',	'3d179d26-5192-45a6-909d-35874a6b6bc0',	NULL,	'Mel: Sjösala vals

Huvudet vi lyfter med ett stön ur vår säng,

tvättmaskinen i buken, kanoner i huvudet.

Tungan som en plyschsoffa och yrseln i sväng,

i ångesten vi svettas kom sjung din refräng:

Varför finns det aldrig nån nykter liten fest?

O, låt oss somna om så vi slipper denna pest -

men se så många supar vi redan kastat upp i sängen:

Renat och Skåne, Svart Vinbär och fager Bäsk!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('ed602566-04e2-4d54-8a4f-aa688db09512',	'EFTER GÜCKEL',	'Unknown',	'yfcf',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Det där det gjorde de fan så bra

En skål uti botten för \[**insert name**\] vi tar

Hugg i och dra, HEJ

Hugg i och dra, HEJ

En skål ut i botten för \[**insert name**\] vi tar

Å alla så dricka vi nu \[**insert name**\] till.

Och \[**insert name**\]  säger?!

\***Gücklande svarar**\*

För det var i vår ungdoms fagraste vår

Vi drack varandra till och vi sade, Gutår.

Skål Forrest!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('77a0df11-bbf2-4c77-a2c2-e18abc772baf',	'KILLARNAS SKÅL',	'Unknown',	'wxts',	'c1a47088-425a-48f2-abb8-cfa541f95f67',	NULL,	'Mel: Vi skålar för dem vi gillar

Vi skålar för våra killar.

Vi skålar för dom vi gillar.

Men dom som vi inte gillar

dom skiter vi i.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('086f04f3-bf60-4027-9a8c-12f31e219c1b',	'INVERS APTIT',	'Unknown',	'xuzm',	'fdf5a80b-864d-48fc-8346-e34264ebff46',	NULL,	'Nu fyllas många magar små
av iskall renad sprit.
Men några kastar åter upp,
Det är invers aptit.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('cb823e8a-730e-4709-9952-a78118a84d8b',	'IT: s PUB',	'P.R.I.T. -04',	'gvqk',	'c7b8f3f1-d42b-4f18-8057-98b36bca0c23',	NULL,	'Vill du ut och festa
Och sen nya saker testa
Vill du ha det roligt
Kom till IT: s pub ida''!

Ja, till IT ska vi sticka
För där finns mat, musik och dricka
Här samlas det bästa folket
Ja, precis som det ska va''!

Kom nu allihopa
Nu ska vi glada sånger ropa
Dansa, flirta, sjunga
Vart annars vill man va''?

Ja, till IT ska vi sticka...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('d433857f-326b-448e-805e-522c6c50ab07',	'FETA FRANSYSKOR',	'Unknown',	'qbfy',	'6a28cc67-f568-4b70-8e74-ea0cf3f2e478',	NULL,	'Mel: Marsche militaire av Franz Schubert

(Tomtarnas vaktparad)

Feta fransyskor som svettas om fötterna

de trampar druvor som sedan skall jäsas till vin

Transpirationen viktig e'' ty den ger fin bouquet

Vårtor och svampar följer me'', men vad gör väl de''?

För\...

Vi vill ha vin, vill ha vin, vill ha mera vin

även om följderna blir att vi må lida pin

Flickor: Flaskan och glaset gått i sin

Pojkar: Hit med vin, mera vin

Flickor: Tror ni att vi är fyllesvin?

Pojkar: JA! (Fast större)',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('2bfa7a65-71b5-49bf-890f-7d7c14366af1',	'HÄRJAREVISAN',	'Unknown',	'xhsn',	'58cbdb78-dcc9-4605-b74c-b3cf708f7ff6',	NULL,	'*Mel: Gärdebylåten*

Liksom våra fäder vikingarna i Norden

drar vi riket runt och super oss under borden.

Brännvinet har blivit ett elixir för kropp såväl som själ.

Känner du dig liten och ynklig på jorden

växer du med supen och blir stor uti orden,

slår dig för ditt håriga bröst och blir en karl från hår till häl.

Ja, nu skall vi ut och härja, supa och slåss och svärja,

bränna röda stugor, slå små barn och säga fula ord

Med blod ska vi stäppen färga.

Nu änteligen lär jag

kunna dra nån verklig nytta

av min Hermodskurs i mord.

Hurra nu ska man äntligen få röra på benen,

hela stammen jublar och det spritter i grenen.

Tänk att än en gång få skrida fram på Brunte i galopp.

Din doft o kära Brunte är trots brist i hygienen

för en vild mongol minst lika ljuv som syrenen.

Tänk att än en gång få rida runt i stan och spela topp!

Ja, nu skall vi ut och härja....

Ja, mordbränder är häftiga, ta fram fotogenen

och eftersläckning tillhör ju just de fenomenen

inom brandmansyrket som jag tycker

att det är nån nytta med.

Jag målar för mitt inre upp den härliga scenen:

Blodrött mitt i brandgult, ej ens prins Eugen,

En lika mustig vy kunde måla,

Ens om han målade med sked.

Ja nu skall vi ut och härja.....',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('77fa3873-7916-4a42-b1f4-c393d68db4f4',	'KOMPILATORN',	'P.R.I.T. -04',	'kgzp',	'62afd946-1269-4d68-a0d4-ed5d92539f46',	NULL,	'Tänk om jag vore en liten kompilator
Ompa ompa fallerallera

Då skulle alla ha mig i sin dator
Ompa ompa fallerallera

Tänk om jag vore ett Java run time error
Ompa ompa fallerallera

Då skulle alla lida av min terror
Ompa ompa fallerallera

*Text: P.R.I.T. -04*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('e0c7d8ea-a244-473e-80fd-91e299c1d11d',	'LIVET',	'Unknown',	'tfuj',	'707a1e9a-a95e-4337-92af-4b27cc2afd72',	NULL,	'||: Livet är härligt!
Tavaritj, vårt liv är härligt!
Vi alla våra små bekymmer glömmer
när vi har fått en tår på tanden, SKÅL!

Tag dig en vodka!
Tavaritj, en liten vodka!
Glasen i botten vi tillsammans tömmer,
det kommer mera efter hand :||

SKÅL!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('6ea7303b-bb4b-463b-a917-12808e24d0b8',	'CHALMERS UTBILDNING',	'Unknown',	'stnh',	'801a7885-de62-4ccc-a6ad-80abbfcd91c5',	NULL,	'Chalmers utbildning är fin

Dricka öhl och brännevin

Sen blir man ingenjör

Det är det som susen gör, HEJ!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('cd737e1e-bb33-42b0-9812-db01718f694c',	'VEM KAN RAGLA',	'Unknown',	'qxob',	'0a36a8ee-b618-4d44-94df-61c16390432e',	NULL,	'Mel: Vem kan segla...

Vem kan ragla för utan vin

Vem är nykter om våren

Vem kan skilja på Bäsk och Gin

Utan att smaka på tåren?

Jag kan ragla för utan vin

Å visst var jag nykter om våren

Men ej skilja på Bäsk och Gin

Efter den elfte tåren!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('c91f69f6-acbc-44b9-8218-7912398b5fa5',	'F-ARENS MORGON',	'Unknown',	'xfuf',	'5fb8c97a-de42-415b-a635-4041ddd305ad',	NULL,	'F-aren han vältrar med ett bröl ur sin säng,

huvudet det dunkar och tungan känns torr och stel.

Sen tvärs över golvet fram till skåpet han går,

flaskan kommer fram och han säger gutår.

Turkosa lilla Smurfen ack vore jag som du,

Du bangar aldrig ur och du festar ju för sju,

Du pallar för det mesta,

det är nåt hemskt vad du kan festa.

Aj, vad det gungar, var fan finns det magnecyl?!!

*(Plockad ur F-arnas sånghäfte, nästan utan modifikation)*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('cd388008-b8fe-4efb-ac63-7dbb6247692a',	'DAMSUPÉVISA',	'Unknown',	'bnqb',	'fd3f00e5-9534-4d8c-955c-585b65fc555b',	NULL,	'Mel: Schottis på Valhall

Upp och hoppa kvinns,

visa att vi finns.

Låt oss storma sektionen i kväll!

Kläm nu alla i

med stor frenesi,

vi ska kämpa och segern blir säll.

Tag en redig sup

ut ur bägar''n djup.

Ett-två-tre ned i magen den häll!

Alla ska nu få se

att vi duger nå''t te'',

Vi ska storma sektionen i kväll!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('698fee6f-0729-4fde-8f96-a3122bba0988',	'BAKFYLLESÅNG',	'Unknown',	'hoog',	'ccfb13ed-31ab-419f-8e5b-8794b5d48705',	NULL,	'Mel: Änglamark

Huvudvärk, svettningar, darrningar, diarré.

Ge mig en isblåsa och en gul Jaffa.

B-vitaminer, apelsinjuice och lite te.

Kan de bakfyllan måhända bortfösa.

Festen var dålig, men nattsexan blev för bra:

Janson\''s temptation och brännvinsturnering.

Borta var jag då i går kväll men mest i dag.

No concentration, men mycket vommering.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('8da7cccf-3442-44cc-818f-b947c99608e3',	'IMSIG VIMSIG',	'Unknown',	'gtej',	'a77eb650-87f7-4eb4-8991-d95034ae25a3',	NULL,	'Imsig vimsig blir man, av ett litet glas
Pulsen börjar öka, hjärtat går i kras
Båda knäna skälver och näsan den blir blå
fast det är så läskigt, prövar vi ändå\...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('036e8aee-d199-4623-a18a-85250612e202',	'BRÄNNVIN',	'Unknown',	'vbhk',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'*Att sjungas av icke sångkunniga gäster, ty melodi saknas*

*BOM bör markeras med slag i bordet eller stampning*

Det var brännvin i flaskan när vi kom

BOM, BOM

när vi gick

BOM, BOM

var flaskan tom',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('7cf8f5ea-3c79-4a47-9236-5e871788e790',	'BÄR UT MIG I SNÖN',	'Unknown',	'ivva',	'61ff28fe-b718-48fe-aeda-ad66252ba70d',	NULL,	'Mel: Bär ner mig till sjön

/: Bär ut mig i snön, bär ut mig i snön

Jag känner att jag måste spy :/

Och när jag kastat upp

så får du torka opp

och när du torkat upp

så kan jag spy igen.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('f7fe4711-284f-4398-94b0-ed28db6ea90a',	'TREO',	'Unknown',	'leid',	'02307557-1618-4315-9e4d-4d92be108d8c',	NULL,	'Mel: Vintern rasat...

Morgonstund med smak av döda bävrar,

frukostmorgonen är över oss.

Hur vi stretar, hur vi alla vägrar,

så går solen lik förbannat opp.

Snart är dagen här med hemska plågor,

huvudvärk och ångest, elände, men

det finns faktiskt ett glas som kan dig rädda:

Treo-comp, vår frälsare och vän.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('5560f265-5c48-4286-b58f-46c222d6f99e',	'SUDDA SUDDA',	'Unknown',	'ksvc',	'6f5402ba-21f6-45ac-b32a-b9cedf732cc5',	NULL,	'Mel: Sudda bort din sura min

Sudda, sudda,sudda, sudda bort din sura min.

Med fyra jättestora bamseklunkar ädelt vin.

Munnen den skall skratta och va'' gla''!

För att den ska bli som den ska va''

Vad häller du då bak det dolda flinet?

Jo vinet, som suddar, suddar bort din sura min.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('e88e8b9c-7e67-4245-be9b-b5aa1a5e8539',	'DA''N DÄRPÅ',	'Unknown',	'cyab',	'df558eb1-0bcd-4062-ac4d-f720d60d45cd',	NULL,	'Mel: Bättre och bättre dag för dag

Sämre och sämre da\''n därpå.

Säg mig, vad gjorde jag igår?

Många namn för hur man mår se\''n

både bilmek, betongkeps och ågren

Tag, en

akvavitamin

och gå på för full maskin.

Aj, aj, aj, aj, aj, aj, aj

men jag mår sämre och sämre da\''n därpå!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('05f8e424-5c8f-4edc-9cae-266b2654d1fa',	'LILLE SUP',	'Unknown',	'ouwg',	'71c92a56-9fbc-4509-b367-cee622bd96c6',	NULL,	'Lille sup, lille sup,
lille söte supen
nu ska du, nu ska du,
ner igenom strupen',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('4028ca99-9a51-4e0b-a8e9-55a9d6fb4232',	'PUNSCHEN KOMMER KALL',	'Unknown',	'rzxc',	'2d0f9a3a-ea44-47f7-bc1b-355beed50dfe',	NULL,	'Mel: Glada Änkan

Punschen kommer, punschen kommer,

ljuv och sval.

Glasen imma, röster stimma i vår sal.

Skål för glada minnen,

skål för varje vår.

Inga sorger finnas mer

när punsch vi får.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('8ab6db15-9153-4148-ad3c-2d273d3456dc',	'SVEPSKÄL',	'Unknown',	'rhro',	'aa73145d-9394-403a-8aa8-c8c3cf78d35f',	NULL,	'Mel: Kamomilla stad

All alkohol är bra för hyn

den främjar ansiktsfärgen

och ger oss skinn som rosentryn,

det känns rätt in i märgen.

Så det är blott av hälsoskäl,

vi dricker den för ve och väl.

För annars så dricker vi inte nån sprit,

varken Skåne, Gauffin eller Akvavit.

En liten klar är för din kropp,

en kärleksfull behandling.

Då genomgår ditt blodomlopp

en effektiv förvandling.

Din kropp blir kall som härdat stål

med hjälp av smaksatt etanol.

Vi ser det blott som medicinsubstitut

när vi dricker Svartvinbärs och Absolut.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('0bb74e1e-dc1d-4c02-a1fa-fb9873510dd1',	'JAG VAR FULL EN GÅNG',	'Unknown',	'ravv',	'd4256d39-7b96-45e8-b250-6a16fc8e3d6e',	NULL,	'Jag var full en gång för länge sen,

på knäna kröp jag hem,

och på vägen träffa jag en elefant, elefant.

Elefanten börja pinka och jag trodde det var öhl,

Sedan dess har jag bli''tt kallad jävla knöl,

mera öhl!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('9c3abcad-2cbc-4709-b5a7-23dc4f0f20b8',	'FRITJOF OCH CARMENCITA',	'Unknown',	'kkvi',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Samboronbon, en liten by förutan gata

den ligger inte långt från Rio de la Plata. Nästan vid kanten av den
blåa Atlanten

och med Pampas bakom sig,

många hundra gröna. mil.

Dit kom jag ridande en afton i april

för jag ville dansa tango.

Dragspel, fiol och mandolin

hördes från krogen och i salen steg jag in. Där på bänken i mantilj

och med en ros vid sin barm

satt den bedårande lilla Carmencita.

Mamman, värdinnan satt i vrån.

Hon tog mitt ridspö, min pistol och min manton.

Jag bjöd upp och Carmencita sa: - Si, gracias señor vámos á bailar este
tango!

\- Carmencita lilla vän,

håller du utav mig än?

Får jag tala med din pappa och din mamma, jag vill gifta mig med dig,
Carmencita!

\- Nej, don Fritjof Andersson,

kom ej till Samboronbon,

om ni hyser andra planer när det gäller mig än att dansa tango.

\- Ack, Carmencita, gör mig inte så besviken! Jag tänkte skaffa mig ett
jobb här i butiken, sköta mig noga, bara spara och knoga,

inte spela och dricka men bara älska dig. Säg, Carmencita, det är ändå
blott med mig, säg, som du vill dansa tango.

\- Nej, Fritjof, ni förstår musik,

men jag tror inte ni kan stå i en butik

och förresten sa min pappa just idag att han visste

vem som snart skulle fria till hans dotter.

En som har tjugotusen kor

och en estancia som är förfärligt stor.

Han har prisbelönta tjurar,

han har oxar, får och svin

och han dansar underbar tango!

\- Carmencita, lilla vän,

akta dig för rika män!

Lyckan den bor ej i oxar eller kor

och den kan heller inte köpas för pengar. Men min kärlek gör dig rik,

skaffa mig ett jobb i er butik!

Och när vi blir gifta söta ungar ska vi få

som kan dansa tango!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('3e93f60d-d13d-4f17-ba81-f67a5b2853d5',	'ÄNGLAHUND',	'Unknown',	'rbho',	'1705e242-95f2-42af-87c1-137c5cac58b1',	NULL,	'Mel: Marseljäsen

Det står en hund på fjärde våningen,

och den tänker hoppa ner!

BANZAI! (supen tages)

Det var en japanesisk självmordshund,

och den hoppar aldrig mer!

*Sångarstriden i Lund, 1982*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('544e6b8d-21b9-4217-82a5-15f03499ab8a',	'VÅRAN FORD',	'Unknown',	'vqmt',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'För uppå våran gård,

där står en gammal ford

förutan hjul och utan däck

och motorn den är väck

Och tittar man där bak,

så finns det inget flak

och tittar man där förarn

satt så finns det ingen ratt

Den går på terpentin,

smör och margarin.

Den går ju som en månraket

genom Johanssons staket

Och Johansson kom ut

Med bössan full av krut

Och sköt den gamla Forden ut

Och så var visan slut. Tut tut',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('3b805044-4f2b-471b-a94e-bd6d3b53eeca',	'SENSOMMARPOESI',	'Unknown',	'impl',	'5581cd58-9719-45d4-9020-465aeeb809df',	NULL,	'Mel: Idas sommarvisa

Du skall inte tro du blir brötfull

ifall inte du sätter fart

på flaskan och tar några snapsar

för då kommer luckorna snart.

Så trevligt att slippa få minnas

allt löjligt och tarvligt du gjort

som var det blev av dina pengar

och hur dina kläder kom bort.

Nån gång kan man väl göra bort sig

så det tycker jag du skall få

så sjung nu och dansa på bordet

skrävla och slåss och stå på.

Sen ligger du lördag och söndag

och våndas så grönblek och yr

och sitter på jobbet på måndag

och kurar vid skärmen och spyr.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('c2407110-7bfb-48e0-859b-ea4d53ab2c1b',	'KISSEMISS',	'Göran Svensson',	'ouur',	'be541d14-0bf9-426d-891a-e9cc7596e3db',	NULL,	'*Mel: Du skall få min gamla...*

Tänk så trevligt att ni kunde komma hit

Låt oss ta en liten jamare med flit

Blir vi sedan lätt i hatten

Ja då kan man ge sig katten

På att jamaren vi tatt den var av sprit.

Så sjung mjau, mjau kissemisse mjau.

Ja, sjung mjau, mjau kissemisse mjau.

Om vi jamar hela natten

Desto gladare blir skratten

Efter slatten får rabatten en visit.

*Sångarstriden i Lund, 1990*

*Text: Göran Svensson*',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('bccf76c1-796b-43f7-ae99-bac8b34d54b2',	'I MEDELHAVET',	'Unknown',	'txox',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'*Svenska:*

I Medelhavet sardiner simmar, apu, apu, apu apu

Men i mitt hjärta där simmar du, apu, apu \....

*Engelska:*

In Middleocean sardines are swimming, apu\...\...

But in my hart are swimming you, apu\.....

*Tyska:*

In Mittelmehre Sardinen schwimmen, apu\...

Aber in mein Herz da schwimmst ja Du, apu\...

*Ryska:*

I Medelhavski sardinski simmski, apusskiduski, apusskidu

Men i mitt hjärtski där simmski dusski, apuskiduski\.....

*Norska:*

I Medelhavet små törsker svömme, apu, apu, apu, apu

Men i min blopump där plasker du apu, apu\...\...',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('2c5e3909-bdc9-4609-b4c4-38366e824b05',	'VI ÄR IT',	'Henrik Jernevad och Tomas Forsman, IT2002',	'rysa',	'6dffa3f5-6029-4f04-bd97-45aeb1b8eb53',	NULL,	'Vi pluggar hela dan, festar sönder stan
röjer loss, gör Göteborg osäkert
när vi laddar upp
blir det gasque förstås
alla vill va med när IT går loss

Vi är, vi är, IT!
Vi är, vi är, IT!

Senare nått år när vi tjänar fett
kommer vi att vara de som gör allt rätt
och när allt är trist
kommer IT så friskt
och över hela världen vi styr med list

Vi är, vi är, IT!
Vi är, vi är, IT!

Som gamlingar vi går med rullator och bår
ser på allt på det sätt som vi förstår
som noll och ett
allting blir lätt
vi visar de unga hur man gör nått rätt

Vi är, vi är, IT!
Vi är, vi är, IT!

Vi är, vi är, IT!
Vi är, vi är, IT!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('2c2b4a9b-d4cb-438a-9861-5717a433131f',	'MUNKAR',	'Unknown',	'ltcs',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Jag vill ha munkar munkar munkar med hål i,\
stora feta munkar med hål i.\
När jag kommer hem till dej,\
så vill jag inte ha nån leverpastej.

Jag vill ha nunnor nunnor nunnor med hål i,\
stora feta nunnor med hål i.\
När jag kommer hem till dej,\
så vill jag faktiskt ha en annan tjej.

Jag vill ha kramar kramar kramar med tryck i,\
stora mjuka kramar med tryck i.\
När jag kommer hem till dej,\
så vill jag inte ha nån leverpastej.

Jag vill ha kyssar kyssar kyssar med sug i,\
stora blöta kyssar med sug i.\
När jag kommer hem till dej,\
så vill jag inte ha nån leverpastej.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('89a30f0e-8ed5-4160-9cdc-61e89b516290',	'SER DU STJÄRNAN',	'Unknown',	'zfoz',	'886f0075-dac1-4492-8d5e-c982f37ae956',	NULL,	'Ser du stjärnan i det blå?
Tag en sup så ser du två.
Tar du mera, ser du flera, stjärnor små.

Ser du stjärnan i det blå?
Tag en sup så ser du två.
Tar du fler så går du ner på låg nivå.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('33a547d1-9176-46e2-be8a-e91aa5a1b7e7',	'ÄN EN GÅNG DÄRAN',	'Unknown',	'foas',	'563aa916-4e9c-4745-846b-7c451e5b372e',	NULL,	'Än en gång däran, bröder,

än en gång däran!

Följom den urgamla seden.

In till sista man, bröder,

in till sista man,

trotsar vi hatet och vreden.

Blankare vapen sågs aldrig i en här

än dessa glasen, kamrater, i gevär!

Än en gång däran, bröder,

än en gång däran.

Svenska hjärtans djup - här är din sup!

Livet är så kort, bröder, livet är så kort.

Lek det ej bort, nej var redo!

Kämpa mot allt torrt, bröder,

kämpa mot allt torrt!

Tänk på de gamla som stredo

fram utan tvekan i floder av champagne,

styrkta från början av brännvin från vårt land!

Kämpa mot allt torrt, bröder,

kämpa mot allt torrt!

Svenska hjärtans djup - här är din sup!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('99596c5e-1512-47b2-8900-da2bc65366d8',	'FESTU: S PUNSCHVISA',	'Unknown',	'bolr',	'18e67e5e-4dd3-49a6-a0ca-3e55727e9506',	NULL,	'Mel: Midnatt råder

Punschen, Punschen, rinner genom strupen,

ner i djupen.

Blandas, konfronteras där med supen,

där med supen.

Gula droppa stärker våra kroppar,

punsch, punsch, punsch!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('a47c9258-b8a5-4f72-adbf-a6922cdc4b36',	'FANS HÄMND',	'Unknown',	'gejk',	'96a8132c-e6ec-4459-9b83-5fe939eb496f',	NULL,	'När som sädesfälten böja sig för vinden

Står nån djävel där och böjer dem tillbaks.',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('880d4efc-28c3-425d-a66f-973ab162af4a',	'ÖHL I GLAS',	'Unknown',	'dgkg',	'91f18bd2-fd56-4cbe-aef6-1ebc2fa221c4',	NULL,	'Mel: Row your boat

Öhl, öhl, öhl I glas

eller I butelj

Skummande, skummande, skummande skummande

Ta en klunk och svälj!',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f');

DROP TABLE IF EXISTS "song_book";
CREATE TABLE "public"."song_book" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "name" text NOT NULL,
    "unique_name" text NOT NULL,
    "deleted" boolean NOT NULL,
    "owned_by" uuid NOT NULL,
    CONSTRAINT "song_book_name_key" UNIQUE ("name"),
    CONSTRAINT "song_book_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "song_book_unique_name_key" UNIQUE ("unique_name")
) WITH (oids = false);

INSERT INTO "song_book" ("id", "name", "unique_name", "deleted", "owned_by") VALUES
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'Official songbook',	'official_songbook',	'0',	'af064f1c-0bac-4fd5-ac3d-7d29c107051f');

DROP TABLE IF EXISTS "song_book_image";
CREATE TABLE "public"."song_book_image" (
    "song_book_id" uuid NOT NULL,
    "image_id" uuid NOT NULL,
    CONSTRAINT "song_book_image_pkey" PRIMARY KEY ("song_book_id", "image_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "song_book_song";
CREATE TABLE "public"."song_book_song" (
    "song_book_id" uuid NOT NULL,
    "song_id" uuid NOT NULL,
    "number" integer NOT NULL,
    CONSTRAINT "song_book_song_pkey" PRIMARY KEY ("song_book_id", "song_id"),
    CONSTRAINT "song_book_song_song_book_id_number_key" UNIQUE ("song_book_id", "number")
) WITH (oids = false);

INSERT INTO "song_book_song" ("song_book_id", "song_id", "number") VALUES
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'8092f5b0-5ff3-484c-9f6e-226b3b56c403',	119),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'bf4b0a30-1542-478a-bfbb-25a5383f6ae7',	47),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'5d94e1cd-10ac-49df-b2f9-af2a651801ff',	53),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'555fc247-e8c1-40d3-8187-fcfd82c3bd9f',	23),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'dd765cca-80ff-4bfd-8096-1b94037c8e10',	16),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'79c44c8c-b9f4-4681-8bc6-61ba7696455b',	38),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'd28de812-d308-4dc1-a2e8-dfc55e8545ed',	66),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'e26028da-6163-46a8-ab26-26aa615ea3ef',	58),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'5e738b9e-5296-41bf-b0bb-3c0241a41575',	26),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'fbf4872e-09cb-4745-8855-d8b32c709aa9',	30),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'66edf33d-f48b-4cc9-af78-c258cb0fe923',	107),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'958455cd-fa6a-4d39-bd91-fbffe33b9982',	86),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'9ec0f28b-4c19-4995-8216-d8c613b9351f',	25),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'b258b06e-485a-4816-a9db-f2b35c00ec53',	43),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'2a12c659-39c4-4584-a671-298759ba8d16',	4),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'74ffd986-9e9f-4353-8d1b-b3d2587d9813',	101),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'a692e24a-8d03-4378-9225-165bbf78ccf3',	121),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'924bc506-8e20-42bb-b34b-f1c58d0f933c',	129),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'700c86b2-6067-4e8b-bb6b-77ce27891f51',	17),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'2dac6228-d7f2-41d4-a817-8644d249d298',	130),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'ffee6513-a734-437e-89e6-9b004d106c20',	51),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'632073eb-ce85-4c4f-83e9-7f17d30d19d1',	62),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'1fd55659-6761-46e3-8a00-94f055e34a52',	54),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'c6032372-f86c-4701-a48a-86e10180fa7e',	128),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'3f2b8731-1f4e-47be-a7ce-a00298c4ac20',	94),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'e9537fcd-f3fd-4c28-9bfc-4e40283f1108',	61),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'41d104a1-04af-4363-89e6-04069cc666b0',	35),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'2f91a726-4aad-49dc-b4b3-fee61bac7d5b',	110),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'9530e97f-51a7-48c1-b042-12b4a7080953',	134),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'8735b563-6b5a-48eb-90a3-090366f4442a',	91),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'0ca541d2-081c-4edb-aa6a-0c319b26a188',	135),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'a16da06b-dab6-4f38-9cbe-f082a8f8f31f',	9),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'397ef6ae-6b7d-4b51-98e6-00586fdc8a6b',	67),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'da68b697-350a-4f4a-a47e-e740d0783ab2',	148),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'4bbcc1ac-278d-475f-bdff-f21fb27d5481',	33),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'67126478-346c-4055-9640-e7ced22df8a6',	126),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'56b05e39-4deb-43c5-b987-7f391f70ab55',	44),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'93be1f87-d263-46e4-92d5-f62ae868bb58',	11),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'4726fb13-8982-45a2-9689-c147a111e2d4',	63),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'32c19a1a-962e-4eb0-9e4d-4edd4ba6c7b1',	39),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'7f3c55c1-1a5c-4928-9b79-9d872fffc438',	50),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'b9836a0c-4a8c-4f8a-8ff3-1b88579707fd',	90),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'af2fa488-eeee-4794-999a-74806ae7afee',	2),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'78e83a55-a4d1-424c-a532-957290635ba2',	97),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'7acc0180-6ac5-4bb9-bc23-7244bf56ec7f',	71),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'bd544859-7535-4eca-bb26-6fc1e69a1500',	122),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'0697213b-a5ba-46f7-aa4f-3ea8a0ca31f2',	144),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'8cad5901-a444-4001-b222-0e1405889459',	1),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'b1213be6-42fb-4a3b-a205-2016902a3bfa',	65),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'794d89f1-5b04-4e7e-8c97-e7bc6e173778',	74),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'83705d4a-1a0e-48ff-9547-27cde995a4be',	31),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'6f801d29-15e7-4be3-bd41-345fc5710193',	32),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'd4fcd078-0e1f-4600-a4fd-8fc0bb869ac5',	22),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'25899195-c2b2-4b94-bb65-37b26d0cfbf7',	127),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'c0d350e0-099d-4057-9916-f3189de66e6f',	13),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'a2c99e98-fd83-48fd-b650-d99095f5e49c',	3),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'7643b4d1-361d-4096-85aa-213e7179f63b',	133),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'66bc99cf-bc87-4e99-9b2e-272b3c27ee04',	68),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'dbd85ed6-499b-4705-858b-c9fb08609c1d',	37),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'c5263484-ff7f-4870-b128-26cd040c48f3',	5),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'14104edd-eeae-472b-81b7-e6e2ef644041',	137),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'f1811b0c-5088-49a1-85c5-0c02fd9e92b2',	118),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'db03b4ea-564f-4cd9-8011-a355b3ef9dab',	70),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'b4758827-7ea5-41b3-8883-2c7120a5b248',	20),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'c55f6a79-eb0e-4eee-8a75-b237c0a22b31',	140),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'c98fed28-299a-440a-8eca-a4f756206fa8',	139),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'43db42d4-1bbb-488c-bd33-857ca323b0e1',	145),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'24fa8fa6-ec8d-4fa6-a341-eea481ae60eb',	87),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'e810f9c3-5530-443c-9367-ce8c422c84dc',	98),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'7c204095-cdb9-46a4-938d-b95fbcbe2a96',	21),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'7654ce0e-c7ac-4cda-9733-46a0dd8e4c2a',	72),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'b7337aa1-6147-44f8-8e2e-208efd084913',	27),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'0d5e161f-dd53-4aba-9d54-d615fe1be443',	7),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'e1f84506-1f9a-48f4-bd8c-e0bcb93d1f0f',	138),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'e78751be-38e7-4c2c-812f-c4e5ab8ad313',	147),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'9315f10d-2abf-4455-a37e-60a6cb94b833',	64),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'5dff797b-993c-4be3-8510-4b20b6705b15',	73),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'81a7b2e3-87b7-4bee-9b01-54f74ca5036a',	84),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'8ed4b477-2df7-4c60-9355-314263d4e00e',	132),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'3dc094db-e1c3-4941-b55d-325c91068713',	116),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'96f48933-9847-460b-bddb-cee33f875f4d',	69),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'57ddee82-05b5-4876-8319-0a1d75187cc3',	79),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'45ef5297-a8c1-4db8-9013-15371f0e4b60',	114),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'b08c0d21-af35-402d-a4a3-0a760dcd2c51',	60),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'0f6c37e7-b6c4-4405-8fa3-9390092a10bc',	81),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'7307d602-d052-4edb-95db-586ccab817b0',	85),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'95065903-c00b-43bc-a469-8cf37d6b68e3',	48),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'7c084724-0327-48bb-b6ec-932b0eaa70aa',	124),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'c3a06ab4-3c76-45c1-9ea2-418cecef373c',	106),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'a04f17a6-e16b-4dda-8586-fced50472531',	55),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'a58caebd-f654-40d2-a97f-4cac4e4bface',	83),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'6a55fa1a-aad9-489b-9152-350eb8c76e32',	42),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'33c386e6-2dea-4763-8174-66283e0da942',	82),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'0b0ca22e-8173-40ac-8021-46e83bb55f34',	10),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'e200a4fa-cd9e-46f3-b20a-da77e8955b67',	18),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'23628efd-0f9e-4126-a840-933e76788ae9',	92),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'3f825a38-b957-4949-ba97-9af3635022d3',	113),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'dfb09787-908d-4df6-9f81-cad706969e37',	78),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'1b57773c-0800-4e70-a7cd-9e6690f604fa',	77),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'53c9c957-4a08-463d-8b5a-4d6f890ffe5c',	100),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'5afb0b01-3adb-4d56-9ed0-1dead5f7a957',	49),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'aa004d66-9e59-4ee2-b401-0222909c91aa',	123),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'1a002719-64b9-48b6-9f4d-54163a5ebae3',	28),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'49a22637-bdc6-4e23-b677-acf237ce6258',	96),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'31183fca-e21f-424e-a95c-80eeaa4d6b40',	95),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'0224e374-7c75-4281-8560-0d7c969e6c98',	115),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'a883f8eb-e8a6-42f2-a052-5057b875723a',	76),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'be86286e-5a6a-478f-9260-5dc7686086c8',	40),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'32d84bd0-e44f-4d9e-a95e-9cb737a20f79',	141),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'dd5391b3-48d4-4e07-a740-5f0c6b72177b',	36),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'b602abd3-560c-416b-9bf1-076f9b9aefaf',	108),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'ed602566-04e2-4d54-8a4f-aa688db09512',	117),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'77a0df11-bbf2-4c77-a2c2-e18abc772baf',	111),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'086f04f3-bf60-4027-9a8c-12f31e219c1b',	46),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'cb823e8a-730e-4709-9952-a78118a84d8b',	8),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'd433857f-326b-448e-805e-522c6c50ab07',	80),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'2bfa7a65-71b5-49bf-890f-7d7c14366af1',	125),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'77fa3873-7916-4a42-b1f4-c393d68db4f4',	6),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'e0c7d8ea-a244-473e-80fd-91e299c1d11d',	15),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'6ea7303b-bb4b-463b-a917-12808e24d0b8',	19),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'cd737e1e-bb33-42b0-9812-db01718f694c',	88),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'c91f69f6-acbc-44b9-8218-7912398b5fa5',	12),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'cd388008-b8fe-4efb-ac63-7dbb6247692a',	112),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'698fee6f-0729-4fde-8f96-a3122bba0988',	103),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'8da7cccf-3442-44cc-818f-b947c99608e3',	24),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'036e8aee-d199-4623-a18a-85250612e202',	57),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'7cf8f5ea-3c79-4a47-9236-5e871788e790',	104),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'f7fe4711-284f-4398-94b0-ed28db6ea90a',	102),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'5560f265-5c48-4286-b58f-46c222d6f99e',	89),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'e88e8b9c-7e67-4245-be9b-b5aa1a5e8539',	105),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'05f8e424-5c8f-4edc-9cae-266b2654d1fa',	34),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'4028ca99-9a51-4e0b-a8e9-55a9d6fb4232',	93),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'8ab6db15-9153-4148-ad3c-2d273d3456dc',	52),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'0bb74e1e-dc1d-4c02-a1fa-fb9873510dd1',	41),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'9c3abcad-2cbc-4709-b5a7-23dc4f0f20b8',	143),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'3e93f60d-d13d-4f17-ba81-f67a5b2853d5',	59),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'544e6b8d-21b9-4217-82a5-15f03499ab8a',	146),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'3b805044-4f2b-471b-a94e-bd6d3b53eeca',	109),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'c2407110-7bfb-48e0-859b-ea4d53ab2c1b',	56),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'bccf76c1-796b-43f7-ae99-bac8b34d54b2',	120),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'2c5e3909-bdc9-4609-b4c4-38366e824b05',	14),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'2c2b4a9b-d4cb-438a-9861-5717a433131f',	131),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'89a30f0e-8ed5-4160-9cdc-61e89b516290',	29),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'33a547d1-9176-46e2-be8a-e91aa5a1b7e7',	45),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'99596c5e-1512-47b2-8900-da2bc65366d8',	99),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'a47c9258-b8a5-4f72-adbf-a6922cdc4b36',	142),
('4ab4c691-d76b-4a91-bee9-fb732517a1c2',	'880d4efc-28c3-425d-a66f-973ab162af4a',	75);

DROP TABLE IF EXISTS "song_tag";
CREATE TABLE "public"."song_tag" (
    "song_id" uuid NOT NULL,
    "tag_id" uuid NOT NULL,
    CONSTRAINT "song_tag_song_id_tag_id_key" UNIQUE ("song_id", "tag_id")
) WITH (oids = false);

INSERT INTO "song_tag" ("song_id", "tag_id") VALUES
('8092f5b0-5ff3-484c-9f6e-226b3b56c403',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('bf4b0a30-1542-478a-bfbb-25a5383f6ae7',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('5d94e1cd-10ac-49df-b2f9-af2a651801ff',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('555fc247-e8c1-40d3-8187-fcfd82c3bd9f',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('dd765cca-80ff-4bfd-8096-1b94037c8e10',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('dd765cca-80ff-4bfd-8096-1b94037c8e10',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('79c44c8c-b9f4-4681-8bc6-61ba7696455b',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('d28de812-d308-4dc1-a2e8-dfc55e8545ed',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('e26028da-6163-46a8-ab26-26aa615ea3ef',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('5e738b9e-5296-41bf-b0bb-3c0241a41575',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('fbf4872e-09cb-4745-8855-d8b32c709aa9',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('66edf33d-f48b-4cc9-af78-c258cb0fe923',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('958455cd-fa6a-4d39-bd91-fbffe33b9982',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('9ec0f28b-4c19-4995-8216-d8c613b9351f',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('b258b06e-485a-4816-a9db-f2b35c00ec53',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('2a12c659-39c4-4584-a671-298759ba8d16',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('74ffd986-9e9f-4353-8d1b-b3d2587d9813',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('a692e24a-8d03-4378-9225-165bbf78ccf3',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('924bc506-8e20-42bb-b34b-f1c58d0f933c',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('700c86b2-6067-4e8b-bb6b-77ce27891f51',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('2dac6228-d7f2-41d4-a817-8644d249d298',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('ffee6513-a734-437e-89e6-9b004d106c20',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('632073eb-ce85-4c4f-83e9-7f17d30d19d1',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('1fd55659-6761-46e3-8a00-94f055e34a52',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('c6032372-f86c-4701-a48a-86e10180fa7e',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('3f2b8731-1f4e-47be-a7ce-a00298c4ac20',	'd5d782fe-a015-49c8-af53-4986266c6b61'),
('e9537fcd-f3fd-4c28-9bfc-4e40283f1108',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('41d104a1-04af-4363-89e6-04069cc666b0',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('2f91a726-4aad-49dc-b4b3-fee61bac7d5b',	'17c4deec-2e3c-4a67-b00e-e39e13d25cb0'),
('9530e97f-51a7-48c1-b042-12b4a7080953',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('8735b563-6b5a-48eb-90a3-090366f4442a',	'f0c2442f-5eaf-4d5a-bba2-f87078463a1b'),
('0ca541d2-081c-4edb-aa6a-0c319b26a188',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('a16da06b-dab6-4f38-9cbe-f082a8f8f31f',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('a16da06b-dab6-4f38-9cbe-f082a8f8f31f',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('397ef6ae-6b7d-4b51-98e6-00586fdc8a6b',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('da68b697-350a-4f4a-a47e-e740d0783ab2',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('4bbcc1ac-278d-475f-bdff-f21fb27d5481',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('67126478-346c-4055-9640-e7ced22df8a6',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('56b05e39-4deb-43c5-b987-7f391f70ab55',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('93be1f87-d263-46e4-92d5-f62ae868bb58',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('93be1f87-d263-46e4-92d5-f62ae868bb58',	'18ee212f-b35e-420e-b36c-36cdd5551dab'),
('93be1f87-d263-46e4-92d5-f62ae868bb58',	'f0c2442f-5eaf-4d5a-bba2-f87078463a1b'),
('93be1f87-d263-46e4-92d5-f62ae868bb58',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('4726fb13-8982-45a2-9689-c147a111e2d4',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('32c19a1a-962e-4eb0-9e4d-4edd4ba6c7b1',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('7f3c55c1-1a5c-4928-9b79-9d872fffc438',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('b9836a0c-4a8c-4f8a-8ff3-1b88579707fd',	'f0c2442f-5eaf-4d5a-bba2-f87078463a1b'),
('af2fa488-eeee-4794-999a-74806ae7afee',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('78e83a55-a4d1-424c-a532-957290635ba2',	'd5d782fe-a015-49c8-af53-4986266c6b61'),
('7acc0180-6ac5-4bb9-bc23-7244bf56ec7f',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('bd544859-7535-4eca-bb26-6fc1e69a1500',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('0697213b-a5ba-46f7-aa4f-3ea8a0ca31f2',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('8cad5901-a444-4001-b222-0e1405889459',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('b1213be6-42fb-4a3b-a205-2016902a3bfa',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('794d89f1-5b04-4e7e-8c97-e7bc6e173778',	'18ee212f-b35e-420e-b36c-36cdd5551dab'),
('83705d4a-1a0e-48ff-9547-27cde995a4be',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('6f801d29-15e7-4be3-bd41-345fc5710193',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('d4fcd078-0e1f-4600-a4fd-8fc0bb869ac5',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('25899195-c2b2-4b94-bb65-37b26d0cfbf7',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('c0d350e0-099d-4057-9916-f3189de66e6f',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('a2c99e98-fd83-48fd-b650-d99095f5e49c',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('7643b4d1-361d-4096-85aa-213e7179f63b',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('66bc99cf-bc87-4e99-9b2e-272b3c27ee04',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('dbd85ed6-499b-4705-858b-c9fb08609c1d',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('c5263484-ff7f-4870-b128-26cd040c48f3',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('14104edd-eeae-472b-81b7-e6e2ef644041',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('f1811b0c-5088-49a1-85c5-0c02fd9e92b2',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('db03b4ea-564f-4cd9-8011-a355b3ef9dab',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('b4758827-7ea5-41b3-8883-2c7120a5b248',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('c55f6a79-eb0e-4eee-8a75-b237c0a22b31',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('c98fed28-299a-440a-8eca-a4f756206fa8',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('43db42d4-1bbb-488c-bd33-857ca323b0e1',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('24fa8fa6-ec8d-4fa6-a341-eea481ae60eb',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('e810f9c3-5530-443c-9367-ce8c422c84dc',	'd5d782fe-a015-49c8-af53-4986266c6b61'),
('7c204095-cdb9-46a4-938d-b95fbcbe2a96',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('7654ce0e-c7ac-4cda-9733-46a0dd8e4c2a',	'18ee212f-b35e-420e-b36c-36cdd5551dab'),
('b7337aa1-6147-44f8-8e2e-208efd084913',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('0d5e161f-dd53-4aba-9d54-d615fe1be443',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('e1f84506-1f9a-48f4-bd8c-e0bcb93d1f0f',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('e78751be-38e7-4c2c-812f-c4e5ab8ad313',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('9315f10d-2abf-4455-a37e-60a6cb94b833',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('5dff797b-993c-4be3-8510-4b20b6705b15',	'18ee212f-b35e-420e-b36c-36cdd5551dab'),
('81a7b2e3-87b7-4bee-9b01-54f74ca5036a',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('8ed4b477-2df7-4c60-9355-314263d4e00e',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('3dc094db-e1c3-4941-b55d-325c91068713',	'17c4deec-2e3c-4a67-b00e-e39e13d25cb0'),
('96f48933-9847-460b-bddb-cee33f875f4d',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('57ddee82-05b5-4876-8319-0a1d75187cc3',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('45ef5297-a8c1-4db8-9013-15371f0e4b60',	'17c4deec-2e3c-4a67-b00e-e39e13d25cb0'),
('b08c0d21-af35-402d-a4a3-0a760dcd2c51',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('0f6c37e7-b6c4-4405-8fa3-9390092a10bc',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('7307d602-d052-4edb-95db-586ccab817b0',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('95065903-c00b-43bc-a469-8cf37d6b68e3',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('7c084724-0327-48bb-b6ec-932b0eaa70aa',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('c3a06ab4-3c76-45c1-9ea2-418cecef373c',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('a04f17a6-e16b-4dda-8586-fced50472531',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('a58caebd-f654-40d2-a97f-4cac4e4bface',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('6a55fa1a-aad9-489b-9152-350eb8c76e32',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('33c386e6-2dea-4763-8174-66283e0da942',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('0b0ca22e-8173-40ac-8021-46e83bb55f34',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('e200a4fa-cd9e-46f3-b20a-da77e8955b67',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('23628efd-0f9e-4126-a840-933e76788ae9',	'f0c2442f-5eaf-4d5a-bba2-f87078463a1b'),
('3f825a38-b957-4949-ba97-9af3635022d3',	'17c4deec-2e3c-4a67-b00e-e39e13d25cb0'),
('dfb09787-908d-4df6-9f81-cad706969e37',	'18ee212f-b35e-420e-b36c-36cdd5551dab'),
('1b57773c-0800-4e70-a7cd-9e6690f604fa',	'18ee212f-b35e-420e-b36c-36cdd5551dab'),
('53c9c957-4a08-463d-8b5a-4d6f890ffe5c',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('5afb0b01-3adb-4d56-9ed0-1dead5f7a957',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('5afb0b01-3adb-4d56-9ed0-1dead5f7a957',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('aa004d66-9e59-4ee2-b401-0222909c91aa',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('1a002719-64b9-48b6-9f4d-54163a5ebae3',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('49a22637-bdc6-4e23-b677-acf237ce6258',	'd5d782fe-a015-49c8-af53-4986266c6b61'),
('31183fca-e21f-424e-a95c-80eeaa4d6b40',	'd5d782fe-a015-49c8-af53-4986266c6b61'),
('0224e374-7c75-4281-8560-0d7c969e6c98',	'17c4deec-2e3c-4a67-b00e-e39e13d25cb0'),
('a883f8eb-e8a6-42f2-a052-5057b875723a',	'18ee212f-b35e-420e-b36c-36cdd5551dab'),
('be86286e-5a6a-478f-9260-5dc7686086c8',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('32d84bd0-e44f-4d9e-a95e-9cb737a20f79',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('dd5391b3-48d4-4e07-a740-5f0c6b72177b',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('b602abd3-560c-416b-9bf1-076f9b9aefaf',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('ed602566-04e2-4d54-8a4f-aa688db09512',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('77a0df11-bbf2-4c77-a2c2-e18abc772baf',	'17c4deec-2e3c-4a67-b00e-e39e13d25cb0'),
('086f04f3-bf60-4027-9a8c-12f31e219c1b',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('cb823e8a-730e-4709-9952-a78118a84d8b',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('d433857f-326b-448e-805e-522c6c50ab07',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('2bfa7a65-71b5-49bf-890f-7d7c14366af1',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('77fa3873-7916-4a42-b1f4-c393d68db4f4',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('e0c7d8ea-a244-473e-80fd-91e299c1d11d',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('e0c7d8ea-a244-473e-80fd-91e299c1d11d',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('6ea7303b-bb4b-463b-a917-12808e24d0b8',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('cd737e1e-bb33-42b0-9812-db01718f694c',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('c91f69f6-acbc-44b9-8218-7912398b5fa5',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('cd388008-b8fe-4efb-ac63-7dbb6247692a',	'17c4deec-2e3c-4a67-b00e-e39e13d25cb0'),
('698fee6f-0729-4fde-8f96-a3122bba0988',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('8da7cccf-3442-44cc-818f-b947c99608e3',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('036e8aee-d199-4623-a18a-85250612e202',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('7cf8f5ea-3c79-4a47-9236-5e871788e790',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('f7fe4711-284f-4398-94b0-ed28db6ea90a',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('5560f265-5c48-4286-b58f-46c222d6f99e',	'bc234995-95a7-4da3-a1a0-82f3e595244f'),
('e88e8b9c-7e67-4245-be9b-b5aa1a5e8539',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('05f8e424-5c8f-4edc-9cae-266b2654d1fa',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('4028ca99-9a51-4e0b-a8e9-55a9d6fb4232',	'd5d782fe-a015-49c8-af53-4986266c6b61'),
('8ab6db15-9153-4148-ad3c-2d273d3456dc',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('0bb74e1e-dc1d-4c02-a1fa-fb9873510dd1',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('9c3abcad-2cbc-4709-b5a7-23dc4f0f20b8',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('3e93f60d-d13d-4f17-ba81-f67a5b2853d5',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('544e6b8d-21b9-4217-82a5-15f03499ab8a',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('3b805044-4f2b-471b-a94e-bd6d3b53eeca',	'3052f517-a29e-4c51-88ab-7902d3c45674'),
('c2407110-7bfb-48e0-859b-ea4d53ab2c1b',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('bccf76c1-796b-43f7-ae99-bac8b34d54b2',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('2c5e3909-bdc9-4609-b4c4-38366e824b05',	'b9611baf-a801-47c8-b7b4-5646ade52646'),
('2c2b4a9b-d4cb-438a-9861-5717a433131f',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('89a30f0e-8ed5-4160-9cdc-61e89b516290',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('33a547d1-9176-46e2-be8a-e91aa5a1b7e7',	'5baa334c-88ec-4a9a-af0b-867f38b1e2d7'),
('99596c5e-1512-47b2-8900-da2bc65366d8',	'd5d782fe-a015-49c8-af53-4986266c6b61'),
('a47c9258-b8a5-4f72-adbf-a6922cdc4b36',	'4b3c30f3-dd8d-444f-8b54-b697ef13d0a7'),
('880d4efc-28c3-425d-a66f-973ab162af4a',	'18ee212f-b35e-420e-b36c-36cdd5551dab');

DROP TABLE IF EXISTS "songbook_user";
CREATE TABLE "public"."songbook_user" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "nick" text NOT NULL,
    "cid" text NOT NULL,
    CONSTRAINT "songbook_user_cid_key" UNIQUE ("cid"),
    CONSTRAINT "songbook_user_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tag";
CREATE TABLE "public"."tag" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "color_red" integer NOT NULL,
    "color_green" integer NOT NULL,
    "color_blue" integer NOT NULL,
    "owned_by" uuid NOT NULL,
    CONSTRAINT "tag_name_key" UNIQUE ("name"),
    CONSTRAINT "tag_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tag" ("id", "name", "description", "color_red", "color_green", "color_blue", "owned_by") VALUES
('17c4deec-2e3c-4a67-b00e-e39e13d25cb0',	'Mannen och kvinnan',	'',	0,	0,	0,	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('5baa334c-88ec-4a9a-af0b-867f38b1e2d7',	'Snaps',	'',	0,	0,	0,	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('f0c2442f-5eaf-4d5a-bba2-f87078463a1b',	'Bäsk',	'',	0,	0,	0,	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('18ee212f-b35e-420e-b36c-36cdd5551dab',	'Öhl',	'',	0,	0,	0,	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('3052f517-a29e-4c51-88ab-7902d3c45674',	'Dagen efter...',	'',	0,	0,	0,	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('bc234995-95a7-4da3-a1a0-82f3e595244f',	'Vin',	'',	0,	0,	0,	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('4b3c30f3-dd8d-444f-8b54-b697ef13d0a7',	'Allmänt',	'',	0,	0,	0,	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('b9611baf-a801-47c8-b7b4-5646ade52646',	'IT',	'',	0,	0,	0,	'af064f1c-0bac-4fd5-ac3d-7d29c107051f'),
('d5d782fe-a015-49c8-af53-4986266c6b61',	'Punsch',	'',	0,	0,	0,	'af064f1c-0bac-4fd5-ac3d-7d29c107051f');

DROP TABLE IF EXISTS "user_owner";
CREATE TABLE "public"."user_owner" (
    "owner_id" uuid NOT NULL,
    "songbook_user_id" uuid NOT NULL,
    CONSTRAINT "user_owner_pkey" PRIMARY KEY ("owner_id", "songbook_user_id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."official_song_book" ADD CONSTRAINT "official_song_book_song_book_id_fkey" FOREIGN KEY (song_book_id) REFERENCES song_book(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."song" ADD CONSTRAINT "song_owned_by_fkey" FOREIGN KEY (owned_by) REFERENCES owner(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."song" ADD CONSTRAINT "song_primary_melody_fkey" FOREIGN KEY (primary_melody) REFERENCES melody(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."song" ADD CONSTRAINT "song_secondary_melody_fkey" FOREIGN KEY (secondary_melody) REFERENCES melody(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."song_book" ADD CONSTRAINT "song_book_owned_by_fkey" FOREIGN KEY (owned_by) REFERENCES owner(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."song_book_image" ADD CONSTRAINT "song_book_image_image_id_fkey" FOREIGN KEY (image_id) REFERENCES image(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."song_book_image" ADD CONSTRAINT "song_book_image_song_book_id_fkey" FOREIGN KEY (song_book_id) REFERENCES song_book(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."song_book_song" ADD CONSTRAINT "song_book_song_song_book_id_fkey" FOREIGN KEY (song_book_id) REFERENCES song_book(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."song_book_song" ADD CONSTRAINT "song_book_song_song_id_fkey" FOREIGN KEY (song_id) REFERENCES song(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."song_tag" ADD CONSTRAINT "song_tag_song_id_fkey" FOREIGN KEY (song_id) REFERENCES song(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."song_tag" ADD CONSTRAINT "song_tag_tag_id_fkey" FOREIGN KEY (tag_id) REFERENCES tag(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tag" ADD CONSTRAINT "tag_owned_by_fkey" FOREIGN KEY (owned_by) REFERENCES owner(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."user_owner" ADD CONSTRAINT "user_owner_owner_id_fkey" FOREIGN KEY (owner_id) REFERENCES owner(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."user_owner" ADD CONSTRAINT "user_owner_songbook_user_id_fkey" FOREIGN KEY (songbook_user_id) REFERENCES songbook_user(id) NOT DEFERRABLE;

-- 2022-08-22 12:12:09.328933+00
