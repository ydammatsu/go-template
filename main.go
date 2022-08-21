package main

import (
	"fmt"

	"github.com/ydammatsu/go-template/src/model"
)

func main() {
	u := model.User{Name: "John", Age: 20}
	message := u.SayHello()
	fmt.Println(message)
}
