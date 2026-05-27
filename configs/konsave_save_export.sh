#/bin/bash
DATE="$(date +\"%Y-%m-%d-%H-%M-%S\")"
git pull
PROFILE_NAME="kde_plasma_cachy_os"
echo $PROFILE_NAME
rm $PROFILE_NAME.knsv
konsave -s $PROFILE_NAME -f
konsave -e $PROFILE_NAME
#git add -A 
#$PROFILE_NAME.knsv
git commit -am "update konsave $DATE"
git push -u origin HEAD
