//
// This is only a SKELETON file for the 'Pangram' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isPangram = (sentence) => {
  const letters = new Set(sentence.toLowerCase().replace(/[^a-z]/g, ''));
  return letters.size === 26;
};
