#!/bin/bash

command -v v4l2-ctl || sudo apt install -y v4l-utils
command -v realpath || sudo apt install -y coreutils

CURRENT_PATH=$(realpath $0)
CURRENT_DIR=$(dirname $CURRENT_PATH)

V4L2_CONFIGURE=$CURRENT_DIR/v4l2-ctl.bash

TEMP_FILE=$(mktemp)

bash $V4L2_CONFIGURE

crontab -l > $TEMP_FILE

# TODO check crontab doesn't already have V4L2 configuration

echo "@reboot /bin/bash $V4L2_CONFIGURE" >> $TEMP_FILE

crontab $TEMP_FILE
rm $TEMP_FILE
