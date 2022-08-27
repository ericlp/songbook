package tables

import "github.com/google/uuid"

type SongBookSong struct {
	SongBookId uuid.UUID
	SongId     uuid.UUID
	Number     int
}
