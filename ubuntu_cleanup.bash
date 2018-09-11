# !/bin/bash
# It cleans up space on / driver of ubuntu
# usage: sh ubuntu_cleanup.bash

# Check which filesystem (driver) is taking up more space
df -h

# Clean up commands
sudo apt-get clean
sudo apt-get autoremove
