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

#check_file_status
#backup_files
