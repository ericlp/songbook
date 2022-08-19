package tables

import "github.com/google/uuid"

type SongTag struct {
	SongId uuid.UUID
	TagId  uuid.UUID
}

func (_ SongTag) StructName() string {
	return "SongTag"
}
