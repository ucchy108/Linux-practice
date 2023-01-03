package main

import "fmt"

func main() {
	var p *int = nil

	fmt.Println("不正アクセス前")
	*p = 0
	fmt.Println("不正アクセス後")
}