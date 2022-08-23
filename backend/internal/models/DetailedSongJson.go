package models

import (
	"github.com/google/uuid"
)

type DetailedSongJson struct {
	ID              uuid.UUID   `json:"id"`
	Title           string      `json:"title"`
	Author          string      `json:"author"`
	UniqueName      string      `json:"uniqueName"`
	PrimaryMelody   MelodyJson  `json:"primaryMelody"`
	SecondaryMelody *MelodyJson `json:"secondaryMelody"`
	Text            string      `json:"text"`
	OwnedBy         Owner       `json:"ownedBy"`
	Tags            []TagJson   `json:"tags"`
}

type MelodyJson struct {
	Melody string `json:"melody"`
	Link   string `json:"link"`
}
