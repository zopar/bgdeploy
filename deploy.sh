#!/bin/bash

# We use commit reference to build our container also with labels
COMMIT="$(git rev-parse --short HEAD)"
if test -z "$COMMIT"
then
    echo "Error: no commit found exit"
    exit 1
fi

# Check if is a blue or green deployment
blue=$(docker ps -f name=blue -q)
if test -z "$blue"
then
    ENV="blue"
    OLD="green"
else
    ENV="green"
    OLD="blue"
fi

echo "Starting \"$ENV\" container"
COMMIT="$COMMIT" docker-compose --project-name=$ENV up --build  -d

echo "Waiting 10 seconds"
sleep 30

echo "Stopping \"$OLD\" container"
docker-compose --project-name=$OLD stop

echo "Removeing container"