def palindrome(s: str) -> bool:
    # remove spaces
    i: int = 0
    while i < len(s):
        if (s[i] == " "):
            s = s[:i] + s[i + 1:]
            i -= 1
        i += 1
    
    nmap = [0] * len(s)
    for i in range(len(s)):
        nmap[hash(s[i]) % len(s)] += 1
    
    # we can only have one odd number in our nmap
    odd = 0
    for i in range(len(nmap)):
        if (nmap[i] % 2 == 1):
            odd += 1
        if (odd > 1):
            return False
    
    return True

s = "tact coa"

print(palindrome(s))