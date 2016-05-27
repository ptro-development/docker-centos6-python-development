#!/bin/bash

# $1 - directory path to end scripts

echo -e "About to execute scripts from *$1* directory in alphabetical order.\n"

for SCRIPT_NAME in `ls "$1"`
do
    echo "START of ${SCRIPT_NAME}"
    chmod +x $1/${SCRIPT_NAME}
    $1/${SCRIPT_NAME}
    echo -e "END of ${SCRIPT_NAME}\n"
done
