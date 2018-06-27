#!/bin/bash
# Syncing files in ~/Backup/ to personal server

check_file_status () {
	rsync --recursive --verbose --update --dry-run --human-readable \
		--exclude-from='exclude.txt' \
		~/Backup/ \
		michael@michaelclaybaugh.com:~/Backup/
}

backup_files () {
	rsync --recursive --verbose --human-readable \
		--exclude-from='exclude.txt' \
		~/Backup/ \
		michael@michaelclaybaugh.com:~/Backup/
}

read -p "Check status? [y/n]: " check
if [ "$check" == "y" ]; then
		check_file_status
fi

read -p "Backup files? [y/n]: " backup
if [ "$backup" == "y" ]; then
	backup_files
fi