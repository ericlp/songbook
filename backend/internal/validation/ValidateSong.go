package validation

import (
	"errors"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/google/uuid"
)

var ErrPrimaryNotUsedAsPrimary = errors.New("Primary melody has no melody while the secondary has one")
var ErrMelodyHasLinkButNoMelody = errors.New("Melody has a link but no melody")
var ErrTagNotExist = errors.New("the tag doesn't exist")

func ValidateSong(song *models.EditSongJson) error {

	err := validateMelodies(song.PrimaryMelody, song.SecondaryMelody)

	err = validateTags(song.Tags)
	if err != nil {
		return err
	}

	return nil
}

func validateMelodies(primary, secondary models.MelodyJson) error {
	if primary.Melody == "" && secondary.Melody != "" {
		return ErrPrimaryNotUsedAsPrimary
	}
	if (primary.Melody == "" && primary.Link != "") ||
		(secondary.Melody == "" && secondary.Link != "") {
		return ErrMelodyHasLinkButNoMelody
	}

	return nil
}

func validateTags(tags []uuid.UUID) error {
	for _, tag := range tags {
		_, err := queries.GetTagById(tag)
		if err != nil {
			return ErrTagNotExist
		}
	}

	return nil
}
