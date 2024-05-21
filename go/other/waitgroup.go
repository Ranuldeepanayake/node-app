package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {

	wg := new(sync.WaitGroup)
	wg.Add(2)
	//defer wg.Done()

	//The main thread will be executed first.
	go routine1(wg)
	go routine2(wg)
	routineEnd()

	wg.Wait()
}

func routine1(wg *sync.WaitGroup) {
	defer wg.Done()
	//fmt.Print("Hello!")
	for i := 0; i < 5; i++ {
		fmt.Println("Routine 1: ", i)
		time.Sleep(300 * time.Millisecond)
	}
}

func routine2(wg *sync.WaitGroup) {
	defer wg.Done()
	//fmt.Print("World!")
	for i := 0; i < 5; i++ {
		fmt.Println("Routine 2: ", i)
		time.Sleep(300 * time.Millisecond)
	}
}

func routineEnd() {
	fmt.Println("End of routines.")
}
