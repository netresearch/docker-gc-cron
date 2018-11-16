#!/bin/bash

DEFAULT_CRON="0 0 * * *"

if [ "$CRON" ]
then
   echo "Using user-defined CRON variable: $CRON"
else
   echo "CRON variable undefined. Using default of \"$DEFAULT_CRON\""
   CRON="$DEFAULT_CRON"
fi

echo -e "$CRON" "sh /executed-by-cron.sh" '>> /var/log/cron.log 2>&1'"\n" > crontab.tmp
