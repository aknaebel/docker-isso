# docker-isso

## Description:

This docker image provide a [isso](https://posativ.org/isso/) service based on [Alpine Linux](https://hub.docker.com/_/alpine/)

## Usage:
```
docker run --name bind -d -p 8080:8080 \
-v /isso/isso.conf:/opt/isso/isso.conf \
-v /isso/data:/opt/issodb \
--restart=always aknaebel/isso
```

## Docker-compose:
``` 
version: '2'
services:
    isso:
        image: aknaebel/isso
        ports:
            - "8080:8080"
        volumes:
            - /isso/isso.conf:/opt/isso/isso.conf
            - /isso/data:/opt/issodb
        restart: always 
```

```
docker-compose up -d
```

## Isso stuff

### Minimal isso.conf
``` 
[general]
dbpath = /opt/issodb/comments.db
host = https://example.tld/
[server]
listen = http://0.0.0.0:8080
```

### environment variable:

The image use an environment variable (``ISSO_SETTINGS``) to define the path to isso.conf (see https://posativ.org/isso/docs/configuration/server/)

The default value of ``ISSO_SETTINGS`` is **/opt/isso/isso.conf**
