# Bash-Profiles
(Potentially) useful aliases and scripts to improve productivity. These scripts were built with Mac OS in mind. Specifically, VPN utilities may not work on other operating systems. 

* **vpnConnector.sh** - A utility script used by other scripts to connect to a configured VPN.
* **mvpn.sh** - A script for automatically connecting to a VPN while running Maven builds. Useful for simplifying Maven builds which require resources only avaiable on private networks.
* **vit.sh** - A script for automatically connecting to a VPN while running Git commands. Useful for simplifying working with a Git repository hosted on a private network.

## Usage
Use `vit` and `mvpn` commands in any place you'd use `git` or `mvn` to connect to the VPN before execution.

Ex: 
`vit pull` == `git pull`
`mvpn clean install -DskipTests` == `mvn clean install -DskipTests`

## Requirements
* Mac OS X Lion (10.7.5) 

## Setup
* Create a directory that all your bash scripts will be saved in (this will be added to your bash_profile).
* Add the following to `~/.bash_profile`:
```
export DEFAULT_VPN="<your desired VPN>"
export BASH_SCRIPTS="<absolute/path/to/bash/scripts>"
alias mvpn="sh $BASH_SCRIPTS/mvpn.sh"
alias vit="sh $BASH_SCRIPTS/vit.sh"
```
* Open a new terminal window and test the `mvpn` and `vit` commands, they should work now.
