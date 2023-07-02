# X-UI
**X-UI** is a web panel that supports multi-protocol and multi-user proxy operations.

Brilliant work done by "vaxilu" dockerized by me.

![Made with](https://img.shields.io/badge/Made%20with-Docker%2Fbash-blue)
![Dockerfile](https://img.shields.io/badge/Dockerfile-Ready-darkgreen)
![Docker Compose](https://img.shields.io/badge/Docker_Compose-Ready-darkgreen)
![Cloak version](https://img.shields.io/badge/Cloak_version-2.6.0-purple)
![Docker Build](https://img.shields.io/badge/Docker_Build-Automatic-yellowgreen)

# Usage:

## Docker

Install docker:

```bash
sudo yum install -y yum-utils

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
```

Then start the container:

```bash
docker run -d -p 1234:1234 -e USERNAME="Your Username" -e PASSWORD="Tour Password" PANELPORT="Your Port" xuidocker
```

## docker-compose

Install docker-compose:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

Edit `docker-compose.yml` to your desired settings, then start the container:

```bash
git clone dbbbb && cd dbbbbb
docker compose up -d
```

### Build your own image
```bash
docker build . xuiimage
```

## non-dockerized solution

Check out the main project [x-ui](https://github.com/vaxilu/x-ui) by vaxilu.

# Supported Variables

| Variable | Default value | Description |
| --- | --- | --- |
| USERNAME | `admin` | Username to access the panel. |
| PASSWORD | `admin` | Password to access the panel. |
| PANELPORT | `1234` | The port to access the panel. |

Pass down your desired variables to `docker-compose.yml` file.

Add your desired commands to `main.sh` (script used to config the image.)
