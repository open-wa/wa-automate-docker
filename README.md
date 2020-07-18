# wa-automate-docker

This repo shows a simple way to create a memory efficient API out of your WhatsApp account using docker.

## How to

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
    > npm run api
    ```

    After scanning the QR code, a session.data.json file will be saved to the folder. Make sure to keep     this safe and leave it in this folder.

    Note: The file MUST BE NAMED `session.data.json`

3. Build and deploy the containers

    First of all, make sure you have docker and docker-compose installed. Then run the following command in the folder.

    ```bash
    > docker-compose up --build
    ```
