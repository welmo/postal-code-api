#!/bin/bash

EXTRACT="[12][0-9][0-9]"

HOME=$(cd $(dirname $0); pwd)/../
POSTAL_CODE=$HOME/api/v1

while read LEFT
do
	while read RIGHT
	do

		cat $POSTAL_CODE/$LEFT/$RIGHT.json

	done < <(
	ls $POSTAL_CODE/$LEFT |
	sed -E "s/\.json//g"
	)
done < <(
ls $POSTAL_CODE |
grep -E "$EXTRACT"
)
