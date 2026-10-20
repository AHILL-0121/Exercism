package isogram

import "unicode"

func IsIsogram(word string) bool {
	seen := make(map[rune]bool)

	for _, r := range word {
		if !unicode.IsLetter(r) {
			continue
		}
		r = unicode.ToLower(r)
		if seen[r] {
			return false
		}
		seen[r] = true
	}

	return true
}