package tables

import "github.com/google/uuid"

type SongBookSong struct {
	SongBookId uuid.UUID
	RecipeId   uuid.UUID
	Number     int
}
