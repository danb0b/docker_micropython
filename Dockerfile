FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /work
RUN apt update && apt install -y build-essential libffi-dev git pkg-config python3
RUN git clone https://github.com/micropython/micropython
WORKDIR /work/micropython
RUN git checkout -b dev
WORKDIR ports/unix
RUN make submodules && make && make install

EXPOSE 5000
