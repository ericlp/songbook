package commands

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var createSongBookImageCommand = `
INSERT INTO song_book_image(song_book_id, image_id)
					  VALUES ($1, 			  $2)
RETURNING song_book_id, image_id
`

func CreateSongBookImage(songBookId, imageId uuid.UUID) (*tables.SongBookImage, error) {
	db := getDb()

	var songBookImage tables.SongBookImage
	err := pgxscan.Get(ctx, db, &songBookImage, createSongBookImageCommand, songBookId, imageId)
	return &songBookImage, err
}

var deleteSongBookImageCommand = `
DELETE FROM song_book_image
WHERE song_book_id=$1 AND image_id=$2
`

func DeleteSongBookImage(bookId, imageId uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, deleteSongBookImageCommand, bookId, imageId)
	return err
}
