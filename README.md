# Monitoring system using collectd, graphite and grafana

[Collectd](https://collectd.org) is a daemon which collects system and application performance metrics periodically and provides mechanisms to store the values in a variety of ways. It gathers metrics from various sources, e.g. the operating system, applications, logfiles and external devices, and stores this information or makes it available over the network.

[Graphite](https://graphiteapp.org) is a free open-source software that monitors and graphs numeric time-series data such as the performance of computer systems. It collects, stores, and displays time-series data in real time.

[Grafana](https://grafana.com) is an open source metric analytics & visualization suite. It is most commonly used for visualizing time series data for infrastructure and application analytics but many use it in other domains including industrial sensors, home automation, weather, and process control.

## Install and Run

This page helps you in installing [Docker Compose](https://docs.docker.com/compose/install).
```
git clone https://github.com/ifelsenayeem/monitoring.git

cd monitoring/

sudo chown -R 472:472 grafana

docker-compose up --detach --build

docker ps -a  # Check all containers are running or not
```
Hit, http://localhost:3000/login

Login to grafana with **admin** & **admin** as username & password.

That's it!

## Screenshot

![Monitoring Screen](https://user-images.githubusercontent.com/15060542/55627722-83576b00-57cc-11e9-8930-9f190f8c2c38.png)
