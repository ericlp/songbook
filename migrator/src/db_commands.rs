// use sqlx::Transaction;

// use crate::db::{Owner, DB};

// pub async fn create_owner(transaction: &mut Transaction<'_, DB>, name: String) -> Owner {
//     Ok(sqlx::query_as!(
//         Owner,
//         "
// INSERT
// INTO owner(name)
// VALUES    ($1)
//         ",
//         name
//     )
//     .fetch_one(transaction)
//     .await?)
// }
