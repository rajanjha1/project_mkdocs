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
COPY test_project1/ /mkdocs
ADD mkdockerize.sh /mkdocs
WORKDIR /mkdocs

EXPOSE 8000

ENTRYPOINT ["./mkdockerize.sh"]

CMD ["serve", "--dev-addr=0.0.0.0:8000"]
