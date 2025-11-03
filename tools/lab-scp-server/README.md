# to build container

docker build -t scp-server:latest ~/Projects/home-lab-repo/tools/lab-sshd-image

# to run container

docker run -d \
  --name scp-server \
  -p 2222:22 \
  -v ~/Projects/home-lab-repo/configs:/home/labconfig/upload \
  -v ~/Projects/home-lab-repo/secrets:/secrets \
  scp-server:latest


# clean up..

docker ps -a        # list containers
docker stop my-ssh  # stop it if running
docker rm my-ssh    # remove the old container

docker images       # list images
docker rmi my-ssh:latest   # remove the old image


When SCP to the server use go to directory /upload/[vendor_name]