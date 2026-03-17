def is_paired(input_string):
    stack = []
    matching = {')': '(', '}': '{', ']': '['}
    for char in input_string:
        if char in '({[':
            stack.append(char)
        elif char in ')}]':
            if not stack or stack[-1] != matching[char]:
                return False
            stack.pop()
    return len(stack) == 0