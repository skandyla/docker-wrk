#!/bin/bash
case "$1" in
    bash)
         echo "Running shell"
         /bin/bash 
         ;;
    *)
         echo "Wrk:"
         /opt/wrk/wrk $@
         ;;
esac
exit $?

