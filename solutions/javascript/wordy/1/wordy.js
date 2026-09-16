export const answer = (question) => {
  if (!question.startsWith('What is') || !question.endsWith('?')) {
    throw new Error('Unknown operation');
  }

  let cleaned = question
    .slice('What is'.length, -1)
    .replace(/multiplied by/g, 'multiplied')
    .replace(/divided by/g, 'divided')
    .trim();

  if (cleaned === '') {
    throw new Error('Syntax error');
  }

  const tokens = cleaned.split(/\s+/);

  const isNumber = (t) => /^-?\d+$/.test(t);
  const operators = new Set(['plus', 'minus', 'multiplied', 'divided']);

if (!isNumber(tokens[0])) {
  if (operators.has(tokens[0])) {
    throw new Error('Syntax error');
  }
  throw new Error('Unknown operation');
}
  let result = parseInt(tokens[0], 10);
  let i = 1;

  while (i < tokens.length) {
    const op = tokens[i];
    if (!operators.has(op)) {
      if (isNumber(op)) {
        throw new Error('Syntax error');
      }
      throw new Error('Unknown operation');
    }
    const next = tokens[i + 1];
    if (next === undefined || !isNumber(next)) {
      throw new Error('Syntax error');
    }
    const num = parseInt(next, 10);

    switch (op) {
      case 'plus':
        result += num;
        break;
      case 'minus':
        result -= num;
        break;
      case 'multiplied':
        result *= num;
        break;
      case 'divided':
        result /= num;
        break;
    }

    i += 2;
  }

  return result;
};