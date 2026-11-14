package largestseriesproduct

import "errors"

func LargestSeriesProduct(digits string, span int) (int64, error) {
	if span < 0 {
		return 0, errors.New("span must not be negative")
	}
	if span > len(digits) {
		return 0, errors.New("span must not exceed input length")
	}

	nums := make([]int64, len(digits))
	for i, r := range digits {
		if r < '0' || r > '9' {
			return 0, errors.New("digits input must only contain digits")
		}
		nums[i] = int64(r - '0')
	}

	var largest int64
	for i := 0; i+span <= len(nums); i++ {
		product := int64(1)
		for _, n := range nums[i : i+span] {
			product *= n
		}
		if product > largest {
			largest = product
		}
	}

	return largest, nil
}