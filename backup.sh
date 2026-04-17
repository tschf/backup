#!/bin/bash
set -e

backupPath="$1"

if [[ -z "$backupPath" ]]; then
  echo "Specify where the backup is going to. e.g ./backup.sh /mnt/argon/backup/$(hostname)" >&2
  exit 1
fi

echo "This backup script will backup your system to a specified path."
echo "Backup target specified as $backupPath"
read -n 1 -s -r -p "Press any key to continue..."

# --no-owner --no-group to handle NAS targets. They generally don't have the same
# user mappings, so we don't want to include this.
args='-rltv --no-owner --no-group --delete --progress'
args_nodelete='-rltv --no-owner --no-group --progress'

# Home
mkdir -p "$backupPath/$HOME"
rsync $args_nodelete /home/trent/Pictures/ "$backupPath/home/$USER/Pictures/" --exclude Screenshot*
rsync $args /home/trent/Projects/ "$backupPath/home/$USER/Projects/" --exclude "node_modules/" --exclude ".venv/"
rsync $args /home/trent/Documents/ "$backupPath/home/$USER/Documents/"
rsync $args /home/trent/Desktop/ "$backupPath/home/$USER/Desktop/"
rsync $args /home/trent/Downloads/ "$backupPath/home/$USER/Downloads/" --exclude "node_modules/"
rsync $args /home/trent/bin/ "$backupPath/home/$USER/bin/"

rsync $args /home/trent/.ssh/ "$backupPath/home/$USER/.ssh"
rsync $args /home/trent/.oci/ "$backupPath/home/$USER/.oci"
rsync $args /home/trent/.vim/ "$backupPath/home/$USER/.vim"
rsync $args /home/trent/.vimrc "$backupPath/home/$USER/"
rsync $args /home/trent/.bash_history "$backupPath/home/$USER/"
[ -d "$HOME/.fn" ] && rsync $args "$HOME/.fn/" "$backupPath/home/$USER/.fn"
rsync $args /home/trent/.gitignore "$backupPath/home/$USER/"
rsync $args /home/trent/.sqlcl/ "$backupPath/home/$USER/.sqlcl"
rsync $args /home/trent/.gnupg/ "$backupPath/home/$USER/.gnupg"

# System

mkdir -p $backupPath/etc
rsync $args /etc/hosts "$backupPath/etc/hosts$(hostname)"
rsync $args /etc/gitconfig "$backupPath/etc/"

echo "DONE"
