FROM alpine
RUN \
    apk add --update \
        bash \
        git \
	gcc \
	python3 \ 
        python3-dev \
	build-base  && \
    pip3 install --upgrade pip && \
    pip install mkdocs
EXPOSE 8080
CMD ["mkdocs", "serve"]
