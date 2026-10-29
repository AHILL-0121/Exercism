package anagram

import "strings"

func Detect(subject string, candidates []string) []string {
	lowerSubject := strings.ToLower(subject)
	subjectCounts := countRunes(lowerSubject)

	result := []string{}
	for _, candidate := range candidates {
		lowerCandidate := strings.ToLower(candidate)

		if lowerCandidate == lowerSubject {
			continue
		}

		if equalCounts(subjectCounts, countRunes(lowerCandidate)) {
			result = append(result, candidate)
		}
	}
	return result
}

func countRunes(s string) map[rune]int {
	counts := make(map[rune]int)
	for _, r := range s {
		counts[r]++
	}
	return counts
}

func equalCounts(a, b map[rune]int) bool {
	if len(a) != len(b) {
		return false
	}
	for r, n := range a {
		if b[r] != n {
			return false
		}
	}
	return true
}