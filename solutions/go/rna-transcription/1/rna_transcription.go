package rnatranscription

import "strings"

func ToRNA(dna string) string {
	var sb strings.Builder
	sb.Grow(len(dna))

	for _, nucleotide := range dna {
		switch nucleotide {
		case 'G':
			sb.WriteRune('C')
		case 'C':
			sb.WriteRune('G')
		case 'T':
			sb.WriteRune('A')
		case 'A':
			sb.WriteRune('U')
		}
	}

	return sb.String()
}