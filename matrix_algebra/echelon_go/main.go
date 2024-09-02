package main

import (
	"fmt"
	"time"
)

func main() {
	// // Create a matrix
	// nrows := 10000
	// ncols := 1000
	// matrix := make([][]float64, nrows)
	// for i := 0; i < nrows; i++ {
	// 	matrix[i] = make([]float64, ncols)
	// }

	// // Fill the matrix with random numbers
	// for i := 0; i < nrows; i++ {
	// 	for j := 0; j < ncols; j++ {
	// 		matrix[i][j] = rand.Float64()
	// 	}
	// }

	matrix := [][]float64{
		{1, 2, 3, 4},
		{2, 3, 4, 5},
		{3, 4, 5, 6},
	}

	// Create an echelon form
	before := time.Now()
	echelon := EchelonForm(matrix)

	reduced := ReduceEchelonForm(echelon)

	after := time.Now()
	fmt.Println(len(reduced))

	fmt.Println("Time taken to create echelon form:", after.Sub(before))
}

func ReduceEchelonForm(matrix [][]float64) [][]float64 {
	// Get the number of rows and columns
	rows := len(matrix)
	cols := len(matrix[0])

	for i := rows - 1; i >= 0; i-- {
		// Find the pivot element
		pivot := matrix[i][i]

		// Make the pivot element 1
		for j := i; j < cols; j++ {
			if pivot == 0 {
				continue
			}
			matrix[i][j] = matrix[i][j] / pivot
		}

		// Make the other elements in the column 0
		for j := i - 1; j >= 0; j-- {
			multiplier := matrix[j][i]
			for k := i; k < cols; k++ {
				matrix[j][k] = matrix[j][k] - multiplier*matrix[i][k]
			}
		}
	}

	return matrix
}

func EchelonForm(matrix [][]float64) [][]float64 {
	// Get the number of rows and columns
	rows := len(matrix)
	cols := len(matrix[0])

	for i := 0; i < rows; i++ {
		// Find the pivot element
		pivot := matrix[i][i]

		// Make the pivot element 1
		for j := i; j < cols; j++ {
			if pivot == 0 {
				continue
			}
			matrix[i][j] = matrix[i][j] / pivot
		}

		// Make the other elements in the column 0
		for j := i + 1; j < rows; j++ {
			multiplier := matrix[j][i]
			for k := i; k < cols; k++ {
				matrix[j][k] = matrix[j][k] - multiplier*matrix[i][k]
			}
		}
	}

	return matrix
}
