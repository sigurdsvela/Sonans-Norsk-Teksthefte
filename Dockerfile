FROM ubuntu:18.04
WORKDIR /root
RUN apt update
RUN apt install build-essential cmake curl file\
    asciinema unzip git libssl-dev\
    zlib1g-dev autoconf automake autotools-dev\
    libtool xutils-dev ca-certificates file -y

ENV SSL_VERSION=1.0.2s

RUN curl https://www.openssl.org/source/openssl-$SSL_VERSION.tar.gz -O && \
    tar -xzf openssl-$SSL_VERSION.tar.gz && \
    cd openssl-$SSL_VERSION && ./config && make depend && make install && \
    cd .. && rm -rf openssl-$SSL_VERSION*

ENV OPENSSL_LIB_DIR=/usr/local/ssl/lib \
    OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
    OPENSSL_STATIC=1

RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain beta -y

RUN apt install libfreetype6-dev xclip nano vim -y

ENV PATH=/root/.cargo/bin:$PATH

# Install Tectonic
RUN apt install libfontconfig1-dev libgraphite2-dev libharfbuzz-dev libicu-dev zlib1g-dev -y
RUN cargo install tectonic

RUN cargo install mdbook mdbook-latex

COPY . /book


# Infinite Halt
CMD tail -f /dev/null
