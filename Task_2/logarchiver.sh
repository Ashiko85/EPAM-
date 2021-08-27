#!/bin/bash -x
#author: Anna Waluszko
#email: ashiko85@gmail.com
#script creates zipped tarball from all .gz files within /var/log location (preserving folder structure) and tests if tar archive can be restored
#script also creates log file with list of files that were archived

#variables declaration
TARTEMP="/opt/tartemp"
DESTDIR="/opt/logarchive"
TIMESTAMP="$(date +%D | sed 's;/;_;g')"

if [ ! -d "$DESTDIR" ]; then
  echo "creating ${DESTDIR} folder"
  mkdir ${DESTDIR}
else
  echo "folder ${DESTDIR} present on fs - skipping creation"
fi

#verification if temp with pretar and posttar subfolders folder exist and creating if not
if [ -d "$TARTEMP" ]; then
  echo "removing ${TARTEMP}"
  rm -r ${TARTEMP}
else
  echo "folder ${TARTEMP} not present on fs - skipping removal"
fi

#creating folder structure
mkdir ${TARTEMP}
mkdir ${TARTEMP}/pretar
mkdir ${TARTEMP}/posttar


#coping .gz files from /var/log location to pretar folder
cd /var/log
find . -name '*.gz' -exec cp --parents \{\} ${TARTEMP}/pretar \;

#creating zipped tarball and log file
#cd $DESTDIR
#tar -zcvf archive_${TIMESTAMP}.tar.gz ${TARTEMP}/pretar > archive_${TIMESTAMP}.log
cd ${TARTEMP}/pretar
tar -zcvf ${DESTDIR}/archive_${TIMESTAMP}.tar.gz . > ${DESTDIR}/archive_${TIMESTAMP}.log


#testing if tar file can be sucesfully extracted and contains correct files (point 5 procedure)
tar -xzvf ${DESTDIR}/archive_${TIMESTAMP}.tar.gz -C ${TARTEMP}/posttar
checkdiff="$(diff -qr ${TARTEMP}/pretar ${TARTEMP}/posttar | wc -l)"

if [ ${checkdiff} -ne 0 ]; then
  mail -s "Daily logs archive job failed!" ashiko85@gmail.com <<< 'There are differences between pretar and posttar folders. Manual check needed.'
else
  mail -s "Daily logs archive finished succesfully!" ashiko85@gmail.com <<< 'New archive file created and verified sucesfully!'
fi

exit 0


