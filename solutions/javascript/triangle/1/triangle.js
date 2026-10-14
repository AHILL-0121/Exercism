export class Triangle {
  constructor(...sides) {
    this.sides = sides;
  }

  get isValid() {
    if (this.sides.length !== 3) return false;
    const [a, b, c] = this.sides;
    if (a <= 0 || b <= 0 || c <= 0) return false;
    return a + b >= c && b + c >= a && a + c >= b;
  }

  get isEquilateral() {
    const [a, b, c] = this.sides;
    return this.isValid && a === b && b === c;
  }

  get isIsosceles() {
    const [a, b, c] = this.sides;
    return this.isValid && (a === b || b === c || a === c);
  }

  get isScalene() {
    const [a, b, c] = this.sides;
    return this.isValid && a !== b && b !== c && a !== c;
  }
}