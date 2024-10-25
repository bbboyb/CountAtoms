#!/bin/bash

filename=("molecules/*")

# In sed, eliminate the first 2 lines and the last line (Just for practice)
function renames(){
    atomnames=$(sed -e '1,2d' -e '$d' "$1" |
                awk -v atom="$2" '/ATOM/ && $3 == atom {print $3}' |
                wc -l)
    echo "$atomnames" >> names.txt
}


for file in molecules/*; do
	echo C > names.txt
	renames "$file" "C"
	echo H >> names.txt
	renames "$file" "H"
# If the molecule contains atom O
#	echo O >> names.txt
#	renames "$file" "O"

	newname=$(awk '{printf $0}' names.txt)


	cp "$file" "$newname" 
	done
rm names.txt

