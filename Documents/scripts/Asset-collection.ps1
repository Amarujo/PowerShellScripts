# This script uses Invoke-Command to iterate over a list of remote computers, collecting specific workstation details. 
# It creates a custom object with these details for each computer and returns this data to the machine running the script.
# Finally, the collected data is exported into a CSV file.

# Assigning a variable to hold the aggregated results from all computers for CSV export.
$results = Invoke-Command -ComputerName $computers -ScriptBlock {
    # Collect workstation details using CIM instances, selecting properties for the custom object.
    $model = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property Name, Model, Manufacturer
    $serialnumb = Get-CimInstance -ClassName Win32_BIOS | Select-Object -Property SerialNumber

    # Custom object creation allows for flexible data mapping, supporting different CSV import requirements by adjusting property names as needed.
    $combinedDetails = New-Object PSObject -Property @{
        Name = $model.Name
        Model = $model.Model
        Manufacturer = $model.Manufacturer
        SerialNumber = $serialnumb.SerialNumber
    }

    # Returning the custom object to ensure that only desired data is outputted and then passed back to the local workstation.
    return $combinedDetails
}

# Aggregating the data from each remote workstation into $results, which is subsequently exported to a CSV file.
$results | Export-Csv -Path $HOME\file.csv -NoTypeInformation