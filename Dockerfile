FROM golang:1.11.2-alpine3.8
ADD . /go/src/app
RUN go install app
FROM alpine:latest
COPY --from=0 /go/bin/app .
ENV PORT 8080
CMD ["./app"]
