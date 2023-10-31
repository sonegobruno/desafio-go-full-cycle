FROM golang:1.21 as builder

WORKDIR /app

RUN go mod init github.com/full-cycle/desafio-go

COPY /main.go .

RUN go build -o /server

FROM scratch

WORKDIR /app

COPY --from=builder /server /server

EXPOSE 8080

ENTRYPOINT [ "/server" ]