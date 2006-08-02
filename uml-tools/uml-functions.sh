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
	local myusage;
	if [ -n "${USAGE}" ]; then
		myusage=${USAGE}
	else
		myusage="No usage given"
	fi
	if [ -n "$1" ]; then
		echo "$@"
	fi
	echo "`basename $0` ${myusage}"
	if [ -n "${LONGUSAGE}" ]; then
		echo -e "${LONGUSAGE}"
	fi
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


#
# Script template:

##!/bin/bash
##
## Script that does something
##
#
## Set usage output
#USAGE="[-hk] [-f <file>] [<directories>]"
#LONGUSAGE="\t-h\tPrint this help message
#\t-k\tKernel database (no system includes)
#\t<directories>\tDirectories to scan (defaults to '.')"
#
## Standard functions
#source ~/bin/scripts/functions.sh
#
## Parse arguments
#while getopts ":hkf:" option; do
#	case ${option} in
#		k ) KERNEL="yes";;
#		f ) FILE=${OPTARG};;
#		h ) usage;;
#		\? ) usage "Invalid argument ${OPTARG}";;
#		* ) usage "Invalid argument ${option}";;
#	esac
#done
#
#if [ "${OPTIND}" != "0" ]; then
#	shift $((OPTIND-1))
#fi
#
# Remaining arguments are in $1, $2, etc. as normal
