# 0x17. Web stack debugging #3

## Resources:books:
When debugging, sometimes logs are not enough. Either because the software is breaking in a way that was not expected and the error is not being logged, or because logs are not providing enough information. In this case, you will need to go down the stack, the good news is that this is something Holberton students can do :)

Wordpress is a very popular tool, it allows you to run blogs, portfolios, e-commerce and company websites… It actually powers 26% of the web, so there is a fair chance that you will end up working with it at some point in your career.

Wordpress is usually run on LAMP (Linux, Apache, MySQL, and PHP), which is a very widely used set of tools.

The web stack you are debugging today is a Wordpress website running on a LAMP stack.

---
## Learning Objectives:bulb:
What you should learn from this project:
* All your files will be interpreted on Ubuntu 14.04 LTS
* All your files should end with a new line
* A README.md file at the root of the folder of the project is mandatory
* Your Puppet manifests must pass puppet-lint version 2.1.1 without any errors
* Your Puppet manifests must run without error
* Your Puppet manifests first line must be a comment explaining what the Puppet manifest is about
* Your Puppet manifests files must end with the extension .pp
* Files will be checked with Puppet v3.4

---
## More Info
Install puppet-lint
```
$ apt-get install -y ruby
$ gem install puppet-lint -v 2.1.1
```

---

### [0. Strace is your friend](./0-strace_is_your_friend.pp)
*Using strace, find out why Apache is returning a 500 error. Once you find the issue, fix it and then automate it using Puppet (instead of using Bash as you were previously doing).

* [Watch this video](https://www.youtube.com/watch?v=uHEzt1QuASo&feature=youtu.be)

Hint:
* strace can attach to a current running process
* You can use [tmux](https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/) to run [strace](https://strace.io/) in one window and curl in another one

Requirements:
* Your 0-strace_is_your_friend.pp file must contain Puppet code
* You can use whatever Puppet resource type you want for you fix

Example:
```
root@e514b399d69d:~# curl -sI 127.0.0.1
HTTP/1.0 500 Internal Server Error
Date: Fri, 24 Mar 2017 07:32:16 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Connection: close
Content-Type: text/html

root@e514b399d69d:~# puppet apply 0-strace_is_your_friend.pp
Notice: Compiled catalog for e514b399d69d.ec2.internal in environment production in 0.02 seconds
Notice: /Stage[main]/Main/Exec[fix-wordpress]/returns: executed successfully
Notice: Finished catalog run in 0.08 seconds
root@e514b399d69d:~# curl -sI 127.0.0.1:80
root@e514b399d69d:~#
HTTP/1.1 200 OK
Date: Fri, 24 Mar 2017 07:11:52 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Link: <http://127.0.0.1/?rest_route=/>; rel="https://api.w.org/"
Content-Type: text/html; charset=UTF-8

root@e514b399d69d:~# curl -s 127.0.0.1:80 | grep Holberton
<title>Holberton &#8211; Just another WordPress site</title>
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Feed" href="http://127.0.0.1/?feed=rss2" />
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Comments Feed" href="http://127.0.0.1/?feed=comments-rss2" />
        <div id="wp-custom-header" class="wp-custom-header"><img src="http://127.0.0.1/wp-content/themes/twentyseventeen/assets/images/header.jpg" width="2000" height="1200" alt="Holberton" /></div>  </div>
                            <h1 class="site-title"><a href="http://127.0.0.1/" rel="home">Holberton</a></h1>
        <p>Yet another bug by a Holberton student</p>
root@e514b399d69d:~#
``` 

[Using this blog as reference:](https://medium.com/@katyakalache/postmortem-24ecfefca44c)
Resolution and recovery

1. When I tried to transfer some data from local server I did not get a response from the web-server. That gave me a clue that I need to check my apache2 process and try trace the error.
```
root@f5c5fc4e021c:~
# curl -sI 127.0.0.1
HTTP/1.0 500 Internal Server Error
Date: Fri, 24 Mar 2017 07:32:16 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Connection: close
Content-Type: text/html
```
2. I listed all active processes to identify process id of apache2 web-server.
```
root@f5c5fc4e021c:~# ps -A
PID TTY TIME CMD
 1 ? 00:00:00 run.sh
 40 ? 00:00:00 apache2
 44 ? 00:00:00 apache2
 91 ? 00:00:00 mysqld_safe
 437 ? 00:00:00 mysqld
```
3. I straced pid of apache2 and got 44 processes attached.
```
root@f5c5fc4e021c:~#strace -p 44
Process 44 attached
accept4(4,
```

4. Curled again in another window and got detailed information about every process being ran.

```
lstat("/var/www/html/wp-includes/class-wp-locale.phpp", 0x7ffc0a9f7110) = -1 ENOENT (No such file or directory)
lstat("/var/www/html/wp-includes/class-wp-locale.phpp", 0x7ffc0a9f6fe0) = -1 ENOENT (No such file or directory)
lstat("/var/www/html/wp-includes/class-wp-locale.phpp", 0x7ffc0a9f9210) = -1 ENOENT (No such file or directory)
open("/var/www/html/wp-includes/class-wp-locale.phpp", O_RDONLY) = -1 ENOENT (No such file or directory)
```

After spending some time reading through all output, I noticed that there were a lot of errors about files that did not exists, checking even further turned out there was a typo in some file names that caused all troubles.

5. The issue was corrected with a simple puppet script by updating the file name.
```
exec { '/var/www/html/wp-setting.php':  path    => [ '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' ],  command => "sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php",}
```
Corrective and Preventative Measures

To avoid this error in the future, I would suggest not to type out paths, file names, directory names etc. when referring to them in your code, but rather copy & paste them.
---

## Author
* **Robinson Montes** - [mecomonteshbtn](https://github.com/mecomonteshbtn)