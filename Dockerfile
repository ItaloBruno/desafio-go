# Primeiro estágio

FROM golang:latest AS builder

WORKDIR /app

COPY full_cycle_rocks.go .
COPY go.mod .

RUN go build -o full_cycle_rocks .

# Segundo estágio

FROM hello-world

WORKDIR /app

COPY --from=builder /app .

CMD [ "./full_cycle_rocks" ]
