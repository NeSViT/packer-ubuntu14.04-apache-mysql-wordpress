#!/bin/bash
sudo set -e
sudo set -x 

# this script need for working public network in vagrant.
sudo echo "auto eth1" >> /etc/network/interfaces
sudo echo "iface eth1 inet dhcp" >> /etc/network/interfaces