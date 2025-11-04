FROM python:3.11-slim

# Install system deps
# sshpass lets ansible handle ssh connection with passwords not just keys, helpful in labs
# rm -rf /var/lib/apt/lists/* cleans up cached package list to reduce the final image size.
RUN apt-get update && apt-get install -y \
    sshpass \
    openssh-client \
    vim \
    nano \
    git \
    curl \
    iputils-ping \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

# Install Ansible + useful collections
RUN pip install --no-cache-dir \
    ansible==9.4.0 \
    paramiko \
    pyaoscx
    
# Create Ansible directories
# this will later be mounted to host via docker compose
RUN mkdir -p /ansible
WORKDIR /ansible

# Default command to run when container starts, otherwise might stop auto. 
# the brackets are a JSON array, here there is just one command "bash" but others could be added as other strings

CMD ["bash"]
