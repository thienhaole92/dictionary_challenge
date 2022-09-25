package service

import (
	"database/sql"
	"errors"
	"log"
	"strings"

	"github.com/thienhaole92/dictionary_challenge/backend/database"
	"github.com/thienhaole92/dictionary_challenge/backend/model"
)

func FindWordByIndex(index int) (model.Word, error) {
	db := database.GetDB()
	row := db.QueryRow("SELECT id, word_index, word FROM words WHERE word_index=?", index)

	w := model.Word{}
	var err error
	if err = row.Scan(&w.Id, &w.WordIndex, &w.Word); err == sql.ErrNoRows {
		log.Printf("word not found")

		return model.Word{}, errors.New("word not found")
	}

	return w, err
}

func ListWordMeaning(id int) ([]model.Mean, error) {
	db := database.GetDB()
	rows, err := db.Query("SELECT * FROM means WHERE word_id=?", id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	data := []model.Mean{}
	for rows.Next() {
		m := model.Mean{}
		err = rows.Scan(&m.Id, &m.WordIndex, &m.WordId, &m.WordType, &m.Meaning)
		if err != nil {
			return nil, err
		}
		data = append(data, m)
	}

	return data, nil
}

func TotalWords() (int, error) {
	var count int

	db := database.GetDB()
	rows, err := db.Query("SELECT COUNT(*) as count FROM  words")
	if err != nil {
		return 0, err
	}
	defer rows.Close()

	for rows.Next() {
		err = rows.Scan(&count)
	}

	if err != nil {
		return 0, err
	}

	return count, nil
}

func Search(word string) (model.Word, error) {
	trimed := strings.Trim(word, " ")
	needle := strings.ToLower(trimed)

	if len(needle) == 0 {
		return model.Word{}, errors.New("empty input")
	}

	total, err := TotalWords()
	if err != nil {
		return model.Word{}, errors.New("can not get total word")
	}

	low := 1
	high := total

	for low <= high {
		median := (low + high) / 2

		w, err := FindWordByIndex(median)
		if err != nil {
			return model.Word{}, err
		}

		cp := strings.Compare(w.Word, needle)

		if cp == -1 {
			low = median + 1
		} else {
			high = median - 1
		}
	}

	w, err := FindWordByIndex(low)
	if err != nil {
		return model.Word{}, err
	}

	cp := strings.Compare(w.Word, needle)
	if low == total || cp != 0 {
		return model.Word{}, errors.New("not found")
	}

	return w, nil
}
