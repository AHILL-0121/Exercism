package resistorcolor

var colors = []string{
	"black",
	"brown",
	"red",
	"orange",
	"yellow",
	"green",
	"blue",
	"violet",
	"grey",
	"white",
}

func Colors() []string {
	result := make([]string, len(colors))
	copy(result, colors)
	return result
}

func ColorCode(color string) int {
	for i, c := range colors {
		if c == color {
			return i
		}
	}
	return -1
}