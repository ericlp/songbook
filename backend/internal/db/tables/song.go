package tables

import (
	"github.com/google/uuid"
)

type Song struct {
	ID              uuid.UUID
	Title           string
	Author          string
	UniqueName      string
	PrimaryMelody   uuid.UUID
	SecondaryMelody uuid.UUID
	Text            string
	Deleted         bool
	OwnedBy         uuid.UUID
}

func (_ Song) StructName() string {
	return "Song"
}
