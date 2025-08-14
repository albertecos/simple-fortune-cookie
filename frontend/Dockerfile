FROM golang:1.8 

WORKDIR /app

# Download Go modules
COPY go.mod ./
RUN go mod download

# Copy the source code
COPY *.go ./

RUN go build -o /frontend
CMD ["/frontend"]