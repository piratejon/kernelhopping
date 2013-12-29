#!/bin/bash

dork_replace() {
	HEADER_FILE=${1}
	OLD=${2}
	NEW=${3}
	
	grep -q ^${OLD}: ${HEADER_FILE} 2>/dev/null && grep ^${OLD}: ${HEADER_FILE} | sed -e "s/[ \t\r\n]*\$//" -e "s/^${OLD}: \(.*\)/-H '${NEW}: \1'/"
}

MAIN_OPTIONS="-D response_headers -o response_body -s https://www.kernel.org/"
ETAG=`dork_replace response_headers ETag If-None-Match`
LAST_MODIFIED=`dork_replace response_headers Last-Modified If-Modified-Since`

echo curl ${ETAG} ${LAST_MODIFIED} ${MAIN_OPTIONS}

