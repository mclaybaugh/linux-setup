#!/usr/local/bin/python3
# journal.py -- will auto generate log files

import os
import datetime

def main():
    """
    If journal file already exists, print filenames and exit. Otherwise,
    prompt for title and create journal file
    """
    today = datetime.datetime.now()
    date = today.strftime('%Y-%m-%d')
    matching = [name for name in working_directory_files() if date in name]

    if matching:
        print('Existing files found:')
        for name in matching:
            print(name)
    else:
        title = input('Enter Title [journal]: ')
        if title == '':
            title = 'journal'
        with open(f'{date}_{title}.md', 'w') as file:
            file.write(f'# {title}')

def working_directory_files():
    """Get list of file names in current working directory"""
    return [file.name for file in os.scandir() if file.is_file()]

main()
