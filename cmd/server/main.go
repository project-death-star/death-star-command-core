// package main is the entry point for the command-core service.
// Its primary responsibility is to initialize and run the HTTP server.
// This package should contain minimal logic, delegating all business
// and server configuration to the internal packages. This adheres to the
// Clean Code principle of Separation of Concerns and our architectural
// guideline of keeping the /cmd directory as a thin-as-possible launcher.
package main

import (
	"log"
	"os"

	"github.com/death-star/command-core/internal/server"
)

// main is the application's entry point.
// It sets up the server by calling the NewServer constructor from our internal
// server package and then starts it, listening for incoming HTTP requests on a
// port defined by an environment variable.
func main() {
	// Instantiate the server. This encapsulates all the Gin engine
	// setup and route registration from the internal/server package.
	srv := server.NewServer()

	// Configuration is read from the environment, a best practice for
	// modern, cloud-native applications. This allows us to deploy the same
	// artifact across different environments (dev, staging, prod) without code changes.
	port := os.Getenv("PORT")
	if port == "" {
		// A default value is provided for local development convenience.
		port = "8080"
	}

	log.Printf("Server starting on port %s", port)

	// Start the server and listen for incoming requests. The Run method blocks
	// the main goroutine, keeping the application alive.
	// We wrap it in a log.Fatal to ensure that if the server fails to start
	// (e.g., port is already in use), the application will exit with a clear error message.
	if err := srv.Run(":" + port); err != nil {
		log.Fatalf("Failed to run server: %v", err)
	}
}
