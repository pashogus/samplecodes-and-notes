while true
set -X
do 
read -p "1. uptime " CHOICE
case $CHOICE in
 1)
  uptime
  ;;
 *)
  echo "invalid input"
  break
  ;;
ease
done
set +X
  