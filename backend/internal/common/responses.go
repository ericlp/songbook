package common

type SuccessResponse struct {
	Success bool        `json:"success"`
	Data    interface{} `json:"data"`
}

type ErrorResponse struct {
	Success bool   `json:"success"`
	Error   string `json:"error"`
}

func Success(data interface{}) SuccessResponse {
	return SuccessResponse{
		Success: true,
		Data:    data,
	}
}

func Error(err string) ErrorResponse {
	return ErrorResponse{
		Success: false,
		Error:   err,
	}
}

const (
	ResponseSongNameExist             = "song_name_exists"
	ResponseFailedToCreateSong        = "failed_to_create_song"
	ResponseFailedToEditSong          = "failed_to_edit_song"
	ResponseSongNotFound              = "song_not_found"
	ResponseInvalidJson               = "invalid_json"
	ResponseMissingFile               = "missing_file"
	ResponseBadImage                  = "bad_image"
	ResponseFileTypeNotSupported      = "filetype_not_supported"
	ResponseFailedToSaveImage         = "failed_to_save_image"
	ResponseFailedToRetrieveSongs     = "failed_to_retrieve_songs"
	ResponseFailedToRetrieveSong      = "failed_to_retrieve_song"
	ResponseMalformedSongId           = "malformed_song_id"
	ResponseFailedToDeleteSong        = "failed_to_delete_song"
	ResponseFailedToDeleteSongBook    = "failed_to_delete_song_book"
	ResponseFailedToAuthenticate      = "failed_to_authenticate"
	ResponseInvalidUserId             = "invalid_user_id"
	ResponseNotAuthorized             = "not_authorized"
	ResponseIncorrectUser             = "incorrect_user"
	ResponseSongBookNameExists        = "song_book_name_exists"
	ResponseFailedToCreateSongBook    = "failed_to_create_song_book"
	ResponseFailedToRetrieveSongBooks = "failed_to_retrieve_song_books"
	ResponseSongBookNotFound          = "song_book_not_found"
	ResponseFailedToRetrieveSongBook  = "failed_to_retrieve_song_book"
	ResponseMalformedSongBookId       = "malformed_song_book_id"
	ResponseFailedToEditSongBook      = "failed_to_edit_song_book"
	ResponseTagNameTaken              = "tag_name_taken"
	ResponseFailedToCreateTag         = "failed_to_create_tag"
	ResponseFailedToRetrieveTags      = "failed_to_retrieve_tags"
	ResponseMalformedTagId            = "malformed_tag_id"
	ResponseTagNotFound               = "tag_not_found"
	ResponseFailedToDeleteTag         = "failed_to_delete_tag"
	ResponseFailedToEditTag           = "failed_to_edit_tag"
)
