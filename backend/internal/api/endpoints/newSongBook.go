package endpoints

import (
	"errors"
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/ericlp/songbook/backend/internal/process"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

type NewSongBookResponse struct {
	UniqueName string `json:"uniqueName"`
}

func NewSongBook(c *gin.Context) {
	songBook, err := validateNewSongBook(c)
	if err != nil {
		log.Printf("Failed to validate new songbook json: %v\n", err)
		c.JSON(http.StatusBadRequest, common.Error(common.ResponseInvalidJson))
		return
	}

	uniqueName, err := process.CreateNewSongBook(songBook)
	if err != nil {
		if errors.Is(err, common.ErrNameTaken) {
			log.Printf("Tried to create duplicate songbook")
			c.JSON(
				http.StatusUnprocessableEntity,
				common.Error(common.ResponseSongBookNameExists),
			)
			return
		}

		log.Printf("Failed to create new songbook: %v\n", err)
		c.JSON(
			http.StatusInternalServerError,
			common.Error(common.ResponseFailedToCreateSongBook),
		)
		return
	}

	c.JSON(
		http.StatusCreated, common.Success(
			NewSongBookResponse{
				UniqueName: uniqueName,
			},
		),
	)
}

func validateNewSongBook(c *gin.Context) (*models.NewSongBookJson, error) {
	var songBook models.NewSongBookJson
	err := c.ShouldBindJSON(&songBook)
	return &songBook, err
}
