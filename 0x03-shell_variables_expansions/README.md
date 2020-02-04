# **Shell, init files, variables and expansions**

## General

What happens when you type *$ ls -l *.txt*.

## Shell Initialization Files

What are the */etc/profile* file and the */etc/profile.d* directory
What is the *~/.bashrc* file

## Variables

* What is the difference between a local and a global variable
* What is a reserved variable
* How to create, update and delete shell variables
* What are the roles of the following reserved variables: *HOME, PATH, PS1*
* What are special parameters
* What is the special parameter *$*??

## Expansions

* What is expansion and how to use them
* What is the difference between single and double quotes and how to use them properly
* How to do command substitution with *$()* and backticks

## Shell Arithmetic

* How to perform arithmetic operations with the shell

## The alias Command

* How to create an *alias*
* How to list *aliases*
* How to temporarily disable an *alias*

## Other help pages

* How to execute commands from a file in the current shell

## 0-alias: <o> 

A script that creates an alias with *Name: ls* *Value: rm \** using *alias ls="rm \*"*.
                
## 1-hello_you: Hello you 

Create a script that prints *hello user*, where user is the current Linux user using *echo "hello $USER"*.

## 2-path: The path to success is to take massive, determined action 

Add ]*/action* to the *PATH*. */action* should be the last directory the shell looks into when looking for a program using *export PATH=$PATH:/action*.

## 3-paths: If the path be beautiful, let us not ask where it leads

Create a script that counts the number of directories in the *PATH* using *echo $PATH | tr ':' '\n' | wc -l*.              

## 4-global_variables: Global variables

Create a script that lists environment variables using *echo $PATH | tr ':' '\n' | wc -l*.

## 5-local_variables: Local variables 

Create a script that lists all local variables and environment variables, and functions using *env*.

## 6-create_local_variable: Local variable 

Create a script that creates a new local variable with *Name: BETTY Value: Holberton* using export *BETTY="Holberton"*.

## 7-create_global_variable: Global variable 

Create a script that creates a new global variable *Name: HOLBERTON Value: Betty* using *export HOLBERTON=Betty*.

## 8-true_knowledge: Every addition to true knowledge is an addition to human power 

Write a script that prints the result of the addition of 128 with the value stored in the environment variable *TRUEKNOWLEDGE*, followed by a new line using 
*export TRUEKNOWLEDGE=1209*
*echo $(($TRUEKNOWLEDGE+128)) or ./8-true_knowledge | cat -e*.

## 9-divide_and_rule: Divide and rule 

Write a script that prints the result of *POWER* divided by *DIVIDE*, followed by a new line. *POWER* and *DIVIDE* are environment variables using *export POWER=42784*
*export DIVIDE=32*
*echo $(($POWER/$DIVIDE)) | cat -e    or    ./9-divide_and_rule | cat -e*

## 10-love_exponent_breath: Love is anterior to life, posterior to death, initial of creation, and the exponent of breath 

Write a script that displays the result of *BREATH* to the power *LOVE*. *BREATH* and *LOVE* are environment variables and the script should display the result, followed by a new line using 
*export BREATH=4*
*export LOVE=3*
*echo $(($BREATH**$LOVE))      or     ./10-love_exponent_breath*

## 11-binary_to_decimal: There are 10 types of people in the world -- Those who understand binary, and those who don't 

Write a script that converts a number from base 2 to base 10. The number in base 2 is stored in the environment variable *BINARY*. The script should display the number in base 10, followed by a new line using 
*export BINARY=10100111001*
*echo "$((2#$BINARY))"     or     ./11-binary_to_decimal*

## 12-combinations:  Combination 

Create a script that prints all possible combinations of two letters, except *oo*. Letters are lower cases, from a to z; One combination per line; The output should be *alpha* ordered, starting with *aa*; Do not print *oo*; Your script file should contain maximum 64 characters using *echo {a..z}{a..z} | tr ' ' '\n' | grep -v 'oo'    or     ./12-combinations | wc -l*.

## 13-print_float: Floats 

Write a script that prints a number with two decimal places. The number will be stored in the environment variable *NUM* using 
*export NUM=98*
*printf "%0.2f\n" $NUM     or    ./13-print_float*.

## 14-decimal_to_hexadecimal: Decimal to Hexadecimal 

Write a script that converts a number from base 10 to base 16. The number in base 10 is stored in the environment variable *DECIMAL*. The script should display the number in base 16, followed by a new line using 
*export DECIMAL=16*
*    or    ./14-decimal_to_hexadecimal*

## 100-rot13: Everyone is a proponent of strong encryption 

Write a script that encodes and decodes text using the *rot13* encryption. Assume ASCII.
*cat quote*
*"Everyone is a proponent of strong encryption."*
*- Dorothy E. Denning*
*tr 'A-Za-z' 'N-ZA-Mn-za-m'   or    ./100-rot13 < quote*


*"Rirelbar vf n cebcbarag bs fgebat rapelcgvba."*
*- Qbebgul R. Qraavat*
