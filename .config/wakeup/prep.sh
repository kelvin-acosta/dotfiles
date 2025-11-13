#!/bin/bash

# Turn on wifi
networksetup -setairportpower en0 on

echo "$(date): Wake event triggered" >>~/.sleepwatcher.log
