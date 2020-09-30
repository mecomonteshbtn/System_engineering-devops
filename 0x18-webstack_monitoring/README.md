# 0x18. Webstack monitoring

---
## Monitoring


Just as the heart monitor in a hospital that is making sure that a patient’s heart is beating and at the right beat, software monitoring will watch computer metrics, record them, and emit an alert if something is unusual or that could make the computer not work properly happens.

You cannot fix or improve what you cannot measure is a famous saying in the tech industry. In the age of the data-ism, monitoring how our software systems are doing is an important thing.

Web stack monitoring can be broken down into 2 categories:

    Application monitoring: getting data about your running software and making sure it is behaving as expected
    Server monitoring: getting data about your virtual or physical server and making sure they are not overloaded (could be CPU, memory, disk or network overload)

Here are few famous monitoring tools:

### NewRelic

NewRelic requires you to add a piece of JavaScript to your website, this agent will collect information and send it back to the New Relic servers. It will give you a detailed analysis of how quickly your website loads in a browser, with a detailed analysis at every level of the stack. If the website is loading too slowly or users are experiencing error (500), there is a feature that allows you to trigger an alert. NewRelic now does much more than this, I’ll let you discover the rest.

### DataDog

DataDog allows you to measure and monitor everything with graphs. It gathers performance data from all your application components. The service has a lot of integrations. You usually just need to properly configure your alert and you are good to go with solid monitoring coverage.

### Uptime Robot

Uptime Robot is a simple service that will check that your website is responding from multiple locations in the world. This is the bare minimum when you host a website.

### Nagios

Nagios is an open source project started in 1999, it is among the most widely used monitoring tools in the tech industry. It is, however, seen as outdated. Nagios had trouble adapting to the rise of the Cloud but is slowly trying to catch up.

### WaveFront

Wavefront is a cutting edge monitoring service funded by great software engineers who’ve built monitoring tools for the best tech companies in Silicon Valley. The idea is to be able to analyze anything that can produce data points. A query language that looks like SQL allows users to apply mathematical operations to these data points to extract values or detect anomalies from the time series data. While it takes some time to get used to the tool, it’s the type of monitoring that the best companies are using. To my knowledge, LinkedIn, Facebook and DropBox are using a very similar tool for their monitoring needs.

---
## Background Context

“You cannot fix or improve what you cannot measure” is a famous saying in the Tech industry. In the age of the data-ism, monitoring how our Software systems are doing is an important thing. In this project, we will implement one of many tools to measure what is going on our servers.

Web stack monitoring can be broken down into 2 categories:

* Application monitoring: getting data about your running software and making sure it is behaving as expected
* Server monitoring: getting data about your virtual or physical server and making sure they are not overloaded (could be CPU, memory, disk or network overload)

---

## Resources:books:
Read or watch:
* [What is server monitoring](https://intranet.hbtn.io/rltoken/m8e7smqRz3k4PUBnv0zB7g)
* [What is application monitoring](https://intranet.hbtn.io/rltoken/fGzCCVr7lwNEvarE8u1HRQ)
* [System monitoring by Google](https://intranet.hbtn.io/rltoken/h6WV2iIVUCL-atjFIu6TZA)
* [Nginx logging and monitoring](https://intranet.hbtn.io/rltoken/ZUIlnid6NphRWIaGZ3MTZQ)

---
## Learning Objectives:bulb:
What you should learn from this project:

* Why is monitoring needed
* What are the 2 main area of monitoring
* What are access logs for a web server (such as Nginx)
* What are error logs for a web server (such as Nginx)

---

### [0. Sign up for Datadog and install datadog-agent](./2-setup_datadog)
* For this task head to [https://www.datadoghq.com/](https://www.datadoghq.com/) and sign up for a free Datadog account. When signing up, you’ll have the option of selecting statistics from your current stack that Datadog can monitor for you. Once you have an account set up, follow the instructions given on the website to install the Datadog agent. 
* Sign up for Datadog - Please make sure you are using the US website of Datagog (.com)
* Install datadog-agent on web-01
* Create an application key
* Copy-paste in your Intranet user profile (here) your DataDog API key and your DataDog application key.
* Your server web-01 should be visible in Datadog under the host name XX-web-01
* You can validate it by using this [API](https://docs.datadoghq.com/api/v1/hosts/)
* If needed, you will need to update the hostname of your server
```
curl -X GET "https://api.datadoghq.com/api/v1/hosts" -H "Content-Type: application/json" -H "DD-API-KEY: 2fc8f8c857e33d8f9a9e64302ed59662" -H "DD-APPLICATION-KEY: 7b4cc9864f052aab9dbc7efc8ad2b1d514114563"
```

### 1. [Monitor some metrics](./)

Among the litany of data your monitoring service can report to you are system metrics. You can use these metrics to determine statistics such as reads/writes per second, which can help your company determine if/how they should scale. Set up some monitors within the Datadog dashboard to monitor and alert you of a few. You can read about the various system metrics that you can monitor here: [System Check.](https://docs.datadoghq.com/integrations/system/)
* Set up a monitor that checks the number of read requests issued to the device per second.
* Set up a monitor that checks the number of write requests issued to the device per second.


### 2. [Create a dashboard](./2-setup_datadog)
* Now create a dashboard with different metrics displayed in order to get a few different visualizations.
* Create a new dashboard
* Add at least 4 widgets to your dashboard. They can be of any type and monitor whatever you’d like
* Create the answer file 2-setup_datadog which has the dashboard_id on the first line. Note: in order to get the id of your dashboard, you may need to use [Datadog’s API](https://docs.datadoghq.com/api/v1/dashboards/#get-all-dashboards)

---

## Author
* **Robinson Montes** - [mecomonteshbtn](https://github.com/mecomonteshbtn)
