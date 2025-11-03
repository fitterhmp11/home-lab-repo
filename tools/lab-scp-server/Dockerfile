# Base image
FROM ubuntu:22.04

# Install OpenSSH server
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openssh-server && \
    rm -rf /var/lib/apt/lists/*

# Ensure sshd runtime dir exists
RUN mkdir -p /var/run/sshd

# Create dedicated user
RUN useradd -m -s /bin/bash labconfig && \
    echo "labconfig:LabPass" | chpasswd

# Create upload directory (mounted to host)
RUN mkdir -p /home/labconfig/upload && \
    chown -R labconfig:labconfig /home/labconfig/upload

# Copy startup script
COPY start-sshd.sh /usr/local/bin/start-sshd.sh
RUN chmod +x /usr/local/bin/start-sshd.sh

# Expose SSH port
EXPOSE 22

# Default command
CMD ["/usr/local/bin/start-sshd.sh"]