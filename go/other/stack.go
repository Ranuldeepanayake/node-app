package main

import "fmt"

type stack struct {
	name        string
	stackType   string
	head        int
	tail        int
	bufferFull  bool
	bufferEmpty bool
	size        int
	buffer      [5]int
}

func main() {
	var stack1 stack
	create(&stack1)

	for i := 0; i <= 4; i++ {
		push(&stack1, i)
		fmt.Println("Data: ", stack1.buffer[i])
	}

	//var k int = 0
	for j := 4; j >= 0; j-- {
		fmt.Println("Pop [", j, "]: ", pop(&stack1))
	}
}

func head() {

}

func tail() {

}

func seek(buffer *stack, position int, data int) {
	//
}

func push(buffer *stack, data int) int {

	//Exit if the buffer is full.
	if buffer.bufferFull == true {
		return 1
	}

	//Check the buffer capacity in preparation for the next push operation.
	if buffer.tail+1 == buffer.size {
		buffer.bufferFull = true
		fmt.Println("Push Predicted: ", buffer.tail+1)
	} else {
		buffer.bufferFull = false
	}

	fmt.Println("Push Current", buffer.tail)

	//Do the actual push.
	buffer.buffer[buffer.tail] = data
	buffer.tail += 1

	return 0
}

func pop(buffer *stack) int {

	//Exit if the buffer is empty.
	if buffer.bufferEmpty == true {
		return 3
	}

	//Check the buffer capacity in preparation for the next pop operation.
	if buffer.tail-1 == buffer.head {
		buffer.bufferEmpty = true
		//fmt.Println("Pop Predicted: ", buffer.tail-1)
	} else {
		buffer.bufferEmpty = false
	}

	//fmt.Println("Pop Current", buffer.tail)

	//Do the actual pop.
	data := buffer.buffer[buffer.tail]
	buffer.tail -= 1
	buffer.bufferFull = false
	return data
}

func flush(buffer *stack) {

	for i := 0; i < buffer.size; i++ {
		buffer.buffer[i] = 0
	}
}

func create(buffer *stack) {

	buffer.head = 0
	buffer.tail = 0
	buffer.bufferFull = false
	buffer.bufferEmpty = true
	buffer.size = 5
}
