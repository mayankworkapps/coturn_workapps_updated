#!/bin/bash

# Check if /etc/os-release file exists
if [ -f /etc/os-release ]; then
    # Source the /etc/os-release file to get variables
    . /etc/os-release

    # Check if the ID variable is present
    if [ -n "$ID" ]; then
        os_name=$ID
        os_version=$VERSION_ID

        echo "$os_name-$os_version"
    else
        echo "Unable to determine OS information."
	exit -1
    fi
else
    echo "/etc/os-release file not found. Unable to determine OS information."
fi

