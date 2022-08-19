package process

import (
	"github.com/ericlp/songbook/backend/internal/db/queries"
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/ericlp/songbook/backend/internal/models"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

type SongBooksJson struct {
	SongBooks []ShortSongBookJson `json:"songBooks"`
}

type ShortSongBookJson struct {
	ID         uuid.UUID    `json:"id"`
	Name       string       `json:"name"`
	UniqueName string       `json:"uniqueName"`
	Author     string       `json:"author"`
	ImageLink  string       `json:"imageLink"`
	UploadedBy models.Owner `json:"uploadedBy"`
}

func toShortSongBookJson(songBook *tables.SongBook, owner *tables.Owner, imageUrl string) ShortSongBookJson {
	return ShortSongBookJson{
		ID:         songBook.ID,
		Name:       songBook.Name,
		UniqueName: songBook.UniqueName,
		Author:     songBook.Author,
		ImageLink:  imageUrl,
		UploadedBy: models.Owner{
			Id:     owner.ID,
			Name:   owner.Name,
			IsUser: owner.IsUser,
		},
	}
}

func GetSongBooks() (*SongBooksJson, error) {
	songBooks, err := queries.GetNonDeletedSongBooks()
	if err != nil {
		return nil, err
	}

	if songBooks == nil {
		songBooks = make([]*tables.SongBook, 0)
	}

	shortSongBooks := make([]ShortSongBookJson, 0)
	for _, book := range songBooks {
		image, err := queries.GetImageForSongBook(book.ID)

		imageUrl := ""
		if err != nil {
			if pgxscan.NotFound(err) == false {
				return nil, err
			}
		} else {
			imageUrl = imageNameToPath(image.ID, image.Name)
		}

		owner, err := queries.GetOwner(book.OwnedBy)
		if err != nil {
			return nil, err
		}

		shortSongBooks = append(shortSongBooks, toShortSongBookJson(book, owner, imageUrl))
	}

	return &SongBooksJson{
		SongBooks: shortSongBooks,
	}, nil
}
