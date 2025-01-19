def get_largest_number(num: str) -> str:
    res = []
    parities = []
    even_parity = []
    odd_parity = []

    # Partition the string into parity groups
    for ch in num:
        if int(ch) % 2 == 0:  # Even digit
            if odd_parity:
                parities.append(odd_parity)
                odd_parity = []
            even_parity.append(ch)
        else:  # Odd digit
            if even_parity:
                parities.append(even_parity)
                even_parity = []
            odd_parity.append(ch)

    # Add remaining groups to parities
    if odd_parity:
        parities.append(odd_parity)
    if even_parity:
        parities.append(even_parity)

    # Process each parity group and sort digits in descending order
    for group in parities:
        group.sort(reverse=True)
        res.extend(group)

    return "".join(res)


# Test cases with assertions
assert get_largest_number("7596801") == "9758601"  # Mixed parity example
assert get_largest_number("359") == "593"  # Odd digits only
assert get_largest_number("123456") == "654321"  # Alternating parity
assert get_largest_number("8642") == "8642"  # Already sorted even digits
assert get_largest_number("9871234") == "9874321"  # Mixed parity with descending order
assert get_largest_number("111111") == "111111"  # All digits are the same
assert get_largest_number("24680") == "86420"  # All even digits
assert get_largest_number("97531") == "97531"  # All odd digits, already sorted
