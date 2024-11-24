package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/source/file"
)

func main() {
	db, err := sql.Open("mysql", "root:abcd1234@tcp(localhost:3306)/order-dashboard?multiStatements=true")
	if err != nil {
		log.Fatal("Failed to connect to database:", err)
	}
	defer db.Close()

	// 验证连接
	if err = db.Ping(); err != nil {
		log.Fatal("Could not ping database:", err)
	}

	// 创建 migrate 实例
	driver, err := mysql.WithInstance(db, &mysql.Config{})
	if err != nil {
		log.Fatal("Could not create driver:", err)
	}

	m, err := migrate.NewWithDatabaseInstance(
		"file://dbMigration/migrations", // 迁移文件路径
		"mysql",                         // 数据库类型
		driver,                          // 数据库驱动实例
	)

	if err != nil {
		log.Fatal("Failed to create migrate instance:", err)
	}

	// 执行迁移
	if err := m.Up(); err != nil && err != migrate.ErrNoChange {
		log.Fatal("Failed to run migrations:", err)
	}

	// 获取当前版本
	version, dirty, err := m.Version()
	if err != nil && err != migrate.ErrNilVersion {
		log.Fatal("Failed to get version:", err)
	}

	fmt.Printf("Current migration version: %d, Dirty: %v\n", version, dirty)
}
