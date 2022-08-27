package common

import "errors"

var ErrNameTaken = errors.New("nameTaken")
var ErrNoSuchSong = errors.New("noSuchSong")
var ErrNoSuchSongBook = errors.New("noSuchSongBook")
