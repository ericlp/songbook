package tables

import "github.com/google/uuid"

type SongBookRecipe struct {
	SongBookId uuid.UUID
	RecipeId   uuid.UUID
}
