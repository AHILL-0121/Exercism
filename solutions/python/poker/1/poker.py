def best_hands(hands):
    from collections import Counter

    def hand_rank(hand):
        cards = hand.split()
        ranks_map = {'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,
                     '9':9,'10':10,'J':11,'Q':12,'K':13,'A':14}
        suits = [c[-1] for c in cards]
        ranks = sorted([ranks_map[c[:-1]] for c in cards], reverse=True)

        flush = len(set(suits)) == 1
        straight = (len(set(ranks)) == 5 and ranks[0] - ranks[4] == 4)
        low_straight = ranks == [14, 5, 4, 3, 2]
        if low_straight:
            ranks = [5, 4, 3, 2, 1]
            straight = True

        counts = Counter(ranks)
        groups = sorted(counts.values(), reverse=True)
        group_ranks = sorted(counts.keys(), key=lambda r: (counts[r], r), reverse=True)

        if straight and flush:
            return (8, ranks)
        if groups == [4, 1]:
            return (7, group_ranks)
        if groups == [3, 2]:
            return (6, group_ranks)
        if flush:
            return (5, ranks)
        if straight:
            return (4, ranks)
        if groups == [3, 1, 1]:
            return (3, group_ranks)
        if groups == [2, 2, 1]:
            return (2, group_ranks)
        if groups == [2, 1, 1, 1]:
            return (1, group_ranks)
        return (0, group_ranks)

    best = max(hands, key=hand_rank)
    best_rank = hand_rank(best)
    return [h for h in hands if hand_rank(h) == best_rank]