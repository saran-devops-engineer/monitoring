#!/bin/bash

# Create network if not exists
docker network inspect my_custom_network >/dev/null 2>&1 || \
  docker network create my_custom_network

# Run Grafana
docker run -d \
  --name grafana \
  -p 3000:3000 \
  -v $(pwd)/grafana:/var/lib/grafana \
  --network my_custom_network \
  grafana/grafana:5.4.0

# Build and run Collectd
#docker build -f ./collectd/dockerfile -t custom-collectd .
docker run -d \
  --name collectd \
  --privileged \
  --hostname Collectd \
  -v /proc:/mnt/proc:ro \
  -v $(pwd)/collectd/collectd.conf:/etc/collectd/collectd.conf \
  --network my_custom_network \
  collectd

# Run Graphite
#docker run -d \
#  --name graphite \
#  -p 8000:80 \
#  -v $(pwd)/graphite:/opt/graphite/storage \
#  --network my_custom_network \
#  graphiteapp/graphite-statsd:1.1.4-10

docker run -d \
  --name graphite \
  -p 8080:8080 \
  -v $(pwd)/graphite:/opt/graphite/storage \
  --network my_custom_network \
  graphiteapp/graphite-statsd:1.1.4-10

echo "All services started."
