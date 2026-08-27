export class List {
  constructor(values = []) {
    this.values = [...values];
  }

  append(otherList) {
    const result = [...this.values];
    for (const item of otherList.values) {
      result[result.length] = item;
    }
    return new List(result);
  }

  concat(listOfLists) {
    let result = [...this.values];
    for (const list of listOfLists.values) {
      for (const item of list.values) {
        result[result.length] = item;
      }
    }
    return new List(result);
  }

  filter(predicate) {
    let result = [];
    for (const item of this.values) {
      if (predicate(item)) {
        result[result.length] = item;
      }
    }
    return new List(result);
  }

  map(fn) {
    let result = [];
    for (const item of this.values) {
      result[result.length] = fn(item);
    }
    return new List(result);
  }

  length() {
    let count = 0;
    for (const _ of this.values) {
      count += 1;
    }
    return count;
  }

  foldl(fn, initial) {
    let acc = initial;
    for (const item of this.values) {
      acc = fn(acc, item);
    }
    return acc;
  }

  foldr(fn, initial) {
    let acc = initial;
    const reversed = this.reverse().values;
    for (const item of reversed) {
      acc = fn(acc, item);
    }
    return acc;
  }

  reverse() {
    let result = [];
    for (const item of this.values) {
      result = [item, ...result];
    }
    return new List(result);
  }
}