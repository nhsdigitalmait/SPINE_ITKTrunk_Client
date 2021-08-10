#!/bin/bash
#
# NB A and T require a SPINE_MTH responder not a SPINE_ITKTrunk_Host responder (default)
# sends a Spine PDS simple trace or advanced trace request
# full log appears in transmitter_sent_messages
# sync responses in simulator_saved_messages/Sync
# async responses in simulator_saved_messages/EbXml
#
case $1 in  
	A)
	PROPS=tkwClient_mth_pds_advtrace.properties
	;;

	T)
	# simple trace
	PROPS=tkwClient_mth_pds.properties
	;;

	*)
	# ITK trunk
	PROPS=tkwClient.properties
	;;
esac

java -jar ../../TKW.jar -transmit $PROPS
