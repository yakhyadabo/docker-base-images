#!/bin/sh
# Alpine doesn't have /bin/bash by default

set -e

if [ -z "$NEWRELIC_KEY" ]; then
	java -Djava.security.egd=file:/dev/./urandom -jar app.jar
else 
	if [ -z "$NEWRELIC_APP_NAME" ]; then
		echo >&2 'error: missing required environment variable'
		echo >&2 'error: NEWRELIC_APP_NAME must be set when using New Relic'
		exit 1
	fi

	NEW_RELIC_CONFIG_FILE=$NEW_RELIC_DIR/newrelic.yml
	cp $NEW_RELIC_CONFIG_FILE $NEW_RELIC_CONFIG_FILE.original

	# Override key and app_name 
	sed -i -e "s/app_name:\ My\ Application/app_name:\ ${NEWRELIC_APP_NAME}/g" $NEW_RELIC_CONFIG_FILE 
	sed -i -e "s/'<\%= license_key \%>'/${NEWRELIC_KEY}/g" $NEW_RELIC_CONFIG_FILE 

	exec "$@"
fi

