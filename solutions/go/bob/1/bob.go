package bob

import (
	"strings"
	"unicode"
)

func Hey(remark string) string {
	remark = strings.TrimSpace(remark)

	if remark == "" {
		return "Fine. Be that way!"
	}

	isQuestion := strings.HasSuffix(remark, "?")
	isYelling := strings.ToUpper(remark) == remark && strings.IndexFunc(remark, unicode.IsLetter) >= 0

	switch {
	case isYelling && isQuestion:
		return "Calm down, I know what I'm doing!"
	case isYelling:
		return "Whoa, chill out!"
	case isQuestion:
		return "Sure."
	default:
		return "Whatever."
	}
}