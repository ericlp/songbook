package models

import (
	"github.com/google/uuid"
)

type TagJson struct {
	ID          uuid.UUID `json:"id"`
	Name        string    `json:"name"`
	Description string    `json:"description"`
	Color       ColorJson `json:"color"`
	SongCount   uint64    `json:"songCount"`
	Author      Owner     `json:"author"`
}
