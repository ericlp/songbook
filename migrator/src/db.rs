use sqlx::{types::Uuid, Pool, Postgres, Transaction};

pub type DB = Postgres;

#[derive(Debug, Clone, sqlx::FromRow)]
pub struct Song {
    pub id: Uuid,
    pub title: String,
    pub author: String,
    pub unique_name: String,
    pub primary_melody: Uuid,
    pub secondary_melody: Uuid,
    pub text: String,
    pub deleted: bool,
    pub owned_by: Uuid,
}

#[derive(Debug, Clone, sqlx::FromRow)]
pub struct Tag {
    pub id: Uuid,
    pub name: String,
    pub description: String,
    pub color_red: i32,
    pub color_green: i32,
    pub color_blue: i32,
    pub owned_by: Uuid,
}

#[derive(Debug, Clone, sqlx::FromRow)]
pub struct SongTag {
    pub song_id: Uuid,
    pub tag_id: Uuid,
}

#[derive(Debug, Clone, sqlx::FromRow)]
pub struct Owner {
    pub id: Uuid,
    pub name: String,
}

#[derive(Debug, Clone, sqlx::FromRow)]
pub struct Melody {
    pub id: Uuid,
    pub melody: String,
    pub link: String,
}

#[derive(Debug, Clone, sqlx::FromRow)]
pub struct SongBook {
    pub id: Uuid,
    pub name: String,
    pub unique_name: String,
    pub author: String,
    pub deleted: bool,
    pub owned_by: Uuid,
}

#[derive(Debug, Clone, sqlx::FromRow)]
pub struct SongBookSong {
    pub song_book_id: Uuid,
    pub song_id: Uuid,
    pub number: i32,
}

#[derive(Debug, Clone, sqlx::FromRow)]
pub struct OfficialSongBook {
    pub song_book_id: Uuid,
}

pub async fn new_transaction(db_pool: &Pool<DB>) -> Transaction<'_, DB> {
    db_pool
        .begin()
        .await
        .expect("Failed to create transaction :(")
}
