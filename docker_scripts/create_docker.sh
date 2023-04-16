#!/bin/bash

# Example:
# bash myscript -a "String A" -b "String B" -c "String C"
#
# `docker run -dit --name myContainer -h myVirtualMachine -v {PWD}:/SharedFolder ubuntu`
# `sudo docker run -dit --name myContainer -h myVirtualMachine -v ${PWD}:/SharedFolder --net=host  ubuntu /bin/bash`
# * `--name petalinux` : Container name
# * `-h technica` : Docker virtual machine name
# * `-v {PWD}`: Local machine docker store shared location, between the docker container and the host machine.
# * `:/sharedFolder` : Shared folder in the docker container.
# * `ubuntu`: Docker image. You can select the version also.
# 	*  Show downloaded docker images to create new containers:
# 	* `docker images`
# 


helpFunction()
{
   echo ""
   echo "Usage: $0 -n "DdpkContainer" -h "DpdkRocky" -v "/home/albertdm/Workspace/Docker_containers/DpdkContainer""
   echo -e "\t-a Description of what is parameterA"
   echo -e "\t-b Description of what is parameterB"
   echo -e "\t-c Description of what is parameterC"
   exit 1 # Exit script after printing help
}

while getopts "n:h:v:" opt
do
   case "$opt" in
      n ) paramName="$OPTARG" ;;
      h ) paramVmach="$OPTARG" ;;
      v ) paramLocation="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$paramName" ] || [ -z "$paramVmach" ] || [ -z "$paramLocation" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct

## Run Docker
sudo docker run -dit --name "$paramName" -h "$paramVmach" -v "$paramLocation":/SharedFolder --net=host  rockylinux:9 /bin/bash

echo "Container name: $paramName"
echo "Virutal Machine name: $paramVmach"
echo "Location: $paramLocation"

docker start "$paramName"
docker attach "$paramName"
