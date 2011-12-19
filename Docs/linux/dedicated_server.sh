#!/bin/bash
cd /home/trepidation
./trepded.i386 +set net_ip YOURIP +set +set com_hunkmegs 120 +set dedicated 2 +exec trep-server.cfg > /dev/null 2>&1 &

