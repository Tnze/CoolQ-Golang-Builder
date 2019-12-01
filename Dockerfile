FROM golang

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc-mingw-w64-i686 \ 
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/i686-w64-mingw32-gcc /usr/bin/gcc

ENV CGO_LDFLAGS=-Wl,--kill-at \
    CGO_ENABLED=1 \
    GOOS=windows \
    GOARCH=386 \
    GOPROXY=https://goproxy.cn

WORKDIR /home
CMD /usr/local/go/bin/go build -ldflags "-s -w" -buildmode=c-shared -o app.dll