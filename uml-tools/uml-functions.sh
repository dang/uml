#
# Common bash functions for the UML scripts
#

die() {
	echo "$@"
	if [ ! -z "$(declare -F | grep "UMLcleanup")" ]; then
		UMLcleanup
	fi
	exit 1
}

usage() {
	echo "`basename $0` $@"
	exit 1
}

#
# Compute an IP address from an IP prefix and an offset.  The prefix need not
# have all 4 octets.  Missing octets will be treated as zero.  The offset is
# added to the fourth octet and the resulting IP address is returned
# Parameters:
# $1	IP prefix
# $2	Offset
# Result:
# Variable GENERATE_IP4_RETURN is set to the IP
generate_ip4() {
	if [ -z "$1" ]; then
		die "generate_ip4 Error: no prefix given.  Usage: generate_ip4 <prefix> <offset>"
	fi
	if [ -z "$2" ]; then
		die "generate_ip4 Error: no offset given.  Usage: generate_ip4 <prefix> <offset>"
	fi
	GENERATE_IP4_RETURN=$(echo "$1" | awk -F . -v o=$2 '{print $1+0 "." $2+0 "." $3+0 "." $4+o}' -)
	if [ -z "${GENERATE_IP4_RETURN}" ]; then
		die "generate_ip4 Error: Could not generate address from $1 $2"
	fi
}
