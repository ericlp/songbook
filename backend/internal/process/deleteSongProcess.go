package process

import (
	"fmt"
	"github.com/ericlp/songbook/backend/internal/db/commands"
	"github.com/ericlp/songbook/backend/internal/db/tables"
)

func DeleteSong(song *tables.Song) error {
	deletedName := fmt.Sprintf("%s_%s_deleted", song.Title, song.ID)
	deletedUniqueName := fmt.Sprintf("%s_%s_deleted", song.UniqueName, song.ID)

	return commands.SongSetDeleted(deletedName, deletedUniqueName, song.ID)
}
