package queries

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var getSongByNameQuery = `SELECT id, title, author, unique_name, primary_melody, secondary_melody, text, deleted, owned_by
FROM song
WHERE unique_name=$1`

func GetSongByName(uniqueName string) (*tables.Song, error) {
	db := getDb()

	var recipe tables.Song
	err := pgxscan.Get(ctx, db, &recipe, getSongByNameQuery, uniqueName)
	return &recipe, err
}

var getSongByIdQuery = `SELECT id, title, author, unique_name, primary_melody, secondary_melody, text, deleted, owned_by
FROM song
WHERE id=$1`

func GetSongById(id uuid.UUID) (*tables.Song, error) {
	db := getDb()

	var song tables.Song
	err := pgxscan.Get(ctx, db, &song, getSongByIdQuery, id)
	return &song, err
}

var getNonDeletedSongsQuery = `SELECT id, title, author, unique_name, primary_melody, secondary_melody, text, deleted, owned_by
FROM song
WHERE deleted=false`

func GetNonDeletedRecipes() ([]*tables.Song, error) {
	db := getDb()

	var songs []*tables.Song
	err := pgxscan.Select(ctx, db, &songs, getNonDeletedSongsQuery)

	return songs, err
}

var getSongsForSongBookQuery = `
SELECT song.id, title, author, unique_name, primary_melody, secondary_melody, text, deleted, owned_by
FROM song_book_song
	JOIN song ON song_book_song.song_id = song.id
WHERE song_book_song.song_book_id = $1
AND song.deleted = false;
`

func GetSongsForSongBook(songBookId uuid.UUID) ([]*tables.Song, error) {
	db := getDb()

	var songs []*tables.Song
	err := pgxscan.Select(ctx, db, &songs, getSongsForSongBookQuery, songBookId)

	return songs, err
}
