#!/bin/sh
spawn-fcgi -u nginx -s /run/fcgiwrap.sock /usr/bin/fcgiwrap
nginx -g "daemon off;"
