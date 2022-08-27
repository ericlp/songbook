package commands

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var createSongBookSongCommand = `
INSERT INTO song_book_song(song_book_id, song_id, number)
					   VALUES ($1, 		 $2,       $3)
RETURNING song_book_id, song_id, number
`

func CreateSongBookSong(songBookId, songId uuid.UUID, songNum int) (*tables.SongBookSong, error) {
	db := getDb()

	var songBookSong tables.SongBookSong
	err := pgxscan.Get(ctx, db, &songBookSong, createSongBookSongCommand, songBookId, songId, songNum)
	return &songBookSong, err
}

var deleteSongBookSongBySongBookIdCommand = `
DELETE FROM song_book_song
WHERE song_book_id=$1
`

func DeleteSongBookSongBySongBook(songBookId uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, deleteSongBookSongBySongBookIdCommand, songBookId)
	return err
}
