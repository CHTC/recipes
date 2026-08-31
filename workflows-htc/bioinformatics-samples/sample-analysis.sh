#!/bin/bash

# Set the sample id: 
SAMPLEID=$1
# if you used the option with a lane argument
# uncomment to set the lane value: 
# LANE=$2

# build up the filenames - edit this to match
# the filenames you have! 
READ1=${SAMPLEID}_R1_001.fastq
READ2=${SAMPLEID}_R2_001.fastq

# insert any needed software setup here, if relevant

# run your program 
# (replace 'head' with your analysis pipeline)
head ${READ1}
head ${READ2}
