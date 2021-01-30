#!/bin/bash

command -v v4l2-ctl || sudo apt install -y v4l-utils
command -v realpath || sudo apt install -y coreutils

CURRENT_PATH=$(realpath $0)
CURRENT_DIR=$(dirname $CURRENT_PATH)

V4L2_CONFIGURE=$CURRENT_DIR/v4l2-ctl.bash
V4L2_SERVICE=$CURRENT_DIR/v4l2.service
V4L2_SYSTEMD_PATH=/etc/systemd/system/v4l2.service

TEMP_FILE=$(mktemp)

bash $V4L2_CONFIGURE

sudo cp -f $V4L2_SERVICE $V4L2_SYSTEMD_PATH
sudo sed -i "s+:script+$V4L2_CONFIGURE+g" $V4L2_SYSTEMD_PATH
