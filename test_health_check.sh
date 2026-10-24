#!/bin/bash

SCRIPT="./health_check.sh"

echo "Starting Health Check Tests"

# Test 1: Valid input and syntax
if bash -n "$SCRIPT"; then
    echo "PASS: Syntax validation"
else
    echo "FAIL: Syntax validation"
    exit 1
fi

# Test 2: Invalid disk threshold
"$SCRIPT" abc 80 >/dev/null 2>&1
if [ $? -eq 1 ]; then
    echo "PASS: Invalid disk threshold"
else
    echo "FAIL: Invalid disk threshold"
    exit 1
fi

# Test 3: Invalid CPU threshold
"$SCRIPT" 80 101 >/dev/null 2>&1
if [ $? -eq 1 ]; then
    echo "PASS: Invalid CPU threshold"
else
    echo "FAIL: Invalid CPU threshold"
    exit 1
fi

echo "All tests completed."
