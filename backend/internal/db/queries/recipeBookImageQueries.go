package queries

import (
	"github.com/ericlp/songbook/backend/internal/db/tables"
	"github.com/georgysavva/scany/pgxscan"
	"github.com/google/uuid"
)

var getImageForSongBookQuery = `
SELECT image_id, song_book_id 
FROM song_book_image
WHERE song_book_id=$1
`

func GetImageForSongBook(songBookId uuid.UUID) (*tables.Image, error) {
	db := getDb()

	var songBookImage tables.SongBookImage
	err := pgxscan.Get(ctx, db, &songBookImage, getImageForSongBookQuery, songBookId)

	if err != nil {
		return nil, err
	}

	img, err := GetImageById(songBookImage.ImageId)
	return img, err
}

var getImagesForSongBookQuery = `
SELECT image_id, song_book_id
FROM song_book_image
WHERE song_book_id=$1
`

func GetImagesForSongBook(songBookId uuid.UUID) ([]tables.Image, error) {
	db := getDb()

	var songBookImages []*tables.SongBookImage
	err := pgxscan.Select(ctx, db, &songBookImages, getImagesForSongBookQuery, songBookId)
	if err != nil {
		return nil, err
	}

	var images []tables.Image
	if songBookImages != nil {
		for _, bookImage := range songBookImages {
			img, err := GetImageById(bookImage.ImageId)
			if err != nil {
				return nil, err
			}
			images = append(images, *img)
		}
	}

	return images, nil
}
