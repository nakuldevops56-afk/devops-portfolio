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
├── README.md
└── health_check.sh.bak
```

## Future Improvements

- Email notifications
- Automated health checks using Cron
- Jenkins pipeline integration
- Monitoring multiple filesystems

