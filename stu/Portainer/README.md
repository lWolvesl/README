# Portainer

[回到主页](../README.md)

```shell
docker run -d -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce:latest

docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/ru
n/docker.sock:/var/run/docker.sock portainer/portainer-ce:latest
```

## podman 支持

```shell
systemctl --user enable --now podman.socket

podman run -d -p 59443:9443 --security-opt label=disable --name=portainer --restart=always -v /run/user/$(id -u)/podman/podman.sock:/var/r
un/docker.sock:Z -v /data/szh2/podman/portainer:/data  docker.io/portainer/portainer-ce
```

