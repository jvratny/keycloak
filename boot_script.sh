#!/bin/bash
#
# keycloak      Startup script for the Keycloak IDM Server
#
# chkconfig: -  85 15
# description:  The Keycloak Application Server
#
# processname:  standalone.sh
#

KEYCLOAK_HOME="/home/ew_admin/bin/keycloak/"
IP_ADDRESS=`ip -f inet a show eth0 | grep inet | awk '{ print $2 }' | cut -d/ -f1`

start() {
    echo "Starting keycloak..."
    
    $KEYCLOAK_HOME/bin/standalone.sh -b $IP_ADDRESS -bprivate $IP_ADDRESS --server-config=standalone-ha.xml
}