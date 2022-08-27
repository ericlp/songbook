package process

import (
	common2 "github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/commands"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
	"strings"
)

func CreateSong(
	newSong *models.NewSongJson, priMelodyId, secMelodyId uuid.UUID) (*tables.Song, error) {
	uniqueName, err := generateUniqueSongName(newSong.Title)
	if err != nil {
		return nil, err
	}
	song, err := commands.CreateSong(
		newSong.Title,
		uniqueName,
		priMelodyId,
		secMelodyId,
		newSong.OwnerId,
	)
	return song, err
}

func CreateNewSong(
	songJson *models.NewSongJson,
) (string, error) {
	priMelody, err := commands.CreateUnknownMelody()
	if err != nil {
		return "", err
	}
	secMelody, err := commands.CreateEmptyMelody()
	if err != nil {
		return "", err
	}

	song, err := CreateSong(songJson, priMelody.ID, secMelody.ID)
	if err != nil {
		return "", err
	}

	return song.UniqueName, nil
}

func generateUniqueSongName(name string) (string, error) {
	lowerCase := strings.ToLower(name)
	uniqueName := strings.ReplaceAll(lowerCase, " ", "_")

	_, err := queries.GetSongByName(uniqueName)
	if err != nil {
		if pgxscan.NotFound(err) {
			return uniqueName, nil
		}
		return "", err
	}
	return uniqueName, common2.ErrNameTaken
}
