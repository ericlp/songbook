package endpoints

import (
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/process"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func RemoveSong(c *gin.Context) {
	song, err := validateSongId(c)
	if err != nil {
		log.Printf("Failed to validate song id: %v\n", err)
		return
	}

	err = validateOwnerAuthorized(c, song.OwnedBy)
	if err != nil {
		log.Printf("Failed to authorize user: %v\n", err)
		c.JSON(http.StatusForbidden, common.Error(common.ResponseIncorrectUser))
		return
	}

	err = process.DeleteSong(song)
	if err != nil {
		log.Printf("Failed to delete song: %v\n", err)
		c.JSON(
			http.StatusInternalServerError,
			common.Error(common.ResponseFailedToDeleteSong),
		)
		return
	}

	c.JSON(http.StatusOK, common.Success("Song deleted"))
}
