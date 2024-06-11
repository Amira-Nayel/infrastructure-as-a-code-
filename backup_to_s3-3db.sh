#!/bin/bash
AWS_PROFILE=default
# Database credentials
USER="****"
PASS="****"
DB_NAME1="moodledb"
DB_NAME2="morphcast"
DB_NAME3="whole_proj"

# Backup path
BACKUP_PATH="/home/azureuser/backups/"
DATE=$(date +"%Y%m%d")

# AWS S3 bucket name
S3_BUCKET="insigth-learn-backup"

# Backup filenames
BACKUP_FILE1="$BACKUP_PATH$DB_NAME1-$DATE.sql"
BACKUP_FILE2="$BACKUP_PATH$DB_NAME2-$DATE.sql"
BACKUP_FILE3="$BACKUP_PATH$DB_NAME3-$DATE.sql"

# Create backups
mysqldump -u $USER -p$PASS $DB_NAME1 > $BACKUP_FILE1
mysqldump -u $USER -p$PASS $DB_NAME2 > $BACKUP_FILE2
mysqldump -u $USER -p$PASS $DB_NAME3 > $BACKUP_FILE3

# Check if mysqldump commands were successful and upload to S3
if [ $? -eq 0 ]; then
  echo "Database backup successful."

 
  # Upload backups to S3
  aws s3 cp $BACKUP_FILE1 s3://$S3_BUCKET/MoodleDB/
  aws s3 cp $BACKUP_FILE2 s3://$S3_BUCKET/Morphcast/ 
  aws s3 cp $BACKUP_FILE3 s3://$S3_BUCKET/whole_project/ 

  # Check if uploads were successful
  if [ $? -eq 0 ]; then
    echo "Upload to S3 successful."
    # Remove local backup files
    rm $BACKUP_FILE1
    rm $BACKUP_FILE2
    rm $BACKUP_FILE3
  else
    echo "Upload to S3 failed. Check your AWS settings and permissions."
  fi
else
  echo "Database backup failed. Check your database settings and permissions."
fi

