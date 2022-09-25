import { configureStore, ThunkAction, Action } from '@reduxjs/toolkit';
import searcherReducer from '../features/searcher/searcherSlice';

export const store = configureStore({
  reducer: {
    searcher: searcherReducer,
  },
});

export type AppDispatch = typeof store.dispatch;
export type RootState = ReturnType<typeof store.getState>;
export type AppThunk<ReturnType = void> = ThunkAction<
  ReturnType,
  RootState,
  unknown,
  Action<string>
>;
