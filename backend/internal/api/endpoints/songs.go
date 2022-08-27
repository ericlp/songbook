package endpoints

import (
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/process"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func Songs(c *gin.Context) {
	songs, err := process.GetSongs()
	if err != nil {
		log.Printf("Error: Failed to retrieve songs due to %s\n", err)
		c.JSON(
			http.StatusInternalServerError,
			common.Error(common.ResponseFailedToRetrieveSongs),
		)
		return
	}

	c.JSON(http.StatusOK, common.Success(songs))
}
