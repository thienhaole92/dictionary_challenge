const axios = require("axios").default;

export async function searchWord(word: string) {
  const DOMAIN = process.env.REACT_APP_API_URL;

  const response = await axios.get(`${DOMAIN}/search?word=${word}`);

  return response;
}
