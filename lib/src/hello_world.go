package main

import (
	"C"
	"fmt"
	"os"
	"os/exec"
	"syscall"
)

//export PrintHello
func PrintHello() {
	fmt.Print("Hello,World")
}

//export Exec
func Exec() {
	binary, err := exec.LookPath("ping")
	if err != nil {
		panic(err)
	}
	if err := syscall.Exec(binary, []string{"1.1.1.1"}, os.Environ()); err != nil {
		panic(err)
	}
}

func main() {}

/*
	Compile me with https://github.com/karalabe/xgo
	xgo --targets linux/amd64,windows/amd64,darwin/amd64 -buildmode=c-shared github.com/brad-jones/dart-go/lib/src
*/
