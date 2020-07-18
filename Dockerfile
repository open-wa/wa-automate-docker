FROM node:current-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./


RUN npm install
RUN npm rebuild --verbose sharp
RUN npm install --only=dev
# If you are building your code for production
# RUN npm ci --only=production

# Copy the session data over to the container
# Bundle app source
COPY . .

EXPOSE 8080

# RUN sh ./install.sh npx node-10-alpine $HOME/bin
# Comment out the next line if you just want to use the npx easy api
# CMD [ "ts-node", "index.ts" ]

#Uncomment the next line if you want to use the npx no-install API. Using --in-docker will allow the service to infer config variables from the environment.
CMD ["npm", "run", "api"]
# RUN npm run api
# CMD ["npx", "@open-wa/wa-automate","--in-docker", '-p', '8080', '--npm-options=--ignore-scripts']
# RUN npx wa-automate --in-docker -p 8080 --npm-options=--ignore-scripts