# 0x06. Regular expression

## Resources:books:
Read or watch:
* [Regular expressions - info](http://www.regular-expressions.info/)
* [Regular expressions - basics](https://intranet.hbtn.io/rltoken/SJ2eQ7V2iQlCgLc-L96zWg)
* [Regular expressions - advanced](https://intranet.hbtn.io/rltoken/qyjWL-J1_qUaZGR690gH1Q)
* [Rubular is your best friend](https://intranet.hbtn.io/rltoken/WCjn8NgohbQ5NGXEObWZvQ)
* [Use a regular expression against a problem: now you have 2 problems](https://intranet.hbtn.io/rltoken/Zfvv_ydOCvJ_YaBB6eDqVw)
* [Learn Regular Expressions with simple, interactive exercises](https://intranet.hbtn.io/rltoken/Y-OVGcJ5cskdXWIBowiE_A)

---
## Learning Objectives:bulb:
For this project, you have to build your regular expression using Oniguruma, a regular expression library that which is used by Ruby by default. Note that other regular expression libraries sometimes have different properties.

Because the focus of this exercise is to play with regular expressions (regex), here is the Ruby code that you should use, just replace the regexp part, meaning the code in between the //:

```
#!/usr/bin/env ruby
puts ARGV[0].scan(/127.0.0.[0-9]/).join
```
---

### [0. Simply matching Holberton](./0-simply_match_holberton.rb)
* Requirements:

*    The regular expression must match Holberton
*    Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method

### [1. Repetition Token #0](./1-repetition_token_0.rb)
* Requirements:

*    Find the regular expression that will match the above cases
*    Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method

### [2. Repetition Token #1](./2-repetition_token_1.rb)
* Requirements:

*    Find the regular expression that will match the above cases
*    Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method

### [3. Repetition Token #2](./3-repetition_token_2.rb)
* Requirements:

*    Find the regular expression that will match the above cases
*    Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method

### [4. Repetition Token #3](./4-repetition_token_3.rb)
* Requirements:

*    Find the regular expression that will match the above cases
*    Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method

### [5. Not quite HBTN yet](./5-beginning_and_end.rb)
* Requirements:

*    The regular expression must be exactly matching a string that starts with h ends with n and can have any single character in between
*    Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method

### [6. Call me maybe](./6-phone_number.rb)
* This task is brought to you by Holberton mentor Neha Jain, Senior Software Engineer at LinkedIn.

* Requirement:
*    The regular expression must match a 10 digit phone number

### [7. OMG WHY ARE YOU SHOUTING?](./7-OMG_WHY_ARE_YOU_SHOUTING.rb)
* Requirement:
*    The regular expression must be only matching: capital letters

### [8. Textme](./100-textme.rb)
* This exercise was prepared for you by Guillaume Plessis, VP of Infrastructure at TextMe. It is something he uses daily. You can thank Guillaume for his project on Twitter.

For this task, you’ll be taking over Guillaume’s responsibilities: one afternoon, a TextMe VoIP Engineer comes to you and explains she wants to run some statistics on the TextMe app text messages transactions.

* Requirements:

*    Your script should output: [SENDER],[RECEIVER],[FLAGS]
*        The sender phone number or name (including country code if present)
*        The receiver phone number or name (including country code if present)
*        The flags that were used

You can find a log file here.

Example:
```
$ ./100-textme.rb 'Feb 1 11:00:00 ip-10-0-0-11 mdr: 2016-02-01 11:00:00 Receive SMS [SMSC:SYBASE1] [SVC:] [ACT:] [BINF:] [FID:] [from:Google] [to:+16474951758] [flags:-1:0:-1:0:-1] [msg:127:This planet has - or rather had - a problem, which was this: most of the people on it were unhappy for pretty much of the time.] [udh:0:]'
Google,+16474951758,-1:0:-1:0:-1
$
$
$ ./100-textme.rb 'Feb 1 11:00:00 ip-10-0-64-10 mdr: 2016-02-01 11:00:00 Receive SMS [SMSC:SYBASE2] [SVC:] [ACT:] [BINF:] [FID:] [from:+17272713208] [to:+19172319348] [flags:-1:0:-1:0:-1] [msg:136:Orbiting this at a distance of roughly ninety-two million miles is an utterly insignificant little blue green planet whose ape-descended] [udh:0:]'
+17272713208,+19172319348,-1:0:-1:0:-1
$
$ ./100-textme.rb 'Feb 1 11:00:00 ip-10-0-64-11 mdr: 2016-02-01 11:00:00 Sent SMS [SMSC:SYBASE1] [SVC:backendtextme] [ACT:] [BINF:] [FID:] [from:18572406905] [to:14022180266] [flags:-1:0:-1:-1:-1] [msg:136:Far out in the uncharted backwaters of the unfashionable end of the western spiral arm of the Galaxy lies a small unregarded yellow sun.] [udh:0:]'
18572406905,14022180266,-1:0:-1:-1:-1
$
$
$ ./100-textme.rb 'Feb 1 11:00:00 ip-10-0-64-11 mdr: 2016-02-01 11:00:00 Sent SMS [SMSC:SYBASE1] [SVC:backendtextme] [ACT:] [BINF:] [FID:] [from:12392190384] [to:19148265919] [flags:-1:0:-1:-1:-1] [msg:99:life forms are so amazingly primitive that they still think digital watches are a pretty neat idea.] [udh:0:]'
12392190384,19148265919,-1:0:-1:-1:-1
$
```
### [9. Pass LinkedIn technical interview level0](./101-passed_linkedin_regex_challenge.jpg)
* One way to get started in getting a Software Engineering job at LinkedIn is to solve their regex puzzle.

* Requirements:
*    Solve LinkedIn regex puzzle: [https://engineering.linkedin.com/puzzle](https://engineering.linkedin.com/puzzle)
*    Provide as an answer file a screenshot of the “Congratulations” screen with the date and time of completion

---

## Author
* **Robinson Montes** - [mecomonteshbtn](https://github.com/mecomonteshbtn)
