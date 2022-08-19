package endpoints

import (
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/process"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func SongBooks(c *gin.Context) {
	songBooks, err := process.GetSongBooks()
	if err != nil {
		log.Printf("Failed to retrieve recipe books: %v\n", err)
		c.JSON(
			http.StatusInternalServerError,
			common.Error(common.ResponseFailedToRetrieveSongBooks),
		)
		return
	}

	c.JSON(http.StatusOK, common.Success(songBooks))
}
