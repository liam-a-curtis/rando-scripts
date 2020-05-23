#/bin/bash

WPDIR="/var/www/wordpress"
BKUPDIR="/root/wpbackups"
FORMAT="%y%m%d-%H%M%S"
BKUPDATE="`date +${FORMAT}`"
WPBKUPFILE="wpbkup${BKUPDATE}.tar.gz"
DBFILE="blkitchen.sql.${BKUPDATE}"
USER="debian-sys-maint"
PW="mycoolpassword"

set -x #for debugz
tar -cvzf ${BKUPDIR}/${WPBKUPFILE} ${WPDIR}
mysqldump -u ${USER} -p ${PW} --single-transaction --all-databases > ${BKUPDIR}/${DBFILE}


