#!/bin/bash

ls -l /usr/local/bin/wildfly-exec.sh

ls -l $JBOSS_HOME
ls -l $JBOSS_HOME/standalone

WHO=`whoami`
GROUPS=`groups`
echo "Running as $WHO in groups $GROUPS"

$JBOSS_HOME/bin/standalone.sh -c standalone-teiid.xml -b 0.0.0.0 -bmanagement 0.0.0.0
