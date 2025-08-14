FROM golang:1.21 

WORKDIR /app

# Download Go modules

# RUN go mod download
COPY go.mod ./
COPY . ./

# Copy the source code
COPY *.go ./

RUN go build -o /frontend
EXPOSE 8080
CMD ["/frontend"]