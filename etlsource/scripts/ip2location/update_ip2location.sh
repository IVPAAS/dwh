#!/bin/bash
. /etc/kaltura.d/system.ini

<<<<<<< HEAD
KITCHEN=$BASE_DIR/bin/pentaho/kitchen.sh
=======
KITCHEN=$BASE_DIR/pentaho/kitchen.sh
>>>>>>> d1c3d07d81513494745dc28b9731a23aad0a241a
ROOT_DIR=$BASE_DIR/dwh
TMP_DIR=/tmp/

while getopts "k:p:" o
do      case "$o" in
    k)  KITCHEN="$OPTARG";;
    p)  ROOT_DIR="$OPTARG";;
    t)  TMP_DIR="$OPTARG";;
        [?])    echo >&2 "Usage: $0 [-k  pdi-path] [-p dwh-path] [-t tmp_dir]"
                exit 1;;
        esac
done

LOGFILE=$ROOT_DIR/logs/ip2location-`date +%Y%m%d`.log

mkdir -p $ROOT_DIR/etlsource/scripts/ip2location/`date +%b%y`
cd $ROOT_DIR/etlsource/scripts/ip2location/`date +%b%y`
perl $ROOT_DIR/etlsource/scripts/ip2location/download.pl -package DB7 -login -password >> $LOGFILE 2>&1

unzip IP-COUNTRY-REGION-CITY-ISP-DOMAIN-FULL.ZIP >> $LOGFILE 2>&1

mv IP-COUNTRY-REGION-CITY-ISP-DOMAIN.CSV $TMP_DIR/IP-COUNTRY-REGION-CITY-ISP-DOMAIN.CSV  >> $LOGFILE 2>&1
export KETTLE_HOME=$ROOT_DIR
$KITCHEN -file $ROOT_DIR/etlsource/ip2location/load_ip2location.kjb -param:ExportPath=$TMP_DIR  >> $LOGFILE 2>&1
