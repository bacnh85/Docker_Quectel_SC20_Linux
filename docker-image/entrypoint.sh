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
  # Add gitlab to know host 
  su - $UID -c "ssh-keyscan gitlab.quectel.com -p 2222 >> ~/.ssh/known_hosts"

  echo "Clone Quectel SC20 Linux SDK to SDK folder"
  su - $UID -c "git clone ssh://git@gitlab.quectel.com:2222/quectel_smart/sc20_linux.git /opt/SDK"  
fi

# Run bash to keep container alive
tail -f /dev/null