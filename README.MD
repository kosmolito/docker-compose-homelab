# Docker Compose project for homelab

## Description

This project is a docker-compose project for my homelab. It is a collection of services that I use on a daily basis. It is not meant to be a one-size-fits-all solution, but rather a starting point for others to build upon.

I have tried to make the project as dynamic as possible, so that it can be used on different platforms and with different configurations. This is achieved by using environment variables and a `.env` file.

## Features

- [x] Dynamic configuration using environment variables
- [X] No hardcoded secrets in the repository

## Services

- [Adminer](https://www.adminer.org/) - Database management UI
- [ChangeDetection](https://www.changedetection.com/) - Website change detection
- [Duplicati](https://www.duplicati.com/) - Backup
- [Nextcloud](https://nextcloud.com/) - Cloud storage
- [Portainer](https://www.portainer.io/) - Docker management UI
- [Traefik](https://traefik.io/) - Reverse proxy
- [Bookstack](https://www.bookstackapp.com/) - Wiki
- [Cloudflared-argo-tunnel](https://developers.cloudflare.com/argo-tunnel/) - Tunnel to expose services to the internet
- [Dashy](https://dashy.to/) - Dashboard
- [Gluetun](https://github.com/qdm12/gluetun) - VPN client
- [Hugo](https://gohugo.io/) - Static site generator
- [MariaDB](https://mariadb.org/) - Database
- [pgadmin](https://www.pgadmin.org/) - Database management UI
- [Photoprism](https://photoprism.app/) - Photo management
- [Plex](https://www.plex.tv/) - Media server
- [Postgres](https://www.postgresql.org/) - Database
- [Qbittorrent](https://www.qbittorrent.org/) - Torrent client
- [Radarr](https://radarr.video/) - Movie management
- [Redis](https://redis.io/) - In-memory data structure store
- [Unifi](https://www.ui.com/software/) - Network management
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden) - Bitwarden compatible password manager

### Setup

- #### Clone the repository and cd into it

    ```bash
    git clone https://github.com/kosmolito/docker-compose-homelab.git
    cd docker-compose-homelab
    ```

- #### If Docker is not installed

    The `install-docker.sh` script (*provided in this repo*) will install Docker and Docker Compose on Ubuntu 22.04.

    ```bash
    chmod +x install-docker.sh
    ./install-docker.sh
    ```

- #### 3. Create a `.env` file in the root of the repository. See `sample-config.env.example` for an example

### Usage

#### Run `docker-compose` to start the services

```bash
# Simple nginx webserver for testing purposes
# The port 8899 is exposed in the docker-compose.yml file
docker compose --env-file .env -f nginx-webserver/docker-compose.yml up -d
```
