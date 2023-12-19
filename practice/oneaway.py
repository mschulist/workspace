def oneaway(s: str, target: str) -> bool:
    # must need more than 1 change if diff in lengths > 1
    if (abs(len(s) - len(target)) > 1):
        return False
    
    # if equal length strings
    if (abs(len(s) - len(target)) == 0):
        n: int = 0
        for i in range(len(s)):
            if (s[i] != target[i]):
                n+=1
        if (n > 1):
            return False
    
    # if s is longer than target, we need to remove
    if (len(s) - len(target) == 1):
        n = 0
        tmp = s
        for i in range(len(target)):
            if (tmp[i] != target[i]):
                n+=1
                tmp = tmp[:i] + tmp[i+1:]
            if (n > 1):
                return False
    
    # if s is shorter than target, we need to add
    if (len(s) - len(target) == -1):
        n = 0
        tmp = s
        for i in range(len(s)):
            if (tmp[i] != target[i]):
                n+=1
                tmp = tmp[:i] + tmp[i] + tmp[i:]
            if (n > 1):
                return False

    return True

s: str = "pall"
target: str = "pall"

print(oneaway(s, target))