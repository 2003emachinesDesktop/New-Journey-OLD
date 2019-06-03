#!/bin/sh

APPDIR=$(readlink -f "$0")
APPDIR=$(dirname "$APPDIR")
java -Djna.nosys=true -Djava.library.path="$APPDIR:$APPDIR/lib" -cp "$APPDIR:$APPDIR/lib/create_world.jar:$APPDIR/lib/core.jar:$APPDIR/lib/jogl-all.jar:$APPDIR/lib/gluegen-rt.jar:$APPDIR/lib/jogl-all-natives-linux-aarch64.jar:$APPDIR/lib/gluegen-rt-natives-linux-aarch64.jar:$APPDIR/lib/slf4j-api.jar:$APPDIR/lib/slf4j-log4j.jar:$APPDIR/lib/log4j.jar:$APPDIR/lib/Console.jar" create_world "$@"
