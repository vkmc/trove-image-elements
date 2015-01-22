Image elements for building Trove guest images
==============================================

Building prerequisites
----------------------

Each image for datastore should include next mandatory elements:

    ${DISTRO}-${DATASTORE}-guest-image (for example rhel-mysql-guest-image, rhel-mongodb-guest-image, etc.)


Instructions
------------

Checkout this source tree and also the diskimage builder, export an
ELEMENTS\PATH to add elements from this tree, and build any disk images you
need.

    pip install dib-utils pyyaml
    pip install git+https://github.com/openstack/diskimage-builder.git
    git clone https://github.com/openstack/tripleo-image-elements.git
    git clone https://github.com/vkmc/trove-image-elements.git
    export ELEMENTS_PATH=tripleo-image-elements/elements:trove-guest-image-elements/elements:diskimage-builder/elements

Building images
---------------

To build an image please run this commands:


    export TROVE_REMOTE_REPO="https://github.com/openstack/trove"
    export TROVE_REMOTE_REPO_BRANCH=master
    export DISTRO=rhel
    export DATASTORE=...
    export DIB_CLOUD_INIT_DATASOURCES="ConfigDrive"
    disk-image-create -a amd64 \
        -o ${DISTRO}-${DATASTORE}-guest-image \
        -x --qemu-img-options compat=0.10 \
        ${DISTRO}-${DATASTORE}-guest-image

    Note. Only anonymous HTTP(S) accessable Git repos are allowed.

** Based on Denis Makogon's trove-guest-image-elements work **
