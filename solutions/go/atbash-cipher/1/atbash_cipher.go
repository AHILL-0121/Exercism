package atbashcipher

import "strings"

func Atbash(s string) string {
	var sb strings.Builder
	count := 0

	for _, r := range strings.ToLower(s) {
		var out rune
		switch {
		case r >= 'a' && r <= 'z':
			out = 'a' + ('z' - r)
		case r >= '0' && r <= '9':
			out = r
		default:
			continue
		}

		if count > 0 && count%5 == 0 {
			sb.WriteRune(' ')
		}
		sb.WriteRune(out)
		count++
	}

	return sb.String()
}