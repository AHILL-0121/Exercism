import math

def cipher_text(plain_text):
    normalized = ''.join(c.lower() for c in plain_text if c.isalnum())
    if not normalized:
        return ""
    
    length = len(normalized)
    c = math.ceil(math.sqrt(length))
    r = math.ceil(length / c)
    
    padded = normalized.ljust(r * c)
    rows = [padded[i:i+c] for i in range(0, r * c, c)]
    
    chunks = [''.join(row[col] for row in rows) for col in range(c)]
    return ' '.join(chunks)