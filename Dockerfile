FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME /root
ENV PYTHONPATH /fastapi_spro
ENV PYTHON_VERSION 3.8.5
ENV PYTHON_ROOT $HOME/local/python-$PYTHON_VERSION
ENV PATH $PYTHON_ROOT/bin:$PATH

RUN mkdir /fastapi_spro \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && apt install -y git curl locales python3-pip python3-dev python3-passlib python3-jwt \
    libssl-dev libffi-dev zlib1g-dev libpq-dev postgresql postgresql-client

RUN echo "ja_JP UTF-8" > /etc/locale.gen \
    && locale-gen

WORKDIR /fastapi_spro
ADD . /fastapi_spro/
RUN LC_ALL=ja_JP.UTF-8 \
    && pip3 install -r requirements.txt
