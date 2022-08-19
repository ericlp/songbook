package tables

import "github.com/google/uuid"

type UserOwner struct {
	OwnerID       uuid.UUID
	songbookUserID uuid.UUID
}

func (_ UserOwner) StructName() string {
	return "UserOwner"
}
