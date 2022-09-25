# BUILDER
FROM golang:1.19.0-alpine as builder
LABEL maintainer="HaoLe(thienhaole92@gmail.com)"

RUN apk update && \
    apk upgrade && \
    apk add build-base

WORKDIR /app

ADD . /app

RUN go get -d -v && \
    go build -o /app/bin/app ./main.go

# RUNTIME
FROM golang:1.19.0-alpine

WORKDIR /app

COPY --from=builder /app/bin/app .
COPY dictionary.db .

RUN adduser -D user

USER user

EXPOSE 4000

CMD ["./app"]