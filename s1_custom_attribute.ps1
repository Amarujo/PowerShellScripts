#This script will import csv data, check if data matches settings in office365/exchange, and update if necesary.
#Future addiitons: output UPN with results, check if user exists, print output to csv file with email to relevant parties 


#connect to online services
connect-exchangeonline 
connect-msolservice

#import data from csv file 
Import-Csv c:\users\andy\nextcloud\powershell\employees.csv | ForEach-Object (

#Custom attribute
{
	$email=$_.email
	$new_attribute=$_.link
	$current_attribute=(get-mailbox $_.email).customattribute1

	if ($new_attribute -eq $current_attribute) 
		{write-host "New and current attribute are the same, no changes made."
		}
   	else 
		{Set-Mailbox $_.email -CustomAttribute1 $new_attribute 
		$attribute=(get-mailbox $_.email).customattribute1
		write-host "Attributes have been updated to $attribute"
		}
	
#Office number
	$new_office_number=$_.OfficeNumber	
	$current_office_number=(Get-MsolUser -userprincipalname $_.email).phonenumber

	if ($new_office_number -eq $current_office_number) 
		{write-host "New and current office number are the same, no changes made"
		}
    else 
		{Set-msoluser -userprincipalname $_.email -phonenumber $new_office_number
		$office_number=(Get-MsolUser -userprincipalname $_.email).phonenumber
		write-host "Office number has been updated"	
		}
#Mobile number
#Title
#Department
#
}



)
