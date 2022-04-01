ARG GO_VER=1.17
FROM golang:${GO_VER} AS builder

WORKDIR /usr/src/app
COPY go.mod main.go ./
RUN go build -v -o /usr/local/bin/true

FROM scratch

LABEL VERSION=${VERSION}
COPY --from=builder /usr/local/bin/true /usr/bin/
CMD [ "/usr/bin/true" ]
