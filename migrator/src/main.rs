use std::collections::HashMap;
use std::fs;

use db_commands::{create_melody, create_song};
use sqlx::postgres::PgPoolOptions;
use sqlx::types::Uuid;

mod config;
mod db;
mod db_commands;
mod json_types;

use crate::config::Config;
use crate::db_commands::{
    add_song_to_songbook, add_tag_for_song, create_official_song_book, create_owner,
    create_song_book, create_tag,
};
use db::new_transaction;
use json_types::Wrapper;

const DIVIDER: &str = "<+++=====================================+++>";

#[tokio::main(flavor = "current_thread")]
async fn main() {
    let config = Config::new();

    let contents =
        fs::read_to_string(config.data_file_path).expect("Should have been able to read the file");

    // Setup DB
    let db_pool = PgPoolOptions::new()
        .max_connections(5)
        .connect(&config.database_url)
        .await
        .expect("Failed to connect to DB");

    let data: Wrapper = serde_json::from_str(&contents).expect("JSON was not well-formatted");

    let mut transaction = new_transaction(&db_pool).await;

    println!("Creating default owner");
    let owner = create_owner(&mut transaction, String::from(config.default_owner_name))
        .await
        .expect("Failed to create default owner");

    println!("\n\nCreating tags");
    let mut tags_map: HashMap<String, Uuid> = HashMap::new();
    for (_, tag) in data.data.tags {
        println!("Creating tag {} | {}", tag.tag_id, tag.name);
        let db_tag = create_tag(&mut transaction, tag.name, String::new(), 0, 0, 0, owner.id)
            .await
            .expect("Failed to create tag");
        tags_map.insert(tag.tag_id, db_tag.id);
    }
    println!("\nCreating tags complete\n");
    println!("{}", DIVIDER);

    println!("\n\nCreating the songbook");
    let song_book = create_song_book(
        &mut transaction,
        config.default_song_book_name,
        config.default_song_book_unique_name,
        owner.id,
    )
    .await
    .expect("Failed to create songbook");

    println!(
        "Making the songbook {} the official songbook",
        song_book.name
    );
    create_official_song_book(&mut transaction, song_book.id)
        .await
        .expect("Failed to create official song book");

    println!("\n\nCreating the unknown melody");
    let unknown_melody = create_melody(
        &mut transaction,
        config.unknown_melody_name,
        config.default_melody_link.clone(),
    )
    .await
    .expect("Failed to create unknown melody");

    println!("\n\nCreating the songs");
    for (_, song) in data.data.songs.into_iter() {
        println!("");
        let melody_id = if song.melody.is_empty() {
            println!(
                "   Melody of song {} is unknown, connecting to the unknown melody",
                song.title,
            );
            unknown_melody.id.clone()
        } else {
            println!("  Creating melody {}", song.melody);
            create_melody(
                &mut transaction,
                song.melody,
                config.default_melody_link.clone(),
            )
            .await
            .expect("Failed to create melody")
            .id
        };

        println!("  Creating song {}", song.title);
        let db_song = create_song(
            &mut transaction,
            song.title.clone(),
            song.author,
            song.song_id,
            melody_id,
            None,
            song.text,
            owner.id,
        )
        .await
        .expect("Failed to create song");

        println!("  Adding song '{}' to the official songbook", song.title);
        add_song_to_songbook(&mut transaction, song_book.id, db_song.id, song.number)
            .await
            .expect("Failed to add song to songbook");

        for tag in song.tags {
            println!("      Adding tag {} to song {}", tag, db_song.title);
            let tag_id = tags_map.get(&tag).expect("Tag was not found in tag_map");
            add_tag_for_song(&mut transaction, db_song.id, tag_id.clone())
                .await
                .expect("Failed to add tag for song");
        }
    }
    println!("Creating songs complete\n");
    println!("{}", DIVIDER);

    transaction
        .commit()
        .await
        .expect("Failed to commit transaction");
}
