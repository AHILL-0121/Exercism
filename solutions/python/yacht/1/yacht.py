from collections import Counter

YACHT = "yacht"
ONES = "ones"
TWOS = "twos"
THREES = "threes"
FOURS = "fours"
FIVES = "fives"
SIXES = "sixes"
FULL_HOUSE = "full_house"
FOUR_OF_A_KIND = "four_of_a_kind"
LITTLE_STRAIGHT = "little_straight"
BIG_STRAIGHT = "big_straight"
CHOICE = "choice"


def score(dice, category):
    counts = Counter(dice)

    if category == YACHT:
        return 50 if len(counts) == 1 else 0

    if category in (ONES, TWOS, THREES, FOURS, FIVES, SIXES):
        face = (ONES, TWOS, THREES, FOURS, FIVES, SIXES).index(category) + 1
        return counts[face] * face

    if category == FULL_HOUSE:
        return sum(dice) if sorted(counts.values()) == [2, 3] else 0

    if category == FOUR_OF_A_KIND:
        for face, count in counts.items():
            if count >= 4:
                return face * 4
        return 0

    if category == LITTLE_STRAIGHT:
        return 30 if sorted(dice) == [1, 2, 3, 4, 5] else 0

    if category == BIG_STRAIGHT:
        return 30 if sorted(dice) == [2, 3, 4, 5, 6] else 0

    if category == CHOICE:
        return sum(dice)

    return 0