// The module directive defines the module's path, which serves as a unique
// identifier for this package. All packages within this project will be
// imported relative to this path.
module github.com/death-star/command-core

// The go directive specifies the minimum version of Go required to build this module.
// This ensures that we use a consistent language version with expected features
// and standard library behavior across all development and CI/CD environments.
go 1.24.4

// The require directive lists the direct dependencies that are explicitly
// imported by the source code of this module. These are the essential libraries
// our service relies on to function.
require (
	github.com/gin-gonic/gin v1.10.1
	github.com/stretchr/testify v1.10.0
)

// This second require block lists the module's indirect dependencies.
// These are dependencies of our direct dependencies. They are not directly used
// in our source code but are required for the project to compile and run.
// The `// indirect` comment is a standard marker managed by the Go toolchain.
// This list is managed automatically by running `go mod tidy`.
require (
	github.com/bytedance/sonic v1.13.3 // indirect
	github.com/bytedance/sonic/loader v0.2.4 // indirect
	github.com/cloudwego/base64x v0.1.5 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/gabriel-vasile/mimetype v1.4.9 // indirect
	github.com/gin-contrib/sse v1.1.0 // indirect
	github.com/go-playground/locales v0.14.1 // indirect
	github.com/go-playground/universal-translator v0.18.1 // indirect
	github.com/go-playground/validator/v10 v10.26.0 // indirect
	github.com/goccy/go-json v0.10.5 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/klauspost/cpuid/v2 v2.2.10 // indirect
	github.com/leodido/go-urn v1.4.0 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/pelletier/go-toml/v2 v2.2.4 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/twitchyliquid64/golang-asm v0.15.1 // indirect
	github.com/ugorji/go/codec v1.3.0 // indirect
	golang.org/x/arch v0.18.0 // indirect
	golang.org/x/crypto v0.39.0 // indirect
	golang.org/x/net v0.41.0 // indirect
	golang.org/x/sys v0.33.0 // indirect
	golang.org/x/text v0.26.0 // indirect
	google.golang.org/protobuf v1.36.6 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

require github.com/gin-contrib/cors v1.7.6 // indirect
