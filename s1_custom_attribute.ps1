#Users will periodically need their custom attributes updated.
#Will eventually expand this to go through a csv, check multiple columns for multiple properties (directory info, phone number, etc) 
#and make sure it matches or update as necessary


$new_attribute="new website"
$old_attribute=(get-mailbox ups).customattribute1
if ($new_attribute -eq $current_attribute) { 
    write-host "New and current attribute are the same, no changes made."
    } 
	else {
	Set-Mailbox ups -CustomAttribute1 $new_attribute
	}

	
