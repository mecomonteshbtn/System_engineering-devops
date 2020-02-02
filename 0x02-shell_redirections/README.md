# **Shell, I/O Redirections and filters**
## Shell, I/O Redirection

* What do the commands *head, tail, find, wc, sort, uniq, grep, tr* do
* How to redirect standard output to a file
* How to get standard input from a file instead of the keyboard
* How to send the output from one program to the input of another program
* How to combine commands and filters with redirections

## Special Characters

* What are special characters
* Understand what do the *white spaces, single quotes, double quotes, backslash, comment, pipe, command separator, tilde* and how and when to use them

## Other Man Pages

* How to display a line of text
* How to concatenate files and print on the standard output
* How to reverse a string
* How to remove sections from each line of files
* What is the */etc/passwd* file and what is its format
* What is the */etc/shadow* file and what is its format

## 0-hello_world: Hello World

A script that prints *“Hello, World”*, followed by a new line to the standard output using *echo Hello, World*.

## 1-confused_smiley: Confused smiley

A script that displays a confused smiley using *echo \"\(Ôo\)\'*.

## 2-hellofile: Let's display a file 

Display the content of the */etc/passwd* file using *cat /etc/passwd*.

## 3-twofiles: What about 2? 

Display the content of */etc/passwd* and */etc/hosts* using *cat /etc/passwd /etc/hosts*.

## 4-lastlines: Last lines of a file

Display the last 10 lines of */etc/passwd* using *tail /etc/passwd*.

## 5-firstlines: I'd prefer the first ones actually

Display the first 10 lines of /etc/passwd using *head /etc/passwd*.

## 6-third_line: Line #2

A script that displays the third line of the file iacta using *head -n 3 iacta | tail -n 1*.

## 7-file: It is a good file that cuts iron without making a noise 

A shell script that creates a file named exactly *\*\\'"Holberton School"\'\\*$\?\*\*\*\*\*:)* containing the text Holberton School using *echo " Holberton School" > \\\*\\\\\'\"Holberton\ School\"\\\'\\\\\*\$\\\?\\\*\\\*\\\*\\\*\\\*\:\)*.

## 8-cwd_state: Save current state of directory

A script that writes into the file *ls_cwd_content* the result of the command *ls -la*. If the file *ls_cwd_content* already exists, it should be overwritten. If the file *ls_cwd_content* does not exist, create it using *ls -la > ls_cwd_content*.

## 9-duplicate_last_line: Duplicate last line

A script that duplicates the last line of the file *iacta* using *tail -n 1 iacta >> iacta*.

## 10-no_more_js: No more javascript

A script that deletes all the regular files (not the directories) with a .js extension that are present in the current directory and all its subfolders using *find . -type f -name "*.js" -delete*.


## 11-directories: Don't just count your directories, make your directories count

A script that counts the number of directories and sub-directories in the current directory.

* The current and parent directories should not be taken into account
* Hidden directories should be counted

using *find . -mindepth 1 -type d | wc -l*

## 12-newest_files: What’s new 

Create a script that displays the 10 newest files in the current directory: One file per line and sorted from the newest to the oldest using *ls -t | head
*

## 13-unique: Being unique is better than being perfect

A script that takes a list of words as input and prints only words that appear exactly once: Input format: One line, one word; Output format: One line, one word; Words should be sorted using *cat list | sort | uniq -u or cat list | ./13-unique*.

## 14-findthatword: It must be in that file 

Display lines containing the pattern *“root”* from the file */etc/passwd* using *grep root /etc/passwd*.

## 15-countthatword: Count that word 

Display the number of lines that contain the pattern *“bin”* in the file */etc/passwd* using *grep -c bin /etc/passwd*.

## 16-whatsnext: What's next?

Display lines containing the pattern *“root”* and 3 lines after them in the file */etc/passwd* using *grep -A3 root /etc/passwd*.

## 17-hidethisword: I hate bins

Display all the lines in the file */etc/passwd* that do not contain the pattern *“bin”* using *grep -w -v "bin" /etc/passwd*.

## 18-letteronly: Letters only please

Display all lines of the file */etc/ssh/sshd_config* starting with a letter, include capital letters as well using *grep '^[(A-Za-z)]' /etc/passwd*.

## 19-AZ: A to Z

Replace all characters A and c from input to Z and e respectively using *echo 'Replace all characters `A` and `c` from input to `Z` and `e`.' | ./19-AZ or echo 'Replace all characters `A` and `c` from input to `Z` and `e`.' | tr 'Ac' 'Ze'*.

## 20-hiago: Without C, you would live in hiago

Removes all letters c and C from input using *echo Chicago | ./20-hiago or echo Chicago | tr -d 'Cc'*.

## 21-reverse: esreveR

A script that reverse its input using *rev*.

## 22-users_and_homes: DJ Cut Killer

A script that displays all users and their home directories, sorted by users using *grep / /etc/passwd | sort*.

## 100-empty_casks: Empty casks make the most noise

Command that finds all empty files and directories in the current directory and all sub-directories: Only the names of the files and directories, should be displayed (not the entire path), Hidden files should be listed, One file name per line, The listing should end with a new line using *find ./ -type f -empty*.

## 101-gifs: A gif is worth ten thousand words 

A script that lists all the files with a .gif extension in the current directory and all its sub-directories: Hidden files should be listed, Only regular files (not directories) should be listed, The names of the files should be displayed without their extensions, The files should be sorted by byte values, but case-insensitive (file aaa should be listed before file bbb, file .b should be listed before file a, and file Rona should be listed after file jay), One file name per line, The listing should end with a new line using *find . -type f -name "*.gif" | sort -f*.

## 102-acrostic: Acrostic 

An acrostic is a poem (or other form of writing) in which the first letter (or syllable, or word) of each line (or paragraph, or other recurring feature in the text) spells out a word, message or the alphabet. The word comes from the French acrostiche from post-classical Latin acrostichis). As a form of constrained writing, an acrostic can be used as a mnemonic device to aid memory retrieval. 

A script that decodes acrostics that use the first letter of each line using *cut -c-1 | tr -d '\n'*.

## 103-the_biggest_fan: The biggest fan 

Write a script that parses web servers logs in TSV format as input and displays the 11 hosts or IP addresses which did the most requests. Order by number of requests, most active host or IP at the top using * *.
