FROM ubuntu:18.04
WORKDIR /root
COPY . /book
RUN apt update
RUN apt install build-essential curl -y
RUN apt install file -y
RUN apt install asciinema -y
RUN apt install unzip -y
RUN apt install vim -y
RUN apt install nano -y
RUN apt install git -y
RUN apt install libssl-dev -y
RUN apt install zlib1g-dev -y

ENV SSL_VERSION=1.0.2s

RUN curl https://www.openssl.org/source/openssl-$SSL_VERSION.tar.gz -O && \
    tar -xzf openssl-$SSL_VERSION.tar.gz && \
    cd openssl-$SSL_VERSION && ./config && make depend && make install && \
    cd .. && rm -rf openssl-$SSL_VERSION*

ENV OPENSSL_LIB_DIR=/usr/local/ssl/lib \
    OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
    OPENSSL_STATIC=1

RUN curl -sSf sh.rustup.rs | sh -s -- -y
RUN echo "export PATH=~/.cargo/bin:$PATH" >> ~/.bashrc
RUN echo "export PS1='\u:\w$ '" >> ~/.bashrcRUN useradd -ms /bin/bash rust

# RUN cargo install mdbook
# RUN cargo install mdbook-latex

# RUN cd book; make build; cd -
