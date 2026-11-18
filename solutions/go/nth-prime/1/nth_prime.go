package nthprime

import "errors"
func Nth(n int) (int, error) {
	if n <= 0 {
		return 0, errors.New("n must be greater than zero")
	}

	primes := make([]int, 0, n)
	candidate := 2

	for len(primes) < n {
		if isPrime(candidate, primes) {
			primes = append(primes, candidate)
		}
		if candidate == 2 {
			candidate = 3
		} else {
			candidate += 2
		}
	}

	return primes[n-1], nil
}


func isPrime(candidate int, primes []int) bool {
	for _, p := range primes {
		if p*p > candidate {
			break
		}
		if candidate%p == 0 {
			return false
		}
	}
	return true
}