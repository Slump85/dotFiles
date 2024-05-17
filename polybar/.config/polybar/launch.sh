#!/usr/bin/env bash

# Kill toutes les instances de polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Execute la barre default
echo "---" | tee -a /tmp/polybar.log
polybar -rq default >> /tmp/polybar.log 2>&1 &

echo "Polybar launched..."
