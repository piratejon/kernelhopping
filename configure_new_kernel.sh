#!/bin/bash

source sourceme_set_kernel_folder_variable.sh

cd ${KERNEL_FOLDER}
make mrproper
zcat /proc/config.gz | sed 's/^CONFIG_LOCALVERSION/#&/' > .config

