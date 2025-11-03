See additional comments in Dockerfile and docker-compose.yml for explanation of setup


to run

From inside dir with Docker file and docker-compose

docker compose up -d --build

check its running

docker ps

connect to it interactively

docker exec -it ansible-container-ansible bash

confirm ansible is running
 ansible --version
