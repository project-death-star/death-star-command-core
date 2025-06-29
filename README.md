# Death Star - Command Core

![GitHub last commit](https://img.shields.io/github/last-commit/simaopgt/death-star-command-core?style=for-the-badge)
![Repo size](https://img.shields.io/github/repo-size/simaopgt/death-star-command-core?style=for-the-badge)
![License](https://img.shields.io/github/license/simaopgt/death-star-command-core?style=for-the-badge)

This repository contains the source code for the **Command Core**, the primary Backend-for-Frontend (BFF) service for the "Project Death Star." This service is written in Go and is designed to be a high-performance, scalable, and maintainable core for all client applications (Web, iOS, Android).

## 🚀 Overview

The Command Core serves as the central orchestration layer for the application stack. Its responsibilities include:
* Aggregating data from various downstream services and AI APIs.
* Providing tailored, efficient API endpoints for each frontend client.
* Handling core business logic, authentication, and authorization.
* Ensuring a secure and performant interface between clients and the backend ecosystem.

The tech stack is centered around **Go** and the **Gin** framework, chosen for their performance and simplicity.

## 📋 Prerequisites

Before you begin, ensure you have the following installed on your local machine:

1.  **Go:** Version 1.21 or later.
2.  **Make:** A build automation tool, used to run standardized development commands.

## 🛠️ How to Use

This project uses a `Makefile` to simplify and standardize all common development tasks.

* **Install Dependencies:** (Run this first if you clone the repo)
    ```bash
    make tidy
    ```
* **Run Unit Tests:**
    ```bash
    make test
    ```
* **Run the server for local development:**
    ```bash
    make run
    ```
* **Build the application binary:**
    ```bash
    make build
    ```

For a full list of commands, run `make help`.

## 🗺️ Roadmap

The development of this service follows the epics and tasks defined in our official project board.

* [X] **WS-1: Foundational Setup**
* [X] **WS-2: Health Check Endpoint**
* [ ] **WS-5: Basic CI Pipeline**
* [ ] **WS-6: Containerization (Docker) & Automated Deployment (Argo CD)**

See the [GitHub Project board](https://github.com/users/simaopgt/projects/3) for more details.

## 🏛️ Architectural Decisions

* **Backend-for-Frontend (BFF) Pattern**: This service is a dedicated backend for our specific frontend clients, which allows us to optimize payloads and logic for each platform.
* **Go with Gin**: Go was chosen for its excellent performance, simple concurrency model, and strong standard library. Gin provides a lightweight and fast framework for building our API.
* **Standard Project Layout**: We adhere to the `golang-standards/project-layout` to ensure our codebase is organized, predictable, and maintainable.
* **Makefile for Automation**: All common tasks are automated via a `Makefile` to provide a consistent development experience and simplify CI/CD integration.
* **Clean Code & Architecture**: A strong emphasis is placed on separating concerns (e.g., `/cmd` vs. `/internal`), writing testable code, and ensuring high-quality documentation.

## 🤝 Contributing

As this is a solo portfolio project, direct contributions are not expected. However, suggestions and issue reports are welcome. Please feel free to open an issue for any bugs or ideas.

## 📄 License

This project is distributed under the MIT License. See `LICENSE` for more information.
# Test GitOps
# Test GitOps trigger
