FROM golang:1.25-alpine AS builder
WORKDIR /src
RUN apk add --no-cache git
COPY go.mod ./
RUN go mod download
COPY . .
ENV CGO_ENABLED=0 GOOS=linux GOARCH=arm64
RUN go build -o=go-helloworld

FROM scratch
WORKDIR /app
COPY --from=builder /src/go-helloworld /app/go-helloworld
EXPOSE 7800
ENV PORT=7800
USER 65532:65532
ENTRYPOINT ["/app/go-helloworld"]