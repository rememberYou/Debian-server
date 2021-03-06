#!/bin/bash

# Installation of NFS.
apt-get install nfs-kernel-server nfs-common -y

# Create a backup of the configuration file.
if [ ! -f /etc/exports.bak ]; then
    cp /etc/exports /etc/exports.bak
fi

# Create the sharing directory if doesn't exist yet.
if [[ ! -d /srv/share ]]; then
    mkdir /srv/share
    chmod 777 /srv/share
fi

# Create the configuration file.
echo "###### NFS SERVER CONFIGURATION ######" > /etc/exports
echo " " >> /etc/exports

echo "/srv/share  10.1.0.0/16(rw,sync,no_subtree_check,root_squash)" >> /etc/exports

# Update the table of exported file systems.
exportfs -av

# Restart NFS.
/etc/init.d/nfs-kernel-server restart
