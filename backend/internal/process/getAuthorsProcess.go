package process

import (
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/models"
)

type AuthorsJson struct {
	Authors []models.Owner `json:"authors"`
}

func GetAllAuthors() (*AuthorsJson, error) {
	authors, err := queries.GetAllUsersWithSong()
	if err != nil {
		return nil, err
	}

	authorsJson := make([]models.Owner, 0)
	for _, author := range authors {
		authorsJson = append(authorsJson, models.Owner{
			Id:   author.ID,
			Name: author.Name,
		})
	}

	return &AuthorsJson{Authors: authorsJson}, nil
}
