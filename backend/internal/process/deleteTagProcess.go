package process

import (
	"github.com/ericlp/songbook/backend/internal/db/commands"
	"github.com/ericlp/songbook/backend/internal/db/tables"
)

func DeleteTag(tag *tables.Tag) error {
	err := commands.DeleteSongTagsByTagId(tag.ID)
	if err != nil {
		return err
	}

	return commands.DeleteTag(tag.ID)
}
