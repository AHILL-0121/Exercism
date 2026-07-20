export const hey = (message) => {
  const trimmed = message.trim();

  const isSilence = trimmed.length === 0;
  const isYelling = /[A-Z]/.test(trimmed) && trimmed === trimmed.toUpperCase();
  const isQuestion = trimmed.endsWith('?');

  if (isSilence) return 'Fine. Be that way!';
  if (isYelling && isQuestion) return "Calm down, I know what I'm doing!";
  if (isYelling) return 'Whoa, chill out!';
  if (isQuestion) return 'Sure.';
  return 'Whatever.';
};