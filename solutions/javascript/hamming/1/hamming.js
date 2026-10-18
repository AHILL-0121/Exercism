export const compute = (left, right) => {
  if (left.length !== right.length) {
    throw new Error('strands must be of equal length');
  }

  let distance = 0;

  for (let i = 0; i < left.length; i++) {
    if (left[i] !== right[i]) {
      distance++;
    }
  }

  return distance;
};