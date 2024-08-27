
#!/bin/bash
# This script will remove rotated log files (syslog.*) to prevent filling up the /var filesystem

LOG_FILE="/example/path/scripts/cron/handle_syslog.log"
BACKUP_DIR="/example/path/backups/syslog"
CURRENT_DATE=$(date +"%Y%m%d%H%M")

cd /var/log/ || {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Error: Could not access /var/log/" >> $LOG_FILE
    exit 1
}

# Attempt to create the tar backup
if tar -czvfE "$BACKUP_DIR/syslog-$CURRENT_DATE.tar.gz" syslog.?; then
    sudo rm -f syslog.?
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Successfully deleted syslog files after backup" >> $LOG_FILE
else
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Error: Failed to create the backup" >> $LOG_FILE
    exit 1
fi

