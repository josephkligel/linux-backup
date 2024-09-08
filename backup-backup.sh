#!/usr/bin/bash

$DD="/media/joseph/My2TB"

$BP="/media/joseph/Backup_Plus"

function backup_backup {
	rsync -auv $BP/ $DD
}

backup_backup
