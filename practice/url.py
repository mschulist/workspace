def urlify(s: str):
    i = 0
    while i < len(s):
        if (s[i] == " "):
            s = s[:i] + "%20" + s[i+1:]
            i+=2
        print(i)
        print(s)
        i += 1
    return s

s: str = "hello my name is mark"

print(urlify(s))