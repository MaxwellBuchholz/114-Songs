#!/bin/bash
# There's proably a better way to do this but it works.


if  [[ $1 = "-f" ]]; then
	MSCZ="$2"

	PDF=$( echo $MSCZ | sed 's/.mscz/.pdf/')
	PDF=$( echo $PDF | sed 's/MuseScore/pdf/')

	mscore -o $PDF $MSCZ

elif  [[ $1 = "-a" ]]; then
	for MSCZ in MuseScore/*.mscz; do

		PDF=$( echo $MSCZ | sed 's/.mscz/.pdf/')
		PDF=$( echo $PDF | sed 's/MuseScore/pdf/')

		mscore -o $PDF $MSCZ
	done

elif  [[ $1 = "-c" ]]; then
	#TODO:	- Combine with multiple scores on the same page (e.g. Cradle song and La Fede)
	#	- Add title and end pages

	pdfunite pdf/*.pdf 114-songs.pdf

else
	echo "Usage:"
	echo "  -f [FILE]"
	echo "     Selects mscz file to convert to pdf"
	echo "  -a"
	echo "     Converts all mscz files to pdfs"
	echo "  -c"
	echo "     Combines all pdf files into one pdf"
fi
