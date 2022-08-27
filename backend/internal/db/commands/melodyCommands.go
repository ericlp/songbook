package commands

import (
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var createMelodyCommand = `
INSERT INTO melody(melody, link)
		 VALUES($1,   $2)
RETURNING id, melody, link
`

func CreateMelody(melody, link string) (*tables.Melody, error) {
	db := getDb()

	var mel tables.Melody
	err := pgxscan.Get(
		ctx,
		db,
		&mel,
		createMelodyCommand,
		melody,
		link)
	return &mel, err
}

func CreateUnknownMelody() (*tables.Melody, error) {
	db := getDb()

	var mel tables.Melody
	err := pgxscan.Get(
		ctx,
		db,
		&mel,
		createMelodyCommand,
		common.GetEnvVars().UnknownMelodyName,
		common.GetEnvVars().DefaultMelodyLink)

	return &mel, err
}

func CreateEmptyMelody() (*tables.Melody, error) {
	db := getDb()

	var mel tables.Melody
	err := pgxscan.Get(
		ctx,
		db,
		&mel,
		createMelodyCommand,
		"",
		"")

	return &mel, err
}

var deleteMelodyCommand = `
DELETE
FROM melody
WHERE id=$1
`

func DeleteMelody(id uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, deleteMelodyCommand, id)
	return err
}

var updateMelodyCommand = `
UPDATE melody
SET melody=$1,
	link=$2,
WHERE id = $3
`

func UpdateMelody(melody, link string, id uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(
		ctx,
		updateMelodyCommand,
		melody,
		link,
		id)

	return err
}
