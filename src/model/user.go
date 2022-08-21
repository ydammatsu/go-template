package model

type User struct {
	Name string
	Age  int
}

func (u *User) SayHello() string {
	return "Hello, " + u.Name + "!"
}
