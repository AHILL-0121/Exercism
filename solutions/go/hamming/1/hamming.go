package hamming

import "errors"

func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("strands must be of equal length")
	}
	ra, rb := []rune(a), []rune(b)
	if len(ra) != len(rb) {
		return 0, errors.New("strands must be of equal length")
	}
	count := 0
	for i := range ra {
		if ra[i] != rb[i] {
			count++
		}
	}
	return count, nil
}