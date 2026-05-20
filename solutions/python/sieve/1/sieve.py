def primes(limit):
    sieve = list(range(2, limit + 1))
    for p in range(2, int(limit**0.5) + 1):
        if p in sieve:
            sieve = [n for n in sieve if n == p or n % p != 0]
    return sieve