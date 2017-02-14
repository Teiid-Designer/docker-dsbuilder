#!/bin/bash

BIN="/usr/local/bin"
EXEC_WILDFLY="${BIN}/wildfly-exec.sh"

DSBUILDER_USER="user"
DSBUILDER_PASSWD="user1234!"

#
# -k will not verify the ssl certificate
# --user will use the basic authentication
#
AUTH_CURL="curl -k --user ${DSBUILDER_USER}:${DSBUILDER_PASSWD}"

ABOUT_URL="https://localhost:8443/vdb-builder/v1/service/about"
ACCEPT_HEADER="Accept: application/json"

function wait-on-wildfly() {
	set +e

	echo "Waiting for wildfly..."
	while true; do
		ABOUT_STATUS=`${AUTH_CURL} -sL -w "%{http_code}\\n" -X GET --header "${ACCEPT_HEADER}" ${ABOUT_URL} -o /dev/null` 
		echo "Status: ${ABOUT_STATUS}"
		if [ "${ABOUT_STATUS}" = 200 ]; then
			echo "dsbuilder up and running"
			return;
		elif [ "${ABOUT_STATUS}" = 401 ]; then
			echo "Not authorised to connect to dsbuilder ... exiting"
			exit 1;
		else
			echo "Still waiting for wildfly..." && sleep 4
		fi
	done

	set -e
}

#
# Start wildfly in the background
#
${EXEC_WILDFLY} &

#
# Wait for wildfly to deploy and make available dsbuilder
#
wait-on-wildfly

#
# Use jboss cli to configure data sources
#
${JBOSS_HOME}/bin/jboss-cli.sh --file=data-source.cli
