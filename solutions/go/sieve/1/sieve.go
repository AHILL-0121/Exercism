package sieve

func Sieve(limit int) []int {
	if limit < 2 {
		return []int{}
	}

	composite := make([]bool, limit+1)
	primes := []int{}

	for n := 2; n <= limit; n++ {
		if composite[n] {
			continue
		}
		primes = append(primes, n)
		for multiple := n * n; multiple <= limit; multiple += n {
			composite[multiple] = true
		}
	}

	return primes
}