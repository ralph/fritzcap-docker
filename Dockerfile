#
# Dockerfile for fritzcap
# Usage:
# docker container run -e BOX_NAME='192.168.178.1' -e PASSWORD='secret' <imageId>
#

FROM alpine

ENV VERSION 2.3.1

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          curl \
                          gzip \
                          python \
                          tar

RUN curl -L https://github.com/jpluimers/fritzcap/archive/v${VERSION}.tar.gz \
  | tar -xz && mv fritzcap-${VERSION} fritzcap

WORKDIR fritzcap

CMD ["sh", "-c", "python fritzcap.py -c -d -m -p ${PASSWORD} --box_name ${BOX_NAME}"]
