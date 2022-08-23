package commands

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var createSongCommand = `
INSERT INTO song(title,	author, unique_name, primary_melody, secondary_melody, text, deleted, owned_by)
VALUES 			($1,   	$2,		$3,          $4,        	 $5,               $6,	 $7,      $8)
RETURNING id, title, author, unique_name, primary_melody, secondary_melody, text, deleted, owned_by`

func CreateSong(title, uniqueName string, primaryMelody, OwnedBy uuid.UUID) (*tables.Song, error) {
	db := getDb()

	var song tables.Song
	err := pgxscan.Get(ctx, db, &song, createSongCommand, title, "", uniqueName, primaryMelody, nil, "", false, OwnedBy)
	return &song, err
}

var updateSongCommand = `
UPDATE song 
SET title=$1,
	author=$2,
	unique_name=$3,
	primary_melody=$4,
	secondary_melody=$5,
	text=$6
WHERE id=$7
`

func UpdateSong(title, author, uniqueName string, primaryMelody uuid.UUID, secondaryMelody *uuid.UUID, text string, songId uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, updateSongCommand, title, author, uniqueName, primaryMelody, secondaryMelody, text, songId)
	return err
}

var songSetDeletedCommand = `
UPDATE song
SET deleted=true,
	title=$1,
	unique_name=$2
WHERE id=$3
`

func SongSetDeleted(title, uniqueName string, id uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, songSetDeletedCommand, title, uniqueName, id)
	return err
}
