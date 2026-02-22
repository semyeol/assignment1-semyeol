# Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; 
# the second argument is a text string which will be written within this file, referred to below as writestr

# Exits with value 1 error and print statements if any of the arguments above were not specified

# Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. 
# Exits with value 1 and error print statement if the file could not be created.

#!/bin/sh

writefile=$1
writestr=$2

if [ -z "$writefile" -o -z "$writestr" ]
then 
    echo "One or both of the parameters are empty"
    exit 1
fi

# Extract directory path from the full file path
# 'dirname' gets everything except the filename
dirpath=$(dirname "$writefile")

# Create the directory (and any parent directories needed)
# '-p' creates parent directories, doesn't error if it exists
mkdir -p "$dirpath"

# Write writestr to the file (overwrites if exists)
echo "$writestr" > "$writefile"

# Check if file was created successfully
# '-f' checks if file exists
if [ ! -f "$writefile" ]
then
    echo "Error: Could not create file $writefile"
    exit 1
fi