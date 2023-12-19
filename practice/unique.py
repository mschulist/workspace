def isunique(s: str):
    ch = []
    for i in range(len(s)):
        for j in range(len(s)):
            if (i != j):
                if (s[i] == s[j]):
                    return False
    return True

def isunique2(s: str):
    hmap = [0] * len(s)
    for i in range(len(s)):
        hmap[hash(s[i]) % len(s)] += 1
    for i in range(len(s)):
        if (hmap[hash(s[i]) % len(s)] > 1):
            return False
    return True

s: str = ""

for i in range(1000):
    s += str(hash(i))

print(isunique(s))
print(isunique2(s))