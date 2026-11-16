package listops
type IntList []int

func (s IntList) Foldl(fn func(int, int) int, initial int) int {
	acc := initial
	for _, v := range s {
		acc = fn(acc, v)
	}
	return acc
}

func (s IntList) Foldr(fn func(int, int) int, initial int) int {
	acc := initial
	for i := len(s) - 1; i >= 0; i-- {
		acc = fn(s[i], acc)
	}
	return acc
}

func (s IntList) Filter(fn func(int) bool) IntList {
	result := IntList{}
	for _, v := range s {
		if fn(v) {
			result = append(result, v)
		}
	}
	return result
}

func (s IntList) Length() int {
	count := 0
	for range s {
		count++
	}
	return count
}

func (s IntList) Map(fn func(int) int) IntList {
	result := make(IntList, len(s))
	for i, v := range s {
		result[i] = fn(v)
	}
	return result
}

func (s IntList) Reverse() IntList {
	n := len(s)
	result := make(IntList, n)
	for i, v := range s {
		result[n-1-i] = v
	}
	return result
}

func (s IntList) Append(lst IntList) IntList {
	result := make(IntList, 0, len(s)+len(lst))
	result = append(result, s...)
	result = append(result, lst...)
	return result
}

func (s IntList) Concat(lists []IntList) IntList {
	result := make(IntList, 0, len(s))
	result = append(result, s...)
	for _, l := range lists {
		result = append(result, l...)
	}
	return result
}