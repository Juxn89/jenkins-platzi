#!/bin/bash
docker build -t jenkins-custom .
docker-compose down
docker-compose up -d