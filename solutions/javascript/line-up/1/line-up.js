//
// This is only a SKELETON file for the 'Line Up' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const format = (name, number) => {
  const suffix = getOrdinalSuffix(number);
  return `${name}, you are the ${number}${suffix} customer we serve today. Thank you!`;
};

const getOrdinalSuffix = (number) => {
  const lastTwo = number % 100;
  const lastDigit = number % 10;

  if (lastTwo >= 11 && lastTwo <= 13) {
    return 'th';
  }

  switch (lastDigit) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
};