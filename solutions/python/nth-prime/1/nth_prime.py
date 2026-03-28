def prime(number):
    if number < 1:
        raise ValueError("there is no zeroth prime")
    
    primes = []
    candidate = 2
    
    while len(primes) < number:
        if all(candidate % p != 0 for p in primes):
            primes.append(candidate)
        candidate += 1
    
    return primes[-1]