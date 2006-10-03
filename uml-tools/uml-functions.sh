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

# Functions
# Convention: functions set the variable RETVAL to their return value.
# Exit status is 0 on success, non-0 on failure.

# generate_ip4
#
# Compute an IP address from an IP prefix and an offset.  The prefix need not
# have all 4 octets.  Missing octets will be treated as zero.  The offset is
# added to the fourth octet and the resulting IP address is returned
# Arguments:
#	$1	IP prefix
#	$2	Offset
# Return:
#	Generated IP
generate_ip4() {
	if [ -z "$1" ]; then
		echo "generate_ip4() called without a prefix"
		return 1
	elif [ -z "$2" ]; then
		echo "generate_ip4() called without an offset."
		return 2
	fi
	RETVAL=$(echo "$1" | awk -F . -v o=$2 '{print $1+0 "." $2+0 "." $3+0 "." $4+o}' -)
	if [ -z "${RETVAL}" ]; then
		echo "generate_ip4() Could not generate address from $1 $2"
		return 3
	fi
	return 0
}

# getnetdev
#
# Get the network device name for a machine.  If ${NETDEV_${MCH}_${NET} is not
# set, returns "eth${NET}"
#
# Arguments:
#	$1: Machine name
#	$2: Network name
# Return:
#	Name of network device
function getnetdev {
	if [ -z "${1}" ]; then
		echo "getnetdev() called without a machine"
		return 1
	elif [ -z "${2}" ]; then
		echo "getnetdev() called without a network"
		return 1
	fi
	RETVAL=
	CONFNETDEV=NETDEV_${1}_${2}
	if [ -n "${!CONFNETDEV}" ]; then
		RETVAL=${!CONFNETDEV}
	else
		RETVAL="eth${2}"
	fi
	return 0
}

# getdec
#
# Get the unique decimal octet for a machine.  It will be generated, if it's not
# configured, from count.  If count != 0, and DEC_${MACHINE} is set, this is an
# error.
#
# Arguments:
#	$1: Machine name
# Return:
#	Unique decimal octet
function getdec {
	if [ -z "${1}" ]; then
		echo "getdec() called without a machine"
		return 1
	fi
	RETVAL=
	local OCTET=DEC_${1}
	if [ -n "${!OCTET}" ]; then
		if [ "${count}" -ne "0" ]; then
			echo "${1} has configured DEC, but count is not zero!"
			return 2
		fi
		RETVAL=${!OCTET}
	else
		# 0 isn't valid, so pre-increment
		count+=1
		RETVAL=${count}
	fi
	return 0
}

# gethex
#
# Get the unique hex octet for a machine.  If it's not configured, it will be
# generated from the passed-in decimal value.  If count != 0, and HEX_${MACHINE}
# is set, this is an
# error.
#
# Arguments:
#	$1: Machine name
#	$2: Decimal octet (returned from getdec())
# Return:
#	Unique hex octet
function gethex {
	if [ -z "${1}" ]; then
		echo "gethex() called without a machine"
		return 1
	elif [ -z "${2}" ]; then
		echo "gethex() called without a decimal octet"
		return 3
	fi
	RETVAL=
	local OCTET=HEX_${1}
	if [ -n "${!OCTET}" ]; then
		if [ "${count}" -ne "0" ]; then
			echo "${1} has configured DEC, but count is not zero!"
			return 2
		fi
		RETVAL=${!OCTET}
	else
		RETVAL=$(printf "%02x" ${2})
	fi
	return 0
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
