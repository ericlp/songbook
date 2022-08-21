use sqlx::{types::Uuid, Transaction};

use crate::db::{Melody, OfficialSongBook, Owner, Song, SongBook, SongBookSong, SongTag, Tag, DB};

pub async fn create_owner(
    transaction: &mut Transaction<'_, DB>,
    name: String,
) -> sqlx::Result<Owner> {
    sqlx::query_as!(
        Owner,
        "
INSERT
INTO owner(name)
VALUES    ($1)
RETURNING *
        ",
        name
    )
    .fetch_one(transaction)
    .await
}

pub async fn create_tag(
    transaction: &mut Transaction<'_, DB>,
    name: String,
    description: String,
    color_red: i32,
    color_green: i32,
    color_blue: i32,
    owned_by: Uuid,
) -> sqlx::Result<Tag> {
    sqlx::query_as!(
        Tag,
        "
INSERT
INTO tag(name, description, color_red, color_green, color_blue, owned_by)
VALUES  ($1,   $2,          $3,        $4,          $5,         $6)
RETURNING *
        ",
        name,
        description,
        color_red,
        color_green,
        color_blue,
        owned_by
    )
    .fetch_one(transaction)
    .await
}

pub async fn create_melody(
    transaction: &mut Transaction<'_, DB>,
    melody: String,
    link: String,
) -> sqlx::Result<Melody> {
    sqlx::query_as!(
        Melody,
        "
INSERT 
INTO melody(melody, link)
VALUES     ($1,     $2)
RETURNING *
        ",
        melody,
        link
    )
    .fetch_one(transaction)
    .await
}

pub async fn create_song_book(
    transaction: &mut Transaction<'_, DB>,
    name: String,
    unique_name: String,
    owned_by: Uuid,
) -> sqlx::Result<SongBook> {
    sqlx::query_as!(
        SongBook,
        "
INSERT 
INTO song_book(name, unique_name, deleted, owned_by)
VALUES        ($1,   $2,          false,   $3)
RETURNING *
        ",
        name,
        unique_name,
        Some(owned_by),
    )
    .fetch_one(transaction)
    .await
}

pub async fn create_official_song_book(
    transaction: &mut Transaction<'_, DB>,
    song_book_id: Uuid,
) -> sqlx::Result<OfficialSongBook> {
    sqlx::query_as!(
        OfficialSongBook,
        "
INSERT
INTO official_song_book(song_book_id)
VALUES                 ($1)
RETURNING *
        ",
        song_book_id
    )
    .fetch_one(transaction)
    .await
}

pub async fn create_song(
    transaction: &mut Transaction<'_, DB>,
    title: String,
    author: String,
    unique_name: String,
    primary_melody: Uuid,
    secondary_melody: Option<Uuid>,
    text: String,
    owned_by: Uuid,
) -> sqlx::Result<Song> {
    sqlx::query_as!(
        Song,
        "
INSERT 
INTO song(title, author, unique_name, primary_melody, secondary_melody, text, deleted, owned_by)
VALUES   ($1,    $2,     $3,          $4,             $5,               $6,   false,   $7)
RETURNING *
        ",
        title,
        author,
        unique_name,
        primary_melody,
        secondary_melody,
        text,
        owned_by
    )
    .fetch_one(transaction)
    .await
}

pub async fn add_song_to_songbook(
    transaction: &mut Transaction<'_, DB>,
    song_book_id: Uuid,
    song_id: Uuid,
    number: i32,
) -> sqlx::Result<SongBookSong> {
    sqlx::query_as!(
        SongBookSong,
        "
INSERT
INTO song_book_song(song_book_id, song_id, number)
VALUES             ($1,           $2,      $3)
RETURNING *
        ",
        song_book_id,
        song_id,
        number
    )
    .fetch_one(transaction)
    .await
}

pub async fn add_tag_for_song(
    transaction: &mut Transaction<'_, DB>,
    song_id: Uuid,
    tag_id: Uuid,
) -> sqlx::Result<SongTag> {
    sqlx::query_as!(
        SongTag,
        "
INSERT
INTO song_tag(song_id, tag_id)
VALUES       ($1,      $2)
RETURNING *
        ",
        song_id,
        tag_id
    )
    .fetch_one(transaction)
    .await
}
