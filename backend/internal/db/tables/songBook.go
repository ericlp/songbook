package tables

import "github.com/google/uuid"

type SongBook struct {
	ID         uuid.UUID
	Name       string
	UniqueName string
	Author     string
	Deleted    bool
	OwnedBy    uuid.UUID
}
