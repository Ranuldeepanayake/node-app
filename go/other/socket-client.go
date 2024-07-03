package main

import (
	"fmt"
	"net"
)

func main() {
	// Connect to the server
	conn, err := net.Dial("tcp", "localhost:3000")

	//If a connection can't be established.
	if err != nil {
		fmt.Println(err)
		return
	}

	// Send some data to the server
	_, err = conn.Write([]byte("Hello, server!"))

	//If data could not be sent.
	if err != nil {
		fmt.Println(err)
		return
	}

	// Close the connection
	conn.Close()
}
