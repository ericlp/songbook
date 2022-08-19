package endpoints

import (
	"errors"
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/process"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func SongBook(c *gin.Context) {
	uniqueName := c.Param("uniqueName")
	detailedSongBook, err := process.GetSongBook(uniqueName)
	if err != nil {
		if errors.Is(err, common.ErrNoSuchSongBook) {
			c.JSON(
				http.StatusNotFound,
				common.Error(common.ResponseSongBookNotFound),
			)
		}
		log.Printf(
			"Error: Failed to retrieve songbook %s, due to error: %v\n",
			uniqueName,
			err,
		)
		c.JSON(
			http.StatusInternalServerError,
			common.Error(common.ResponseFailedToRetrieveSongBook),
		)
		return
	}

	c.JSON(http.StatusOK, common.Success(detailedSongBook))
}
