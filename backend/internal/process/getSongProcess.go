package process

import (
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/georgysavva/scany/pgxscan"
)

func GetSong(uniqueName string) (*models.SongJson, error) {
	song, err := queries.GetSongByName(uniqueName)
	if err != nil {
		if pgxscan.NotFound(err) {
			return nil, common.ErrNoSuchSong
		}
		return nil, err
	}

	if song.Deleted {
		return nil, common.ErrNoSuchSong
	}

	owner, err := queries.GetOwner(song.OwnedBy)
	if err != nil {
		return nil, err
	}

	priMel, err := queries.GetMelody(song.PrimaryMelody)
	if err != nil {
		return nil, err
	}

	secMel, err := queries.GetMelody(song.SecondaryMelody)
	if err != nil {
		return nil, err
	}

	songTags, err := queries.GetTagsForSong(&song.ID)
	if err != nil {
		return nil, err
	}

	tags, err := songTagsToTagJsons(songTags)
	if err != nil {
		return nil, err
	}

	return &models.SongJson{
		ID:         song.ID,
		Title:      song.Title,
		Author:     song.Author,
		UniqueName: song.UniqueName,
		PrimaryMelody: models.MelodyJson{
			Melody: priMel.Melody,
			Link:   priMel.Link,
		},
		SecondaryMelody: models.MelodyJson{
			Melody: secMel.Melody,
			Link:   secMel.Link,
		},
		Text: song.Text,
		OwnedBy: models.Owner{
			Id:   owner.ID,
			Name: owner.Name,
		},
		Tags: tags,
	}, nil
}
