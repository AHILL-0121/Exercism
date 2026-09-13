const usedNames = new Set();

function generateName() {
  const letters = Array.from({ length: 2 }, () =>
    String.fromCharCode(65 + Math.floor(Math.random() * 26))
  ).join('');
  const digits = Array.from({ length: 3 }, () =>
    Math.floor(Math.random() * 10)
  ).join('');
  return `${letters}${digits}`;
}

function generateUniqueName() {
  let name;
  do {
    name = generateName();
  } while (usedNames.has(name));
  usedNames.add(name);
  return name;
}

export class Robot {
  get name() {
    if (!this._name) {
      this._name = generateUniqueName();
    }
    return this._name;
  }

  reset() {
    this._name = undefined;
  }
}

Robot.releaseNames = () => {
  usedNames.clear();
};