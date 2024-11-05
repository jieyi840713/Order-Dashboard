package main

import (
	"order-dashboard/db"
	. "order-dashboard/src"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	v1 := router.Group("v1")
	AddUserRouter(v1)
	AddMenuRouter(v1)
	go func() {
		db.DB()
	}()

	router.Run(":8000")
}

// func main() {
// 	//連線資料庫
// 	if err := sql.InitMySql(); err != nil {
// 		panic(err)
// 	}

// 	//連結模型
// 	// sql.Connect.AutoMigrate(&model.Message{})
// 	//sql.Connect.Table("message") //也可以使用連線已有資料表方式

// 	//註冊路由
// 	r := router.SetRouter()

// 	//啟動埠為8081的專案
// 	fmt.Println("開啟127.0.0.0.1:8081...")
// 	r.Run("127.0.0.1:8081")
// }
