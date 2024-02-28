FROM golang:latest

WORKDIR /app

COPY . .

RUN go build -o main .

EXPOSE 8086

CMD ["./main"]
