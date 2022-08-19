package commands

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var createSongBookRecipeCommand = `
INSERT INTO song_book_recipe(song_book_id, recipe_id)
					   VALUES ($1, 			   $2)
RETURNING song_book_id, recipe_id
`

func CreateSongBookRecipe(songBookId, recipeId uuid.UUID) (*tables.SongBookRecipe, error) {
	db := getDb()

	var songBookRecipe tables.SongBookRecipe
	err := pgxscan.Get(ctx, db, &songBookRecipe, createSongBookRecipeCommand, songBookId, recipeId)
	return &songBookRecipe, err
}

var deleteSongBookRecipeCommand = `
DELETE FROM song_book_recipe
WHERE song_book_id=$1 AND recipe_id=$2
`

func DeleteSongBookRecipe(songBookId, recipeId uuid.UUID) error {
	db := getDb()

	_, err := db.Exec(ctx, deleteSongBookRecipeCommand, songBookId, recipeId)
	return err
}
