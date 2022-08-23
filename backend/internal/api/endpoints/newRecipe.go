package endpoints

import (
	"errors"
	"github.com/ericlp/songbook/backend/internal/common"
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/ericlp/songbook/backend/internal/process"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"log"
	"net/http"
)

var ErrNoUserInContext = errors.New("no userID could be extracted from the context")
var ErrInvalidUserIdInContext = errors.New("the userID in the context was of an invalid type")

type NewSongJson struct {
	UniqueName string `json:"uniqueName"`
}

func NewSong(c *gin.Context) {
	songJson, err := validateNewSong(c)
	if err != nil {
		log.Printf("Failed to validate new song json: %v\n", err)
		c.JSON(http.StatusBadRequest, common.Error(common.ResponseInvalidJson))
		return
	}

	uniqueName, err := process.CreateNewRecipe(songJson)
	if err != nil {
		if errors.Is(err, common.ErrNameTaken) {
			log.Printf("Tried to create duplicate song")
			c.JSON(
				http.StatusUnprocessableEntity,
				common.Error(common.ResponseRecipeNameExist),
			)
			return
		}

		log.Printf("Failed to create new song: %v\n", err)
		c.JSON(
			http.StatusInternalServerError,
			common.Error(common.ResponseFailedToCreateRecipe),
		)
		return
	}

	c.JSON(
		http.StatusCreated,
		common.Success(NewSongJson{UniqueName: uniqueName}),
	)
}

func validateNewSong(c *gin.Context) (*models.NewSongJson, error) {
	var song models.NewSongJson
	err := c.ShouldBindJSON(&song)
	return &song, err
}

var ErrUserNotAuthorized = errors.New("user not authorized")

func validateOwnerAuthorized(c *gin.Context, userId uuid.UUID) error {
	user, err := getSessionUser(c)
	if err != nil {
		return err
	}

	owners, err := queries.GetOwnersByUser(user.ID)
	if err != nil {
		return err
	}

	isAuthorized := false
	for _, owner := range owners {
		if owner.ID == userId {
			isAuthorized = true
		}
	}

	if isAuthorized {
		return nil

	}
	return ErrUserNotAuthorized
}

func getSessionUser(c *gin.Context) (*tables.User, error) {
	userId, exists := c.Get("userId")
	if !exists {
		return nil, ErrNoUserInContext
	}

	id, ok := userId.(uuid.UUID)
	if !ok {
		log.Printf("Failed to cast %s to UUID", userId)
		return nil, ErrInvalidUserIdInContext
	}

	return queries.GetUser(id)
}
