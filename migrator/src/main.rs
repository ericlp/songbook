use std::{collections::HashMap, fs};

use rand::Rng;
use sqlx::postgres::PgPoolOptions;

mod db;
mod db_commands;
mod json_types;

use db::new_transaction;
use json_types::{Song, Wrapper};

const DATA_FILE_PATH: &str = "data.json";

#[tokio::main(flavor = "current_thread")]
async fn main() {
    let contents =
        fs::read_to_string(DATA_FILE_PATH).expect("Should have been able to read the file");

    // Setup DB
    let db_pool = PgPoolOptions::new()
        .max_connections(5)
        .connect("postgres://songbook:password@localhost/songbook")
        .await
        .expect("Failed to connect to DB");

    let data: Wrapper = serde_json::from_str(&contents).expect("JSON was not well-formatted");

    let transaction = new_transaction(&db_pool);

    // data.data.songs.into_iter().for_each(|(song_id, song)| {});
    randomize_song(data.data.songs);
}

fn randomize_song(songs: HashMap<String, Song>) {
    let mut rng = rand::thread_rng();

    let index = rng.gen_range(0..songs.keys().len() - 1);
    for (i, (_, s)) in songs.iter().enumerate() {
        if i == index {
            println!("SING SONG!!! {:+?}", s);
        }
    }
}
