package commands

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var createSongBookCommand = `
INSERT INTO song_book(name, unique_name, author, deleted, owned_by)
				VALUES ($1,   $2, 	       '',     false,   $3)
RETURNING id, name, unique_name, author
`

func CreateSongBook(name, uniqueName string, OwnedBy uuid.UUID) (
	*tables.SongBook,
	error,
) {
	db := getDb()

	var songBook tables.SongBook
	err := pgxscan.Get(
		ctx,
		db,
		&songBook,
		createSongBookCommand,
		name,
		uniqueName,
		OwnedBy,
	)
	return &songBook, err
}

var updateSongBookCommand = `
UPDATE song_book
SET name=$1,
	unique_name=$2,
	author=$3
WHERE id=$4
`

func UpdateSongBook(name, uniqueName, author string, bookId uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(
		ctx,
		updateSongBookCommand,
		name,
		uniqueName,
		author,
		bookId,
	)
	return err
}

var songBookSetDeletedCommand = `
UPDATE song_book
SET deleted=true,
	name=$1,
	unique_name=$2
WHERE id=$3
`

func SongBookSetDeleted(name, uniqueName string, id uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, songBookSetDeletedCommand, name, uniqueName, id)
	return err
}
