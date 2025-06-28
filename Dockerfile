# Stage 1: Build the Go binary
FROM golang:1.23-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum to download dependencies first
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the application, disabling CGO to ensure static linking
# The output is a single binary named 'command-core'
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o command-core ./cmd/server

# Stage 2: Create the final, minimal image
FROM gcr.io/distroless/static-debian11

# Set the working directory
WORKDIR /app

# Copy the statically linked binary from the builder stage
COPY --from=builder /app/command-core .

# Set the user to non-root for better security
USER nonroot:nonroot

# Expose the port the application will run on
EXPOSE 8080

# Set the entrypoint for the container
ENTRYPOINT ["/app/command-core"]
