#!/bin/bash

filename="molecules/cubane.pdb"

# Create a txt to store names
echo C > names.txt

# In sed, eliminate the first 2 lines and the last line (Just for practice)
function renames(){
	atomnames=$(sed -e '1,2d' -e '$d' $1 |
		awk '/ATOM/{print $3}' |
		awk '/C/{print $1}' |
		wc -l)
	echo $atomnames >> names.txt
}

renames "$filename"


#cat $filename
