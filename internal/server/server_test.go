package server

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

// TestHealthCheckHandler verifies the functionality of the /health endpoint.
//
// This unit test ensures that the API's health check endpoint is operating correctly.
// According to our SRE principles (as outlined in the 'Project Death Star - Roadmap'),
// a reliable health check is the most basic and critical indicator of a service's
// operational status. This endpoint is consumed by monitoring systems and orchestrators
// (like Kubernetes) to determine if the service is alive and ready to serve traffic.
//
// The test validates that a GET request to /health:
// 1. Returns an HTTP status code of 200 OK.
// 2. Returns a JSON body of `{"status": "ok"}`.
func TestHealthCheckHandler(t *testing.T) {
	// --- Arrange ---
	// Set up the test environment. We create a new server instance, which includes
	// our router and all registered handlers. This allows us to test the handler's
	// logic in isolation without a live network connection.
	router := NewServer()

	// Create a mock HTTP response recorder to capture the handler's output.
	responseRecorder := httptest.NewRecorder()

	// Create a new HTTP request targeting the endpoint we want to test.
	// Using require.NoError ensures the test fails immediately if this setup step
	// fails, as there is no point in continuing if the request cannot be created.
	req, err := http.NewRequest(http.MethodGet, "/health", nil)
	require.NoError(t, err, "Failed to create the HTTP request")

	// --- Act ---
	// Execute the request against our router. The router will find the matching
	// handler for the "/health" route and execute it, writing the response
	// into our mock response recorder.
	router.ServeHTTP(responseRecorder, req)

	// --- Assert ---
	// Verify that the outcome is as expected.
	// We check both the HTTP status code and the response body for correctness.
	assert.Equal(t, http.StatusOK, responseRecorder.Code, "Response code should be 200 OK")
	assert.JSONEq(t, `{"status": "ok"}`, responseRecorder.Body.String(), "Response body should be the expected JSON")
}
