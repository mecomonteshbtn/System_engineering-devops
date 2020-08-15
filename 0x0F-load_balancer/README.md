<h1><strong>0x0F. Load balancer<\strong><\h1>
<img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/174/load-balancing.png">

## Load balancer
Ever wonder how Facebook, Linkedin, Twitter and other web giants are handling such huge amounts of traffic? They don’t have just one server, but tens of thousands of them. In order to achieve this, web traffic needs to be distributed to these servers, and that is the role of a load-balancer.

### Readme:
* [Load-balancing](https://www.thegeekstuff.com/2016/01/load-balancer-intro/)
* [Load-balancing algorithms](https://devcentral.f5.com/s/articles/intro-to-load-balancing-for-developers-ndash-the-algorithms)

## Background Context

You have been given 2 additional servers:

* gc-[STUDENT_ID]-web-02-XXXXXXXXXX
* gc-[STUDENT_ID]-lb-01-XXXXXXXXXX

Let’s improve our web stack so that there is [redundancy](https://en.wikipedia.org/wiki/Redundancy_%28engineering%29) for our web servers. This will allow us to be able to accept more traffic by doubling the number of web servers, and to make our infrastructure more reliable. If one web server fails, we will still have a second one to handle requests.

For this project, you will need to write Bash scripts to automate your work. All scripts must be designed to configure a brand new Ubuntu server to match the task requirements.

## Resources:books:
Read or watch:
* [Introduction to load-balancing and HAproxy](https://intranet.hbtn.io/rltoken/ngIXarEyu8jZwOL3Y30PLQ)
* [HTTP header](https://intranet.hbtn.io/rltoken/v32JmcDrSiOnFBfqzXvs_Q)
* [Debian/Ubuntu HAProxy packages](https://intranet.hbtn.io/rltoken/BXGrW_6ocecWaOJb7OK_WA)

---
## Your servers
---
| Name |	Username |	IP |	State |        |          |         |
|------|-----------------|---------|----------|--------|----------|---------|
| 1574-web-01 |	ubuntu |  35.227.35.75 |	running |	Soft reboot |	Hard reboot |	Ask a new server |
| 1574-web-02 |	ubuntu |	100.24.37.33 | running |	Soft reboot |	Hard reboot |	Ask a new server |
| 1574-lb-01 |	ubuntu |	3.91.150.218 |	running |	Soft reboot |	Hard reboot |	Ask a new server |
---

### [0. Double the number of webservers](./0-custom_http_response-header)
* In this first task you need to configure web-02 to be identical to web-01. Fortunately, you built a Bash script during your [web server project](https://github.com/mecomonteshbtn/holberton-system_engineering-devops/tree/master/0x0C-web_server), and they’ll now come in handy to easily configure web-02. Remember, always try to automate your work!

Since we’re placing our web servers behind a load balancer for this project, we want to add a custom Nginx response header. The goal here is to be able to track which web server is answering our HTTP requests, to understand and track the way a load balancer works. More in the coming tasks.

Requirements:
* Configure Nginx so that its HTTP response contains a custom header (on web-01 and web-02)
* The name of the custom HTTP header must be X-Served-By
* The value of the custom HTTP header must be the hostname of the server Nginx is running on
* Write 0-custom_http_response-header so that it configures a brand new Ubuntu machine to the requirements asked in this task
* Ignore SC2154 for shellcheck

Example:
```
sylvain@ubuntu$ ./transfer 0-custom_http_response-header 34.75.91.155 ubuntu ~/.ssh/holberton
0-custom_http_response-header                                100% 1399     1.4KB/s   00:00 
sylvain@ubuntu$ ssh ubuntu@35.227.35.75 -i ~/.ssh/holberton
ubuntu@1574-web-01$ ./0-custom_http_response-header
ubuntu@localhost$ logoout
...
sylvain@ubuntu$ curl -sI 35.227.35.75 | grep X-Served-By
X-Served-By: 1574-web-01
sylvain@ubuntu$ curl -sI 100.24.37.33 | grep X-Served-By
X-Served-By: 1574-web-02
sylvain@ubuntu$ curl -sI 3.91.150.218 | grep X-Served-By
X-Served-By: 1574-lb-01
sylvain@ubuntu$
```
If your server’s hostnames are not properly configured ([STUDENT_ID]-web-01 and [STUDENT_ID]-web-02.), follow this [tutorial](https://aws.amazon.com/premiumsupport/knowledge-center/linux-static-hostname/).

### [1. Install your load balancer](./1-install_load_balancer)
* Install and configure HAproxy on your lb-01 server.

Requirements:
* Configure HAproxy with version equal or greater than 1.5 so that it send traffic to web-01 and web-02
* Distribute requests using a roundrobin algorithm
* Make sure that HAproxy can be managed via an init script
* Make sure that your servers are configured with the right hostnames: [STUDENT_ID]-web-01 and [STUDENT_ID]-web-02. If not, follow this [tutorial](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-hostname.html).
* For your answer file, write a Bash script that configures a new Ubuntu machine to respect above requirements

Example:
```
sylvain@ubuntu$ curl -Is 54.210.47.110
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Mon, 27 Feb 2017 06:12:17 GMT
Content-Type: text/html
Content-Length: 30
Last-Modified: Tue, 21 Feb 2017 07:21:32 GMT
Connection: keep-alive
ETag: "58abea7c-1e"
X-Served-By: 03-web-01
Accept-Ranges: bytes

sylvain@ubuntu$ curl -Is 54.210.47.110
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Mon, 27 Feb 2017 06:12:19 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Tue, 04 Mar 2014 11:46:45 GMT
Connection: keep-alive
ETag: "5315bd25-264"
X-Served-By: 03-web-02
Accept-Ranges: bytes

sylvain@ubuntu$
```

### [2. Add a custom HTTP header with Puppet](./2-puppet_custom_http_response-header.pp)
* Just as in task #0, we’d like you to automate the task of creating a custom HTTP header response, but with Puppet.

* The name of the custom HTTP header must be X-Served-By
* The value of the custom HTTP header must be the hostname of the server Nginx is running on
* Write 2-puppet_custom_http_response-header.pp so that it configures a brand new Ubuntu machine to the requirements asked in this task

---

## Author
* **Robinson Montes** - [mecomonteshbtn](https://github.com/mecomonteshbtn)
