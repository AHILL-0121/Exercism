package complexnumbers

import "math"

type Number struct {
	re, im float64
}

func (n Number) Real() float64 {
	return n.re
}

func (n Number) Imaginary() float64 {
	return n.im
}

func (n1 Number) Add(n2 Number) Number {
	return Number{n1.re + n2.re, n1.im + n2.im}
}

func (n1 Number) Subtract(n2 Number) Number {
	return Number{n1.re - n2.re, n1.im - n2.im}
}

func (n1 Number) Multiply(n2 Number) Number {
	return Number{
		n1.re*n2.re - n1.im*n2.im,
		n1.im*n2.re + n1.re*n2.im,
	}
}

func (n Number) Times(factor float64) Number {
	return Number{n.re * factor, n.im * factor}
}

func (n1 Number) Divide(n2 Number) Number {
	d := n2.re*n2.re + n2.im*n2.im
	return Number{
		(n1.re*n2.re + n1.im*n2.im) / d,
		(n1.im*n2.re - n1.re*n2.im) / d,
	}
}

func (n Number) Conjugate() Number {
	return Number{n.re, -n.im}
}

func (n Number) Abs() float64 {
	return math.Hypot(n.re, n.im)
}

func (n Number) Exp() Number {
	e := math.Exp(n.re)
	return Number{e * math.Cos(n.im), e * math.Sin(n.im)}
}