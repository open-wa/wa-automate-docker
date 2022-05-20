#!/bin/bash 
echo "Starting the application"
echo $@
if [[ $@ == *"--always-latest"* ]]; then
  eval "PUPPETEER_SKIP_DOWNLOAD=true npm i @open-wa/wa-automate@latest --ignore-scripts"
fi
exec node ./node_modules/@open-wa/wa-automate/bin/server.js $@