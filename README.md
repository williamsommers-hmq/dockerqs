# Repository Name: dockerqs
Docker Quick-Start Script for HiveMQ Broker

## Purpose:
This script helps you run HiveMQ Broker in a docker container.  It lets you setup local (host) directories, configuration, license directories for HiveMQ and bind mounts them into the Docker containers. Configuration can be modified in the local host-based directories for easy updates. Since the directories are mounted into the container, HiveMQ immediately sees the changes.

## Usage:

Modify the following variables as needed, starting with BASEDIR, to suit your needs.  
Set the execute permission on the run-hivemq-docker.bash script on MacOS, Linux, WSL2 with:  

`  chmod +x run-hivemq-docker.bash  `
  
## Variables  
The CONF directory should point to the host directory where your HiveMQ Broker configuration lives.  
The ESECONF variable should point to the host directory of the Enterprise Security Extension (ESE).  
The LIC variable should point to the host directory containing the license files.  


BASEDIR    :  Base directory for installation  
CONF       :  Configuration directory for HiveMQ Broker  
ESECONF    :  Enterprise Security Extension configuration directory  
LIC        :  License directory

```  
BASEDIR=/Users/williamsommers  
CONF=${BASEDIR}/src/hivemq/docker/conf  
ESECONF=${BASEDIR}/src/hivemq/docker/eseconf  
LIC=${BASEDIR}/src/hivemq/docker/license  
```
