#!/usr/bin/env sh

# Init the container
if [[ -z $(getent passwd $UID) ]]; then
  # Create user/group and assign /opt permission
  groupadd -g $GID $GID
  useradd -u $UID -g $GID -s /bin/bash $UID

  USER_PASSWORD=$(date +%s | sha256sum | base64 | head -c 32)
  echo $UID:$USER_PASSWORD | chpasswd
fi

# Chmod /opt and change user
chown $UID:$GID /opt

# Clone Linux SDK
if [ ! -d SDK/ ]; then
  # Add gitlab key
  if [ ! $(grep [gitlab.quectel.com]:2222 /home/$UID/.ssh/known_hosts) > /dev/null ]; then
    su - $UID -c  "echo \"[gitlab.quectel.com]:2222,[47.254.29.35]:2222 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNbJZePD6lvNZJ4ewix79Pg3Yt07lh4BotfiKPL57CMfEaAqdUGn3Ed0JrRDVlvkGfLAvK2mVKgxCZs1w/LbYR8=\" >> ~/.ssh/known_hosts"
  fi

  #su - $UID -c "ssh-keyscan gitlab.quectel.com -p 2222 >> ~/.ssh/known_hosts"

  echo "Clone Quectel SC20 Linux SDK to SDK folder"
  su - $UID -c "git clone ssh://git@gitlab.quectel.com:2222/quectel_smart/sc20_linux.git /opt/SDK"  
fi

# Run bash to keep container alive
tail -f /dev/null