#!/bin/bash
# connect to a VPN => run git command => disconnect from a VPN
args=("$@")

printf "Running git command with VPN connection \n"

# this is a utility script for connecting to the VPN
sh vpnConnector.sh

eval git $args

scutil --nc stop $DEFAULT_VPN
printf "Disconnected from VPN \n"
