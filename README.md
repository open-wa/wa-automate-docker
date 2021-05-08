# wa-automate-docker

This repo shows a simple way to create a memory efficient API out of your WhatsApp account using docker.

## How to deploy the ready-made API

There are a few steps you have to follow in order to get started.

1. Clone the repo
2. Create a session.data.json file
3. Build and deploy the containers.

Let's get started.

1. Clone the repo

    ```bash
    > git clone https://github.com/open-wa/wa-automate-docker.git && cd wa-automate-docker
    ```

2. Create a session.data.json file

    In order to make sure you have a persistent session, you should create the session.data.json file (the super sensitive file which contains all data required to authenticate the session) outside the container intially. You could also just copy and paste an existing `session.data.json` file.

    The quickest way to do this after cloning the repo, run the following code:

    ```bash
    > npm run sessiondata
    ```

    After scanning the QR code, a session.data.json file will be saved to the folder. Make sure to keep this safe and leave it in this folder. You can end the process when the session data is saved.

    Note: The file MUST BE NAMED `session.data.json`

3. Build and deploy the containers

    First of all, make sure you have docker and docker-compose installed. Then run the following command in the folder.

    ```bash
    > docker-compose up --build -d
    ```

## How to use this on your own app

It's very simple to use this efficient docker setup on your own custom app made with [@open-wa/wa-automate-nodejs](https://github.com/open-wa/wa-automate-nodejs).

1. Copy [Dockerfile](https://github.com/open-wa/wa-automate-docker/blob/master/Dockerfile) and [docker-compose.yaml](https://github.com/open-wa/wa-automate-docker/blob/master/docker-compose.yaml) into the top level of your project folder (next to package.json).
2. Uncomment line 12 in [Dockerfile](https://github.com/open-wa/wa-automate-docker/blob/master/Dockerfile) to install the required dependencies for your app.

3.  
    When you're ready, run:

    ```bash
    > docker-compose up --build -d
    ```

## Set Session Data as an Environment Variable

As of [@open-wa/wa-automate-nodejs](https://github.com/open-wa/wa-automate-nodejs) version 2.0.0, it is now possible to set the session data as an environment variable `WA_SESSION_DATA` string.

For more updates on the features of this docker set up please star [the NodeJS library](https://github.com/open-wa/wa-automate-nodejs).
