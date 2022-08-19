package models

import "github.com/google/uuid"

type EditSongBookJson struct {
	Name   string      `json:"name" binding:"required"`
	Author string      `json:"author"`
	Songs  []uuid.UUID `json:"songs" binding:"required"`
	Images []uuid.UUID `json:"images" binding:"required"`
}

type EDITSongBookSongJson struct {
	ID     uuid.UUID `json:"id"`
	Number int       `json:"number"`
}
