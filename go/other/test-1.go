package main

import (
	"fmt"
)

func main() {
	//fmt.Println("Hello World!")

	//starPrinter()

	var i, j int = multReturn1()
	fmt.Println(i, j)

	var (
		k int
		l string
	)
	k, l = multReturn2()
	fmt.Println(k, l)

	m, n := multReturn3()
	fmt.Println(m, n)

	_, o := multReturn4()
	fmt.Println(o)

	p, _ := multReturn4()
	fmt.Println(p)
}

func starPrinter() {
	for i := 0; i <= 5; i++ {
		for j := 0; j < i; j++ {
			fmt.Print("*")
		}
		fmt.Println()
	}
}

func multReturn1() (int, int) {
	return 0, 15000
}

func multReturn2() (int, string) {
	return 0, "Data"
}

func multReturn3() (int, string) {
	return 0, "Info"
}

func multReturn4() (int, string) {
	return 100, "Hello"
}
