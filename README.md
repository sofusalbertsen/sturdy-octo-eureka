# Micronaut Application Demo

A demonstration project using Micronaut framework to build a simple web application with REST endpoints.

## Project Structure

- `app/` - The Micronaut application source code
- `component-test/` - Component tests using Python
- `performance-test/` - Performance tests using k6
- `ci/` - CI/CD scripts for building, testing, and deploying
- `.github/workflows/` - GitHub Actions workflow configuration

## Requirements

- Java 11+
- Gradle 5.3+ (or use the included Gradle wrapper)
- Docker (for building and running containers)
- Devbox (for development environment)

## Getting Started

### Using Devbox

This project uses Devbox for managing development dependencies. To set up:

1. Install Devbox following instructions at https://www.jetify.com/devbox/
2. Start a devbox shell:

```bash
devbox shell
```

### Without Devbox

If not using Devbox, ensure you have Java 11+ and Gradle 5.3+ installed on your system.

## Building the Application

```bash
cd app
./gradlew clean build
```

Or using the CI script:

```bash
./ci/build-app.sh
```

## Running Locally

```bash
cd app
./gradlew run
```

The application will start on port 8000 by default. You can access:
- Root endpoint: http://localhost:8000/
- Hello endpoint: http://localhost:8000/hello/{name}
- Status endpoint: http://localhost:8000/status

## Docker

### Building Docker Image

```bash
./ci/build-docker.sh
```

### Running with Docker

```bash
docker run -p 8000:8000 ghcr.io/YOUR_USERNAME/micronaut-app:latest
```

## Testing

### Unit Tests

```bash
./ci/unit-test-app.sh
```

### Component Tests

```bash
./ci/component-test.sh
```

### Performance Tests

```bash
./ci/performance-test.sh
```

## CI/CD Pipeline

This project includes a GitHub Actions workflow that:

1. Builds the application
2. Runs unit tests
3. Performs code linting
4. Builds a Docker image
5. Runs security scans with Trivy
6. Executes component tests
7. Runs performance tests

## API Endpoints

- `GET /` - Returns a simple HTML greeting
- `GET /hello/{name}` - Returns a personalized greeting
- `GET /status` - Returns the application status

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
