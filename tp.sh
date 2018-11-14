#!/bin/bash
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
	echo "error: Wrong parameter. Threshold must be an integer"; exit 1
else
	java net.sf.saxon.Query SOquery.xq threshold=$1 > intermediate.xml
	java net.sf.saxon.Transform -s:intermediate.xml -xsl:create_page.xsl -o:output.html threshold=$1
fi
