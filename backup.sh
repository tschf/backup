#!/bin/bash
set -e
# TODO: Relabel drive to BACKUP
backupFolder=/media/$USER/TOSHIBA\ EXT/Backup
args='-vru --delete'

rsync $args /home/trent/Pictures/ "$backupFolder/home/$USER/Pictures/" --exclude Screenshot*
rsync $args /home/trent/Projects/ "$backupFolder/home/$USER/Projects/" --exclude ".svn/*"
rsync $args /home/trent/Documents/ "$backupFolder/home/$USER/Documents/"
rsync $args /home/trent/Desktop/ "$backupFolder/home/$USER/Desktop/"
rsync $args /home/trent/Downloads/ "$backupFolder/home/$USER/Downloads/"

echo "DONE"
