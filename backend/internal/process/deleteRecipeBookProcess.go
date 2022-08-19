package process

import (
	"fmt"
	"github.com/ericlp/songbook/backend/internal/db/commands"
	"github.com/ericlp/songbook/backend/internal/db/tables"
)

func DeleteSongBook(songBook *tables.SongBook) error {
	deletedName := fmt.Sprintf("%s_%s_deleted", songBook.Name, songBook.ID)
	deletedUniqueName := fmt.Sprintf("%s_%s_deleted", songBook.UniqueName, songBook.ID)

	err := commands.SongBookSetDeleted(deletedName, deletedUniqueName, songBook.ID)
	return err
}
