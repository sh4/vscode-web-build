FROM ubuntu:20.04

# Install toolchain and dependencies
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl \
        git \
        zip \
        build-essential \
        g++ \
        libx11-dev \
        libxkbfile-dev \
        libsecret-1-dev \
        python-is-python3 \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

# Install node.js and yarn
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        nodejs \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && npm install --global yarn

COPY build.sh ./

CMD ["./build.sh"]
