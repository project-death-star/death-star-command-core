# Makefile for the death-star-command-core service.
#
# This file provides a set of standardized commands to streamline common
# development and CI/CD tasks. Using 'make' ensures that all developers
# follow the same steps for building, testing, and running the application,
# promoting consistency and reducing setup friction.

# --- Variables ---
# Define variables to avoid repetition and make the Makefile easier to maintain.

# The name of the final binary artifact.
BINARY_NAME=command-core
# The path to the output directory.
成果物ディレクトリー=./bin
# The main package to be built.
CMD_PATH=./cmd/server

# Go commands
GO=go
GO_BUILD=$(GO) build
GO_RUN=$(GO) run
GO_TEST=$(GO) test
GO_MOD_TIDY=$(GO) mod tidyls

# --- Configuration ---

# Set the default goal to 'help'. Running 'make' without arguments will show the help message.
.DEFAULT_GOAL := help

# Declare targets that are not actual files. This prevents 'make' from getting
# confused if a file with the same name as a target exists.
.PHONY: all build clean help run test tidy

# --- Targets ---
# The following are the available commands that can be executed with 'make'.

# all: Runs the default sequence of 'clean' and 'build'.
all: clean build

# build: Compiles the Go source code into a binary executable.
# IMPORTANT: The recipe lines below MUST be indented with a single TAB, not spaces.
build:
	@echo "Building the application..."
	@$(GO_BUILD) -o $(成果物ディレクトリー)/$(BINARY_NAME) $(CMD_PATH)
	@echo "Build complete: $(成果物ディレクトリー)/$(BINARY_NAME)"

# run: Compiles and runs the application for local development.
# It automatically reads the PORT from the environment.
run:
	@echo "Starting the application..."
	@$(GO_RUN) $(CMD_PATH)

# test: Runs all unit tests in the project.
# The -v flag provides verbose output for better test visibility.
test:
	@echo "Running unit tests..."
	@$(GO_TEST) -v ./...

# tidy: Ensures the go.mod and go.sum files are synchronized.
# This command adds missing dependencies and removes unused ones.
tidy:
	@echo "Tidying module dependencies..."
	@$(GO_MOD_TIDY)
	@echo "Dependencies are now in sync."

# clean: Removes build artifacts and binaries.
# Useful for ensuring a fresh build.
clean:
	@echo "Cleaning up build artifacts..."
	@rm -rf $(成果物ディレクトリー)
	@echo "Cleanup complete."

# help: Displays this help message.
# This target makes the Makefile self-documenting.
help:
	@echo "Available commands for death-star-command-core:"
	@echo "------------------------------------------------"
	@echo " make all     - Cleans and builds the application."
	@echo " make build   - Compiles the application binary."
	@echo " make run     - Runs the application for local development."
	@echo " make test    - Executes all unit tests."
	@echo " make tidy    - Synchronizes project dependencies."
	@echo " make clean   - Removes build artifacts."
	@echo " make help    - Shows this help message (default)."
	@echo "------------------------------------------------"

