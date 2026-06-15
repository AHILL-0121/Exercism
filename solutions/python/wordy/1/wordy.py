def answer(question):
    if not question.startswith("What is") or not question.endswith("?"):
        raise ValueError("unknown operation")
    
    problem = question.removeprefix("What is").removesuffix("?").strip()
    
    if not problem:
        raise ValueError("syntax error")
    
    tokens = problem.split()
    
    unknown_words = {"cubed", "squared", "what", "who", "where", "when", "why", "how"}
    for word in tokens:
        if word in unknown_words:
            raise ValueError("unknown operation")
    
    def parse_number(token):
        try:
            return int(token)
        except (ValueError, TypeError):
            raise ValueError("syntax error")
    
    result = parse_number(tokens[0])
    i = 1
    
    while i < len(tokens):
        if tokens[i] == "plus":
            if i + 1 >= len(tokens):
                raise ValueError("syntax error")
            result += parse_number(tokens[i + 1])
            i += 2
        elif tokens[i] == "minus":
            if i + 1 >= len(tokens):
                raise ValueError("syntax error")
            result -= parse_number(tokens[i + 1])
            i += 2
        elif tokens[i] == "multiplied" and i + 1 < len(tokens) and tokens[i + 1] == "by":
            if i + 2 >= len(tokens):
                raise ValueError("syntax error")
            result *= parse_number(tokens[i + 2])
            i += 3
        elif tokens[i] == "divided" and i + 1 < len(tokens) and tokens[i + 1] == "by":
            if i + 2 >= len(tokens):
                raise ValueError("syntax error")
            result //= parse_number(tokens[i + 2])
            i += 3
        else:
            try:
                int(tokens[i])
                raise ValueError("syntax error")
            except ValueError as e:
                if "syntax error" in str(e):
                    raise
                raise ValueError("unknown operation")
    
    return result