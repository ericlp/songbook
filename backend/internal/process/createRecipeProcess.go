package process

import (
	common2 "github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/commands"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/georgysavva/scany/pgxscan"
	"strings"
)

func CreateSong(
	newSong *models.NewSongJson,
) (*tables.Song, error) {
	uniqueName, err := generateUniqueName(newSong.Title)
	if err != nil {
		return nil, err
	}
	song, err := commands.CreateSong(
		newSong.Title,
		uniqueName,
		"",
		newSong.OwnerId,
	)
	return song, err
}

func CreateNewRecipe(
	recipeJson *models.NewRecipeJson,
) (string, error) {
	recipe, err := CreateRecipe(recipeJson)
	if err != nil {
		return "", err
	}

	return recipe.UniqueName, nil
}

func generateUniqueName(name string) (string, error) {
	lowerCase := strings.ToLower(name)
	uniqueName := strings.ReplaceAll(lowerCase, " ", "_")

	_, err := queries.GetRecipeByName(uniqueName)
	if err != nil {
		if pgxscan.NotFound(err) {
			return uniqueName, nil
		}
		return "", err
	}
	return uniqueName, common2.ErrNameTaken
}
