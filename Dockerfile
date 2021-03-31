#
# Dockerfile for fritzcap

# Build:
# docker build -t ralph/fritzcap-docker .

# Example usage:

# export USERNAME="fritz123"
# export PASSWORD="secret"
# export BOX_NAME="192.168.178.1"
# ❯ docker run --mount type=bind,source="$(pwd)",target=/captures --rm -it fritzcap-docker -c -d -m --username=${USERNAME} --password ${PASSWORD} --box_name ${BOX_NAME}
# 2021-03-31 12:31:03,708 - FritzCap version 2.3.1 started.
# 2021-03-31 12:31:03,710 - Connect    to the call monitor service on 192.168.178.1:1012.
# 2021-03-31 12:31:03,713 - Connected  to the call monitor service on 192.168.178.1:1012.
# ...

# See https://github.com/jpluimers/fritzcap#help for all cli switches.

FROM alpine

ENV VERSION 2.3.1

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          curl \
                          gzip \
                          python2 \
                          tar

RUN mkdir /captures

RUN curl -L https://github.com/jpluimers/fritzcap/archive/v${VERSION}.tar.gz \
  | tar -xz && mv fritzcap-${VERSION} fritzcap
WORKDIR fritzcap

ENTRYPOINT ["/usr/bin/python", "fritzcap.py", "--cap_folder", "/captures"]
