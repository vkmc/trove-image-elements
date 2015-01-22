#!/bin/bash

set -e

mount -o size=8G /tmp

export TROVE_REMOTE_REPO="https://github.com/openstack/trove"
export TROVE_REMOTE_REPO_BRANCH=master
export DISTRO=rhel
export DATASTORE=mysql

export DIB_REPO_PATH="/opt/stack/diskimage-builder"
export TRIPLEO_REPO_PATH="/opt/stack/tripleo-image-elements"
export ELEMENTS_PATH="$DIB_REPO_PATH/elements:$TRIPLEO_REPO_PATH/elements:./elements"

export REG_METHOD=portal
export REG_USER=<user>
export REG_PASSWORD=<password>
export REG_MACHINE_NAME=trove
export REG_POOL_ID=<pool>

# NOTE(vkmc): This param is important, DIB's repos are outdated and will return a 404
# A guest image can be downloaded from http://jur-linux.org/download/ftp.redhat.com/rhel7-rc/GuestImage/
export DIB_LOCAL_IMAGE=<localimg>
export DIB_CLOUD_INIT_DATASOURCES="ConfigDrive"

disk-image-create -a amd64 -o ${DISTRO}-${DATASTORE}-guest-image -x --qemu-img-options compat=0.10  ${DISTRO}-${DATASTORE}-guest-image
