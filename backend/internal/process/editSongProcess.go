package process

import (
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/commands"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/google/uuid"
)

func EditSong(
	oldSong *tables.Song,
	newSong *models.EditSongJson,
) (string, error) {

	primaryMelId, err := updateMelody(oldSong.PrimaryMelody, newSong.PrimaryMelody)
	if err != nil {
		return "", err
	}

	secondaryMelId, err := updateMelody(oldSong.SecondaryMelody, newSong.SecondaryMelody)
	if err != nil {
		return "", err
	}

	err = updateSongTags(oldSong.ID, newSong.Tags)
	if err != nil {
		return "", err
	}

	uniqueName, err := updateSongGeneral(oldSong, newSong, primaryMelId, secondaryMelId)
	if err != nil {
		return "", err
	}

	return uniqueName, nil
}

func updateSongGeneral(
	oldSong *tables.Song,
	newSong *models.EditSongJson,
	primaryMelId, secondaryMelId uuid.UUID,
) (string, error) {
	uniqueName := oldSong.UniqueName
	changed := false
	if oldSong.Title != newSong.Title {
		// Need to generate a new uniqueName
		newUniqueName, err := generateUniqueSongName(newSong.Title)
		if err != nil {
			return "", err
		}
		uniqueName = newUniqueName
		changed = true
	}

	if oldSong.Author != newSong.Author ||
		oldSong.Text != newSong.Text {
		changed = true
	}

	if changed {
		err := commands.UpdateSong(
			newSong.Title,
			newSong.Author,
			uniqueName,
			newSong.Text,
			primaryMelId,
			secondaryMelId,
			oldSong.ID,
		)
		if err != nil {
			return "", err
		}
	}

	return uniqueName, nil
}

func updateMelody(melodyId uuid.UUID, melody models.MelodyJson) (uuid.UUID, error) {
	newMelodyId := melodyId
	oldMelody, err := queries.GetMelody(melodyId)
	if err != nil {
		return newMelodyId, err
	}

	changed := false

	if melody.SameAs(oldMelody) {
		changed = true
	}

	if changed {
		if melody.Melody == common.GetEnvVars().UnknownMelodyName || melody.Melody == "" {
			newMelody, err := commands.CreateMelody(melody.Melody, melody.Link)
			newMelodyId = newMelody.ID
			if err != nil {
				return newMelodyId, err
			}

		} else {
			err = commands.UpdateMelody(melody.Melody, melody.Link, melodyId)
			if err != nil {
				return newMelodyId, err
			}
		}
	}
	return newMelodyId, err
}

func updateSongTags(songId uuid.UUID, tags []uuid.UUID) error {
	oldTags, err := queries.GetTagsForSong(&songId)
	if err != nil {
		return err
	}

	for _, tag := range tags {
		oldTag := getOldTag(tag, oldTags)
		if oldTag == nil {
			// The tag is new
			_, err := connectTagToSong(songId, tag)
			if err != nil {
				return err
			}
		}
	}

	for _, oldTag := range oldTags {
		found := false
		for _, tag := range tags {
			if oldTag.TagId == tag {
				found = true
				break
			}
		}

		if !found {
			// The tag was removed
			err = commands.DeleteSongTag(songId, oldTag.TagId)
			if err != nil {
				return err
			}
		}
	}

	return nil
}

func getOldTag(tag uuid.UUID, oldTags []*tables.SongTag) *tables.SongTag {
	for _, oldTag := range oldTags {
		if oldTag.TagId == tag {
			return oldTag
		}
	}
	return nil
}

func connectTagToSong(songId, tagId uuid.UUID) (*tables.SongTag, error) {
	return commands.CreateSongTag(songId, tagId)
}
