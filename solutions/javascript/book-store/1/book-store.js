const PRICE = 800;
const DISCOUNT = { 1: 1, 2: 0.95, 3: 0.9, 4: 0.8, 5: 0.75 };

export const cost = (books) => {
  if (books.length === 0) return 0;

  const counts = {};
  for (const b of books) counts[b] = (counts[b] || 0) + 1;

  const groups = [];
  while (Object.values(counts).some((c) => c > 0)) {
    const distinct = Object.keys(counts).filter((k) => counts[k] > 0);
    distinct.forEach((k) => (counts[k] -= 1));
    groups.push(distinct.length);
  }

  // Optimization: convert a 5+3 pair into 4+4
  const fives = groups.filter((g) => g === 5).length;
  const threes = groups.filter((g) => g === 3).length;
  const swaps = Math.min(fives, threes);
  for (let i = 0; i < swaps; i += 1) {
    groups.splice(groups.indexOf(5), 1);
    groups.splice(groups.indexOf(3), 1);
    groups.push(4, 4);
  }

  return groups.reduce(
    (total, size) => total + Math.round(size * PRICE * DISCOUNT[size]),
    0
  );
};