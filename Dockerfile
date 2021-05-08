FROM node:current-stretch

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

#install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list 

RUN apt-get update

RUN apt install google-chrome-stable -y

RUN apt upgrade -y

RUN npm i @open-wa/wa-automate@latest

COPY . /usr/src/app

ENV NODE_ENV production

ENV IN_DOCKER true

# Add your custom ENV vars here:
ENV WA_USE_CHROME true
ENV WA_POPUP true
ENV WA_DISABLE_SPINS true

#PORT will most likely be set by your cloud provider. If not, uncomment the next line and set it here
# ENV PORT 8080

EXPOSE $PORT

CMD [ "npx", "@open-wa/wa-automate", "--use-chrome", " --in-docker", "--port", "$PORT", "--qr-timeout", "0"]
