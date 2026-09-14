export class Cipher {
  constructor(key) {
    this._key = key || Cipher.randomKey();
  }

  static randomKey(length = 100) {
    let result = '';
    for (let i = 0; i < length; i += 1) {
      result += String.fromCharCode(97 + Math.floor(Math.random() * 26));
    }
    return result;
  }

  get key() {
    return this._key;
  }

  encode(text) {
    return this._shift(text, 1);
  }

  decode(text) {
    return this._shift(text, -1);
  }

  _shift(text, direction) {
    let result = '';
    for (let i = 0; i < text.length; i += 1) {
      const textCode = text.charCodeAt(i) - 97;
      const keyChar = this._key[i % this._key.length];
      const keyCode = keyChar.charCodeAt(0) - 97;
      const shifted = (textCode + direction * keyCode + 26) % 26;
      result += String.fromCharCode(shifted + 97);
    }
    return result;
  }
}