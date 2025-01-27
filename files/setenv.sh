#!/bin/sh

# JAVA_OPTS
MEMORY="${ERDDAP_MEMORY:-4G}"
NORMAL="-server -d64 -Xms${ERDDAP_MIN_MEMORY:-${MEMORY}} -Xmx${ERDDAP_MAX_MEMORY:-${MEMORY}}"
HEAP_DUMP="-XX:+HeapDumpOnOutOfMemoryError"
HEADLESS="-Djava.awt.headless=true"
EXTRAS="-XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled"
CONTENT_ROOT="-DerddapContentDirectory=$CATALINA_HOME/content/erddap"
JNA_DIR="-Djna.tmpdir=/tmp/"
FASTBOOT="-Djava.security.egd=file:/dev/./urandom"

JAVA_OPTS="$JAVA_OPTS $NORMAL $HEAP_DUMP $HEADLESS $EXTRAS $CONTENT_ROOT/ $JNA_DIR $FASTBOOT"
echo "ERDDAP Running with: $JAVA_OPTS"
