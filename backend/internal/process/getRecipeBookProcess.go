package process

import (
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/georgysavva/scany/pgxscan"
)

func GetSongBook(uniqueName string) (*models.DetailedSongBookJson, error) {
	songBook, err := queries.GetSongBookByName(uniqueName)
	if err != nil {
		if pgxscan.NotFound(err) {
			return nil, common.ErrNoSuchSongBook
		}
		return nil, err
	}

	if songBook.Deleted {
		return nil, common.ErrNoSuchSongBook
	}

	recipes, err := queries.GetRecipesForSongBook(songBook.ID)
	if err != nil && !pgxscan.NotFound(err) {
		return nil, err
	}

	var imageJson *models.ImageJson = nil
	image, err := queries.GetImageForSongBook(songBook.ID)
	if err != nil {
		if !pgxscan.NotFound(err) {
			return nil, err
		}
	} else {
		imageJson = &models.ImageJson{
			Path: imageNameToPath(image.ID, image.Name),
			ID:   image.ID,
		}
	}

	owner, err := queries.GetOwner(songBook.OwnedBy)
	if err != nil {
		return nil, err
	}

	recipeJsons, err := RecipesToJson(recipes)
	if err != nil {
		return nil, err
	}

	return &models.DetailedSongBookJson{
		ID:         songBook.ID,
		Name:       songBook.Name,
		UniqueName: songBook.UniqueName,
		UploadedBy: models.Owner{
			Id:     owner.ID,
			Name:   owner.Name,
			IsUser: owner.IsUser,
		},
		Author:  songBook.Author,
		Recipes: recipeJsons,
		Image:   imageJson,
	}, nil
}

func RecipesToJson(recipes []*tables.Recipe) (
	[]models.SongBookRecipeJson,
	error,
) {
	recipeJsons := make([]models.SongBookRecipeJson, 0)
	for _, recipe := range recipes {
		owner, err := queries.GetOwner(recipe.OwnedBy)
		if err != nil {
			return nil, err
		}

		recipeJsons = append(
			recipeJsons, models.SongBookRecipeJson{
				Name:       recipe.Name,
				UniqueName: recipe.UniqueName,
				Author:     owner.Name,
				ID:         recipe.ID,
			},
		)
	}

	return recipeJsons, nil
}
