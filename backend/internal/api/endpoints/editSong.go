package endpoints

import (
	"errors"
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/ericlp/songbook/backend/internal/process"
	"github.com/ericlp/songbook/backend/internal/validation"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"log"
	"net/http"
)

type EditSongJson struct {
	UniqueName string `json:"uniqueName"`
}

func EditSong(c *gin.Context) {
	songJson, err := validateEditSong(c)
	if err != nil {
		log.Printf("Failed to validate edit song json: %v\n", err)
		c.JSON(http.StatusBadRequest, common.Error(common.ResponseInvalidJson))
		return
	}

	oldSong, err := validateSongId(c)
	if err != nil {
		log.Printf("Failed to validate song id: %v", err)
		return
	}

	err = validateOwnerAuthorized(c, oldSong.OwnedBy)
	if err != nil {
		log.Printf("User not authorized to edit song: %v\n", err)
		c.JSON(http.StatusForbidden, common.Error(common.ResponseIncorrectUser))
		return
	}

	uniqueName, err := process.EditSong(oldSong, songJson)
	if err != nil {
		log.Printf("Failed to edit song: %v\n", err)
		if errors.Is(err, common.ErrNameTaken) {
			c.JSON(
				http.StatusUnprocessableEntity,
				common.Error(common.ResponseSongNameExist),
			)
			return
		}

		c.JSON(
			http.StatusInternalServerError,
			common.Error(common.ResponseFailedToEditSong),
		)
		return
	}

	c.JSON(
		http.StatusOK, common.Success(
			EditSongJson{
				UniqueName: uniqueName,
			},
		),
	)
}

func validateEditSong(c *gin.Context) (*models.EditSongJson, error) {
	var song models.EditSongJson
	err := c.ShouldBindJSON(&song)
	if err != nil {
		return nil, err
	}

	err = validation.ValidateSong(&song)
	return &song, err
}

func validateSongId(c *gin.Context) (*tables.Song, error) {
	idStr := c.Param("id")
	id, err := uuid.Parse(idStr)
	if err != nil {
		c.JSON(
			http.StatusBadRequest,
			common.Error(common.ResponseMalformedSongId),
		)
		return nil, err
	}

	song, err := queries.GetSongById(id)
	if err != nil {
		c.JSON(http.StatusNotFound, common.Error(common.ResponseSongNotFound))
		return nil, err
	}

	return song, nil
}
