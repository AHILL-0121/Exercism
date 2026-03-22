def proteins(strand):
    codon_map = {
        "AUG": "Methionine",
        "UUU": "Phenylalanine", "UUC": "Phenylalanine",
        "UUA": "Leucine", "UUG": "Leucine",
        "UCU": "Serine", "UCC": "Serine", "UCA": "Serine", "UCG": "Serine",
        "UAU": "Tyrosine", "UAC": "Tyrosine",
        "UGU": "Cysteine", "UGC": "Cysteine",
        "UGG": "Tryptophan",
        "UAA": "STOP", "UAG": "STOP", "UGA": "STOP"
    }

    result = []

    for i in range(0, len(strand), 3):
        codon = strand[i:i+3]
        if len(codon) < 3:
            break
        amino = codon_map.get(codon)
        if amino == "STOP":
            break
        result.append(amino)

    return result