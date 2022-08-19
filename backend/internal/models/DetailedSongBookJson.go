package models

import (
	"github.com/google/uuid"
)

type DetailedSongBookJson struct {
	ID         uuid.UUID          `json:"id"`
	Name       string             `json:"name"`
	UniqueName string             `json:"uniqueName"`
	Songs      []SongBookSongJson `json:"recipes"`
	Image      *ImageJson         `json:"image"`
	OwnedBy    Owner              `json:"ownedBy"`
}

type SongBookSongJson struct {
	ID         uuid.UUID `json:"id"`
	Title      string    `json:"title"`
	UniqueName string    `json:"uniqueName"`
	Author     string    `json:"author"`
}

type ImageJson struct {
	Path string    `json:"url"`
	ID   uuid.UUID `json:"id"`
}
