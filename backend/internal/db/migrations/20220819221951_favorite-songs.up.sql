-- CREATE TABLE IF NOT EXISTS favorite_song
-- (
--     song_id uuid REFERENCES song (id),
--     user_id uuid REFERENCES songbook_user (id),
--     PRIMARY KEY (song_id, user_id)
-- );
--
-- CREATE TABLE IF NOT EXISTS favorite_song_book
-- (
--     song_book_id uuid REFERENCES song_book (id),
--     user_id      uuid REFERENCES songbook_user (id),
--     PRIMARY KEY (song_book_id, user_id)
-- );