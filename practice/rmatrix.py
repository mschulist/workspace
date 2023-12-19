def rmatrix(matrix):
    for i in range(len(matrix)):
        for j in range(len(matrix)):
            matrix[-j][-i] = matrix[i][j]
    return matrix


# I'm at m[len(m)][0]
# need to go to m[0][0]

# I'm at m[0][0]
# need to go to m[0][len(m)]

matrix = [[0,1,2], 
          [3,4,5],
          [6,7,8]]

target = [[6, 3, 0],
          [7, 4, 1],
          [8, 5, 2]]
print(matrix)
print(target)
print(rmatrix(matrix))
