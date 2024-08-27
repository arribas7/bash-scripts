# Bash Scripts for System Maintenance
A collection of Bash scripts for system maintenance and automation.

-----------------------------------------------------------------------------------------------------------------------
handle_syslog.sh
-----------------------------------------------------------------------------------------------------------------------
## Backup and Cleanup Script
This script automates the backup of syslog files and ensures old logs are removed to prevent disk space issues.

### Usage
1. Place the script in your `/scripts/cron/` directory.
2. Ensure it has execute permissions: `chmod +x handle_syslog.sh`
3. Add it to your crontab to run at a desired interval.
   This schedule is set based on an understanding of the environment, where logs tend to accumulate during these periods.
   
```bash
0 4 * * 1,4 /scripts/cron/handle_syslog.sh

Modifying log rotation configurations can have broader impacts on the system and may require extensive testing and approvals.
By using this script, you can control exactly what gets deleted without affecting the system's existing configuration, making it a safer option for routine maintenance.
-----------------------------------------------------------------------------------------------------------------------
