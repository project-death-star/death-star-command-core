package server

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// NewServer creates and configures a new Gin server instance for the BFF.
//
// This function acts as the constructor for our HTTP server. It initializes
// the Gin engine with default middleware (for logging and recovery) and then
// registers all the application's API routes.
// This centralized setup ensures that all server configuration is handled
// consistently and provides a single entry point for creating a runnable server instance.
func NewServer() *gin.Engine {
	// Initialize a Gin router with default middleware.
	router := gin.Default()

	// Register all the defined API routes.
	registerRoutes(router)

	return router
}

// registerRoutes sets up all the API endpoints for the service.
// Centralizing route registration makes the API structure clear and easy to manage.
func registerRoutes(router *gin.Engine) {
	// Grouping routes under /v1 for versioning is a best practice.
	// For the walking skeleton, we can register directly.
	router.GET("/health", healthCheckHandler)
}

// healthCheckHandler returns the operational status of the service.
// This endpoint is crucial for automated monitoring, load balancers, and container
// orchestrators (like Kubernetes) to perform health checks.
func healthCheckHandler(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"status": "ok",
	})
}
