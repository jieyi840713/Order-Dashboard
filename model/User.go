package model

import "order-dashboard/db"

type User struct {
	Id       int    `json:"UserId"`
	Name     string `json:"UserName"`
	Password string `json:"UserPassword"`
	Email    string `json:"UserEmail"`
}

func FindAllUsers() []User {
	var users []User
	db.DBConnect.Find(&users)
	return users
}

func FindByUserId(userId int) User {
	var user User
	db.DBConnect.Where("id = ?", userId).First(user)
	return user
}
