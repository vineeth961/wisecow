Problem 2 - Scripts

For Problem Statement 2, I selected the following two objectives:

System Health Monitoring Script (Bash)

Application Health Checker (Bash)

1. System Health Monitoring Script

Objective: Monitor CPU, memory, disk usage, and running processes. Send alerts if thresholds are exceeded.

Script:system_health.sh

Features:

Checks CPU, memory, and disk usage.

Prints a message to the console if any metric exceeds the defined threshold.

Displays the top 5 CPU-consuming processes.

Logs the output to system_health.log.

2. Application Health Checker Script

Objective: Check if an application is up or down by assessing HTTP status codes.

Script:app_healthcheck.sh

Features:

Sends a request to the application URL.

Prints Application is UP if HTTP status code is 200.

Prints Application is DOWN for other status codes or errors.

Logs the output to app_status.log.

OUTPUT:

Added the screenshot of the output in the scripts folder.

Application is UP
