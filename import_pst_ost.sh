#!/bin/bash

find /mnt/*/C/Users | egrep -i '(\.pst|\.ost)' > pst_ost_files.txt

while read f; do
  drive_num=$(echo "-$f"| cut -d "/" -f 3 )
  mkdir "A$drive_num"
  cd "A$drive_num"
  pffexport $f -q
  cd ..
done < pst_ost_files.txt
