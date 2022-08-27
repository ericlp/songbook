package process

import (
	"fmt"
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
	"os"
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

	songs, err := queries.GetSongsForSongBook(songBook.ID)
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

	songJsons, err := SongsToJson(songs)
	if err != nil {
		return nil, err
	}

	return &models.DetailedSongBookJson{
		ID:         songBook.ID,
		Name:       songBook.Name,
		UniqueName: songBook.UniqueName,
		Songs:      songJsons,
		Image:      imageJson,
		OwnedBy: models.Owner{
			Id:   owner.ID,
			Name: owner.Name,
		},
	}, nil
}

func SongsToJson(songs []*tables.Song) (
	[]models.SongBookSongJson,
	error,
) {
	songJsons := make([]models.SongBookSongJson, 0)
	for _, song := range songs {
		owner, err := queries.GetOwner(song.OwnedBy)
		if err != nil {
			return nil, err
		}

		songJsons = append(
			songJsons, models.SongBookSongJson{
				ID:         song.ID,
				Title:      song.Title,
				UniqueName: song.UniqueName,
				Author:     owner.Name,
			},
		)
	}

	return songJsons, nil
}

func imageNameToPath(id uuid.UUID, name string) string {
	imagePath := common.GetEnvVars().ImageFolder
	filePath := fmt.Sprintf("%s/%s", imagePath, name)
	_, err := os.Stat(filePath)
	if err == nil {
		return name
	}

	nameWithId := fmt.Sprintf("%s_%s", id, name)
	filePath = fmt.Sprintf("%s/%s", imagePath, nameWithId)
	return nameWithId
}
