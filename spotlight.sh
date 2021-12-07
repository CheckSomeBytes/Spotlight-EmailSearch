#!/bin/bash

echo Enter the search term


read term 
mkdir -p results.$term
mkdir -p results.$term/file_name
mkdir -p results.$term/contents 

echo "***File Name Search Started***"
find */*.export | grep -i "$term"| sed 's/ /\\ /g' > ./results.$term/file_name/list.n.[$term].txt

while read file_path;
do
	#file_path=$(echo "$file_path" | sed 's/ /\\ /g')
	file_name=$(echo "$file_path" | rev | cut -d'/' -f 1 | rev)
	file_name_clean=$(echo "$file_name" | sed 's/ //g')
	cp "$file_path" "results.$term/file_name/$file_name_clean" 
	 echo "results.$term/file_name/$file_name_clean" >> results_files.txt
done < "results.$term/file_name/list.n.[$term].txt"
echo "***File Name Search Complete***"
cat ./results.$term/file_name/list.n.[$term].txt | rev | cut -d'.' -f 1 | rev | sort | uniq -c | sort -nr
printf "\n\n"






echo "***Contents Search Started***"

grep -l -r -i "$term" */*.export | sed 's/ /\\ /g' > ./results.$term/contents/list.c.[$term].txt


while read c_file_path;
do
        c_file_name_clean=$(echo "$c_file_path" | sed 's/ //g'| sed 's/\///g')
	cp "$c_file_path" "results.$term/contents/$c_file_name_clean"
	echo "results.$term/contents/$c_file_name_clean" >> results_files.txt
done < "results.$term/contents/list.c.[$term].txt"




echo "***Contents Search Complete***"
cat ./results.$term/contents/list.c.[$term].txt | rev | cut -d'.' -f 1 | rev | sort | uniq -c | sort -nr 
