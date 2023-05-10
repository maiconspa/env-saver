#!/bin/env

MESSAGE_CACHING="Caching file..."
CACHE_FOLDER=".cache"
FILE_PATH=$1
ABORT_MESSAGE="Aborting process..."

echo $MESSAGE_CHACHING
echo "file path:" $FILE_PATH

yell () {
	echo "$0: $*" >&2;
}

die () {
	yell "$*"; set -e;
}

try () {
	"$@" || die "$*";
}

# Checking cache folder
if [ -d $CACHE_FOLDER ]; then
	echo "cache folder exists"
else
	echo "cache folder doesn't exists, I'm taking care of this..."
	mkdir $CACHE_FOLDER
fi


# Making file cache
if [ -f $FILE_PATH ]; then
	echo "file exists"
	cat $FILE_PATH > ./$CACHE_FOLDER/.file

	echo "reading cached file: "
	cat ./$CACHE_FOLDER/.file
else
	echo "[error] File doesn't exists. "$ABORT_MESSAGE
	try false # TODO fix
fi

# Comparing file state
# TODO




# Set environment alias
