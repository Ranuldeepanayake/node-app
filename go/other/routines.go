package main

import (
	"fmt"
	"strconv"
)

var (
	a int    = 0
	b string = "null"
)

func main() {

	for i := 0; i < 5; i++ {
		go routine1(i)
		go routine2(strconv.Itoa(i))

		fmt.Println("Routine 1: ", a)
		fmt.Println("Routine 2: ", b)
		fmt.Println()
	}
}

func routine1(x int) {
	a = x
	//time.Sleep(100 * time.Millisecond)
}

func routine2(x string) {
	b = x
}
