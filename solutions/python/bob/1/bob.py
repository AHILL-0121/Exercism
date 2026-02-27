def response(hey_bob):
    stripped = hey_bob.strip()
    
    if not stripped:
        return "Fine. Be that way!"
    
    is_yelling = stripped.upper() == stripped and any(c.isalpha() for c in stripped)
    is_question = stripped.endswith("?")
    
    if is_yelling and is_question:
        return "Calm down, I know what I'm doing!"
    elif is_yelling:
        return "Whoa, chill out!"
    elif is_question:
        return "Sure."
    else:
        return "Whatever."