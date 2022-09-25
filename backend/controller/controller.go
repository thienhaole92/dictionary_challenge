package controller

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/thienhaole92/dictionary_challenge/backend/service"
)

func HealthCheck(c *gin.Context) {
	total, err := service.TotalWords()

	if err != nil {
		c.JSON(http.StatusServiceUnavailable, gin.H{
			"status": "FAILED",
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"status": "OK",
		"total":  total,
	})
}

func Search(c *gin.Context) {
	word := c.Query("word")

	result, err := service.Search(word)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"status": "OK",
			"error":  err.Error(),
		})
		return
	}

	meaning, err := service.ListWordMeaning(result.Id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"status": "OK",
			"error":  err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"status": "OK",
		"data": gin.H{
			"word":    result,
			"meaning": meaning,
		},
	})
}
