FROM node:current-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Uncomment the next line to use this Dockerfile on your own app
#run npm install
RUN apk add --no-cache python3 alpine-sdk
RUN npm install --only=dev --ignore-scripts
RUN npm rebuild --verbose sharp

# Copy the session data over to the container
# Bundle app source
COPY . .

EXPOSE 8080

CMD ["npm", "run", "start"]
