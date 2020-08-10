#!/bin/bash


for file in /var/www/jaws/data/* ; do
          SRC=$file/avatar
 	  FILENAME=$(echo $file | cut -c 20-) #deletes first 19 chars (cuts from 3rd char)
	  DEST=/var/www/files/uploads/$FILENAME/avatars
	  #DEST=/root/test/$FILENAME/avatars
	  echo $FILENAME
	  echo $file
	  ssh -p 4141 root@185.51.202.186 mkdir -p $DEST
	  rsync -zaP -e 'ssh -p 4141' $SRC/* root@185.51.202.186:$DEST/
          

done
