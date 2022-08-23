package process

import (
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/commands"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
	"strings"
)

func CreateNewSongBook(
	songBookJson *models.NewSongBookJson,
) (string, error) {
	uniqueName, err := generateUniqueBookName(songBookJson.Name)
	if err != nil {
		return "", err
	}

	songBook, err := commands.CreateSongBook(
		songBookJson.Name,
		uniqueName,
		songBookJson.OwnerId,
	)
	if err != nil {
		return "", err
	}

	return songBook.UniqueName, nil
}

func generateUniqueBookName(name string) (string, error) {
	lowerCase := strings.ToLower(name)
	uniqueName := strings.ReplaceAll(lowerCase, " ", "_")

	_, err := queries.GetSongBookByName(uniqueName)
	if err != nil {
		if pgxscan.NotFound(err) {
			return uniqueName, nil
		}
		return "", err
	}

	return uniqueName, common.ErrNameTaken
}

func createSongBookSongs(
	songBookId uuid.UUID,
	songs []uuid.UUID,
) error {
	for _, song := range songs {
		_, err := commands.CreateSongBookSong(songBookId, song)
		if err != nil {
			return err
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
