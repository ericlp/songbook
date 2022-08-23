package queries

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var countSongsWithTagQuery = `
SELECT COUNT(*)
FROM song_tag JOIN song ON song_tag.song_id = song.id
WHERE tag_id=$1
`

func CountSongsWithTag(tagId *uuid.UUID) (uint64, error) {
	db := getDb()

	var count uint64
	err := pgxscan.Get(ctx, db, &count, countSongsWithTagQuery, tagId)

	return count, err
}

var getTagsForSongQuery = `
SELECT * 
FROM song_tag
WHERE song_id=$1
`

func GetTagsForSong(songId *uuid.UUID) ([]*tables.SongTag, error) {
	db := getDb()

	var tags []*tables.SongTag
	err := pgxscan.Select(ctx, db, &tags, getTagsForSongQuery, songId)

	return tags, err
}
