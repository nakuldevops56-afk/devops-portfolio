# Linux Server Health Check

## Project Overview

A Linux Server Health Check tool built using Bash scripting. It monitors important Linux system metrics and identifies potential resource usage issues.

## Features

- Displays server hostname
- Shows current date and time
- Reports system uptime
- Monitors memory usage
- Monitors root filesystem disk usage
- Measures CPU usage
- Supports configurable CPU and disk usage thresholds
- Validates user input
- Returns appropriate exit codes for automation
- Supports report logging

## Technologies Used

- Linux
- Bash Scripting
- Git
- GitHub
- Docker
- GitHub Actions
- Jenkins
- CI/CD

## Requirements

- Linux operating system
- Bash shell
- Standard Linux utilities
- `awk`

## Installation

Clone the repository:

```bash
git clone https://github.com/nakuldevops56-afk/devops-portfolio.git
```

Navigate to the project directory:

```bash
cd devops-portfolio
```

Make the script executable:

```bash
chmod +x health_check.sh
```

## Usage

Run with default thresholds (80% disk and 80% CPU):

```bash
./health_check.sh
```

Run with custom thresholds:

```bash
./health_check.sh 90 80
```

Arguments:

- First argument: Disk usage threshold (default: 80%)
- Second argument: CPU usage threshold (default: 80%)

## Generate Health Check Log

Save the health check report to a log file:

```bash
./health_check.sh 95 100 > health_check.log 2>&1
```

View the report:

```bash
cat health_check.log
```

## Exit Codes

| Exit Code | Description |
|---|---|
| 0 | Health check passed |
| 1 | Threshold exceeded or invalid input |

## Project Structure

```text
devops-portfolio/
├── health_check.sh
└── README.md
```

## Future Improvements

- Email notifications
- Automated health checks using Cron
- Jenkins pipeline integration
- Monitoring multiple filesystems


## Docker Usage

The Linux Health Check script is also available as a Docker image.

### Pull Docker Image

```bash
docker pull nakul2047/linux-health-check:latest
```

### Run Docker Container

```bash
docker run --rm nakul2047/linux-health-check:latest 100 100
```

### Custom Thresholds

```bash
docker run --rm nakul2047/linux-health-check:latest 90 80
```

- First argument: Disk usage threshold
- Second argument: CPU usage threshold

Docker Hub Image: https://hub.docker.com/r/nakul2047/linux-health-check

## CI/CD Pipeline

This project uses GitHub Actions to automate the CI/CD process.

On every push to the `main` branch, the workflow:

1. Checks out the source code.
2. Validates Bash script syntax.
3. Runs automated tests.
4. Executes the health check script.
5. Builds the Docker image.
6. Pushes the Docker image to Docker Hub.

Workflow file: `.github/workflows/health-check.yml`

## Project Structure

```text
devops-portfolio/
├── .github/
│   └── workflows/
│       └── health-check.yml
├── Dockerfile
├── Jenkinsfile
├── health_check.sh
├── test_health_check.sh
├── README.md
└── .gitignore
```

## Author

DevOps Portfolio Project
