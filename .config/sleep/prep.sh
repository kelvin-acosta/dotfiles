#!/bin/bash

# Turn off wifi
networksetup -setairportpower en0 off

# Kill zoom
killall -HUP zoom.us

echo "$(date): Sleep event triggered" >>~/.sleepwatcher.log
