def strcompress(s: str) -> str:
    a: str = ""
    char: str = ""
    n: int = 1
    for i in range(len(s)):
        if (s[i] == char):
            n += 1
            a = a[:len(a)-1] + str(n)
        if (s[i] != char):
            a += s[i] + "1"
            char = s[i]
            n = 1
        print(a)
    return a

a = "aabcccccaaa"
print(strcompress(a))
