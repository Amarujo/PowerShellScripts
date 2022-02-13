#for each user in csv file
#check if new attribute equals the old attribute
#if yes, write "attribute already exists)
#if no, set new attribute

$new_attribute="google.com"
$old_attribute=(get-mailbox andy.gallegos@amarujo.onmicrosoft.com).customattribute1
if ($new_attribute -eq $current_attribute) { 
    write-host "New and current attribute are the same, no changes made."
    } 
	else {
	Set-Mailbox andy.gallegos@amarujo.onmicrosoft.com -CustomAttribute1 $new_attribute
	}

	