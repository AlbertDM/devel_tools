#!/bin/bash

# Example:
# 


# Install
echo ""
echo "> Install docker on Ubuntu with apt"
sudo apt-get install docker.io
echo ""
echo "> Download docker images:"
echo ">	 Pull Ubuntu:latest"
echo ""
sudo docker pull ubuntu:latest
echo ">	 Pull rocky Linux v9"
echo ""
sudo docker pull rockylinux:9
echo ""
echo "> Docker images installed"
sudo docker images
echo ""
echo "> Create docker group"
sudo usermod -aG docker ${USER}
echo ""
echo "> Please logout and login before proceeding."
echo ""
