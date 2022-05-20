#!/bin/bash 
if [[ $@ == *"--always-latest"* ]]; then
  eval "PUPPETEER_SKIP_DOWNLOAD=true npm i @open-wa/wa-automate@latest && npm clean cache --force"
fi
eval node ./node_modules/@open-wa/wa-automate/bin/server.js $@