#!/bin/bash
case "$1" in
    bash)
         echo "Running shell"
         /bin/bash 
         ;;
    *)
         echo "Wrk:"
         /usr/local/bin/wrk $@
         ;;
esac
exit $?

