#!/bin/sh

set -e

cd ${WGDIR}

if [ ! -f wg0.conf ]
then
    echo "Config file not found !!!"; exit 1
fi

if [ -f wg0.conf ]
then
    for i in wg*.conf
    do
        i=$(basename $i .conf)
        wg-quick up $i
    done
fi

syslogd -n
