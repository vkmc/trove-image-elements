#!/bin/bash

set -e

export DISTRO=rhel
export DATASTORE=mysql

export DIB_REPO_PATH="/opt/stack/diskimage-builder"
export ELEMENTS_PATH="$DIB_REPO_PATH/elements:./elements"

export REG_METHOD=portal
export REG_USER=<user>
export REG_PASSWORD=<password>
export REG_MACHINE_NAME=trove
export REG_POOL_ID=<pool>

export DIB_LOCAL_IMAGE=<localimg>
export DIB_CLOUD_INIT_DATASOURCES="ConfigDrive"

disk-image-create -a amd64 -o ${DISTRO}-${DATASTORE}-guest-image -x --qemu-img-options compat=0.10  ${DISTRO}-${DATASTORE}-guest-image
