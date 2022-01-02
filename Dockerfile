FROM python:3.9.9

RUN \
    apt update \
    && apt install -y vim

# Install Node
RUN \
    mkdir /usr/local/lib/node16 \
    && wget -c https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.xz -O - \
    | tar -xJvf - -C /usr/local/lib/node16 --strip-components 1

# Set Node env vars
ENV NODEJS_HOME '/usr/local/lib/node16'
ENV PATH "$NODEJS_HOME/bin:$PATH"


# Install Go
RUN \
    wget -c https://go.dev/dl/go1.17.5.linux-amd64.tar.gz -O - \
    | tar -xzf - -C /usr/local
ENV PATH "/usr/local/go/bin:$PATH"

# Set Go env vars
ENV GIN_MODE "release"

WORKDIR /app

COPY go.mod go.sum package-lock.json package.json requirements.prod.txt ./

# Install deps
RUN pip install -r requirements.prod.txt && npm install --only=prod && go mod download

COPY server ./server

RUN go build -o server/gin_server server/gin_server.go

EXPOSE 8080
