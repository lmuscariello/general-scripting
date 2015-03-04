#!/bin/bash


function msleep() {
	./millisleep
}

function lsleep() {
	msleep
	msleep
	msleep
	msleep
	msleep
	msleep
	msleep
}

function type() {

	lsleep
	STRL="${#1}"
	let STRL=STRL-1
	#echo "STRL is: $STRL"
	for i in `seq 0 $STRL`;
	do
		KEY="${1:${i}:1}"
		#echo "Print key: $KEY"
		msleep
		xdotool type "$KEY"
	done
	
}

function ret() {
	msleep
	xdotool key Return
}


function openNewTab() {

	xdotool key ctrl+shift+t
	if [ ! -z "$1" ];
	then
		xdotool key alt+t
		xdotool key s
		type "$1"
		lsleep
		ret
	fi

}

function cmd() {
	lsleep
	type "$1"
	ret
}

function chdir() {
	cmd "cd $1"
}


setxkbmap it
WID=`xdotool search --class gnome-terminal | head -1`
DEVDIR="/home/lorenzo/dev"
APIDIR="$DEVDIR/fanpage"
BROWDIR="$DEVDIR/fanpage-browser-extensions"
CSDIR="$DEVDIR/fanpage-content-searcher"
YMDIR="$DEVDIR/youmedia"
AWSDIR="/home/lorenzo/Dropbox/CiaoPeople/AWS"

source $AWSDIR/.current

xdotool windowfocus $WID
openNewTab "apiactivator"
chdir $APIDIR
cmd "./activator"

openNewTab "apigit"
chdir "$APIDIR"
lsleep
openNewTab "requestor"
chdir "$APIDIR/shelltools"

openNewTab "browser"
chdir "$BROWDIR"

openNewTab "csearcher"
chdir "$CSDIR"
cmd "./activator"

openNewTab "csearcher-git"
chdir "$CSDIR"

openNewTab "ymlocal"
chdir "$YMDIR"
cmd "./activator"

openNewTab "ymgit"
chdir "$YMDIR"


openNewTab "mongolocal"
cmd "mongo fanpage_mod"

openNewTab "elastione"
chdir "$AWSDIR"
cmd "./fanpage-elasticsearch.sh"

openNewTab "elastitwo"
chdir "$AWSDIR"
cmd "./fanpage-elasticsearch-2.sh"

openNewTab "sftp-elastic"
chdir "$AWSDIR"
cmd "sftp -i cp-data-eu-2014.pem ubuntu@$ELASTICSEARCHONE"

openNewTab "ym-9000"
chdir "$AWSDIR"
cmd "./youmedia.sh"


openNewTab "ym-sftp"
chdir "$AWSDIR"
cmd "./youmedia-sftp.sh"

openNewTab "mongoapi"
chdir "$AWSDIR"
cmd "./ec2-apifanpage-mongodb.sh"
sleep 2
cmd "mongo fanpage"

openNewTab "mongoapi"
chdir "$AWSDIR"
cmd "./ec2-apifanpage-mongodb.sh"
sleep 2
cmd "mongostat"

openNewTab "ym-mongo"
chdir "$AWSDIR"
cmd "./ec2-youmedia-mongo.sh"
sleep 2
cmd "mongo youmedia"

openNewTab "api"
chdir "$AWSDIR"
cmd "./current-api-fanpage.sh"
sleep 2
cmd "sudo -s"

openNewTab "api"
chdir "$AWSDIR"
cmd "./current-api-fanpage.sh"
sleep 2
cmd "sudo -s"
cmd "tail -f /var/log/tomcat8/catalina.out"

openNewTab "api"
chdir "$AWSDIR"
cmd "./current-api-fanpage.sh"
sleep 2
cmd "sudo -s"

