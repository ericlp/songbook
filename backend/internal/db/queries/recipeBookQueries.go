package queries

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var getSongBookByNameQuery = `
SELECT id, name, unique_name, author, owned_by, deleted
FROM song_book
WHERE unique_name=$1
`

func GetSongBookByName(uniqueName string) (*tables.SongBook, error) {
	db := getDb()

	var songBook tables.SongBook
	err := pgxscan.Get(ctx, db, &songBook, getSongBookByNameQuery, uniqueName)
	return &songBook, err
}

var getNonDeletedBooksQuery = `
SELECT id, name, unique_name, author, owned_by, deleted
FROM song_book
WHERE deleted=false
`

func GetNonDeletedSongBooks() ([]*tables.SongBook, error) {
	db := getDb()

	var songBooks []*tables.SongBook
	err := pgxscan.Select(ctx, db, &songBooks, getNonDeletedBooksQuery)

	return songBooks, err
}

var getSongBookByIdQuery = `
SELECT id, name, unique_name, author, owned_by, deleted
FROM song_book
WHERE id=$1
`

func GetSongBookById(id uuid.UUID) (*tables.SongBook, error) {
	db := getDb()

	var songBook tables.SongBook
	err := pgxscan.Get(ctx, db, &songBook, getSongBookByIdQuery, id)
	return &songBook, err
}
