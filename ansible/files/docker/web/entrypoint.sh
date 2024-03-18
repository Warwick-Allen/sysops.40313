#!/usr/bin/sh -x

sudo --user=node_exporter ./node_exporter --collector.systemd --collector.processes &

# The app should be running as the "app" user, but there is some issue with that that needs resolving.
#sudo --user=app node app &
node app &

wait
