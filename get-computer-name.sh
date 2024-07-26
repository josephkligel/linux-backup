#!/usr/bin/bash

source /etc/os-release

COMPUTER_NAME="$HOSTNAME:$PRETTY_NAME"

echo "$COMPUTER_NAME"
