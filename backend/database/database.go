package database

import (
	"database/sql"
	"errors"
	"fmt"
	"os"

	_ "github.com/mattn/go-sqlite3"
)

var DB *sql.DB

func Init() {
	dbname := os.Getenv("DB_NAME")

	db, err := sql.Open("sqlite3", dbname)
	if err != nil {
		fmt.Println(err)
		panic(err)
	}

	if db == nil {
		err := errors.New("DB nil")
		fmt.Println(err)
		panic(err)
	}

	fmt.Println("Database connected")
	DB = db
}

func GetDB() *sql.DB {
	if DB == nil {
		err := errors.New("DB nil")
		fmt.Println(err)
		panic(err)
	}
	return DB
}
