# Based on the work by [@nervousapps](https://github.com/nervousapps/haDOCKERaddons/tree/master/silabs-multiprotocol/dockerCustom)

# Silabs multiprotocol for HA docker installation

This container is a dockerized version of the [Silicon Labs multiprotocol addon for HAOS](https://skyconnect.home-assistant.io/procedures/enable-multiprotocol/).

Basically changed s6-overlay scripts, delete `bashio` and add missing `bashlog`.

# Setup

To use this with Zigbee2MQTT, start the container and then in the configuration.yaml file of Zigbee2MQTT use this port configuration:

```
serial:
  port: tcp://host_ip:20108
  adapter: ezsp
```

Restart Zigbee2MQTT.
It might take a couple of tries for Zigbee2MQTT to connect the first time but it will work without issues afterwards.

## Update

1. down the newer firmware from https://github.com/NabuCasa/silabs-firmware/tree/main/RCPMultiPAN/beta
2. place them into `~/multipan/firmware/` (if your `/data` Volume mounted to `~/multipan/`)
3. change the environment variable `FIRMWARE` to the new FIlename (wihtout path)
4. change the environment variable `AUTOFLASH_FIRMWARE` to `1`
5. redeploy your container

## Pre-requirements

- docker installed
- docker-compose installed

## Deploy

```
docker-compose up -d
```

## Uninstall

```
docker-compose down
```
