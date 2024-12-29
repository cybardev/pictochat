# PictoChat

Pictochat for the Nintendo DS & DSi, recreated for browsers!

## In-app commands

- `!block` / `!ignore` / `!unblock` / `!unignore` - Hide/unhide the messages of someone temporarily.
- `!tripcode` / `!tc` - When provided with a password, will generate a tripcode and send it as the server. Used for verification that someone is who they say they are.
- `!list` / `!l` - Lists online users.

## Discord commands

- `!list` / `!l` - Lists online users.

## Usage

- `[RECOMMENDED]` run your own instance by forking this repo and deploying the [`render.yaml`](./render.yaml) file as a [Render Blueprint](https://render.com/docs/infrastructure-as-code).
- demo instance: <https://pictochat.cybar.dev>

## Self hosting

You will need:

- Docker

Build a Docker image from the [Dockerfile](./Dockerfile) and run the container using the following commands:

```sh
docker build . -t cybardev/pictochat:latest
docker run -d --name pictochat -p 80:8080 cybardev/pictochat:latest
```

And navigate to [`http://0.0.0.0:80`](http://0.0.0.0:80) in a browser.

> [!NOTE]
> You can change `80` to any other number to run the service on that port.

### Making tripcodes unique

To make tripcodes unique and reduce the risk of cracking, in the [`settings.json`](./src/main/resources/settings.json) file, set the `tripcode_secret` to something unique and do not share it.

### The captcha

To use the captcha, set the `secret` in the [`settings.json`](./src/main/resources/settings.json) to your Cloudflare Turnstile captcha secret.
To disable the captcha entirely, edit the `www/index.html` file and search for `let token = false;` and change it to `let token = true;`. Then, remove or comment out the `<div id="captcha" ...` element and the `<script src="https://challenges.cloudflare.com/ ...` element.

> [!IMPORTANT]
> Rebuild and rerun container each time you change the [`settings.json`](./src/main/resources/settings.json) file.
