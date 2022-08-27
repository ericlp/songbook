package models

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/google/uuid"
)

type EditSongJson struct {
	Title           string      `json:"title" binding:"required"`
	Author          string      `json:"author"`
	PrimaryMelody   MelodyJson  `json:"primaryMelody" binding:"required,dive,required"`
	SecondaryMelody MelodyJson  `json:"secondaryMelody" binding:"required,dive,required"`
	Text            string      `json:"text" binding:"required"`
	Tags            []uuid.UUID `json:"tags" binding:"required"`
}

func (melody *MelodyJson) SameAs(other *tables.Melody) bool {
	return melody.Melody == other.Melody && melody.Link == other.Link
}
