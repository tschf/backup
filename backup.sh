#!/bin/bash
set -e
# TODO: Relabel drive to BACKUP
backupFolder=/media/$USER/BACKUP
args='-vrut --delete --progress'
args_nodelete='-vrut --progress'

# Home
mkdir -p $backupFolder/$HOME
rsync $args_nodelete /home/trent/Pictures/ "$backupFolder/home/$USER/Pictures/" --exclude Screenshot*
rsync $args /home/trent/Projects/ "$backupFolder/home/$USER/Projects/" --exclude "node_modules"
rsync $args /home/trent/Documents/ "$backupFolder/home/$USER/Documents/"
rsync $args /home/trent/Desktop/ "$backupFolder/home/$USER/Desktop/"
rsync $args /home/trent/Downloads/ "$backupFolder/home/$USER/Downloads/"
rsync $args_nodelete /home/trent/Financial\ Records/ "$backupFolder/home/$USER/Financial Records/"
rsync $args /home/trent/bin/ "$backupFolder/home/$USER/bin/"

rsync $args /home/trent/.ssh/ "$backupFolder/home/$USER/.ssh"
rsync $args /home/trent/.oci/ "$backupFolder/home/$USER/.oci"
rsync $args /home/trent/.vim/ "$backupFolder/home/$USER/.vim"
rsync $args /home/trent/.vimrc "$backupFolder/home/$USER/"
rsync $args /home/trent/.bash_history "$backupFolder/home/$USER/"
rsync $args /home/trent/.fn/ "$backupFolder/home/$USER/.fn"
rsync $args /home/trent/.gitignore "$backupFolder/home/$USER/"
rsync $args /home/trent/.sqlcl/ "$backupFolder/home/$USER/.sqlcl"
rsync $args /home/trent/.sqldeveloper/ "$backupFolder/home/$USER/.sqldeveloper"
rsync $args /home/trent/.gnupg/ "$backupFolder/home/$USER/.gnupg"

# System

mkdir -p $backupFolder/etc
rsync $args /etc/hosts "$backupFolder/etc/hosts$(hostname)"
rsync $args /etc/gitconfig "$backupFolder/etc/"

echo "DONE"
