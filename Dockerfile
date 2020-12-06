FROM golang AS builder

WORKDIR /go/src/app
COPY ./print.go .

RUN go build -ldflags "-w" print.go

FROM scratch

COPY --from=builder /go/src/app  /home
WORKDIR /home
ENTRYPOINT [ "./print" ]
