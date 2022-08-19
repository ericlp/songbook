package common

import "errors"

var ErrNameTaken = errors.New("nameTaken")
var ErrNoSuchRecipe = errors.New("noSuchRecipe")
var ErrNoSuchSongBook = errors.New("noSuchSongBook")