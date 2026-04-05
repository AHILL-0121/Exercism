def proverb(*items, qualifier=""):
    if not items:
        return []
    
    lines = [f"For want of a {first} the {second} was lost."
             for first, second in zip(items, items[1:])]
    
    qualifier_prefix = f"{qualifier} " if qualifier else ""
    lines.append(f"And all for the want of a {qualifier_prefix}{items[0]}.")
    
    return lines