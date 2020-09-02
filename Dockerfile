FROM ubuntu:18.04
WORKDIR /usr
COPY . /book
RUN apt-get update
RUN apt install -y build-essential curl make apt-utils
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#RUN apt install -y cargo

# RUN export PATH=$PATH:/usr/.cargo/bin

# RUN cargo install mdbook
# RUN cargo install mdbook-latex

# RUN cd book; make build; cd -
