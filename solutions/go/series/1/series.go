package series

func All(n int, s string) []string {
	if n <= 0 {
		return nil
	}
	var result []string
	for i := 0; i+n <= len(s); i++ {
		result = append(result, s[i:i+n])
	}
	return result
}

func UnsafeFirst(n int, s string) string {
	return s[:n]
}

func First(n int, s string) (first string, ok bool) {
	if n <= 0 || n > len(s) {
		return "", false
	}
	return s[:n], true
}