# Syncing files in ~/Backup/ to digital ocean droplet
#	Options used:
#		r -> recursive
#		v -> verbose ~/Backup/ -> copy CONTENTS of Backup 
#		--exclude 'node_modules' -> excludes all node_module directories to avoid backing that crap up

rsync -rv --exclude 'node_modules' ~/Backup/ michael@michaelclaybaugh.com:~/Backup/
