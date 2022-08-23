package commands

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var createSongBookSongCommand = `
INSERT INTO song_book_song(song_book_id, song_id)
					   VALUES ($1, 			   $2)
RETURNING song_book_id, song_id
`

func CreateSongBookSong(songBookId, songId uuid.UUID) (*tables.SongBookSong, error) {
	db := getDb()

	var songBookSong tables.SongBookSong
	err := pgxscan.Get(ctx, db, &songBookSong, createSongBookSongCommand, songBookId, songId)
	return &songBookSong, err
}

var deleteSongBookSongCommand = `
DELETE FROM song_book_song
WHERE song_book_id=$1 AND song_id=$2
`

func DeleteSongBookSong(songBookId, songId uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, deleteSongBookSongCommand, songBookId, songId)
	return err
}
