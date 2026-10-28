package acronym

import (
	"strings"
	"unicode"
)

func Abbreviate(s string) string {
	var result strings.Builder
	startOfWord := true

	for _, r := range s {
		switch {
		case unicode.IsLetter(r):
			if startOfWord {
				result.WriteRune(unicode.ToUpper(r))
				startOfWord = false
			}
		case r == '-' || r == '_' || unicode.IsSpace(r):
			startOfWord = true
		}
	}

	return result.String()
}