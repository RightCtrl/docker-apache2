#!/usr/bin/env bash
# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.

if [[ -z "$TIMEZONE" ]]; then
    TIMEZONE='Asia/Kolkata'
fi

ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

if [[ -z "$servn" ]]; then
    servn='rightctrl.com'
fi
if [[ -z "$cname" ]]; then
    cname='www'
fi

dir='/var/www/'
user='apache'
listen='*'


rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/apachectl -DFOREGROUND
