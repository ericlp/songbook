package endpoints

import (
	"errors"
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/process"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func Song(c *gin.Context) {
	uniqueName := c.Param("uniqueName")
	detailedSong, err := process.GetSong(uniqueName)
	if err != nil {
		if errors.Is(err, common.ErrNoSuchSong) {
			c.JSON(
				http.StatusNotFound,
				common.Error(common.ResponseSongNotFound),
			)
			return
		}
		log.Printf(
			"Error: Failed to retrieve song %s, due to error: %s\n",
			uniqueName,
			err,
		)
		c.JSON(
			http.StatusInternalServerError,
			common.Error(common.ResponseFailedToRetrieveSong),
		)
		return
	}

	c.JSON(http.StatusOK, common.Success(detailedSong))
}
