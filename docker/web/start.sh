#!/usr/bin/sh -x

sudo --user=node_exporter ./run-node_exporter.sh &

# The app should be running as the "app" user, but there is some issue with that that needs resolving.
#sudo --user=app node app &
node app &

wait
