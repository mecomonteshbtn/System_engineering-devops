# 0x0A Configuration management

## Background Context

When I was working for SlideShare, I worked on an auto-remediation tool called [Skynet](https://engineering.linkedin.com/slideshare/skynet-project-_-monitor-scale-and-auto-heal-system-cloud) that monitored, scaled and fixed Cloud infrastructure. I was using a parallel job-execution system called MCollective that allowed me to execute commands to one or multiple servers at the same time. I could apply an action to a selected set of servers by applying a filter such as the server’s hostname or any other metadata we had (server type, server environment…). At some point, a bug was present in my code that sent nil to the filter method.

There were 2 pieces of bad news:

1.    When MCollective receives nil as an argument for its filter method, it takes this to mean ‘all servers’
2.    The action I sent was to terminate the selected servers

I started the parallel job-execution and after some time, I realized that it was taking longer than expected. Looking at logs I realized that I was shutting down SlideShare’s entire document conversion environment. Actually, 75% of all our conversion infrastructure servers had been shut down, resulting in users not able to convert their PDFs, powerpoints, and videos… Pretty bad!

Thanks to Puppet, we were able to restore our infrastructure to normal operation in under 1H, pretty impressive. Imagine if we had to do everything manually: launching the servers, configuring and linking them, importing application code, starting every process, and obviously, fixing all the bugs (you should know by now that complicated infrastructure always goes sideways)…

Obviously writing Puppet code for your infrastructure requires an investment of time and energy, but in the long term, it is for sure a must-have.

That was me [^_^‘:](https://twitter.com/devopsreact/status/836971570136375296)

## Resources:books:
Read or watch:
* [Intro to Configuration Management](https://intranet.hbtn.io/rltoken/r-NmkYO8bxIKp2qEx2ZjKQ)
* [Puppet resource type: file](https://intranet.hbtn.io/rltoken/fuhnsI9_1_F4GrHwGT3GxA)
* [Puppet’s Declarative Language: Modeling Instead of Scripting](https://intranet.hbtn.io/rltoken/Fqmb5rnChQgYAypvKoTxAQ)
* [Puppet lint](https://intranet.hbtn.io/rltoken/oezu0m_hJ8nEVA6a9o17Tw)
* [Puppet emacs mode](https://intranet.hbtn.io/rltoken/N70cVw8mG3707He-OxjP1w)

---
## Learning Objectives:bulb:

*    All your files will be interpreted on Ubuntu 14.04 LTS
*    All your files should end with a new line
*    A README.md file at the root of the folder of the project is mandatory
*    Your Puppet manifests must pass puppet-lint version 2.1.1 without any errors
*    Your Puppet manifests must run without error
*    Your Puppet manifests first line must be a comment explaining what the Puppet manifest is about
*    Your Puppet manifests files must end with the extension .pp

---
## Note on Versioning

Your Ubuntu 14.04 VM should have Puppet 3.4 preinstalled.

You do not need to attempt to upgrade versions. This project is simply a set of tasks to familiarize you with the basic level syntax which is virtually identical in newer versions of Puppet.

The linked documentation is to Puppet 3.8 because the 3.4 documentation has been archived and is therefore more challenging to navigate. If you would like to upgrade anyway, click here (this will not affect how your code is checked). Puppet 5 Docs

Install puppet-lint
```
$ apt-get install -y ruby
$ gem install puppet-lint -v 2.1.1
```
---

### [0. Create a file](./0-create_a_file.pp)
* Using Puppet, create a file in /tmp.

Requirements:
*    File path is /tmp/holberton
*    File permission is 0744
*    File owner is www-data
*    File group is www-data
*    File contains I love Puppet

Example:
```
root@6712bef7a528:~# puppet-lint --version
puppet-lint 2.1.1
root@6712bef7a528:~# puppet-lint 0-create_a_file.pp
root@6712bef7a528:~# 
root@6712bef7a528:~# puppet apply 0-create_a_file.pp
Notice: Compiled catalog for 6712bef7a528.ec2.internal in environment production in 0.04 seconds
Notice: /Stage[main]/Main/File[holberton]/ensure: defined content as '{md5}f1b70c2a42a98d82224986a612400db9'
Notice: Finished catalog run in 0.03 seconds
root@6712bef7a528:~#
root@6712bef7a528:~# ls -l /tmp/holberton
-rwxr--r-- 1 www-data www-data 13 Mar 19 23:12 /tmp/holberton
root@6712bef7a528:~# cat /tmp/holberton
I love Puppetroot@6712bef7a528:~#
```

### [1. Install a package](./1-install_a_package.pp)
* Using Puppet, install puppet-lint.

Requirements:
*    Install puppet-lint
*   Version must be 2.1.1

Example:
```
root@d391259bf577:/# puppet apply 1-install_a_package.pp
Notice: Compiled catalog for d391259bf577.hsd1.ca.comcast.net in environment production in 0.10 seconds
Notice: /Stage[main]/Main/Package[puppet-lint]/ensure: created
Notice: Finished catalog run in 2.83 seconds
root@d391259bf577:/# gem list

*** LOCAL GEMS ***

puppet-lint (2.1.1)
root@d391259bf577:/#
```

### [2. Execute a command](./2-execute_a_command.pp)
* Using Puppet, create a manifest that kills a process named killmenow.

Requirements:
*    Must use the exec Puppet resource
*    Must use pkill

Example:

Terminal #0 - starting my process
```
root@d391259bf577:/# cat killmenow
#!/bin/bash
while [[ true ]]
do
    sleep 2
done

root@d391259bf577:/# ./killmenow
```
Terminal #1 - executing my manifest
```
root@d391259bf577:/# puppet apply 2-execute_a_command.pp
Notice: Compiled catalog for d391259bf577.hsd1.ca.comcast.net in environment production in 0.01 seconds
Notice: /Stage[main]/Main/Exec[killmenow]/returns: executed successfully
Notice: Finished catalog run in 0.10 seconds
root@d391259bf577:/# 
```
Terminal #0 - process has been terminated
```
root@d391259bf577:/# ./killmenow
Terminated
root@d391259bf577:/#
```
---

## Author
* **Robinson Montes** - [mecomonteshbtn](https://github.com/mecomonteshbtn)
