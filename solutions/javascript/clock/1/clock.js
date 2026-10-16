const MINUTES_PER_DAY = 24 * 60;
const mod = (n, m) => ((n % m) + m) % m;
const pad = (n) => String(n).padStart(2, '0');
export class Clock {
  #minutes;
  constructor(hour = 0, minute = 0) {
    this.#minutes = mod(hour * 60 + minute, MINUTES_PER_DAY);
  }
  toString() {
    const hours = Math.floor(this.#minutes / 60);
    const minutes = this.#minutes % 60;
    return `${pad(hours)}:${pad(minutes)}`;
  }
  plus(minutes) {
    return new Clock(0, this.#minutes + minutes);
  }
  minus(minutes) {
    return this.plus(-minutes);
  }
  equals(other) {
    return this.toString() === other.toString();
  }
}