#!/bin/bash

echo "=================================="
echo "      Linux Server Health Check"
echo "=================================="

echo ""
echo "1. Server Hostname:"
hostname

echo ""
echo "2. Current Date and Time:"
date

echo ""
echo "3. System Uptime:"
uptime

echo ""
echo "4. Memory Usage:"
free -h

echo ""
echo "5. Disk Usage:"
df -h /

echo ""
echo "=================================="
echo "       Health Check Complete"
echo "=================================="
