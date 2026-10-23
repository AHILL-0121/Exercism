package luhn

func Valid(id string) bool {
	sum := 0
	count := 0
	for i := len(id) - 1; i >= 0; i-- {
		c := id[i]

		if c == ' ' {
			continue
		}
		if c < '0' || c > '9' {
			return false
		}

		d := int(c - '0')
		if count%2 == 1 {
			d *= 2
			if d > 9 {
				d -= 9
			}
		}

		sum += d
		count++
	}

	return count > 1 && sum%10 == 0
}