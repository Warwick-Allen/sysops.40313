#!/usr/bin/sh -x

cd node_exporter-*/
./node_exporter --collector.systemd --collector.processes
