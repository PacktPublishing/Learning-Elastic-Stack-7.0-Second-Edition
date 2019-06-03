for WORD in `cat sensor_data.json`
do
   echo $WORD
   curl -XPOST -u sensor_data:sensor_data --header "Content-Type: application/json" "http://localhost:8080/" -d ''$WORD''
done
