#!/bin/bash

mkdir -p /var/lib/ginc-radar/app
mkdir -p /var/lib/ginc-radar/db-migrations
mkdir -p /var/lib/ginc-radar/backups
mkdir -p /var/lib/ginc-radar/nginx

ginc-radar-ctl configure

CONFIG_FILE=/etc/ginc-radar/ginc-radar.cfg
SUPERVISORD_CFG=/lib/ginc-radar/bundled/etc/supervisord/supervisord.conf
export $(grep -v '^#' $CONFIG_FILE | xargs) &> /dev/null
/lib/ginc-radar/bundled/bin/supervisord -n -c $SUPERVISORD_CFG