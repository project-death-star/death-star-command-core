package featureflags

import "os"

// IsEnabled checks if a feature flag is enabled by reading an environment variable.
// It returns true if the variable is set to "true", otherwise it returns false.
func IsEnabled(flagName string) bool {
	return os.Getenv(flagName) == "true"
}
