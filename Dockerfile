FROM ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc-mingw-w64-i686 \ 
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/i686-w64-mingw32-gcc /usr/bin/gcc

ENV GOLANG_VERSION 1.13.4

RUN wget https://dl.google.com/go/go${GOLANG_VERSION}.linux-386.tar.gz \
    && tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-386.tar.gz \
    && rm go${GOLANG_VERSION}.linux-386.tar.gz

ENV CGO_LDFLAGS=-Wl,--kill-at \
    CGO_ENABLED=1 \
    GOOS=windows \
    GOARCH=386 \
    GOPROXY=https://goproxy.cn

WORKDIR /home
CMD /usr/local/go/bin/go build -ldflags "-s -w" -buildmode=c-shared -o app.dll