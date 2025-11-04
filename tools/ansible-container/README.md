See additional comments in Dockerfile and docker-compose.yml for explanation of setup


to run

From inside dir with Docker file and docker-compose

#to bring down docker container
docker compose down 

# to build
docker compose build
# to start, in detached mode so the terminal is free not staying connected
docker compose up -d

# to build and start
docker compose up -d --build

# to check its running

docker ps

# to connect to it interactively

docker exec -it ansible-container-ansible bash

confirm ansible is running
 ansible --version
