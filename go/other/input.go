package main

import (
	"fmt"
)

var (
	age  int    = 0
	name string = ""
)

func main() {

	for {
		routine1(&name)
		routine2(&name)

		routine3(&age)
		routine4(&age)

		fmt.Println()
	}
}

// Integer functions.
func routine1(x *string) {
	fmt.Println("Enter your name: ")
	fmt.Scan(x)
}

func routine2(x *string) {
	fmt.Println("Entered name is: ", *x)
}

// String functions.
func routine3(x *int) {
	fmt.Println("Enter your age: ")
	fmt.Scan(x)
}

func routine4(x *int) {
	fmt.Println("Entered age is: ", *x)
}
