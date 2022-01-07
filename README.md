# wa-automate-docker

This repo shows a simple way to create a memory efficient API out of your WhatsApp account using docker.

## Instructions

```bash
> docker run [ ... docker flags] --init openwa/wa-automate [... cli flags]
```

It is important to add the `--init` flag to make sure zombie processes are garbage collected properly

The default internal port is 8080. Set `-e PORT=3000` in the `docker flags` section to set the internal port to `3000`.

For example:

```bash
# For a multi-device session
> docker run -p 8080:8080 --init openwa/wa-automate --multi-device

# Legacy session with a pre-set session data via env var. Custom webhook & socket mode enabled for easy integration with node-red
> docker run -e WA_SESSION_DATA=... -p 8080:8080 --init openwa/wa-automate -w https://webhook.site.... --socket
```

See here for more information on [cli flags - https://github.com/open-wa/wa-automate-nodejs/blob/82ecae471e9cdf0013b81f53c2f83d2b33d6fa42/src/cli/setup.ts#L27](https://github.com/open-wa/wa-automate-nodejs/blob/82ecae471e9cdf0013b81f53c2f83d2b33d6fa42/src/cli/setup.ts#L27)
