package tables

import "github.com/google/uuid"

type OfficialSongBook struct {
	SongBookID uuid.UUID
}

func (_ OfficialSongBook) StructName() string {
	return "OfficialSongBook"
}
