#!/bin/bash
set -euo pipefail
set -x

# This means that the application uses core 2 for port 0, queue pair 0
# forwarding, core 3 for port 0, queue pair 1 forwarding, core 4 for port 1,
# queue pair 0 forwarding, and core 5 for port 1, queue pair 1 forwarding.
./build/l3fwd -l 2-5 -n 4 -w 01:00.0 -w 01:00.0 \
        -- -p 0x3 --config '(0,0,2),(0,1,3),(1,0,4),(1,1,5)'
