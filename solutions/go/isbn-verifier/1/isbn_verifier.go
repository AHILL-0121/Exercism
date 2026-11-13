package isbnverifier

func IsValidISBN(isbn string) bool {
	sum := 0
	count := 0

	for _, r := range isbn {
		switch {
		case r == '-':
			continue
		case r >= '0' && r <= '9':
			if count >= 10 {
				return false
			}
			sum += int(r-'0') * (10 - count)
			count++
		case r == 'X' && count == 9:
			sum += 10
			count++
		default:
			return false
		}
	}

	return count == 10 && sum%11 == 0
}