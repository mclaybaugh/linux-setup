#!/usr/local/bin/python3
# journal.py -- will auto generate log files
#
# Check if today's file already exists:
#    exists -> message and exit
#    otherwise -> prompt for title

import os
import datetime

# returns array of strings
def working_directory_files():
    return [file.name for file in os.scandir() if file.is_file()]

today = datetime.datetime.now()
date = today.strftime('%Y-%m-%d')
matching = [name for name in working_directory_files() if date in name]

if len(matching) > 0:
    print('Existing files found:')
    for f in matching:
        print(f)
else:
    title = input("Enter Title [journal]: ")
    if title == '':
        title = 'journal'
    with open(f'{date}_{title}.md', 'w') as f:
        f.write(f'# {title}')
