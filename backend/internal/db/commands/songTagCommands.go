package commands

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var createSongTagCommand = `
INSERT INTO song_tag(song_id, tag_id)
VALUES				($1,		  $2)
RETURNING song_id, tag_id
`

func CreateSongTag(songId, tagId uuid.UUID) (*tables.SongTag, error) {
	db := getDb()

	var songTag tables.SongTag
	err := pgxscan.Get(
		ctx,
		db,
		&songTag,
		createSongTagCommand,
		songId,
		tagId,
	)

	return &songTag, err
}

var deleteSongTagCommand = `
DELETE FROM song_tag
WHERE song_id=$1 AND tag_id=$2
`

func DeleteSongTag(songId, tagId uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, deleteSongTagCommand, songId, tagId)
	return err
}

var deleteSongTagsByTagIdCommand = `
DELETE FROM song_tag
WHERE tag_id=$1
`

func DeleteSongTagsByTagId(tagId uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, deleteSongTagsByTagIdCommand, tagId)
	return err
}
