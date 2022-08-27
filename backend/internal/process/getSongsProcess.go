package process

import (
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
)

type SongsJson struct {
	Songs []models.SongJson `json:"songs"`
}

func GetSongs() (*SongsJson, error) {
	songs, err := queries.GetNonDeletedSongs()
	if err != nil {
		return nil, err
	}

	if songs == nil {
		songs = make([]*tables.Song, 0)
	}

	songsJson := make([]models.SongJson, 0)
	for _, song := range songs {

		owner, err := queries.GetOwner(song.OwnedBy)
		if err != nil {
			return nil, err
		}

		songTags, err := queries.GetTagsForSong(&song.ID)
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

		tags, err := songTagsToTagJsons(songTags)
		if err != nil {
			return nil, err
		}

		songsJson = append(
			songsJson,
			models.SongJson{
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
			},
		)
	}

	return &SongsJson{
		Songs: songsJson,
	}, nil
}

func songTagsToTagJsons(songTags []*tables.SongTag) (
	[]models.TagJson,
	error,
) {
	tagJson := make([]models.TagJson, 0)
	for _, songTag := range songTags {
		tag, err := queries.GetTagById(songTag.TagId)
		if err != nil {
			return nil, err
		}

		owner, err := queries.GetOwner(tag.OwnedBy)
		if err != nil {
			return nil, err
		}

		songCount, err := queries.CountSongsWithTag(&tag.ID)
		if err != nil {
			return nil, err
		}

		tagJson = append(
			tagJson, models.TagJson{
				ID:          tag.ID,
				Name:        tag.Name,
				Description: tag.Description,
				Color: models.ColorJson{
					R: &tag.ColorRed,
					G: &tag.ColorGreen,
					B: &tag.ColorBlue,
				},
				SongCount: songCount,
				Author: models.Owner{
					Id:   owner.ID,
					Name: owner.Name,
				},
			},
		)
	}

	return tagJson, nil
}
