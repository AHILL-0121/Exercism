package rotationalcipher

func RotationalCipher(plain string, shiftKey int) string {
	shift := rune(shiftKey % 26)
	result := make([]rune, 0, len(plain))

	for _, r := range plain {
		switch {
		case r >= 'a' && r <= 'z':
			result = append(result, 'a'+(r-'a'+shift)%26)
		case r >= 'A' && r <= 'Z':
			result = append(result, 'A'+(r-'A'+shift)%26)
		default:
			result = append(result, r)
		}
	}

	return string(result)
}