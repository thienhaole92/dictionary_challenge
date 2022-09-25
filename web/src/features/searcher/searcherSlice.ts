import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import { Meaning } from "../../@types/meaning";
import { Word } from "../../@types/word";
import { RootState } from "../../app/store";
import { searchWord } from "./searcherAPI";

export interface SearcherState {
  status: "initialized" | "idle" | "loading" | "failed";
  word?: Word;
  meaning: Meaning[];
}

const initialState: SearcherState = {
  status: "initialized",
  word: undefined,
  meaning: [],
};

export const searchAsync = createAsyncThunk(
  "searcher/searchWord",
  async (word: string) => {
    const response = await searchWord(word);
    return response.data;
  }
);

export const searcherSlice = createSlice({
  name: "searcher",
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(searchAsync.pending, (state) => {
        state.status = "loading";
      })
      .addCase(searchAsync.fulfilled, (state, action) => {
        const { data } = action.payload;
        const { meaning, word } = data;

        state.status = "idle";
        state.word = word;
        state.meaning = meaning;
      })
      .addCase(searchAsync.rejected, (state) => {
        state.status = "failed";
        state.word = undefined;
        state.meaning = [];
      });
  },
});

export const selecStatus = (state: RootState) => state.searcher.status;

export const selectWord = (state: RootState) => state.searcher.word;

export const selectMeaning = (state: RootState) => state.searcher.meaning;

export default searcherSlice.reducer;
