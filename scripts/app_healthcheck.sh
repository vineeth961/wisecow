#!/bin/bash

# URL of the application
APP_URL="http://127.0.0.1:4499"

# Log file
LOG_FILE="app_status.log"

# Get HTTP status code
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $APP_URL)

# Current timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Determine app status based on HTTP code
if [[ "$STATUS_CODE" -ge 200 && "$STATUS_CODE" -lt 300 ]]; then
    echo "$TIMESTAMP - Application is UP (HTTP $STATUS_CODE)" | tee -a $LOG_FILE
else
    echo "$TIMESTAMP - ALERT! Application is DOWN (HTTP $STATUS_CODE)" | tee -a $LOG_FILE
fi

