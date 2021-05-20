FROM golang:1.13 as builder

RUN apt-get update && apt-get install -y xz-utils && rm -rf /var/lib/apt/lists/*
RUN apt-get install -y ca-certificates

# Set the working directory for all commands moving foward.
WORKDIR /go/src/github.com/jjenkins/breadcrumbs

WORKDIR /root
COPY --from=builder /go/src/github.com/jjenkins/breadcrumbs/http .

EXPOSE 8080
CMD ["./http", "serve"]
