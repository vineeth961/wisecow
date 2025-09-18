#!/bin/bash

# system_health.sh
# Logs system health metrics and sends alerts if thresholds exceeded

LOG_FILE="system_health.log"
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# Function to log messages to console and log file
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Get CPU usage (idle subtracted from 100)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | \
            awk '{print 100 - $8}' | cut -d. -f1)

# Get Memory usage percentage
MEM_USAGE=$(free | grep Mem | awk '{printf("%d"), $3/$2 * 100}')

# Get Disk usage percentage of root partition
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

log "=== SYSTEM HEALTH CHECK ==="
log "CPU usage: $CPU_USAGE%"
log "Memory usage: $MEM_USAGE%"
log "Disk usage: $DISK_USAGE%"

# Check thresholds
[ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ] && log "ALERT: CPU usage above ${CPU_THRESHOLD}%!"
[ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ] && log "ALERT: Memory usage above ${MEM_THRESHOLD}%!"
[ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ] && log "ALERT: Disk usage above ${DISK_THRESHOLD}%!"

# Display top 5 CPU-consuming processes
log "Top 5 CPU-consuming processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6 | tee -a "$LOG_FILE"

log "=== END OF CHECK ==="

