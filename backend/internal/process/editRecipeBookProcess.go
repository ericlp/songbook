package process

import (
	"github.com/ericlp/songbook/backend/internal/db/commands"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/google/uuid"
)

func EditSongBook(
	oldSongBook *tables.SongBook,
	updatedSongBook *models.EditSongBookJson,
) (string, error) {
	uniqueName, err := updateSongBookGeneral(oldSongBook, updatedSongBook)
	if err != nil {
		return "", err
	}

	err = updateSongBookRecipes(oldSongBook.ID, updatedSongBook.Recipes)
	if err != nil {
		return "", err
	}

	err = updateSongBookImages(oldSongBook.ID, updatedSongBook.Images)

	return uniqueName, err
}

func updateSongBookGeneral(
	oldSongBook *tables.SongBook,
	newSongBook *models.EditSongBookJson,
) (string, error) {
	uniqueName := oldSongBook.UniqueName
	changed := false
	if oldSongBook.Name != newSongBook.Name {
		// Need to generate a new uniqueName
		newUniqueName, err := generateUniqueBookName(newSongBook.Name)
		if err != nil {
			return "", err
		}
		uniqueName = newUniqueName
		changed = true
	}

	if oldSongBook.Author != newSongBook.Author {
		changed = true
	}

	if changed {
		err := commands.UpdateSongBook(
			newSongBook.Name,
			uniqueName,
			newSongBook.Author,
			oldSongBook.ID,
		)
		if err != nil {
			return "", err
		}
	}

	return uniqueName, nil
}

func updateSongBookRecipes(bookId uuid.UUID, recipes []uuid.UUID) error {
	oldRecipes, err := queries.GetRecipesForSongBook(bookId)
	if err != nil {
		return err
	}

	for _, recipeId := range recipes {
		if recipeWithIdIsInList(recipeId, oldRecipes) == false {
			// Create the songBookRecipe
			_, err := commands.CreateSongBookRecipe(bookId, recipeId)
			if err != nil {
				return err
			}
		}
	}

	// Delete any recipes that are no longer in the book
	for _, oldRecipe := range oldRecipes {
		removed := true
		for _, rec := range recipes {
			if oldRecipe.ID == rec {
				removed = false
			}
		}

		if removed {
			err := commands.DeleteSongBookRecipe(bookId, oldRecipe.ID)
			if err != nil {
				return err
			}
		}
	}

	return nil
}

func recipeWithIdIsInList(id uuid.UUID, oldRecipes []*tables.Recipe) bool {
	for _, oldRecipe := range oldRecipes {
		if oldRecipe.ID == id {
			return true
		}
	}

	return false
}

func updateSongBookImages(bookId uuid.UUID, images []uuid.UUID) error {
	oldImages, err := queries.GetImagesForSongBook(bookId)
	if err != nil {
		return err
	}

	var handledImages []uuid.UUID
	var newImages []uuid.UUID
	for _, image := range images {
		oldImage := getOldBookImage(image, oldImages)
		if oldImage == nil {
			// The image is new
			newImages = append(newImages, image)
		} else {
			handledImages = append(handledImages, oldImage.ID)
		}
	}

	err = connectImagesToSongBook(bookId, newImages)
	if err != nil {
		return err
	}

	for _, oldImage := range oldImages {
		found := false
		for _, handled := range handledImages {
			if oldImage.ID == handled {
				found = true
			}
		}

		if found == false {
			err = commands.DeleteSongBookImage(bookId, oldImage.ID)
			if err != nil {
				return err
			}
		}
	}

	return nil
}

func getOldBookImage(image uuid.UUID, oldImages []tables.Image) *tables.Image {
	for _, oldImage := range oldImages {
		if image == oldImage.ID {
			return &oldImage
		}
	}

	return nil
}
