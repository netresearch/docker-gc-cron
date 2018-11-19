#!/bin/sh

echo "[$(date)] Docker GC starting." >> /var/log/cron.log 2>&1


if [ -n "$FORCE_IMAGES" ] && [ "$FORCE_IMAGES" = "true" ]; then
   FORCE='-a'
   echo 'force images' >> /var/log/cron.log 2>&1
else
   FORCE=''
fi

docker system prune $FORCE -f >> /var/log/cron.log 2>&1
docker volume prune -f >> /var/log/cron.log 2>&1

echo "[$(date)] Docker GC has completed." >> /var/log/cron.log 2>&1
