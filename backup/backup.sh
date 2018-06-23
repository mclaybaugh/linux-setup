#!/bin/bash
# Syncing files in ~/Backup/ to digital ocean droplet
#	Options used:
#		r -> recursive
#		v -> verbose ~/Backup/ -> copy CONTENTS of Backup 
#		--exclude 'node_modules' -> excludes all node_module directories to avoid backing that crap up

check_file_status () {
#	echo "Checking local files..."
#	rsync --list-only --recursive --verbose \
#		--exclude-from='./exclude.txt' ~/Backup/ \
#		> temp1 
#
#	echo "Checking remote files..."
#	rsync --list-only --recursive --verbose \
#		--exclude-from='./exclude.txt' michael@michaelclaybaugh.com:~/Backup/ \
#		> temp2
#
#	echo "Checking difference..."
#	diff temp1 temp2

	rsync --recursive --verbose --update --dry-run \
		--exclude-from='exclude.txt' \
		~/Backup/ \
		michael@michaelclaybaugh.com:~/Backup/
}

backup_files () {
	rsync --recursive --verbose \
		--exclude-from='exclude.txt' \
		~/Backup/ \
		michael@michaelclaybaugh.com:~/Backup/
}

#check_file_status
backup_files
