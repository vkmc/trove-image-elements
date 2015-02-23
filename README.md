Image elements for building Trove guest images
==============================================

Building prerequisites
----------------------

Each image for datastore should include next mandatory elements:

    ${DISTRO}-${DATASTORE}-guest-image (for example rhel-mysql-guest-image, rhel-mongodb-guest-image, etc.)

Building images
---------------

Without the script
------------------

To build an image without the script, make sure you have diskimage-builder installed (yum install -y diskimage-builder)
and run the following commands:

    # RHEL related required env
    export REG_METHOD=portal
    export REG_USER=<user>
    export REG_PASSWORD=<password>
    export REG_MACHINE_NAME=trove
    export REG_POOL_ID=<pool>

    # DIB related required env
    export DISTRO=<distro>
    export DATASTORE=<datastore>
    export DIB_CLOUD_INIT_DATASOURCES="ConfigDrive"
    disk-image-create -a amd64 \
        -o ${DISTRO}-${DATASTORE}-guest-image \
        -x --qemu-img-options compat=0.10 \
        ${DISTRO}-${DATASTORE}-guest-image

    Note. Only anonymous HTTP(S) accessable Git repos are allowed.

With the script
---------------

Simply run 'sudo ./create-trove-image.sh -h' to see run instructions.


Based on
--------

https://github.com/denismakogon/trove-guest-image-elements
