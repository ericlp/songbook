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

type EditSongBookResponseJson struct {
	UniqueName string `json:"uniqueName"`
}

func EditSongBook(c *gin.Context) {
	songBook, err := validateEditSongBook(c)
	if err != nil {
		log.Printf("Failed to validate edit recipe book json %v\n", err)
		c.JSON(http.StatusBadRequest, common.Error(common.ResponseInvalidJson))
		return
	}

	oldSongBook, err := validateSongBookId(c)
	if err != nil {
		log.Printf("Failed to validate recipe id: %v\n", err)
		return
	}

	err = validateOwnerAuthorized(c, oldSongBook.OwnedBy)
	if err != nil {
		log.Printf("User not authorized to edit songbook: %v\n", err)
		c.JSON(http.StatusForbidden, common.Error(common.ResponseIncorrectUser))
		return
	}

	uniqueName, err := process.EditSongBook(oldSongBook, songBook)
	if err != nil {
		log.Printf("Failed to edit songbook: %v\n", err)
		if errors.Is(err, common.ErrNameTaken) {
			c.JSON(
				http.StatusUnprocessableEntity,
				common.Error(common.ResponseSongBookNameExists),
			)
			return
		}

		c.JSON(
			http.StatusInternalServerError,
			common.Error(common.ResponseFailedToEditSongBook),
		)
		return
	}

	c.JSON(http.StatusOK, common.Success(EditSongBookResponseJson{uniqueName}))
}

func validateSongBookId(c *gin.Context) (*tables.SongBook, error) {
	idStr := c.Param("id")
	id, err := uuid.Parse(idStr)
	if err != nil {
		c.JSON(
			http.StatusBadRequest,
			common.Error(common.ResponseMalformedSongBookId),
		)
		return nil, err
	}

	songBook, err := queries.GetSongBookById(id)
	if err != nil {
		c.JSON(
			http.StatusNotFound,
			common.Error(common.ResponseSongBookNotFound),
		)
		return nil, err
	}

	return songBook, nil
}

func validateEditSongBook(c *gin.Context) (
	*models.EditSongBookJson,
	error,
) {
	var songBook models.EditSongBookJson
	err := c.BindJSON(&songBook)
	if err != nil {
		return nil, err
	}

	err = validation.ValidateSongBook(&songBook)
	return &songBook, err
}
