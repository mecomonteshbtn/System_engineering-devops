# **Shell Basics**

## 0-current_working_directory: Where am I?

This script prints the absolute path name of the current working directory using *pwd* command.

##  1-listit: What's in there?

This script displays the contents list of your current directory using *ls* command.

## 2-bring_me_home: There is no place like home

The script changes the working directory to the user's home directory using *cd* command.

## 3-listfiles: The long format

Display current directory contents in a long format using *ls -l* command.

## 4-listmorefiles: Hidden files

Display current directory contents, including hidden files (starting with .). Use the long format using *ls -la* command.

## 5-listfilesdigitonly:  5. I love numbers mandatory

Display current directory contents using long format with user and group IDs, displayed numerically, and hidden files (starting with .) using *ls -la -n* command.

##  6-firstdirectory: Welcome holberton

A script that creates a directory named holberton in the /tmp/ directory using *mkdir* command.

##  7-movethatfile: Betty in Holberton

Move the file betty from /tmp/ to /tmp/holberton using *mv* command.

##  8-firstdelete: Bye bye Betty

Delete the file betty in /tmp/holberton directory using *rm* command.

##  9-firstdirdeletion: Bye bye Holberton

Delete the directory holberton that is in the /tmp directory using *rmdir* command.

##  10-back: Back to the future

Write a script that changes the working directory to the previous one using *cd -* commmand.

##  11-lists: Lists mandatory

A script that lists all files (even ones with names beginning with a period character, which are normally hidden) in the current directory and the parent of the working directory and the /boot directory (in this order), in long format using *ls -la . .. /boot* command.

##  12-file_type: File type

A script that prints the type of the file named iamafile. The file iamafile will be in the /tmp directory when we will run your script using *file* command.

##  13-symbolic_link: We are symbols, and inhabit symbols

Create a symbolic link to */bin/ls*, named *__ls__*. The symbolic link should be created in the current working directory using *ln -s* command.

##  14-copy_html: Copy HTML fies

A script that copies all the HTML files from the current working directory to the parent of the working directory, but only copy files that did not exist in the parent of the working directory or were newer than the versions in the parent of the working directory using *cp* command.

##  15-lets_move: Let's move

A script that moves all files beginning with an uppercase letter to the directory */tmp/u* using *mv* command.

##  16-clean_emacs: Clean Emacs mandatory

A script that deletes all files in the current working directory that end with the character *~* using *rm* command.

##  17-tree: Creating a tree

A script that creates the directories *welcome/*, *welcome/to/* and *welcome/to/holberton* in the current directory using *mkdir -p* command.

##  18-commas: Life is a series of commas, not periods

* Write a command that lists all the files and directories of the current directory, separated by commas (,).
* Directory names should end with a slash (/)
* Files and directories starting with a dot (.) should be listed
* The listing should be alpha ordered, except for the directories . and .. which should be listed at the very beginning
* Only digits and letters are used to sort; Digits should come first
* You can assume that all the files we will test with will have at least one letter or one digit
* The listing should end with a new line. 

All of the above requeriments using *ls* command.
