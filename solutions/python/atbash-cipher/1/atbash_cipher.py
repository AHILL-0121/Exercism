def encode(plain_text):
    result = []
    for ch in plain_text.lower():
        if ch.isalpha():
            result.append(chr(ord('z') - (ord(ch) - ord('a'))))
        elif ch.isdigit():
            result.append(ch)
    return ' '.join(''.join(result)[i:i+5] for i in range(0, len(result), 5))

def decode(ciphered_text):
    result = []
    for ch in ciphered_text:
        if ch.isalpha():
            result.append(chr(ord('z') - (ord(ch) - ord('a'))))
        elif ch.isdigit():
            result.append(ch)
    return ''.join(result)