# syntax=docker/dockerfile:1

FROM golang:1.16-alpine
ADD . /app
WORKDIR /app

COPY go.mod ./
COPY go.sum ./
COPY .env ./
RUN go mod download

COPY *.go ./

RUN go build -o /app-buku-mvc

EXPOSE 81

CMD [ "/app-buku-mvc" ]