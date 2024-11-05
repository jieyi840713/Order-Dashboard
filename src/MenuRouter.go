package router

import (
	"order-dashboard/service"

	"github.com/gin-gonic/gin"
)

func AddMenuRouter(r *gin.RouterGroup) {
	menu := r.Group("/menu")
	menu.GET("/", service.FindAllItems)
	menu.GET("/:id", service.FindItemByItemId)
}
