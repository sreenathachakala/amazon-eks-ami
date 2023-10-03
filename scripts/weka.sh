#!/bin/bash

curl http://backend0:14000/dist/v1/install | WEKA_CGROUPS_MODE=none sh
weka local stop -f
weka local rm --all -f

[ -f /opt/weka/data/agent/machine-identifier ] && rm -f /opt/weka/data/agent/machine-identifier
version=4.2.0
weka version get $version --set-current
weka version prepare $version

weka local stop -f
weka local rm --all -f