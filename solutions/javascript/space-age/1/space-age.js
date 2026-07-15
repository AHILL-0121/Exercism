const EARTH_YEAR_SECONDS = 31557600;

const ORBITAL_PERIODS = {
  mercury: 0.2408467,
  venus: 0.61519726,
  earth: 1.0,
  mars: 1.8808158,
  jupiter: 11.862615,
  saturn: 29.447498,
  uranus: 84.016846,
  neptune: 164.79132,
};

export const age = (planet, seconds) => {
  if (!Object.prototype.hasOwnProperty.call(ORBITAL_PERIODS, planet)) {
    throw new Error('not a planet');
  }
  const orbitalPeriod = ORBITAL_PERIODS[planet];
  return Number((seconds / (EARTH_YEAR_SECONDS * orbitalPeriod)).toFixed(2));
};