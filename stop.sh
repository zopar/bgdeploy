#!/bin/bash

# Stop app
echo "Stop app"
docker-compose --project-name=blue stop
docker-compose --project-name=green stop

# Stop traefik
echo "Stop Traefik"
docker-compose --project-name=traefik -f docker-compose.traefik.yml stop

# Removing containters
echo "Remove stopped container"
docker ps -a | grep -E "green|traefik|blue" | awk '{print $1}' | xargs -i docker rm -f {}