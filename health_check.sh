
#!/bin/bash

# Linux Server Health Check
# Usage: ./health_check.sh [disk_threshold] [cpu_threshold]

check_status() {
    if [ "$1" -ne 0 ]; then
        echo "ERROR: $2 command failed!"
        exit 1
    fi
}

validate_threshold() {
    if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 1 ] || [ "$1" -gt 100 ]; then
        echo "ERROR: Threshold must be a number between 1 and 100."
        exit 1
    fi
}

DISK_THRESHOLD=${1:-80}
CPU_THRESHOLD=${2:-80}

validate_threshold "$DISK_THRESHOLD"
validate_threshold "$CPU_THRESHOLD"

STATUS=0

echo "=================================="
echo "      Linux Server Health Check"
echo "=================================="

echo ""
echo "1. Server Hostname:"
hostname
check_status $? "hostname"

echo ""
echo "2. Current Date and Time:"
date
check_status $? "date"

echo ""
echo "3. System Uptime:"
uptime
check_status $? "uptime"

echo ""
echo "4. Memory Usage:"
free -h
check_status $? "free"

echo ""
echo "5. Disk Usage:"
df -h /
check_status $? "df"

DISK_USAGE=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "WARNING: Disk usage is ${DISK_USAGE}% (threshold: ${DISK_THRESHOLD}%)"
    STATUS=1
else
    echo "Disk usage is normal: ${DISK_USAGE}%"
fi

echo ""
echo "6. CPU Usage:"

read -r cpu user nice system idle iowait irq softirq steal _ < /proc/stat
TOTAL1=$((user + nice + system + idle + iowait + irq + softirq + steal))
IDLE1=$((idle + iowait))

sleep 1

read -r cpu user nice system idle iowait irq softirq steal _ < /proc/stat
TOTAL2=$((user + nice + system + idle + iowait + irq + softirq + steal))
IDLE2=$((idle + iowait))

TOTAL_DIFF=$((TOTAL2 - TOTAL1))
IDLE_DIFF=$((IDLE2 - IDLE1))

CPU_USAGE=$(awk -v total="$TOTAL_DIFF" -v idle="$IDLE_DIFF" \
    'BEGIN { if (total > 0) printf "%.0f", (total-idle)*100/total; else print 0 }')

echo "CPU usage: ${CPU_USAGE}%"

if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
    echo "WARNING: CPU usage is ${CPU_USAGE}% (threshold: ${CPU_THRESHOLD}%)"
    STATUS=1
else
    echo "CPU usage is normal."
fi

echo ""
echo "=================================="

if [ "$STATUS" -eq 0 ]; then
    echo "       Health Check PASSED"
else
    echo "       Health Check WARNING"
fi

echo "=================================="

exit "$STATUS"
