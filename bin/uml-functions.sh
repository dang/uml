#
# Common bash functions for the UML scripts
#

die() {
	echo "$@"
	if [ ! -z `declare -F | grep "UMLcleanup"` ]; then
		UMLcleanup
	fi
	exit 1
}

usage() {
	echo "`basename $0` $@"
	exit 1
}
