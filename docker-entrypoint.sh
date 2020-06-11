#!/bin/bash -e

ENV_VARIABLES=$(awk 'BEGIN{for(v in ENVIRON) print "$"v}')

if [ -d /temp/custom ]; then
   cp /temp/custom/*.conf /etc/nginx/conf.d/
fi

for FILE in etc/nginx/nginx.conf etc/nginx/conf.d/default.conf etc/modsecurity.d/modsecurity-override.conf
do
    envsubst "$ENV_VARIABLES" <$FILE | sponge $FILE
done

source /opt/modsecurity/activate-rules.sh

exec "$@"

if [ "${DEBUG_MODE}" == "enabled" ]; then
    echo "run debug mode"
    sleep 100000
else
