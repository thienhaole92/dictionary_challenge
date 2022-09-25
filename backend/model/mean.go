package model

type Mean struct {
	Id        int    `json:"id"`
	WordIndex int    `json:"word_index"`
	WordId    int    `json:"word_id"`
	WordType  string `json:"word_type"`
	Meaning   string `json:"meaning"`
}
