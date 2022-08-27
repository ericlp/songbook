package queries

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var getMelodyByIdQuery = `
SELECT id, melody, link
FROM melody		 
WHERE id=$1`

func GetMelody(id uuid.UUID) (*tables.Melody, error) {
	db := getDb()

	var melody tables.Melody
	err := pgxscan.Get(ctx, db, &melody, getMelodyByIdQuery, id)
	return &melody, err
}
