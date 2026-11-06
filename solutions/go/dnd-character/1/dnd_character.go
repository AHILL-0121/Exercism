package dndcharacter

import (
	"math/rand"
	"sort"
)

type Character struct {
	Strength     int
	Dexterity    int
	Constitution int
	Intelligence int
	Wisdom       int
	Charisma     int
	Hitpoints    int
}

func Modifier(score int) int {
	d := score - 10
	if d < 0 && d%2 != 0 {
		return d/2 - 1
	}
	return d / 2
}

func Ability() int {
	dice := make([]int, 4)
	for i := range dice {
		dice[i] = rand.Intn(6) + 1
	}
	sort.Ints(dice)
	return dice[1] + dice[2] + dice[3]
}

func GenerateCharacter() Character {
	c := Character{
		Strength:     Ability(),
		Dexterity:    Ability(),
		Constitution: Ability(),
		Intelligence: Ability(),
		Wisdom:       Ability(),
		Charisma:     Ability(),
	}
	c.Hitpoints = 10 + Modifier(c.Constitution)
	return c
}