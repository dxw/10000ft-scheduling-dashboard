10000ft Scheduling Dashboard
================

A dashboard for [10000ft](https://www.10000ft.com/) using their [API](https://github.com/10Kft/10kft-api).

![alt text](../master/app/assets/images/example.png?raw=true)

## Setup

The project is built to run through Docker via Docker Compose.

Make sure you have Docker for Mac installed: https://docs.docker.com/docker-for-mac/install/

Then run the following to start the app:
```
docker-compose up --build
```

## Run the tests

```
bin/dspec
```

## Developing

Get started with an interactive prompt for debugging via PRY.
```
bin/dstart --build
```

## Deployment

1. On your machine build a new Docker image and push it to a Docker repository:
```
docker build . -t thedxw/10000ft-scheduling-dashboard:latest && docker push thedxw/10000ft-scheduling-dashboard:latest
```

2. Log onto the server running this container and run the following:
```
docker-compose stop app
docker-compose rm app
docker rmi thedxw/10000ft-scheduling-dashboard:latest
docker-compose up -d app
```
