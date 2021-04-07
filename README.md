# fritzcap-docker
Dockerized version of jpluimers/fritzcap

Get it from Dockerhub:
https://hub.docker.com/repository/docker/ralph/fritzcap-docker

You can use the included docker-compose.yml file as a starting point.

Or you can run the image manually:

```
# export USERNAME="fritz123"
# export PASSWORD="secret"
# export BOX_NAME="192.168.178.1"
# ❯ docker run --mount type=bind,source="$(pwd)",target=/captures --rm -it fritzcap-docker -c -d -m --username=${USERNAME} --password ${PASSWORD} --box_name ${BOX_NAME}
# 2021-03-31 12:31:03,708 - FritzCap version 2.3.1 started.
# 2021-03-31 12:31:03,710 - Connect    to the call monitor service on 192.168.178.1:1012.
# 2021-03-31 12:31:03,713 - Connected  to the call monitor service on 192.168.178.1:1012.
# ...
```

See https://github.com/jpluimers/fritzcap#help for all cli switches.
