export class Matrix {
  constructor(matrixString) {
    this.rowsArr = matrixString
      .split('\n')
      .map((line) => line.trim().split(/\s+/).map(Number));
  }

  get rows() {
    return this.rowsArr;
  }

  get columns() {
    return this.rowsArr[0].map((_, colIndex) =>
      this.rowsArr.map((row) => row[colIndex])
    );
  }
}