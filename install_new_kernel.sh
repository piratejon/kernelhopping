#!/bin/bash

rotateit() {
	LOL=${1}
	mv /boot/${LOL}-current /boot/${LOL}-previous
	cp ${KERNEL_FOLDER}/${LOL} /boot/${LOL}-current
}

source sourceme_set_kernel_folder_variable.sh
cd ${KERNEL_FOLDER}

make modules_install

rotateit vmlinuz
rotateit System.map
rotateit .config

rename .config config /boot/.config*

