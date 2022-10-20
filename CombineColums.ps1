#Run this one liner to create a new csv file with the output of two combined columns from an original csv.  Need to find a way to add this column to original csv.

import-csv .\sourcecsv |select-object @{name='column name you want';expression={$_.column1,$_.column1 -join ' ' }} | export-csv combinedcsv.csv -notypeinformation

#example:

# source.csv
# | firstname | lastname |
# | andy      | doe      |

# import-csv .\sourcecsv |select-object @{name='fullname';expression={$_.firstname,$_.lastname -join ' ' }} | export-csv combinedcsv.csv -notypeinformation

# combined.csv 
# | displayname |
# | andy doe    |
