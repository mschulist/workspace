def permutation(s1: str, s2: str):
    hmap1 = [0] * max(len(s1), len(s2))
    for i in range(len(s1)):
        hmap1[hash(s1[i]) % len(hmap1)] += 1

    hmap2 = [0] * max(len(s1), len(s2))
    for i in range(len(s2)):
        hmap2[hash(s2[i]) % len(hmap2)] += 1
    
    if (hmap1 == hmap2):
        return True
    return False

s1: str = "ava"
s2: str = "ava"

print(permutation(s1, s2))