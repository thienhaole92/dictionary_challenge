package main

import (
	"fmt"
	"os"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"

	"github.com/thienhaole92/dictionary_challenge/backend/controller"
	"github.com/thienhaole92/dictionary_challenge/backend/database"
)

func setupRouter() *gin.Engine {
	router := gin.Default()

	router.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"GET"},
		AllowHeaders:     []string{"Origin"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		MaxAge:           12 * time.Hour,
	}))

	router.GET("/", controller.HealthCheck)
	router.GET("/health", controller.HealthCheck)
	router.GET("/search", controller.Search)

	return router
}

func main() {
	port := os.Getenv("PORT")

	database.Init()

	r := setupRouter()
	r.Run(fmt.Sprintf(":%s", port))
}
