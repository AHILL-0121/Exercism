export class SplitSecondStopwatch {
  constructor() {
    this._state = 'ready';
    this._previousLaps = [];
    this._currentLapElapsed = 0;
  }

  get state() {
    return this._state;
  }

  get currentLap() {
    return this._format(this._currentLapElapsed);
  }

  get total() {
    const lapsSum = this._previousLaps.reduce((sum, lap) => sum + lap, 0);
    return this._format(lapsSum + this._currentLapElapsed);
  }

  get previousLaps() {
    return this._previousLaps.map((seconds) => this._format(seconds));
  }

  start() {
    if (this._state === 'running') {
      throw new Error('cannot start an already running stopwatch');
    }
    this._state = 'running';
  }

  stop() {
    if (this._state !== 'running') {
      throw new Error('cannot stop a stopwatch that is not running');
    }
    this._state = 'stopped';
  }

  lap() {
    if (this._state !== 'running') {
      throw new Error('cannot lap a stopwatch that is not running');
    }
    this._previousLaps.push(this._currentLapElapsed);
    this._currentLapElapsed = 0;
  }

  reset() {
    if (this._state !== 'stopped') {
      throw new Error('cannot reset a stopwatch that is not stopped');
    }
    this._state = 'ready';
    this._previousLaps = [];
    this._currentLapElapsed = 0;
  }

  advanceTime(time) {
    if (this._state !== 'running') {
      return;
    }
    this._currentLapElapsed += this._parse(time);
  }

  _parse(time) {
    const [hours, minutes, seconds] = time.split(':').map(Number);
    return hours * 3600 + minutes * 60 + seconds;
  }

  _format(totalSeconds) {
    totalSeconds = Math.floor(totalSeconds);
    const hours = Math.floor(totalSeconds / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    const seconds = totalSeconds % 60;
    const pad = (n) => String(n).padStart(2, '0');
    return `${pad(hours)}:${pad(minutes)}:${pad(seconds)}`;
  }
}