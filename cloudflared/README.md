# Cloudflared Argo Tunnel Setup Guide

## 1. Create App Folder and set permissions

```bash
mkdir -p $HOME/docker/appdata/cloudflared/ && chmod -R 777 $HOME/docker/appdata/cloudflared/
```

## 2. Authorise Cloudflared

```bash
docker run -it --rm -v $HOME/docker/appdata/cloudflared:/home/nonroot/.cloudflared/ cloudflare/cloudflared:latest tunnel login
```

It will print out a link to Cloudflare. Put this link in your web browser, and select which domain you want to use. Then, the daemon will automatically pull the certificate as `cert.pem` file in `$HOME/docker/appdata/cloudflared` folder.

## 3. Create a Tunnel

Now we need to create a tunnel.

```bash
docker run -it --rm -v $HOME/docker/appdata/cloudflared:/home/nonroot/.cloudflared/ cloudflare/cloudflared:latest tunnel create TUNNELNAME
```

This will create your tunnel's `UUID.json` file in `$HOME/docker/appdata/cloudflared`, which contains a secret used to authenticate your tunnelled connection with Cloudflare.

Make sure you copy your UUID, as this will be used in later steps. It can always be found later by the name of the JSON file.

## 4. Create a Tunnel Configuration File

Now we need to create a configuration file for our tunnel. This will be used to tell Cloudflared what to do with the tunnel.

Create a file called **`config.yml`** in `$HOME/docker/appdata/cloudflared` and paste the following into it:

```yaml
tunnel: UUID
credentials-file: /home/nonroot/.cloudflared/UUID.json

### NOTE: You should only have one ingress tag, so if you uncomment one block comment the others ###
# Forward all traffic to Reverse Proxy w/ SSL
ingress:
  - service: https://REVERSEPROXYIP:PORT
    originRequest:
      originServerName: reverse.yourdomain.com
  # create the required catch all rule for if something doesn’t match the info we entered above. We will tell it to serve a 404 page.
  - service: http_status:404
```
