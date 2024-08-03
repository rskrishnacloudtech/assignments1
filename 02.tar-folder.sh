#!/bin/bash

# Forming a time stamp
timestamp=$(date +%F-%H-%M-%S)
fromFolder=/home/ec2-user/fromfolder/
toFolder=/home/ec2-user/tofolder/
tarFileName="file-backup-$timestamp.tar.gz"

tar cvzf "$toFolder/$tarFileName" $fromFolder

