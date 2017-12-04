#!/bin/bash
######
# Script to do setup local git repo and remote with github 
#####

#Path to git binary
GIT=/usr/local/bin/git

#GitHub user - hard set
GITUSER=pabluniu

#Repo name as first argument - if not provided get name of current dir
REPONAME=$1

if [ -z $1 ]
	then
		REPONAME=$(/usr/bin/basename $(/bin/pwd))
		/bin/echo "No argumment supplied - repo name will be \"$REPONAME\""
	fi
	
/bin/echo "# $REPONAME" >> README.md
$GIT init
$GIT add README.md
$GIT commit -m "first commit for $REPONAME"
$GIT remote add origin git@github.com:$GITUSER/$REPONAME.git
$GIT push -u origin master
