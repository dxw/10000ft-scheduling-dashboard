[ ![Codeship Status for dxw/10000ft-scheduling-dashboard](https://app.codeship.com/projects/1ab21990-d39b-0135-2a90-42740a1f2756/status?branch=develop)](https://app.codeship.com/projects/262842)

10000ft Scheduling Dashboard
================

A dashboard for [10000ft](https://www.10000ft.com/) using their [API](https://github.com/10Kft/10kft-api).

![alt text](../master/app/assets/images/example2.png?raw=true)

## Usage

### Distinguish contractors
In 10,000ft add a `tag` to a person called `contractor` and their thumbnail will have a coloured triangle. eg:

![alt text](../master/app/assets/images/example-contractor.jpg?raw=true)

### Hide people
In 10,000ft add a `tag` to a person called `hide-from-dashboard` and they will be hidden from the dashboard.

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

The [setup](#setup) steps will get you started but it will not come with an interactive prompt should you want to use a debugger such as [Pry](https://github.com/pry/pry). If you wish to use a debugger, we've included a script to achieve this that replaces the above `docker-compose` command:
```
bin/dstart --build
```

## Deployment

The scheduling dashboard is currently deployed through [Dachshund](https://github.com/dxw/dachshund/blob/develop/README.md#deployment). The following instructions will need updating if this changes.

You will need ssh access to the server running this container: `stats-2.prod.dxw.net`. Ask in the #developers channel on Slack.

1. On your machine build a new Docker image and push it to a Docker repository:
```
docker build . -t thedxw/10000ft-scheduling-dashboard:latest && docker push thedxw/10000ft-scheduling-dashboard:latest
```

2. Log onto the server running this container and change to the `dachshund` directory:

```
ssh ubuntu@stats-2.prod.dxw.net
sudo su # necessary because docker runs as root
cd /home/tomh/dachshund # dachshund lives in @hippers's home directory
```

3. Run the following to stop the service, remove the old image, and restart the service with the new image:
```
docker-compose stop scheduling-dashboard
docker-compose rm scheduling-dashboard
docker rmi thedxw/10000ft-scheduling-dashboard:latest
docker-compose up -d scheduling-dashboard # will download and build the latest image
```

You might have to wait a few seconds before the removing commands, so the service has time to stop.
