def binaddition(bin1: str, bin2: str) -> int:
    out = []
    carry = 0
    if (len(bin1) > len(bin2)):
        for i in range(len(bin2)):
            sum, carry = add(int(bin1[-(i+1)]), int(bin2[-(i+1)]), carry)
            out.append(str(sum))
        for i in range(len(bin1) - 1 - len(bin2), -1, -1):
            sum, carry = add(int(bin1[i]), 0, carry)
            out.append(str(sum))
    if (len(bin1) < len(bin2)):
        for i in range(len(bin1)):
            sum, carry = add(int(bin1[-(i+1)]), int(bin2[-(i+1)]), carry)
            out.append(str(sum))
        for i in range(len(bin2) - 1 - len(bin1), - 1, -1):
            sum, carry = add(int(bin2[i]), 0, carry)
            out.append(str(sum))
    if (len(bin1) == len(bin2)):
        for i in range(len(bin1) - 1, -1, -1):
            print(carry)
            sum, carry = add(int(bin1[i]), int(bin2[i]), carry)
            out.append(str(sum))
            print(carry)
    if (carry == 1):
        out.append("1")
    out.reverse()
    return "".join(out)

def add(bit1: int, bit2: int, carry: int):
    print(bit1, bit2, carry)
    if (carry == 1):
        if (bit1 + bit2 == 0):
            return [1,0]
        elif (bit1 + bit2 == 1):
            return [0,1]
        elif (bit1 + bit2 == 2):
            return [1,1]
    elif (carry == 0):
        if (bit1 + bit2 == 0):
            return [0,0]
        elif (bit1 + bit2 == 1):
            return [1,0]
        elif (bit1 + bit2 == 2):
            return [0,1]
    else:
        return None
    

bin2 = "1001"
bin1 =  "1110"

print(binaddition(bin1, bin2))