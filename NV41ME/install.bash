#!/bin/bash

CURRENT_PATH=$(realpath $0)
CURRENT_DIR=$(dirname $CURRENT_PATH)

V4L2_SETUP=$CURRENT_DIR/v4l2-setup.bash
AMIXER_SETUP=$CURRENT_DIR/amixer-setup.bash

bash $V4L2_SETUP
bash $AMIXER_SETUP
