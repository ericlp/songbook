package models

import "github.com/google/uuid"

type NewSongJson struct {
	Title   string    `json:"title" binding:"required"`
	OwnerId uuid.UUID `json:"ownerId" binding:"required"`
}
