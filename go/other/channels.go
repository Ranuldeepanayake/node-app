package main

import (
	"fmt"
	"time"
)

//Channels are blocking operations in nature. When we send data into the channel using a GoRoutine, it will be blocked until the data is consumed by another GoRoutine.
//When we receive data from channel using a GoRoutine, it will be blocked until the data is available in the channel.

var channel_1 = make(chan string)
var channel_2 = make(chan int)
var channel_3 = make(chan string)

func main() {
	//channel_1:= make(chan string)

	go diskAccess()
	go networkAccess()

	message_1 := <-channel_1
	message_2 := <-channel_2
	fmt.Println(message_1, " in block: ", message_2)

	message_3 := <-channel_3
	fmt.Println(message_3)

	end()
}

func diskAccess() {
	//fmt.Print("Searching for file descriptor")
	for i := 0; i < 3; i++ {
		//fmt.Println("Accessing block: ", i)
		time.Sleep(10000 * time.Millisecond)

		if i == 1 {
			channel_1 <- "File found>"
			channel_2 <- i
		}
	}

}

func networkAccess() {
	for i := 0; i < 3; i++ {
		//fmt.Println("Accessing block: ", i)
		time.Sleep(10000 * time.Millisecond)
	}
	channel_3 <- "5 MB uploaded>"
}

func end() {
	fmt.Println("End of execution>")
}
