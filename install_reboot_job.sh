#!/bin/bash

INSTALLED=
for job in `crontab -l | awk '{print $6}'`; do
	if [ "z${job}"="z/root/do_kernel_hopping.sh" ]; then
		INSTALLED=true
	fi
done

if [ -z "${INSTALLED}" ]; then
	EDITOR=/root/edit_install_cronjob.sh crontab -e
fi

