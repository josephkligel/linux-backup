#!/usr/bin/bash

DD=/media/joseph/Backup_Plus/Backups

DIRS=("/home" "/etc" "/var/www" "/etc/crontab" "/etc/cron.d" "/var/log" "/lib/modules" "/boot" "/var/mail" "/var/spool/mail")

function get_backup_drive  {
	if ! [ -d "$DD" ]; then 
		read -p "Please provide a destination drive location: " DD
	fi
}

function create_destination_folder {
	DD="$DD/$HOSTNAME"
	mkdir -p "$DD"
}

function backup_source_dirs {
	rsync -auv "${DIRS[@]}" $DD > "./backup_log/system:$(date).log"
}

function get-package-list {
	apt list --installed > "$DD/package_list.txt"
}

function get-user-cron-jobs {
	crontab -l > "$DD/user_cron_jobs.txt"
}

get_backup_drive
create_destination_folder
backup_source_dirs

get-package-list
get-user-cron-jobs
