package models

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/google/uuid"
)

type EditRecipeJson struct {
	Title           string          `json:"title" binding:"required"`
	Author          string          `json:"author"`
	PrimaryMelody   EditMelodyJson  `json:"primaryMelody" binding:"required,dive,required"`
	SecondaryMelody *EditMelodyJson `json:"secondaryMelody" binding:"required,dive,required"`
	Text            string          `json:"text" binding:"required"`
	Tags            []uuid.UUID     `json:"tags" binding:"required"`
}

type EditMelodyJson struct {
	Melody string `json:"melody" validate:"required"`
	Link   string `json:"link" validate:"required"`
}

func (step *EditMelodyJson) SameAs(other *tables.Melody) bool {
	return step.Melody == other.Melody && step.Link == other.Link
}
