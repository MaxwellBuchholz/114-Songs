#!/bin/bash
# Usage: ./convert.sh /MuseScore/file.mscz
# There's proably a better way to do this but it works.

MSCZ="$1"
PDF=$( echo $MSCZ | sed 's/.mscz/.pdf/')
PDF=$( echo $PDF | sed 's/MuseScore/pdf/')

mscore -o $PDF $MSCZ
