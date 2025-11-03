#!/bin/bash
set -e

# Ensure sshd runtime dir exists
mkdir -p /var/run/sshd

# Ensure SSH authorized_keys exist if mounted
if [ -f /secrets/authorized_keys ]; then
  mkdir -p /home/labconfig/.ssh
  cp /secrets/authorized_keys /home/labconfig/.ssh/authorized_keys
  chown -R labconfig:labconfig /home/labconfig/.ssh
  chmod 700 /home/labconfig/.ssh
  chmod 600 /home/labconfig/.ssh/authorized_keys
fi

# Adjust sshd_config to allow both key and password authentication
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Optional: Log more for troubleshooting
echo "LogLevel VERBOSE" >> /etc/ssh/sshd_config

# Ensure upload directory has correct permissions
chown -R labconfig:labconfig /home/labconfig/upload || true

# Start SSH daemon in foreground
exec /usr/sbin/sshd -D -e