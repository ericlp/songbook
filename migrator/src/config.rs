use std::env;

#[derive(Clone)]
pub struct Config {
    pub database_url: String,
    pub data_file_path: String,
    pub default_owner_name: String,
    pub unknown_melody_name: String,
    pub default_melody_link: String,
    pub default_song_book_name: String,
    pub default_song_book_unique_name: String,
}

impl Config {
    pub fn new() -> Self {
        dotenv::dotenv().expect("Failed to load .env file");

        Config {
            database_url: load_env_str("DATABASE_URL"),
            data_file_path: load_env_str("DATA_FILE_PATH"),
            default_owner_name: load_env_str("DEFAULT_OWNER_NAME"),
            unknown_melody_name: load_env_str("UNKNOWN_MELODY_NAME"),
            default_melody_link: load_env_str("DEFAULT_MELODY_LINK"),
            default_song_book_name: load_env_str("DEFAULT_SONG_BOOK_NAME"),
            default_song_book_unique_name: load_env_str("DEFAULT_SONG_BOOK_UNIQUE_NAME"),
        }
    }
}

fn load_env_str(key: &str) -> String {
    let var = env::var(&key).expect("Failed to load environment variable");

    if var.is_empty() {
        panic!("Required environment variable '{}' was empty!", key);
    }

    var
}
