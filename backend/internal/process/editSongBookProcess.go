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

	err = updateSongBookSongs(oldSongBook.ID, updatedSongBook.Songs)
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

func updateSongBookSongs(bookId uuid.UUID, songs []uuid.UUID) error {
	err := commands.DeleteSongBookSongBySongBook(bookId)
	if err != nil {
		return err
	}

	for songNum, songId := range songs {
		_, err := commands.CreateSongBookSong(bookId, songId, songNum)
		if err != nil {
			return err
		}
	}

	return nil
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

func connectImagesToSongBook(
	songBookId uuid.UUID,
	imageIds []uuid.UUID,
) error {
	for _, imageId := range imageIds {
		_, err := commands.CreateSongBookImage(songBookId, imageId)
		if err != nil {
			return err
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
