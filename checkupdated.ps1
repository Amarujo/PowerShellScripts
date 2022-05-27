#get count of available updates
$count= Get-WindowsUpdate | measure

#if updates are more than 0, apply updates and prompt user to reboot
#if 0, exit 
if ($count.count -eq 0) {
	}
    else { 
		Get-WindowsUpdate -AcceptAll -Install -AutoReboot
	}