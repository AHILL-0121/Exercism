package primefactors

func Factors(n int64) []int64 {
	factors := []int64{}
	for d := int64(2); d*d <= n; d++ {
		for n%d == 0 {
			factors = append(factors, d)
			n /= d
		}
	}
	if n > 1 {
		factors = append(factors, n)
	}
	return factors
}