#!/bin/sh

# ---------------------------------------------------------------------------------------------------------------------
# MAKE FILE SYSTEM
# ---------------------------------------------------------------------------------------------------------------------
echo "Creating file system for gitlab data"
sudo mkfs.xfs -f /dev/xvdi

# ---------------------------------------------------------------------------------------------------------------------
# CREATE DIRECTORIES
# ---------------------------------------------------------------------------------------------------------------------
echo "Creating directories for data, wal and meta directories"
sudo mkdir -p  /mnt/gitlab-data

# ---------------------------------------------------------------------------------------------------------------------
# MOUNT ATTACHED DISKS AND CHANGE OWNERSHIP TO GITLAB USER
# ---------------------------------------------------------------------------------------------------------------------
echo "Mounting EBS Volume for gitlab data directories"
sudo mount /dev/xvdi /mnt/gitlab-data


echo "Change ownership of mounted volumes to gitlab"
sudo  chown -R git:git /mnt/gitlab-data
