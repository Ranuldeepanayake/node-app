package main

import (
	"fmt"
)

func main() {

	sliceFromMake()
	//sliceFromArray()
}

func sliceFromMake() {

	var slice1 = make([]int, 0, 5)
	//var slice1 = []int{}

	fmt.Println("Length of slice 1: ", len(slice1))
	fmt.Println("Capacity of slice 1: ", cap(slice1))

	for i := 0; i < 5; i++ {
		//slice1[i] = i
		slice1 = append(slice1, i)
	}

	fmt.Println("Contents of slice 1: ", slice1)

	fmt.Println("Length of slice 1: ", len(slice1))
	fmt.Println("Capacity of slice 1: ", cap(slice1))
}

func sliceFromArray() {

	//Array
	array := [5]int{0, 1, 2, 3, 4}

	slice1 := array[0:2]
	slice2 := array[3:5]

	fmt.Println("Contents of slice 1: ", slice1)
	fmt.Println("Contents of slice 2: ", slice2)

	fmt.Println("Length of slice 1: ", len(slice1))
	fmt.Println("Capacity of slice 1: ", cap(slice1))
	fmt.Println("Length of slice 2: ", len(slice2))
	fmt.Println("Capacity of slice 2: ", cap(slice2))
}
