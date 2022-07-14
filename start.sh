#!/bin/bash
# Upgrade Debian to latest release and installed packages upgrades
# Author: Yevgeniy Goncharov aka xck, http://sys-adm.in

# Envs
# ---------------------------------------------------\
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
cd $SCRIPT_PATH

# Funcs
# ---------------------------------------------------\
default() {
    # Upgrade Debian / to next release
    apt-get update; apt-get -y upgrade; apt-get -y dist-upgrade; apt-get -y --purge autoremove
}

default_apt() {
    apt update; apt -y upgrade; apt -y full-upgrade; apt -y --purge autoremove
}

# Params
# ---------------------------------------------------\
# Checks arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -a|--apt) _APT=1; ;;
        -h|--help) usage ;; 
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Run options
# ---------------------------------------------------\
# Options
if [[ "$_APT" -eq "1" ]]; then
    default_apt
else
    default
fi