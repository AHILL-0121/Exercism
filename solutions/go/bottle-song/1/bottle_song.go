package bottlesong

import (
	"fmt"
	"strings"
)

var numbers = []string{
	"no", "one", "two", "three", "four",
	"five", "six", "seven", "eight", "nine", "ten",
}

func bottles(n int) string {
	if n == 1 {
		return "one green bottle"
	}
	return numbers[n] + " green bottles"
}

func capitalize(s string) string {
	return strings.ToUpper(s[:1]) + s[1:]
}

func Recite(startBottles, takeDown int) []string {
	var result []string
	for i := 0; i < takeDown; i++ {
		n := startBottles - i
		if i > 0 {
			result = append(result, "")
		}
		line := capitalize(bottles(n)) + " hanging on the wall,"
		result = append(result,
			line,
			line,
			"And if one green bottle should accidentally fall,",
			fmt.Sprintf("There'll be %s hanging on the wall.", bottles(n-1)),
		)
	}
	return result
}