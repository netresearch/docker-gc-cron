#!/bin/sh

echo "[$(date)] Docker GC starting." >> /var/log/cron.log 2>&1

docker system prune -a -f >> /var/log/cron.log 2>&1
docker volume prune -f >> /var/log/cron.log 2>&1

echo "[$(date)] Docker GC has completed." >> /var/log/cron.log 2>&1
