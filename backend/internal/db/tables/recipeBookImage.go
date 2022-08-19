package tables

import "github.com/google/uuid"

type SongBookImage struct {
	SongBookId uuid.UUID
	ImageId    uuid.UUID
}
