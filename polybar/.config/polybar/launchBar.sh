#!/usr/bin/env bash

#Kill toutes les instances de polybar
killall -q polybar

#Execute la barre default
echo "---" | tee -a /tmp/polybar.log
polybar default >> /tmp/polybar.log 2>&1 &

echo "Bar launched..."
