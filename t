#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
for slave in `$SCRIPT_DIR/get-slaves`
do
  ssh $slave "jps |grep DataNode"
done
