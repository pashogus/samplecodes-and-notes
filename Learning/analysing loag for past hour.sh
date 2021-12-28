INPUT_FILE="coudwords.log"
TIME_INTERVAL=1
DATE_ONE_HOUR=$(date -d '${TIME_INTERVAL} hour ago')
DATE_EXTRACTED=$DATE_ONE_HOUR +%F
HOUR_EXTRACTED=$DATE_ONE_HOUR +%l
FAILURE_DELETION="Failure deleting unattached asset"
SYNC_ISSUE="sync issue"

grep "$DATE_EXTRACTED 0[$HOUR_EXTRACTED]"  $INPUT_FILE >> temp.log
while read line
do
grep $FAILURE_DELETION $line
if [ "$?" -eq 0]
then 
echo "error in deleting assets in WCS :" $line
fi
grep $SYNC_ISSUE $line
if [ "$?" -eq 0 ]
then
echo "error in sync to WCS :" $line
fi
done < temp.log

rm -v temp.log

