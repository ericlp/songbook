-- Setup a user and owner
INSERT INTO songbook_user (id, nick, cid)
VALUES ('177e9825-7000-431b-96c8-3ef314eaf92e', 'admin', 'admin');

INSERT INTO owner (id, name)
VALUES ('7cc2fc04-7379-4361-9f4e-079054933d2f', 'admin');

INSERT INTO user_owner (owner_id, songbook_user_id)
VALUES  ('7cc2fc04-7379-4361-9f4e-079054933d2f', '177e9825-7000-431b-96c8-3ef314eaf92e');
        
INSERT INTO user_owner (owner_id, songbook_user_id)
SELECT id, '177e9825-7000-431b-96c8-3ef314eaf92e' FROM owner WHERE name='sexit';
