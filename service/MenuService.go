package service

import (
	"log"
	"net/http"
	"order-dashboard/model"

	"github.com/gin-gonic/gin"
)

func FindAllItems(c *gin.Context) {
	items := model.FindAllItems()
	c.JSON(http.StatusOK, items)
}

func FindItemByItemId(c *gin.Context) {
	item := model.FindByItemId(c.Param("id"))
	if item.Id == 0 {
		c.JSON(http.StatusNotFound, "Error")
		return
	}
	log.Println(item)
	c.JSON(http.StatusOK, item)
}
