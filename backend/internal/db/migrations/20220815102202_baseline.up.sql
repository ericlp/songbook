CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS songbook_user
(
    id   uuid PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    nick TEXT             NOT NULL,
    cid  TEXT             NOT NULL
);

CREATE TABLE IF NOT EXISTS owner
(
    id      uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name    TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS user_owner
(
    owner_id         uuid REFERENCES owner (id),
    songbook_user_id uuid REFERENCES songbook_user (id),
    PRIMARY KEY (owner_id, songbook_user_id)
);

CREATE TABLE IF NOT EXISTS song
(
    id             uuid PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    title          TEXT UNIQUE      NOT NULL,
    author         TEXT,
    unique_name    TEXT UNIQUE      NOT NULL,
    primary_melody TEXT,
    text           TEXT,
    private        TEXT,
    deleted        BOOLEAN          NOT NULL,
    owned_by       uuid REFERENCES owner (id)
);

CREATE TABLE tag
(
    id          uuid PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    name        TEXT UNIQUE      NOT NULL,
    description TEXT             NOT NULL,
    color_red   INTEGER          NOT NULL,
    color_green INTEGER          NOT NULL,
    color_blue  INTEGER          NOT NULL,
    owned_by    uuid REFERENCES owner (id)
);

CREATE TABLE song_tag
(
    song_id uuid REFERENCES song (id),
    tag_id  uuid REFERENCES tag (id),
    UNIQUE (song_id, tag_id)
);

CREATE TABLE IF NOT EXISTS secondary_melody
(
    song_id uuid REFERENCES song (id),
    melody  TEXT NOT NULL,
    PRIMARY KEY (song_id, melody)
);


CREATE TABLE IF NOT EXISTS official_song_request
(
    approved BOOLEAN,
    song_id  uuid PRIMARY KEY REFERENCES song (id)
);


CREATE TABLE IF NOT EXISTS official_song
(
    number  BIGINT UNIQUE NOT NULL,
    song_id uuid REFERENCES song (id),
    PRIMARY KEY (song_id, number)
);

CREATE TABLE IF NOT EXISTS song_book
(
    id          uuid PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    name        TEXT             NOT NULL UNIQUE,
    unique_name TEXT             NOT NULL UNIQUE,
    author      TEXT,
    private     BOOLEAN          NOT NULL,
    deleted     BOOLEAN          NOT NULL,
    owned_by    uuid REFERENCES owner (id)
);

CREATE TABLE IF NOT EXISTS song_book_song
(
    song_book_id uuid REFERENCES song_book (id),
    song_id      uuid REFERENCES song (id),
    PRIMARY KEY (song_book_id, song_id)
);

CREATE TABLE IF NOT EXISTS image
(
    id   uuid PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    name TEXT             NOT NULL
);

CREATE TABLE IF NOT EXISTS song_book_image
(
    song_book_id uuid REFERENCES song_book (id),
    image_id     uuid REFERENCES image (id),
    PRIMARY KEY (song_book_id, image_id)
);

CREATE TABLE IF NOT EXISTS favorite_song
(
    song_id uuid REFERENCES song (id),
    user_id uuid REFERENCES songbook_user (id),
    PRIMARY KEY (song_id, user_id)
);

CREATE TABLE IF NOT EXISTS favorite_song_book
(
    song_book_id uuid REFERENCES song_book (id),
    user_id      uuid REFERENCES songbook_user (id),
    PRIMARY KEY (song_book_id, user_id)
);
