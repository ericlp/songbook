package endpoints

import (
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/process"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func RemoveSongBook(c *gin.Context) {
	songBook, err := validateSongBookId(c)
	if err != nil {
		log.Printf("Failed to validate recipe id: %v\n", err)
		return
	}

	err = validateOwnerAuthorized(c, songBook.OwnedBy)
	if err != nil {
		log.Printf("Failed to authorize user %v\n", err)
		c.JSON(http.StatusForbidden, common.Error(common.ResponseIncorrectUser))
		return
	}

	err = process.DeleteSongBook(songBook)
	if err != nil {
		log.Printf("Failed to delete songBook %v\n", err)
		c.JSON(http.StatusInternalServerError, common.Error(common.ResponseFailedToDeleteSongBook))
		return
	}

	c.JSON(http.StatusOK, common.Success("Recipe deleted"))
}
