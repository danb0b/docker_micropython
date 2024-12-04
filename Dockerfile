FROM ubuntu:24.04
WORKDIR /work
RUN apt update && apt install -y build-essential libffi-dev git pkg-config
RUN git clone https://github.com/micropython/micropython
WORKDIR /work/micropython
RUN git checkout -b dev
WORKDIR ports/unix
RUN make submodules
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y python3
RUN make
RUN make install
EXPOSE 5000
