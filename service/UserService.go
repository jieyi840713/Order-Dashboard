package service

import (
	"log"
	"net/http"
	"order-dashboard/model"
	"strconv"

	"github.com/gin-gonic/gin"
)

var userList = []model.User{}

func FindAllUsers(c *gin.Context) {
	c.JSON(http.StatusOK, userList)
}

func PostUser(c *gin.Context) {
	user := model.User{}
	if err := c.BindJSON(&user); err != nil {
		c.JSON(http.StatusNotAcceptable, "Error: "+err.Error())
		return
	}
	userList = append(userList, user)
	c.JSON(http.StatusOK, "Successfully posted")
}

func DeleteUser(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))
	for _, user := range userList {
		log.Println(user)
		userList = append(userList[:id], userList[id+1:]...)
		c.JSON(http.StatusOK, "Successfully Delete")
		return

	}
	c.JSON(http.StatusNotFound, "Error")
}
