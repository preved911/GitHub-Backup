FROM ubuntu:20.04

RUN apt update \
    && apt install -y python3 python3-venv python3-setuptools git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -m 400 ~/.ssh \
    && echo -n "Host *\n\tUserKnownHostsFile /dev/null\n\tStrictHostKeyChecking no" > ~/.ssh/config \
    && chmod 600 ~/.ssh/config

WORKDIR /app
COPY . .
RUN python3 setup.py install

ENTRYPOINT ["github-backup"]
