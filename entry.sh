#!/bin/bash
case "$1" in
    bash)
         echo "Running shell"
         /bin/bash
         ;;
    *)
         echo "Running wrk"
         /opt/wrk/wrk
         ;;
esac
exit $?

