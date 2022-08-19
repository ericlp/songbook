package models

import (
	"github.com/google/uuid"
)

type DetailedSongBookJson struct {
	ID         uuid.UUID            `json:"id"`
	Name       string               `json:"name"`
	UniqueName string               `json:"uniqueName"`
	UploadedBy Owner                `json:"uploadedBy"`
	Author     string               `json:"author"`
	Recipes    []SongBookRecipeJson `json:"recipes"`
	Image      *ImageJson           `json:"image"`
}

type SongBookRecipeJson struct {
	ID         uuid.UUID `json:"id"`
	Name       string    `json:"name"`
	UniqueName string    `json:"uniqueName"`
	Author     string    `json:"author"`
}
