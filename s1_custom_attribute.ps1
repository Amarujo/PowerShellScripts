#for each user in csv file
#check if new attribute equals the old attribute
#if yes, write "attribute already exists)
#if no, set new attribute

$new_attribute="google.com"
$current_attribute=(get-mailbox upn).customattribute1
if ($new_attribute -eq $current_attribute) { 
    write-host "New and current attribute are the same, no changes made."
    }
    else {
    Set-Mailbox LynneR@amarujo.onmicrosoft.com -CustomAttribute1 $new_attribute 
    $attribute=(get-mailbox LynneR@amarujo.onmicrosoft.com).customattribute1
    write-host "Attribute has been updated to $attribute"
    }

	
