use std::collections::HashMap;

use serde::Deserialize;

#[derive(Deserialize, Debug)]
pub struct Wrapper {
    pub data: Data,
}

#[derive(Deserialize, Debug)]
pub struct Data {
    pub songs: HashMap<String, Song>,
    pub tags: HashMap<String, Tag>,
}

#[derive(Deserialize, Debug)]
pub struct Song {
    pub song_id: String,
    pub title: String,
    pub number: i32,
    pub melody: String,
    pub author: String,
    pub text: String,
    pub tags: Vec<String>,
}

#[derive(Deserialize, Debug)]
pub struct Tag {
    pub tag_id: String,
    pub name: String,
    pub pretty_name_sv: String,
    pub pretty_name_en: String,
    pub song: Vec<String>,
}
