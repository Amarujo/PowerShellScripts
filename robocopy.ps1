#backup script using robocopy.
#makes local backup first, then copies it to the USB drive

#set variables for creating backup folder and back up destination
$backupdir="$env:USERPROFILE\Weekly-Backups\Weeky-Backup-$(get-date -f yyyy-MM-dd) "
$backupdocuments="$env:USERPROFILE\Weekly-Backups\Weeky-Backup-$(get-date -f yyyy-MM-dd)\Documents "

#set variable for creating backup folders and back back up destination on USB Drive
$USBDir="D:\user-files\Weeky-Backup-$(get-date -f yyyy-MM-dd)\ "

#set variables for source folders 
$Desktop="$env:USERPROFILE\Desktop\ "
$Documents="$env:USERPROFILE\Documents\ "


#check that your external drive is plugged in. 
#if you want to see a list of drives plugged in, run this command:
# Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match '^USB' }.

$disk=Get-PnpDevice -PresentOnly | Where-Object { $_.FriendlyName -match 'SanDisk' }
	if ($disk){
		echo "Drive is plugged in, proceeding with the backup"
	}		
	else {
		echo "Drive not plugged in, exiting"
		break
	}
	
#Make weekly backup folders 
$dirs = @($backupdir,$backupdocuments,$USBDir)
foreach ($dir in $dirs) {
	 new-item -path $dir -itemtype directory 
	}

#backup folders to Weekly Back Up directory and then back up to USB drive 
robocopy $Documents $backupdocuments /s /E /R:0 /W:0 
robocopy $backupdir $USBDir /s /E /R:0 /W:0 

