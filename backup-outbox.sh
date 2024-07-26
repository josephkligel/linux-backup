#!/usr/bin/bash

DD=/media/joseph/Backup_Plus/Inbox

OB=/home/joseph/Outbox

function get_backup_drive  {
	if ! [ -d "$DD" ]; then 
		read -p "Please provide a destination drive location: " DD
	fi
}

function backup_outbox_folder {
	rsync -auv $OB/* $DD > ./backup_log/"outbox:$(date).log"
}

get_backup_drive
backup_outbox_folder
