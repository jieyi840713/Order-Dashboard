package main

import (
	"io"
	"order-dashboard/db"
	"order-dashboard/middlewares"
	. "order-dashboard/src"
	"os"

	"github.com/gin-gonic/gin"
)

func setupLogging() {
	f, _ := os.Create("gin.log")
	gin.DefaultWriter = io.MultiWriter(f, os.Stdout)
}

func main() {

	setupLogging()
	router := gin.Default()
	router.Use(gin.BasicAuth(gin.Accounts{"Tom": "123456"}), middlewares.Logger())
	v1 := router.Group("v1")
	AddUserRouter(v1)
	AddMenuRouter(v1)
	go func() {
		db.DB()
	}()

	router.Run(":8000")
}
