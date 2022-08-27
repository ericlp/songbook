package validation

import (
	"errors"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/google/uuid"
	"log"
)

var (
	ErrFailedToRetrieveImage = errors.New("failed to retrieve the provided image id from the database")
	ErrFailedToRetrieveSong  = errors.New("failed to retrieve the provided song id from the database")
)

func ValidateSongBook(songBook *models.EditSongBookJson) error {
	err := validateSongBookImages(songBook.Images)
	if err != nil {
		return err
	}

	err = validateSongBookSongs(songBook.Songs)
	if err != nil {
		return err
	}

	return nil
}

func validateSongBookImages(images []uuid.UUID) error {
	for _, imageId := range images {
		_, err := queries.GetImageById(imageId)
		if err != nil {
			log.Printf("Failed to retrieve image: %v\n", err)
			return ErrFailedToRetrieveImage
		}
	}
	return nil
}

func validateSongBookSongs(songs []uuid.UUID) error {
	for _, songId := range songs {
		_, err := queries.GetSongById(songId)
		if err != nil {
			log.Printf("Failed to retrieve song: %v\n", err)
			return ErrFailedToRetrieveSong
		}
	}
	return nil
}
