CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS songbook_user
(
    id   uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    nick TEXT NOT NULL,
    cid  TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS owner
(
    id      uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name    TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS user_owner
(
    owner_id         uuid REFERENCES owner (id)         NOT NULL,
    songbook_user_id uuid REFERENCES songbook_user (id) NOT NULL,
    PRIMARY KEY (owner_id, songbook_user_id)
);

CREATE TABLE IF NOT EXISTS song
(
    id             uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    title          TEXT UNIQUE                   NOT NULL,
    author         TEXT                          NOT NULL,
    unique_name    TEXT UNIQUE                   NOT NULL,
    primary_melody   uuid REFERENCES melody (id) NOT NULL,
    secondary_melody uuid REFERENCES melody (id),
    text           TEXT                          NOT NULL,
    deleted        BOOLEAN                       NOT NULL,
    owned_by       uuid REFERENCES owner (id)    NOT NULL
);


CREATE TABLE IF NOT EXISTS melody
(
    id      uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    song_id uuid REFERENCES song (id) NOT NULL,
    melody  TEXT                      NOT NULL,
    link    TEXT                      NOT NULL
);

CREATE TABLE tag
(
    id          uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name        TEXT UNIQUE                NOT NULL,
    description TEXT                       NOT NULL,
    color_red   INTEGER                    NOT NULL,
    color_green INTEGER                    NOT NULL,
    color_blue  INTEGER                    NOT NULL,
    owned_by    uuid REFERENCES owner (id) NOT NULL
);

CREATE TABLE song_tag
(
    song_id uuid REFERENCES song (id),
    tag_id  uuid REFERENCES tag (id),
    UNIQUE (song_id, tag_id)
);

CREATE TABLE IF NOT EXISTS official_song_book
(
    song_book_id uuid REFERENCES song (id) NOT NULL
);

CREATE TABLE IF NOT EXISTS song_book
(
    id          uuid PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    name        TEXT             NOT NULL UNIQUE,
    unique_name TEXT             NOT NULL UNIQUE,
    deleted     BOOLEAN          NOT NULL,
    owned_by    uuid REFERENCES owner (id)
);

CREATE TABLE IF NOT EXISTS song_book_song
(
    song_book_id uuid REFERENCES song_book (id),
    song_id      uuid REFERENCES song (id),
    number       INTEGER         NOT NULL,
    UNIQUE (song_book_id, number),
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

