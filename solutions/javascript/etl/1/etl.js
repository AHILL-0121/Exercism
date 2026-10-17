export const transform = (old) => {
  const result = {};
  for (const [score, letters] of Object.entries(old)) {
    for (const letter of letters) {
      result[letter.toLowerCase()] = Number(score);
    }
  }
  return result;
};