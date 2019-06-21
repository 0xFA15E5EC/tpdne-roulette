#!/bin/bash
# need moar user agents? https://github.com/N0taN3rd/userAgentLists

while true; do
  FILENAME=$(openssl rand -hex 18)
  USERAGENT=$(cat useragents.txt | sort -R | head -1)
  DELAY=$[ ( $RANDOM % 15 )  + 10 ]
  echo "Fetching a faux rando profile pic!"
  echo "User Agent: $USERAGENT"
  echo "Saved made up person: $FILENAME.jpg"
  echo "Sleeping for $DELAY seconds..."
  echo ""

  wget --no-http-keep-alive -U "$USERAGENT" -q https://thispersondoesnotexist.com/image -O "$FILENAME.jpg" 2>&1 /dev/null
  
  sleep "$DELAY"s
done

