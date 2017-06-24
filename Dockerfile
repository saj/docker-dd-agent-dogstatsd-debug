FROM datadog/docker-dd-agent

RUN apt-get update && \
    apt-get install -y \
        curl \
        patch

RUN cd / ; \
curl -Ss https://gist.githubusercontent.com/remh/deed8245ba74784f51de/raw/de858c35e3e1bcfeca167a18483fffde79045ee1/dogstatsd_debug.py.patch | \
patch -p 0

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
