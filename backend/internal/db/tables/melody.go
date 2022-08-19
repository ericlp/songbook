package tables

import "github.com/google/uuid"

type Melody struct {
	ID     uuid.UUID
	SongId uuid.UUID
	Melody string
	Link   string
}

func (_ Melody) StructName() string {
	return "Melody"
}
