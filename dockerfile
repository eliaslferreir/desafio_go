FROM golang:alpine as construtor

WORKDIR /usr/src/app

COPY . .
RUN CGO_ENABLE=0 go build -o /app main.go

FROM scratch

COPY --from=construtor /app /app
CMD ["/app"]
