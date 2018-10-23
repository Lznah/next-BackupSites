#!/bin/bash
INPUT=$1
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

folder=$(date +%Y%m%d_%H%M%S)
mkdir $folder

while IFS=, read -r name ip user mysqluser mysqlpassword path
do
	if [ -n "$2" ];
	then if [ "$2" != "$name" ]; then continue; fi
	fi
  folder2=$(date +%Y%m%d_%H%M%S)
  mkdir $folder"/"$name"-"$folder2
  ssh $user"@"$ip "mysqldump -u '$mysqluser' -p$mysqlpassword --all-databases --single-transaction --quick --lock-tables=false" > $folder"/"$name"-"$folder2"/"$(date +%Y%m%d_%H%M%S)".sql"
  scp -r $user"@"$ip:$path"/" $folder"/"$name"-"$folder2"/"
done < "$1"
IFS=$OLDIFS

# mkdir .ssh
# cat .ssh/id_rsa.pub | ssh root@domain 'cat >> .ssh/authorized_keys'
