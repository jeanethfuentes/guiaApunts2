#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Cal indicar un fitxer";
	exit -1;
fi

FILENAME=$1

BASENAME="${FILENAME%.*}"
TEMPLATE="templates/topdf.md";

echo "Executing..."
echo "pandoc $FILENAME --defaults ${TEMPLATE} -o ${BASENAME}.pdf"
pandoc $FILENAME --defaults ${TEMPLATE} -o ${BASENAME}.pdf

ERROR=$?;
if [ ${ERROR} -eq 0 ]; then
	echo "FET."
else
    echo "Eixida amb error ${ERROR}";
	exit ${ERROR}
fi