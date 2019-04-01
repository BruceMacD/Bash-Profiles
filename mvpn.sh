#!/bin/bash
# connect to a VPN => run maven => disconnect from a VPN
args=("$@")

printf "Running maven build with VPN connection \n"

# this is a utility script for connecting to the VPN
sh $BASH_SCRIPTS/vpnConnector.sh

eval mvn $args

scutil --nc stop $DEFAULT_VPN
printf "Disconnected from VPN \n"
