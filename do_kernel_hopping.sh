#!/bin/bash

check_retrieval() {
	head -1 response_headers | grep -q "200 OK"
}

./uninstall_cron_job.sh

./generate_conditional_homepage_retrieval_command.sh > conditional_homepage_retrieval_command
sh conditional_homepage_retrieval_command
check_retrieval && {
	echo "Homepage retrieved"
	./retrieve_new_kernel.sh
	./extract_new_kernel.sh
	./configure_new_kernel.sh
	./compile_new_kernel.sh
	./install_new_kernel.sh
	./install_reboot_job.sh
	./teach_grub_a_lesson.sh
	reboot
} || {
	echo -n "Homepage not retrieved: "
	head -1 response_headers
}

