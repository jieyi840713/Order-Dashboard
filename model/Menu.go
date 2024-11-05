package model

import (
	"order-dashboard/db"
	"time"
)

type Menu struct {
	Id          int       `json:"id"`
	Name        string    `json:"name"`
	Description string    `json:"description"`
	Price       int       `json:"price"`
	IsAvailable int       `json:"isAvailable"`
	ImageURL    string    `json:"imageUrl"`
	ModifyUser  string    `json:"modifyUser"`
	ModifyTime  time.Time `json:"modifyTime"`
	CreateUser  string    `json:"createUser"`
	CreateTime  time.Time `json:"createTime"`
}

func FindAllItems() []Menu {
	var items []Menu
	db.DBConnect.Table("menu").Find(&items)
	return items
}

func FindByItemId(itemId string) Menu {
	var item Menu
	db.DBConnect.Table("menu").Where("id = ?", itemId).First(&item)
	return item
}
