#!/bin/sh

# Shamelessly take the extract-files.sh from the Moto Jordan tree and massage
# it for our uses (pulls in common and device specific bits now)

VENDOR=lge
DEVICE=thunderc_VM670

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary/system
rm -rf $BASE/*

for LIST in proprietary-files.txt ../thunderc_common/proprietary-files.txt; do
  for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
      mkdir -p $BASE/$DIR
    fi
    adb pull /system/$FILE $BASE/$FILE
  done
done

# Skip the setup-makefiles.sh bit for now because I've already listed the blobs
# in the relevant makefiles.