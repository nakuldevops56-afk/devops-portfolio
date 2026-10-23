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

echo ""
echo "=================================="
echo "       Health Check Complete"
echo "=================================="

