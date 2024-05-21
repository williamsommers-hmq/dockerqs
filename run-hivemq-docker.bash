#!/bin/bash

# Purpose:
#
#   This script helps you run HiveMQ Broker in a docker container
#   It lets you setup local (host) directories, configuration, license directories
#   for HiveMQ and bind mounts them into the Docker containers. Configuration can
#   be modified in the local host-based directories for easy updates. Since the
#   directories are mounted into the container, HiveMQ immediately sees the changes.
#

# BASEDIR    :  Base directory for installation
# CONF       :  Configuration directory for HiveMQ Broker
# ESECONF    :  Enterprise Security Extension configuration directory
# LIC        :  License directory

BASEDIR="Change this to base directory of your choice"
CONF=${BASEDIR}/src/hivemq/docker/conf
ESECONF=${BASEDIR}/src/hivemq/docker/eseconf
LIC=${BASEDIR}/src/hivemq/docker/license

# CCTRPORT   :  HiveMQ Control Center (CC) port external mapped to 8080 on the inside of the container
# MQTTPORT   :  MQTT port external mapped to 1883 on the inside of the container
# WSPORT     :  Websocket port external mapped to 9001 on the inside of the container

CCTRPORT=8087
MQTTPORT=1887
WSPORT=8007

# HIVEMQIMG  :  Name of the DockerHub HiveMQ Broker image hivemq/hivemq4:semver
# HIVEMQNAME :  HiveMQ Docker Container name

HIVEMQIMG="hivemq/hivemq4:4.28.0"
HIVEMQNAME="hivemq-428"

#
# Run HiveMQ Docker container with settings defined above
#
docker run --ulimit nofile=500000:500000 \
    -v ${LIC}:/opt/hivemq/license \
    -v ${CONF}:/opt/hivemq/conf/ \
    -v ${ESECONF}:/opt/hivemq/extensions/hivemq-enterprise-security-extension/conf/ \
    -p ${CCTRPORT}:8080 -p ${WSPORT}:9001 -p ${MQTTPORT}:1883 \
    -d --name ${HIVEMQNAME} \
    ${HIVEMQIMG}

#
# uncomment these lines or run them in a shell to enable enterprise security extension (ESE).
#
# docker exec -it $HIVEMQNAME rm -v /opt/hivemq/extensions/hivemq-enterprise-security-extension/DISABLED
# docker exec -it $HIVEMQNAME touch /opt/hivemq/extensions/hivemq-allow-all-extension/DISABLED
