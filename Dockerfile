# syntax = docker/dockerfile:1.3-labs
FROM node:current-stretch-slim

RUN <<eot bash
  mkdir -p /usr/src/app
  mkdir -p /usr/src/app/node_modules
  mkdir -p /sessions
  apt update
  apt install nano wget --no-install-recommends  -y
  apt upgrade
  cd /tmp
  wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
  rm -rf /var/lib/apt/lists/*
  groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser
  mkdir -p /home/pptruser/Downloads
  chown -R pptruser:pptruser /home/pptruser
  chown -R pptruser:pptruser /usr/src/app
  chown -R pptruser:pptruser /sessions
  chown -R pptruser:pptruser /usr/src/app/node_modules
eot

WORKDIR /usr/src/app

# test with root later
USER pptruser

# skip the puppeteer browser download
ENV PUPPETEER_SKIP_DOWNLOAD true
ENV NODE_ENV production
ENV PORT 8080

# Add your custom ENV vars here:
ENV WA_USE_CHROME true
ENV WA_POPUP true
ENV WA_DISABLE_SPINS true
ENV WA_PORT $PORT
ENV WA_EXECUTABLE_PATH /usr/bin/google-chrome-stable

RUN <<eot bash
  npm i @open-wa/wa-automate@latest
  npm cache clean --force
eot

COPY . /usr/src/app

EXPOSE $PORT

ENTRYPOINT [ "node", "./node_modules/@open-wa/wa-automate/bin/server.js", "--in-docker", "--qr-timeout", "0", "--popup", "--debug"]
