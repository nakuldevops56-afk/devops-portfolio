#!/bin/bash

# Function to handle errors
check_status() {
    if [ "$1" -ne 0 ]; then
        echo "ERROR: $2 command failed!"
        exit 1
    fi
}

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

if [ "$DISK_USAGE" -ge 80 ]; then
    echo "WARNING: Disk usage is ${DISK_USAGE}% (threshold: 80%)"
else
    echo "Disk usage is normal: ${DISK_USAGE}%"
fi

echo ""
echo "=================================="
echo "       Health Check Complete"
echo "=================================="

