package pangram
import "unicode"

func IsPangram(input string) bool {
	const all = (1 << 26) - 1
	seen := 0
	for _, r := range input {
		r = unicode.ToLower(r)
		if r >= 'a' && r <= 'z' {
			seen |= 1 << (r - 'a')
		}
	}
	return seen == all
}