FROM node:current-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./


RUN npm install --only=dev --ignore-scripts
RUN npm rebuild --verbose sharp

# Copy the session data over to the container
# Bundle app source
COPY . .

EXPOSE 8080

#Uncomment the next line if you want to use the npx no-install API. Using --in-docker will allow the service to infer config variables from the environment.
CMD ["npm", "run", "api"]