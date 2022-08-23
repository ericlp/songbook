package queries

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var getUserByIdQuery = `
SELECT id, nick, cid
FROM songbook_user 
WHERE id=$1`

func GetUser(id uuid.UUID) (*tables.User, error) {
	db := getDb()

	var user tables.User
	err := pgxscan.Get(ctx, db, &user, getUserByIdQuery, id)
	return &user, err
}

var getUserByCIDQuery = `
SELECT id, nick, cid
FROM songbook_user
WHERE cid=$1;
`

func GetUserByCID(cid string) (*tables.User, error) {
	db := getDb()

	var user tables.User
	err := pgxscan.Get(ctx, db, &user, getUserByCIDQuery, cid)
	return &user, err
}

var GetAllOwnersWithSongQuery = `
SELECT DISTINCT owner.id, owner.name
FROM owner
INNER JOIN song ON song.owned_by=owner.id
`

func GetAllUsersWithSong() ([]tables.Owner, error) {
	db := getDb()

	var owners []tables.Owner
	err := pgxscan.Select(ctx, db, &owners, GetAllOwnersWithSongQuery)
	return owners, err
}
