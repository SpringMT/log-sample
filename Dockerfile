# Build
FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 go build -o /log-sample

# Deploy
FROM scratch

WORKDIR /

COPY --from=build /log-sample /log-sample

CMD ["./log-sample"]