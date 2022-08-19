package main

import (
	"github.com/ericlp/songbook/backend/internal/api"
	"github.com/ericlp/songbook/backend/internal/db"
	"log"
)

func main() {
	log.Println("==== Starting songbook golang backend =====")

	db.Init()
	defer db.Close()
	api.Init()
	api.Start()
}
