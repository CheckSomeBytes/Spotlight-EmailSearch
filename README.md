# Spotlight-EmailSearch

These script were written to quickly pull in PST/OST files from mounted disk images and quickly search through them to find search terms. The upside is you don't have to pull the entire contents of the inboxes onto the analysis box.   

## import_pst_ost.sh
Purpose: This script checks all user folders on mounted Windows drives and pulls a list of the PST/OST filepaths. 

Output: Single text file with a list of filepaths of PST/OST files on mounted drives.

## spotlight.sh
Purpose: Searches contents of emails AND filenames of attachements for a user provided search term.  

Output: 
1. A text file listing all of the email subject lines and filenames where the search term was found.  
2. A directory containting the emails and attachemnt files that contain the search term. 

## f_spotlight.sh
Purpose: Searches contents of emails AND filenames of attachements for search terms listed in a **user provided wordlist**.  

Output: 
1. Multiple text files listing all of the email subject lines and filenames that matched the terms provided in the wordlist.  
2. A directory for each search term containting the emails and attachemnt files that contain the search term. 

