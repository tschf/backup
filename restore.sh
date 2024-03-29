#!/bin/bash
set -e
# TODO: Relabel drive to BACKUP
backupFolder=/media/$USER/BACKUP
args='-vrut --delete --progress'

# Home

rsync $args_nodelete "$backupFolder/home/$USER/Pictures/" /home/trent/Pictures/
rsync $args "$backupFolder/home/$USER/Projects/" /home/trent/Projects/
rsync $args "$backupFolder/home/$USER/Documents/" /home/trent/Documents/
rsync $args "$backupFolder/home/$USER/Desktop/" /home/trent/Desktop/
rsync $args "$backupFolder/home/$USER/Downloads/" /home/trent/Downloads/
rsync $args_nodelete "$backupFolder/home/$USER/Financial Records/" /home/trent/Financial\ Records/
rsync $args "$backupFolder/home/$USER/.ssh" /home/trent/
rsync $args "$backupFolder/home/$USER/.oci" /home/trent/
rsync $args "$backupFolder/home/$USER/.vim" /home/trent/
rsync $args "$backupFolder/home/$USER/.fn" /home/trent/
rsync $args "$backupFolder/home/$USER/.gitignore" /home/trent/
rsync $args "$backupFolder/home/$USER/.sqlcl" /home/trent/
#rsync $args "$backupFolder/home/$USER/.sqldeveloper" /home/trent/.sqldeveloper/
rsync $args "$backupFolder/home/$USER/.gnupg" /home/trent/

# System

#rsync $args /etc/hosts "$backupFolder/etc/"
sudo rsync $args "$backupFolder/etc/gitconfig" /etc/

echo "DONE"
