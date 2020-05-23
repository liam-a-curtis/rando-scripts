#/bin/bash

WPDIR="/var/www/wordpress"
BKUPDIR="/root/wpbackups"
FORMAT="%y%m%d-%H%M%S"
BKUPDATE="`date +${FORMAT}`"
WPBKUPFILE="wpbkup${BKUPDATE}.tar.gz"
DBDUMPFILE="${BKUPDIR}/blkitchen.sql.${BKUPDATE}"
USER="debian-sys-maint"
PW="mycoolpw"

set -x 
mysqldump -u${USER} -p${PW} --all-databases --single-transaction > ${DBDUMPFILE}
tar -cvzf ${BKUPDIR}/${WPBKUPFILE} ${WPDIR} ${DBDUMPFILE}

if [ $? -eq 0 ]; then
  rm ${DBDUMPFILE} 
else
    echo "script failed"
fi

#ye olde purge files line
find ${BKUPDIR} -mtime +7 -type f -delete

