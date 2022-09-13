#!/bin/bash
#
# NB A and T require a SPINE_MTH responder not a SPINE_ITKTrunk_Host responder (default)
# sends a Spine PDS simple trace or advanced trace request
# full log appears in transmitter_sent_messages
# sync responses in simulator_saved_messages/Sync
# async responses in simulator_saved_messages/EbXml and stdout
#

# TKWX ?
X=-x

# usage ./transmit.sh (A|T|R) [(mth|opentest) [N]] 

TARGET=mth
#TARGET=opentest

case $# in  
	1)
		message=$1
	;;
	2)
		message=$1
		TARGET=$2
	;;
	3)
		message=$1
		TARGET=$2
		X=
	;;
	*)
		echo  "usage: $0"' (A|T|R) [(mth|opentest) [N]]'
		exit 1
	;;
esac

case $message in  
	A)
	# advanced trace async response to stdout urn:nhs:names:services:pdsquery/QUPA_IN000006UK02
	PROPS=tkwClient"$X"_"$TARGET"_pds_advtrace.properties
	;;

	T)
	# simple trace urn:nhs:names:services:pdsquery/QUPA_IN000005UK01
	PROPS=tkwClient"$X"_"$TARGET"_pds.properties
	;;

	R)
	# ITK trunk (deprecated)
	PROPS=tkwClient"$X".properties
	;;
esac

#OPTIONS=-Djavax.net.debug=all

java $OPTIONS -jar ../../TKW"$X".jar -transmit $PROPS
