FROM golang:1.21

WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code
COPY *.go ./

RUN go build -o /backend
EXPOSE 9000
CMD ["/backend"]