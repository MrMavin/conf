#!/bin/bash

command -v amixer || sudo apt install -y alsa-utils
command -v realpath || sudo apt install -y coreutils

CURRENT_PATH=$(realpath $0)
CURRENT_DIR=$(dirname $CURRENT_PATH)

AMIXER_CONFIGURE=$CURRENT_DIR/amixer-ctl.bash
AMIXER_SERVICE=$CURRENT_DIR/amixer.service
AMIXER_SYSTEMD_PATH=/etc/systemd/system/amixer.service

sudo cp -f $AMIXER_SERVICE $AMIXER_SYSTEMD_PATH
sudo sed -i "s+:script+$AMIXER_CONFIGURE+g" $AMIXER_SYSTEMD_PATH
sudo systemctl enable amixer
sudo systemctl start amixer

