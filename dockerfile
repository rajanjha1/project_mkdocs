#Take alpine as the base image
FROM alpine
MAINTAINER rajan_jha
#Install mkdocs and other libraries
RUN \
    apk add --update \
    bash \
    python3 \
    python3-dev \
    build-base  && \
    pip3 install --upgrade pip && \
    pip install mkdocs

RUN mkdir -p /mkdocs
#RUN ln -s /project_mkdocs /mkdocs
WORKDIR /mkdocs


ENTRYPOINT ["./mkdockerize.sh"]

