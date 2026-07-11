const complements = {
  G: 'C',
  C: 'G',
  T: 'A',
  A: 'U',
};

export const toRna = (dnaStrand) =>
  dnaStrand
    .split('')
    .map((nucleotide) => complements[nucleotide])
    .join('');