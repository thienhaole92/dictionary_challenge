package model

type Word struct {
	Id        int    `json:"id"`
	WordIndex int    `json:"word_index"`
	Word      string `json:"word"`
}
