# Silabs multiprotocol for HA docker installation

This container is a dockerized version of the [Silicon Labs multiprotocol addon for HAOS](https://skyconnect.home-assistant.io/procedures/enable-multiprotocol/).

![](https://img.shields.io/github/license/b2un0/silabs-multipan-docker.svg)
![](https://img.shields.io/github/stars/b2un0/silabs-multipan-docker)
![](https://img.shields.io/docker/pulls/b2un0/silabs-multipan-docker.svg)
![](https://img.shields.io/docker/stars/b2un0/silabs-multipan-docker.svg)
![](https://img.shields.io/docker/image-size/b2un0/silabs-multipan-docker.svg)
![](https://github.com/b2un0/dcled/workflows/container/badge.svg)

## Credits

Based on the work by [@nervousapps](https://github.com/nervousapps/haDOCKERaddons/tree/master/silabs-multiprotocol/dockerCustom)
and [m33ts4k0z](https://github.com/m33ts4k0z/silabs-multipan-docker)

## getting started

### as docker run

change `DEVICE` and `BACKBONE_IF` if necessary

```bash
docker run --name multipan \
            --detach \
            --privileged \
            --network host \
            --restart unless-stopped \
            --volume ~/multipan/:/data \
            --env DEVICE="/dev/ttyUSB0" \
            --env BACKBONE_IF="eth0" \
            b2un0/silabs-multipan-docker:latest
```

### as docker compose

1. download the [docker-compose.yml](docker-compose.yml) or copy the service to your existing one
2. change the config in `environment` if necessary
2. run `docker compose up -d`

## Setup OpenThread Border Router

open in your browser `http://HOST:8086` and configure your OTBR

## Setup Zigbee2MQTT

To use this with Zigbee2MQTT change the `configuration.yaml` file of Zigbee2MQTT to this configuration:

```yaml
serial:
  port: tcp://host_ip:20108
  adapter: ezsp
```

Restart Zigbee2MQTT.
It might take a couple of tries for Zigbee2MQTT to connect the first time but it will work without issues afterwards.

### Firmware Update

1. download the newer firmware from https://github.com/NabuCasa/silabs-firmware/tree/main/RCPMultiPAN/beta
2. place them into your local directory `~/multipan/firmware/` (if your `/data` Volume mounted to `~/multipan/`)
3. change the environment variable `FIRMWARE` to the new Filename (without path)
4. change the environment variable `AUTOFLASH_FIRMWARE` to `1`
5. redeploy your container
